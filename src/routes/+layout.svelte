<script>
	import { fade } from 'svelte/transition';
	import '../app.css';
	import '$lib/glitch.css';
	import { onMount } from 'svelte';
	import NavLink from '../components/main/navLink.svelte';
	import AnimatedNav from '../components/main/animatedNav.svelte';
	import { page } from '$app/stores';
	import { onNavigate } from '$app/navigation';

	// Animation : start at center, end up in the navbar
	let titlePosition = 0;
	let transitioning = false;

	onMount(() => {
		setTimeout(() => {
			titlePosition++;
		}, 1000);
	});

	onNavigate(() => {
		transitioning = true;
		setTimeout(() => {
			transitioning = false;
		}, 300);
	});
</script>

<!-- Animation : start at center, end up in the navbar -->

<AnimatedNav state={titlePosition}>
	<!-- Add buttons for navigation -->
	<NavLink href="/" activated={$page.url.pathname === '/'}>Home</NavLink>
	<NavLink href="/page" activated={$page.url.pathname === '/page'}>Page</NavLink>
</AnimatedNav>

{#if !transitioning}
	<div transition:fade={{ duration: 200 }}>
		<slot />
	</div>
{/if}

<style lang="postcss">
	:global(html) {
		background-color: #07090f;
		overflow-x: hidden;
	}
</style>
