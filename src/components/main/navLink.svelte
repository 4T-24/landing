<script>
	export let href = '';
	export let activated = false;
</script>

<a {href} class="h-full text-2xl text-white" class:active={activated}>
	<slot />
</a>

<style>
	a {
		transition: all 0.3s;
	}

	a::after {
		transition: all 0.3s;
		content: '';
		display: block;
		width: 100%;
		height: 2px;
		background-color: black;
	}

	a:hover::after {
		transition: all 0.3s;
		content: '';
		display: block;
		width: 100%;
		height: 2px;
		background-color: white;
	}

	.active::after {
		transition: all 0.3s;
		content: '';
		display: block;
		width: 100%;
		height: 2px;
		background-color: white;
	}
</style>
