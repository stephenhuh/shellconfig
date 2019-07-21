# vim-snippets blobs
## Intro
All code blocks here are to be imported and used with the honza/vim-snippets or a plugin that adapts to the same API

## SCSS
comment blocks for following [idiomatic css](https://github.com/necolas/idiomatic-css/)
```
snippet comment1
	/* ==========================================================================
	${0:Section Comment Block}
	========================================================================== */
snippet comment2
	/*${0:Sub-section comment block}
snippet comment3
	/**
	 * ${1:Short description using Doxygen-style comment format}
	 *
	 * ${2:Long description}
	 * 
	 * ${3:@tag This is a tag named 'tag'}
	 *
	 * TODO:${4:This is a todo statement that describes an atomic task to be completed}
	 *   
	 *   
	 */
snippet comment4
	/* ${0:Basic comment} */
```
## Markdown
```
snippet c
	\`\`\`
	${1:code}
	\`\`\`
snippet cjs
	\`\`\`javascript
	${1:code}
	\`\`\`
```
