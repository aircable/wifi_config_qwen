<script lang="ts">
  import { onMount } from 'svelte';
  import { writable } from 'svelte/store';

  const ledOn = writable(false);
  let socket: WebSocket;

  function toggle() {
    const msg = JSON.stringify({ type: 'toggle' });
    socket.send(msg);
  }

  onMount(() => {
    const protocol = location.protocol === 'https:' ? 'wss' : 'ws';
    const wsUrl = `${protocol}://${location.host}/ws`;
    socket = new WebSocket(wsUrl);
    socket.onmessage = (event) => {
      try {
        const data = JSON.parse(event.data);
        if (data.type === 'state') {
          ledOn.set(data.state);
        }
      } catch (e) {
        console.error('Invalid WS message', e);
      }
    };
  });
</script>

<main class="p-4">
  <h1 class="text-2xl font-bold mb-4">LED Control</h1>
  <button class="btn btn-primary mb-2" on:click={toggle}>
    Toggle LED
  </button>
  <div>State: {$ledOn ? 'On' : 'Off'}</div>
</main>
