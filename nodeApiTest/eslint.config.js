import js from "@eslint/js";
import globals from "globals";
import { defineConfig } from "eslint/config";

export default defineConfig([
	{
		files: ["**/*.{js,mjs,cjs}"],
		plugins: { js },
		extends: ["js/recommended"],
		languageOptions: {
			globals: { ...globals.browser, ...globals.jest, ...globals.node },
		},
		rules: {
			"no-unused-vars": "warn",
			"no-undef": "warn",
		},
	},
]);
