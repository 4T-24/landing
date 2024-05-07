<script>
	import '../app.css';
</script>

<slot />

<style lang="postcss">
	:global(html) {
		background-color: theme(colors.gray.900);
		overflow-x: hidden;
	}
</style>
