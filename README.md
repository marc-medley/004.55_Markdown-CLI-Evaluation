# [004.55 Markdown CLI Evaluation][t]
[t]:https://github.com/marc-medley/004.55_Markdown-CLI-Evaluation

_A comparative evalution of open source CLI Markdown processors: discount `markdown`, `hoedown`, `multimarkdown` and `pandoc`._

## Contents <a id="contents"></a>
[Objectives](#objectives-) •
[Process](#process-) •
[Observations](#observations-) •
[Resources](#resources-)

## Objectives <a id="objectives-"></a><sup>[▴](#contents)</sup>

1. Markdown Syntax. Find, to the extent possible, a common set of markdown syntax including certain extensions.
2. CLI Settings. Find settings which produce the most similar markdown output.
3. Extension Support. Evaluate extension support for footnotes, piped tables, fenced code, and LaTeX math.

## Process <a id="process-"></a><sup>[▴](#contents)</sup>

1. Install ['multimarkdown'](https://formulae.brew.sh/formula/multimarkdown#default) (which installs as `markdown`), ['hoedown'](https://formulae.brew.sh/formula/hoedown#default), and ['pandoc'](https://formulae.brew.sh/formula/pandoc#default) as command line tools. 

    * Uninstall 'multimarkdown' (`brew uninstall multimarkdown`) and install ['discount'](https://formulae.brew.sh/formula/discount#default) (which installs as `markdown`) to run tests for `discount`.

2. Review/Edit source markdown file ["md_evaluation.md"](test_sets/md_evaluation.md).
3. Review ["test.sh"](test_sets/test.sh). Edit options as needed. Run `./test.sh`.
4. Compare output. The `a` and `b` versions allow comparison what output changed for some settings change for the same CLI tool. The `txt` and `html` allows for comparison of raw output and how the output renders in a browser.

>_Note: Discount and MultiMarkdown have install conflicting execution binaries named `markdown`. Thus, Discount `markdown` and MultiMarkdown `markdown` are mutually exclusive `brew` installs. However, Discount `markdown` can be manually installed somewhere not on `$PATH` and scripted with `/FULL/PATH/TO/markdown`._
    
## Observations <a id="observations-"></a><sup>[▴](#contents)</sup>

The source document [`md_evaluation.md`](md_evaluation_files/md_evaluation.md) evolved and evolves to contain details on common syntax and notes on various markdown feature.

Some of the major findings are noted here below.

_LaTeX demarkation syntax_

|                     | `$`, `$$` | `\\(`, `\\[` | `\(`, `\[` |
|---------------------|:---------:|:------------:|:------------:|
| raw html            |           |              | ✓            |
| discount `markdown` |           |              | ✓            |
| `hoedown`           | ✓         | ✓            |              |
| `multimarkdown`     | ✓         | ✓            |              |
| `pandoc`            | ✓         | ✓            | ✓            |

Note: Use of `\(`, `\[` single escape syntax _disallows escaping_ `(` and `[` for other purposes. `hoedown` does not have expressly enable/disbale control over dollar sign `$` vs. double backslash `\\` syntax. `pandoc` can expressly enable/disable each of the three syntax.

**discount `markdown`** 

* **html fenced code.**  discount `markdown` fenced html with **&Tilde;&Tilde;&Tilde; html** does not generate a useable code block.  Angle brackets are not converted to html entities.  The enclosing `<pre><code>` tags are not produced.  Workaround Options: (1) fence the html with **&Tilde;&Tilde;&Tilde; markup** or (2) write an html codeblock as raw html in the markdown file.

**`hoedown`** 

* **C Library**. MacDown uses `hoedown` C library when rendering markdown.
* **LaTeX guessing.** `--math` option alone can produce incorrect and unexpected output. The combination of `--math` and `--math-explicit` did produce predictable, reliable results in these tests.

**`multimarkdown`**

* **C Library**

**`pandoc`** 

* **Options.** Pandoc has the largest set of enable/disable options. [see PandocMarkdownOptions.md](pandoc/PandocMarkdownOptions.md)
* `<pre><code>` Pandoc generates `<pre class="markdown"><code>` instead of `<pre><code class="language-markdown">`.

## Resources <a id="resources-"></a><sup>[▴](#contents)</sup>

* [DaringFireball: `markdown` ⇗](https://daringfireball.net/projects/markdown/) _Implementation: `Perl`_  v1.0.1 2004.12.17
* [Discount `markdown` ⇗](http://www.pell.portland.or.us/~orc/Code/discount/), [github ⇗](https://github.com/Orc/discount), _Implementation: `C`_  
* [GitHub/hoedown: `hoedown` ⇗](https://github.com/hoedown/hoedown) _Implementation: `C`_ v3.0.7 2015.12.03
* [Markingbird](https://github.com/kristopherjohnson/Markingbird) _Swift port of MarkdownSharp. No longer actively maintained._
* Pandoc
    * [Pandoc User’s Guide ⇗](http://pandoc.org/MANUAL.html)
    * [GitHub: pandoc ⇗](https://github.com/jgm/pandoc) _Implementation: `Haskell`_
* [Perfect-Markdown](https://github.com/PerfectlySoft/Perfect-Markdown) _Swift wrapper which directly builds on `libupskirt` which was forked from `sundown`._

**CommonMark**

> _Note: [CommonMark Spec ⇗](https://spec.commonmark.org/) does not mention any support for LaTeX math._

* CommonMark: [home ⇗](http://commonmark.org), [github ⇗](https://github.com/commonmark/cmark) 0.28.3 2017.10, brew: `cmark` | `commonmark`   
* [Github/github: cmark ⇗](https://github.com/github/cmark-gfm) _GitHub Flavored Markdown_, extended CommonMark , brew: `cmark-cfm` v0.28.3.gfm.20
    * [GitHub Flavored Markdown Spec](https://github.github.com/gfm/) Adds tables, task lists and autolinks. Does not add LaTeX math.
* brew conflict: `cmark`|`commonmark` and `cmark-cfm`, both install `cmark.h`
* [Github/iwasrobbed: Down ⇗](https://github.com/iwasrobbed/Down) Swift wrapper for reference `cmark` C. does not use Swift Package Manager.
* [Github/Pyroh: SwiftMark ⇗](https://github.com/Pyroh/SwiftMark) Swift framework which wraps `libcmark`. beta 2016.01.26.
* [Github/calebkleveter: SwiftMark ⇗](https://github.com/calebkleveter/SwiftMark), [guide ⇗](https://calebkleveter.github.io/SwiftMarkSite/guide.html), [site ⇗](https://calebkleveter.github.io/SwiftMarkSite/) **pure Swift.** Early development. Roadmap to support GFM (GitHub Flavored Markdown) features. 


**MultiMarkdown**

* [MultiMarkdown `markdown`](http://fletcherpenney.net/multimarkdown/) 
* [GitHub/fletcher: MultiMarkdown-5](https://github.com/fletcher/MultiMarkdown-5)    
* [GitHub/fletcher: MultiMarkdown-6](https://github.com/fletcher/MultiMarkdown-6) _Implementation: `C`_   
* _Homebrew installs `multimarkdown` with binary `markdown`._
    * brew conflict: `discount`, `markdown` and `multimarkdown` install `markdown` binaries.
    * brew conflict: mtools (MSDOS file manipulation) … both install `mmd` binaries.
