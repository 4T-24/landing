<script>
	import { crossfade } from 'svelte/transition';
	import { cubicInOut } from 'svelte/easing';
	import { fade } from 'svelte/transition';
	import Title from '../title.svelte';
	const [send, receive] = crossfade({
		duration: 3000,
		easing: cubicInOut
	});

	export let state = 0;
</script>

{#if state === 0}
	<div
		out:fade={{ delay: 3000 }}
		class="absolute flex h-screen w-screen items-center justify-center bg-[#07090f]"
	>
		<div in:receive={{ key: 'title' }} out:send={{ key: 'title' }} class="text-9xl">
			<Title />
		</div>
	</div>
{:else}
	<nav class="flex w-screen justify-between p-8">
		<div in:receive={{ key: 'title' }} out:send={{ key: 'title' }} class="text-4xl">
			<Title />
		</div>

		<div in:fade={{ delay: 3000 }} class="flex space-x-4">
			<slot />
		</div>
		<div />
	</nav>
{/if}
