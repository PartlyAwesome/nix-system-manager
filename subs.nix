let
	substituters = [
		"https://cache.numtide.com"
		"https://cache.lix.systems"
	];
	keys = [
		"niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
		"cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
	];
in {
	nix.settings = {
		extra-substituters = substituters;
		extra-trusted-substituters = substituters;
		extra-trusted-public-keys = keys;
	};
}
