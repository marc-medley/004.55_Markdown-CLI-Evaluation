004.55 Markdown CLI Evaluation
=======

<a id="toc"></a>
| [Objectives](#Objectives) | [Process](#Process) | [Observations](#Observations) | [Resources](#Resources) |  

_A comparative evalution of open source CLI Markdown processors: discount `markdown`, `hoedown`, `multimarkdown` and `pandoc`._

:TODO: put bug report notes in `man markdown`, `man hoedown`, `man pandoc` pages.

Objectives <a id="Objectives">[▴](#toc)</a>
----------

1. Markdown Syntax. Find, to the extent possible, a common set of markdown syntax including certain extensions.
2. CLI Settings. Find settings which produce the most similar markdown output.
3. Extension Support. Evaluate extension support for footnotes, piped tables, fenced code, and LaTeX.

Process <a id="Process">[▴](#toc)</a>
-------

1. Install ["discount"](http://braumeister.org/formula/discount) (which installs as `markdown`), [`hoedown`](http://braumeister.org/formula/hoedown), and [`pandoc`](http://braumeister.org/formula/pandoc) as command line tools. 
2. Edit soure markdown file [`md_evaluation.md`](md_evaluation_files/md_evaluation.md)
3. Run [`test.sh`](md_evaluation_files/)
4. Compare output. The `a` and `b` versions allow comparison what output changed for some settings change for the same CLI tool. The `txt` and `html` allows for comparison of raw output and how the output renders in a browser.

Observations <a id="Observations">[▴](#toc)</a>
------------

The source document [`md_evaluation.md`](md_evaluation_files/md_evaluation.md) evolved and evolves to contain details on common syntax and notes on various markdown feature.

Some of the major findings are noted here below.

_LaTeX demarkation syntax_

|                     | `$`, `$$` | `\\(`, `\\[` | `\(`, `\[` |
|---------------------|:---------:|:------------:|:------------:|
| discount `markdown` |           |              | ✓            |
| `hoedown`           | ✓         | ✓            |              |
| `multimarkdown`     | ✓         | ✓            |              |
| `pandoc`            | ✓         | ✓            | ✓            |

Note: Use of `\(`, `\[` syntax disallows escaping `(` and `[` for other purposes. `hoedown` does not have expressly enable/disbale control over dollar sign `$` vs. double backslash `\\` syntax. `pandoc` can expressly enable/disable each of the three syntax.

**discount `markdown`** 

* **html fenced code.**  discount `markdown` fenced html with ` ~~~html` does not generate a useable code block.  Angle brackets are not converted to html entities.  The enclosing `<pre><code>` tags are not produced.  Workaround Options: (1) fence the html as xml with `~~~xml` or (2) write an html codeblock as raw html in the markdown file.

**`hoedown`** 

* **C Library**. MacDown uses `hoedown` C library when rendering markdown.
* **LaTeX guessing.** `--math` option alone can produce incorrect and unexpected output. The combination of `--math` and `--math-explicit` did produce predictable, reliable results in these tests.

**`pandoc`** 

* **Options.** Pandoc has the largest set of enable/disable options. [see PandocMarkdownOptions.md](pandoc/PandocMarkdownOptions.md)
* `<pre><code>` Pandoc generates `<pre class="markdown"><code>` instead of `<pre><code class="language-markdown">`.

**MacDown**

* **Hang.** If MacDown Preference `Update preview automatically as you type` is enabled, then editing the [md_evaluation.md](md_evaluation.md) document may cause MacDown to hang. Likely related to html render, not markdown highlighting.  Maybe related to time to render a significant about remotely loaded MathJax JavaScript.

Resources <a id="Resources">[▴](#toc)</a>
---------

[DaringFireball: `markdown` ⇗](https://daringfireball.net/projects/markdown/) _Implementation: `Perl`_  
[Discount `markdown` ⇗](http://www.pell.portland.or.us/~orc/Code/discount/) _Implementation: `C`_  
[GitHub/hoedown: `hoedown` ⇗](https://github.com/hoedown/hoedown) _Implementation: `C`_  
[GitHub/fletcher: MultiMarkdown-5](https://github.com/fletcher/MultiMarkdown-5)    
[GitHub/fletcher: MultiMarkdown-6](https://github.com/fletcher/MultiMarkdown-6)    
[GitHub: pandoc ⇗](https://github.com/jgm/pandoc) _Implementation: `Haskell`_  
[MultiMarkdown `markdown`](http://fletcherpenney.net/multimarkdown/) _Implementation: `C`_  
[Pandoc User’s Guide ⇗](http://pandoc.org/MANUAL.html)   

  


