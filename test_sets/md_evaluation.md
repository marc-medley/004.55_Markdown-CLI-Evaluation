# [H1 md_evaluation][title]
[title]:http://daringfireball.net/projects/markdown/syntax

_See: [004.55_Markdown-CLI-Evaluation](https://github.com/marc-medley/004.55_Markdown-CLI-Evaluation)_

## Contents <a id="contents"></a>
[Heading Anchor](#heading-anchor-):
[id after](#id-after-) |
[Code](#code-) |
[Monospace](#monospace-) |
[Lists](#lists-) |
[Tables _(extension)_](#tables-extension-) |
[Links](#links-) |
[Images](#images-) |
[Video Link](#video-link-) |
[Inline HTML](#inline-html-) |
[Mathematics](#mathematics-) |
[Mathematics (GitHub/GitLab)](#mathematics-githubgitlab-) |
[Entities](#entities-) |
[Fonts](#fonts-) |
[Xcode](#xcode-) |
[Observations](#observations-) | 
[Resources](#resources-)

Note: Pandoc `markdown_strict` appears to only recognized one title line at the top of file.

## Heading Anchors `<a id="name-"></a><sup>[▴](#contents)</sup>` <a id="heading-anchor-"></a><sup>[▴](#contents)</sup>

Note: Discount, Hoedown, MacDown & Pandoc can all work with `<a id="name-"></a><sup>[▴](#contents)</sup>` after the heading. Pandoc does not render line as header if `<a id=_></a>` line preceeds the header line.

``` markdown
####<a id="idBefore" \></a> H4: `id=` same line, before header.
#### H4: `id=` same line, after header. <sup>[▴](#contents)</sup> <a id="id-after-"></a>
#### H4: USE THIS APPROACH. `<a id="id-after-"></a><sup>[▴](#contents)</sup> `<a id="id-after-"></a><sup>[▴](#contents)</sup>
```

#### H4: USE THIS APPROACH. `<a id="id-after-"></a><sup>[▴](#contents)</sup> `<a id="id-after-"></a><sup>[▴](#contents)</sup>

## Blank Line Before Header

| parser   | directive             | comment                                                    |
| -------- | --------------------- |:---------------------------------------------------------- |
| discount |                       |   |
| hoedown  |                       | not required                                            |
| macdown  |                       | not required                                            |
| pandoc   | `blank_before_header` | Pandoc Markdown extension requires blank before header. |

``` markdown
Some text.
### H3 - no blank line before header
#### H4 - no blank line before header
##### H5 - no blank line before header
###### H6 - no blank line before header
```

Some text.
### H3 - no blank line before header
#### H4 - no blank line before header
##### H5 - no blank line before header
###### H6 - no blank line before header

Header Attributes `{#indentifier .class key=value}`
----

| parser   | directive           | comment |
| -------- |:-------------------:|:--------------- |
| discount | -                   | not supported |
| hoedown  | -                   | not supported |
| macdown  | -                   | not supported |
| pandoc   | `header_attributes` | Pandoc Markdown extension … |


``` markdown
### Some Header {#indentifier .class key=value}
```

### Some Header  {#anchor .class key=value}

Header Trailing `#`
-------------------

``` markdown
### Some Header with `###` on both sides. ###
```

### Some Header with `###` on both sides. ###


## Horizontal Rule

____

-----

Horizontal Rule: at least three asterisks, underscores, or hyphens. Put empty line before and after.

*****

## Inline Formatting

Italics emphasis brackets with *single asterisks* (cmd-i) or _single underscores_. Strong bold emphasis brackets with **double asterisks** (cmd-b) or __double underscores__. Mixed emphasis can be **can be _nested_**. ~~Strikethrough~~ is bracketed with two tildes.

If intra_letter_emphasis is not enabled, then `_` and `*` are are unmodified in a name or equation a=b*c.

|Option name (enabled) | Syntax        | Result if enabled                                   |
|----------------------|:-------------:|-----------------------------------------------------|
|Emphasis, Italic      | `_`           | So _Amazing_  |
|Emphasis, Italic      | `*`           | So *Amazing*  |
|Emphasis, Strong      | `__`          | So __Amazing__  |
|Emphasis, Strong      | `**`          | So **Amazing**  |
|Emphasis, IntraWord   | `A*maz*ing`   | A*maz*ing (complicates equations. Discount, Pandoc: always enabled) |
|Emphasis, IntraWord   | `A_maz_ing`   | A_maz_ing (complicates some names. Hoedown, MacDown:does not separately control `_`, `*`) |
|Strikethrough         | `~~`          | ~~Much wow~~  |

|Option name (disabled) | Syntax        | Result if enabled                                   |
|-----------------------|:-------------:|-----------------------------------------------------|
|Highlight              | `==`          | ==So good== (Hoedown, MacDown) |
|Quote                  | `"`           | "If enabled, `"` becomes `<q>`. (Hoedown, MacDown: not smarty pants compatible)"|
|Subscript              | `H~2~0`       | H~2~0 is water (Pandoc) |
|Superscript            | `2^3^`        | 2^3^ is 8  (Pandoc) |
|Superscript            | `hoge^(fuga)` | hoge^(fuga) (Discount , Hoedown, MacDown) |
|Underline              | `_`           | _If enabled, underline overrides `_` Italic Emphasis_ |

|Option name         |&lt;html&gt;| Result if enabled  |
|--------------------|:----------:|------------------------|
|<em>Emphasis</em>   | `<em>`     | A<em>maz</em>ing  |
|Highlight           | `<mark>`   | <mark>So good</mark> |
|Quote               | `<q>`      | <q>Such editor</q>   |
|Strikethrough       | `<del>`    | <del>Much wow</del>  |
|Superscript         | `<sup>`    | hoge<sup>fuga</sup>  |
|Underline           | `<u>`      | <u>So doge</u>       |


## Block Quotes

> Blockquotes use `>` similar to email reply text.  
>> Nested line in the same quote. Pandoc & MacDown show next line break.  
>    
> > * Lists  
> > * [Some link][arbitrary_id]  
> > * Etc.  

[arbitrary_id]:http://www.macupdate.com

N0-BREAK SPACE : U+00A0 `&nbsp;`. Directly type char into code segments.

## Code <a id="code-"></a><sup>[▴](#contents)</sup>

Inline `code` has `single back-ticks around` it.

``` javascript
// JavaScript
var s = "JavaScript syntax highlighting";
alert(s);
```

```
Triple tilde ~ or back-ticks creates a <pre><code> block.
No language indicated. No syntax highlighting.
```  

``` bash
# bash
$ ls -alx
$ pwd
```

``` c
// ANSI C
a = b + c;
for (int i=0; i<n; n++) {}
```

``` markup
<dict>
    <key>Message</key>
    <string>Greetings.</string>
    <key>Type</key>
    <integer>0</integer>
</dict>
```

``` markup
<p>Example html paragraph</p>
```

**`markdown`**: `<pre><code class="c">` (discount). Note: `markdown` deliniate `html` the code fences. To show `html`, use `<pre><code class="language-html">` with escaped angle brackets `&gt;` `&lt;` for the enclosed example code. 
**`hoedown`**: `<pre><code class="language-c">`  
**`pandoc`**: `<pre class="c"><code>` _using `--no-highlight` option with `fenced_code_attributes` flag enabled_

Languages: actionscript apacheconf applescript bash (sh) c coffeescript cpp (c++) css fortran git go groovy handlebars html http ini java javascript (js) json latex less markdown matlab objectivec (objc) pascal perl php python ruby sql swift xml

Note: `class="language-xyz"` is [html5 recommended](https://www.w3.org/TR/html5/text-level-semantics.html#the-code-element).

## Monospace <a id="monospace-"></a><sup>[▴](#contents)</sup>

Monospace 120

``` swift
123456789*123456789*123456789*123456789*123456789*123456789*123456789*123456789*123456789*123456789*123456789*123456789*
```
Portrait 64

``` swift
123456789*123456789*123456789*123456789*123456789*123456789*1234
```
Landscape 85  

``` swift
123456789*123456789*123456789*123456789*123456789*123456789*123456789*123456789*12345
```

## Lists <a id="lists-"></a><sup>[▴](#contents)</sup>

**Example ordered list**

1. First ordered list item
2. Another item
    * Unordered sub-list.
1. Actual numbers don't matter, just that it's a number
    1. Ordered sub-list  
        1. Sub-sub-list
4. And another item.

    Properly (4-space) indented paragraph. Blank line above. At least one leading space.  
    
    Two trailing spaces creates a linebreak. ..  
    Note that this line is separate, but within the same paragraph.

**Example alpha list** - Discount only.

A. First ordered list item  
B. Another item  
C. Actual numbers don't matter, just that it's a number  

**Example unordered list:**  

* Unordered list can use asterisks
- Or `-` minuses
+ Or `+` pluses


## Tables _(extension)_  <a id="tables-extension-"></a><sup>[▴](#contents)</sup>

Pandoc: `table_captions`, `simple_tables`, `multiline_tables`, `grid_tables`, `pipe_tables` 

NOTE: Pandoc `pipe_tables` uses `----` separator length for both relative column widths and overall table width.

Colons can be used to align columns. The outer pipes (|) are optional.  Needs at least 3 dashes per column `---`.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| zebra stripes | alternate     |   120 |
| column 2      | centered      |  1230 |
| column 3      | ✓             |     1 |

``` markdown
| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| zebra stripes | alternate     |   120 |
| column 2      | centered      |  1230 |
| column 3      | ✓             |     1 |
```

_html `<table>`_

<table style="width:100%; font-family: monospace;">
<tr>
  <th>Firstname</th>
  <th>Lastname</th>
  <th><pre>Points</pre></th>
</tr> 
<tr>
  <td>Jill</td>
  <td>Smith</td>
  <td>50</td>
</tr>
<tr>
  <td>Eve</td>
  <td>Jackson</td>
  <td>94</td>
</tr>
</table> 

**36**

| Table      | Size       | Test       |
|:---------- |:----------:| ----------:|
| 10+2       | 10+2       | 10+2       |

**66**

| Table                | Size                 | Test                 |
|:-------------------- |:--------------------:| --------------------:|
| 20+2                 | 20+2                 | 20+2                 |

**96**

| Table                          | Size                           | Test                           |
|:------------------------------ |:------------------------------:| ------------------------------:|
| 30+2 . . . . . . . . . . . . . | 30+2 . . . . . . . . . . . . . | 30+2 . . . . . . . . . . . . . |

**126**

| Table                                    | Size                                     | Test                                     |
|:---------------------------------------- |:----------------------------------------:| --------------------:|
| 40+2 AAAA BBBB CCCC DDDD EEEE FFFF GGGG. | 40+2 AAAA BBBB CCCC DDDD EEEE FFFF GGGG. | 20+2 AAAA BBBB CCCC DDDD EEEE FFFF GGGG. |

**100%**

| Table                                    | Size                        | Test                        |
|------------------------------------------|:---------------------------:|----------------------------:|
| 40+2 AAAA BBBB CCCC DDDD EEEE FFFF GGGG. | 29 AAAA BBBB `CCCC` DDDD EEEE FFFF GGGG. | 29 AAAA BBBB CCCC DDDD EEEE FFFF GGGG HHHH IIII JJJJ KKKK LLLL MMMM NNN OOOO PPPP. |

***

## Links <a id="links-"></a><sup>[▴](#contents)</sup>

Autolink: `http://t.co` becomes `<http://t.co>` displayed as <http://t.co>

Footnotes[^4]: inline `[^4]` & `[^longnote]` references `[^4]: Some footnote text.` & `[^ longnote]: Some longnote text.`

[^4]: You don't have to use a number. Arbitrary things like `[^footy note4]` and `[^footy note4]:` will also work. But they will *render* as numbered footnotes. Also, no need to keep your footnotes in order, I will sort out the order for you so they appear in the same order they were referenced in the text body. You can even keep some footnotes near where you referenced them, and collect others at the bottom of the file in the traditional place for footnotes. 

    Subsequent paragraphs are indented to show that they belong to the previous footnote. _Pandoc. Hoedown supports with return link in first paragraph._

Here is an inline note.^[Inlines notes are easier to write, since you don't have to pick an identifier and move down to type the note.] _Pandoc `inline_notes` only_

<mailto:someone@example.com> (Discount, Hoedown, MacDown, Pandoc)

###### inline link
[Markdown Syntax &neArr;](http://www.site.org/ "Daring Fireball Markdown: Syntax")

```markdown
 [Link Description](http://site "title")
```

###### reference link
[see Note 1][Note1]  
[see MDN:Hover][MDN:Hover]

[Note1]: http://mozilla.org
[MDN:Hover]: https://developer.mozilla.org/en-US/docs/Web/CSS/:hover

```markdown
 [see Note 1][Note1]  
 [see MDN:Hover][MDN:Hover]

 [Note1]: http://mozilla.org
 [MDN:Hover]: https://developer.mozilla.org/en-US/docs/Web/CSS/:hover
```

```markdown
 [url_id]: http://example.com "Optional Title"
 [url_id]: http://example.com 'Optional Title'
 [url_id]: http://example.com (Optional Title)
 [url_id]: <http://example.com/> "Angle Brackets OK"
```

```markdown
 [url_id]: http://example.com/some/long/url
     "Title With White Space Padding"
```

[Link via id=""](#anchor21)  
[Link via name=""](#anchor22)

<a id="anchor21"></a>Link to here via `id`. HTML5 creates a JavaScript global for each `id`. `name` is obsolete in HTML5, but may work and also not create globals. `id` must be unique in the whole document. `id` can contain `azAZ_-.`

```markdown
 [Link via id=""](#anchor21)
 <a id="anchor21"></a>Link to here via `id`.
 <p id="anchor21">Link to here via <code>id</code>.</p>
```

<a name="anchor22"></a>Link to here via a *fragment* `<a>` tag `name` attribute.

```markdown
 [Link text via name=""](#anchor22)
 <a name="anchor22"></a>Link to here via name.
```

Markdown `<http://example.com/>` expands to HTML `<a href="http://example.com/">http://example.com/</a>`

Browser looks for absolute "server" path `file:///Markdown_files/figure1.png`

## Images <a id="images-"></a><sup>[▴](#contents)</sup>

Inline-style (HTTP)  
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

`![alt text](https://github.com/…/images/icon48.png "Title Text")`

Inline-style (relative)  
[![alt text](md_evaluation_files/figure1.png "Title 1")](md_evaluation_files/figure1.png)  
`![alt text](md_evaluation_files/figure1.png "Title 1")`

(relative, clickable)

```markdown
[![alt text](md_evaluation_files/figure1.png "Title 1")]
(04.55_Markdown__QREF_files/figure1.png)
```

Reference-style (HTTP)  
![alt text][logo]  

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Title 2"

`![alt text][logo]`
`[logo]: https://github.com/…/images/icon48.png "Title 2"`


Reference-style (relative)  
![alt text][logo2]

[logo2]: md_evaluation_files/figure2.png "Title 2"

```markdown
 ![alt text][logo2]
 [logo2]: md_evaluation_files/figure2.png "Title 2"
```

--
Reference-style (relative, description=reference implicit)  
![logo3]

[logo3]: md_evaluation_files/figure3.png "Title 3"

```markdown
 ![logo3]
 [logo3]: md_evaluation_files/figure3.png "Title 3"
```

HTML Style (Relative)  
<p><img src="md_evaluation_files/figure4.png"
         alt="logo4"
       title="Title 4"
       width="256"></p>

<pre><code class="language-html" >&lt;p&gt;&lt;img src="md_evaluation_files/figure4.png"
         alt="logo4"
       title="Title 4"
       width="256"
       height="96"&gt;&lt;/p&gt;
</code></pre>

Browser looks for relative "server" path `file:///Users/~/Desktop/md_evaluation_files/figure3.png`


## Video Link <a id="video-link-"></a><sup>[▴](#contents)</sup>

[![BOZEMAN VIDEO: Wave Amplitude](https://i.ytimg.com/vi/2Kos5VrtTtA/mqdefault.jpg "Wave Amplitude") ](https://www.youtube.com/watch?v=2Kos5VrtTtA)

```markdown
[![Text](path|url/p.jpg)](path|url/video)
```

## Inline HTML <a id="inline-html-"></a><sup>[▴](#contents)</sup>

<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does <em>*not*</em> work inside <strong>**html block tags**</strong>. Use HTML <em>tags</em>.</dd>
</dl>

<pre><code>This is an html &lt;pre&gt;&lt;code&gt; block.
</code></pre>

<table style="width:100%; font-family: monospace;">
    <tr>
        <th>Name</th>
        <th>Column</th>
        <th>Column</th>
    </tr>
    <tr>
        <td>A</td>
        <td>B</td>
        <td>C</td>
    </tr>
</table>

<a href="https://www.youtube.com/watch?v=2Kos5VrtTtA" ><img src="https://i.ytimg.com/vi/2Kos5VrtTtA/mqdefault.jpg"
alt="BOZEMAN VIDEO: Wave Amplitude" border="2" /></a>

Note: `target="_blank"` does not work in MacDown.

## Mathematics <a id="mathematics-"></a><sup>[▴](#contents)</sup>

> Baseline: use **`\\(`**, **`\\[`**, **`$`**, **`$$`**

**`markdown` (discount)** : `$$`, `\(`, `\[`.  Note: a drawback of `\(`, `\[` extension is that it precludes escaping `(` and `[`. Note: `markdown` and `hoedown` are mutually exclusive.

**`hoedown`** : _`--math`_ for **`\\(`**, **`\\[`**. _`--math-explicit`_ for **`$`**, **`$$`**. _(Note: "guessing by context" may generate unexpected output if `--math` is enabled, and `--math-explicit` is not enabled. `--math-explicit` also disables "guessing by context")_

**`pandoc`** : _`+tex_math_double_backslash`_ for **`\\(`**, **`\\[`**. _`+tex_math_dollars`_ for **`$`**, **`$$`**. _`+tex_math_single_backslash`_ **`\(`**, **`\[`**

_Note: `LaTeX` inside `<div>` or `<table><tr><td>` html tags uses only single escape `\(…\)`, `\[…\]`. Markdown inside `<div>` or `<table><tr><td>` html tags are not parsed as markdown.  Also, `<br>` is needed for line breaks._  

[TeX Equations](http://atomurl.net/math/)  *(MacDown, Atom:markdown-preview-plus)*  

`\\(A^T_S = B\\)` : \\(A^T_S = B\\)  
`\\[A^T_S = B\\]` : \\[A^T_S = B\\]  
`\\(\sqrt{ab}\\)` * : \\(\sqrt{ab}\\)  
`\\[\sqrt{ab}\\]` * : \\[\sqrt{ab}\\]  

`$A^T_S = B$` : $A^T_S = B$  
`$$A^T_S = B$$` : $$A^T_S = B$$  
`$\sqrt{ab}$` : $\sqrt{ab}$  
`$$\sqrt{ab}$$` * : $$\sqrt{ab}$$  

`\(\sqrt{ab}\)` : \(\sqrt{ab}\)  
`\[\sqrt{ab}\]` : \[\sqrt{ab}\]  


#### The probability of getting `k` heads when flipping `n` coins is

Dollar syntax: $P(E) = {n \choose k} p^k (1-p)^{ n-k}$

$$P(E) = {n \choose k} p^k (1-p)^{ n-k}$$

Double backslash syntax: \\(P(E) = {n \choose k} p^k (1-p)^{ n-k} \\)

\\[P(E) = {n \choose k} p^k (1-p)^{ n-k} \\]

Single backslash syntax: \(P(E) = {n \choose k} p^k (1-p)^{ n-k} \)

\[P(E) = {n \choose k} p^k (1-p)^{ n-k} \]

Note: LaTeX inline `\(...\)`, LaTeX display `\[...\]`, TeX shorthand inline `$...$`, TeX shorthand display `$$...$$`.

#### Maxwell’s Equations

_`$$...$$` syntax_ (multimarkdown fails get generate correct HTML LaTeX)

$$  \begin{aligned}
\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\   \nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
\nabla \cdot \vec{\mathbf{B}} & = 0 \end{aligned}
$$

*Note: markdown-preview-plus prefers light syntax highlights*

## Mathematics (GitHub/GitLab) <a id="mathematics-githubgitlab-"></a><sup>[▴](#contents)</sup>

_GitHub and GitLab markdown does not directly support LaTeX formulas. A workaround is to use `https://render.githubusercontent.com/…` ._

> Note: Each plus `+` needs to be encoded as `$2B`to avoid how standard URL processing removes `+`.

_HTML syntax is ok with spaces on GitHub and GitLab._

<img src="https://render.githubusercontent.com/render/math?math=e^{i \pi} = -1 %2B a">

``` html
<img src="https://render.githubusercontent.com/render/math?math=e^{i \pi} = -1 %2B a">
```

_Markdown syntax without space encoding does not render correctly on GitHub and GitLab._

![](https://render.githubusercontent.com/render/math?math=e^{i \pi} = -1 %2B a)

``` markdown
![formula](https://render.githubusercontent.com/render/math?math=e^{i \pi} = -1 %2B a)
```

_Markdown syntax needs `%20` encoding for spaces to work correctly on GitHub and GitLab._

![](https://render.githubusercontent.com/render/math?math=e^{i%20\pi}%20=%20-1%20%2B%20a)

``` markdown
![formula](https://render.githubusercontent.com/render/math?math=e^{i%20\pi}%20=%20-1%20%2B%20a)
```

## Entities <a id="entities-"></a><sup>[▴](#contents)</sup>

▴ `&blacktriangle;` `&utrif;` _… link to top table of contents_  
⇗ `&neArr;`  North East Arrow _… link to offsite_  

⇈ `&uuarr;` `&upuparrows;` `&#x21C8;` `&#8648;`  _… link top a topic level_  
⇊ `&ddarr;` `&downdownarrows;` `&#x21CA;` `&#8650;` _… link down a topic_  

⇉ `&rrarr;` `&rightrightarrows;` `&#x21C9;` `&#8649;` _… link to previous page_  
⇇ `&llarr;` `&leftleftarrows;` `&#x21C7;` `&#8647;` _… link to next page_  
	
➤ `&#x27A4;`	_… play media_  
&blacktriangleright; `&blacktriangleright;` `&rtrif;` _... play media_  

⧫ `&lozf;` `&blacklozenge;` `&#x29EB;` `&#10731;`  
◊ `&loz;` `&lozenge;` `&#x25CA;` `&#9674;`  

&uparrow;

__&nearr; &amp;nearr;__  
__&blacktriangleleft; &amp;blacktriangleft; &amp;ltrif;__  
__&blacktriangledown; &amp;blacktriangdown; &amp;dtrif;__  ▲
__&urtri; &amp;urtri;__  
__&profline; &amp;profline;__  
__&angle; &amp;angle;__  
__&frasl; &amp;frasl; fraction slash__
__&andslope; &amp;andslope; fraction slash__  

see: com.apple.CharacterPicker.plist  
see also: com.apple.CharacterPaletteM.plist  
see: `_PROCESS_/KeyBoard/!FavoriteChars.txt` 

## Fonts <a id="fonts-"></a><sup>[▴](#contents)</sup>

'Andale Mono', 'DejaVu Sans Mono',

**`Example: <table>` with `\(`, `\[` & `$$` **

<table style="width:100%">
<tr>
  <td>
  <span style="font-family:'DejaVu Sans Mono','Andale Mono',Courier,Monaco,'Courier New',monospace; font-size: 10pt;">
Given:  
\[r_A = 30\ \texttt{mm} \]  
\[r_E = 90\ \text{mm}\]  
</span>
  </td>
  <td>
  $$r_A = r_B = r_C = r_D = 30\ \texttt{mm} = 0.03\ \texttt{m}$$
  </td>
</tr>
<tr>
  <td>
  $$r_A = r_B = r_C = r_D = 30\ \texttt{mm} = 0.03\ \texttt{m}$$
  </td>
  <td>
  \(r_A = 30\ \texttt{mm}\)<br>
  \(r_B = 30\ \texttt{mm}\)
  </td>
</tr>
</table> 

**`Example: <span>` with font styles**

<span style="font-family:'DejaVu Sans Mono','Andale Mono',Courier,Monaco,'Courier New',monospace; 
color: red; font-size: 12pt;">
0123 Plain <i>Italic</i> <u>Underline</u> <b>Bold</b> 
</span>

**`Example: <span> with \\(`**

<span style="font-family:'DejaVu Sans Mono','Andale Mono',monospace; font-size: 10pt;">
Given:  
\\(r_A = r_B = r_C = r_D = 30\ \texttt{mm} = 0.03\ \texttt{m}\\)  
\\(r_E = 90\ \text{mm} = 0.09\ \text{m}\\)  
\\(\omega_e = 180\ \text{rpm}\\)  
</span>

**`Example: <kbd> with \\(`**

<kbd>
Given:  
\\(r_A = r_B = r_C = r_D = 30 mm = 0.03 m\\)  
\\(r_E = 90 mm = 0.09\ m\\)  
\\(\omega_e = 180\ \text{RPR} = \\)  
</kbd>

**`Example: <div> with \\(`** _does not generally work. Pandoc `markdown` is OK. Pandoc `markdown_strict` may work with. use `<span>`_

<div style="font-family:'DejaVu Sans Mono','Andale Mono',Courier,Monaco,'Courier New',monospace; font-size: 10pt;">

Given:<br>
\\(\omega_a = 90\ \text{rpm}\\)<br>
\\(\omega_e = 180\ \text{rpm}\\)  

</div>

<div style="font-family:'DejaVu Sans Mono','Andale Mono',Courier,Monaco,'Courier New',monospace; font-size: 10pt;">

Given:<br>
$\omega_a = 90\ \text{rpm}$<br>
$\omega_e = 180\ \text{rpm}$  

</div>

<div style="font-family:'DejaVu Sans Mono','Andale Mono',Courier,Monaco,'Courier New',monospace; font-size: 10pt;">

Given:<br>
\(\omega_a = 90\ \text{rpm}\)<br>
\(\omega_e = 180\ \text{rpm}\)  

</div>


<div style="font-family:'DejaVu Sans Mono','Andale Mono',Courier,Monaco,'Courier New',monospace; font-size: 10pt;">

# `div` heading    

</div>

## XCode <a id="xcode-"></a><sup>[▴](#contents)</sup>

1. Added `Resources/` folder to the project. 
2. Set Build Phase rule for each `*.md` file
    1. Select Project Navigator > your project
    2. Select target > Build Phases
    3. Move (Drag & Drop) `*.md` files from `Compile Sources` to `Copy Bundle Resources`.

_May be possible to add a Build Rules action script for `*.md` files_

## Observations <a id="observations-"></a><sup>[▴](#contents)</sup>

* `markdown` (discount) and `hoedown` use mutually exclusive LaTeX syntax. `markdown` only uses a single backslash `\`.  `hoedown` uses both double backslash `\\` and dollar sign `$`

* Except for LaTeX syntax, `markdown` (discount), `hoedown` and `pandoc` can be configured to produce similar output from the same input.

* `pandoc` fenced code generates older `<pre class="name"><code>` instead of newer html5 recommended `<pre><code="langauge-name">`

* `auto_identifiers` is unique to `pandoc`. May produce identifiers similar to ones created for a manually generated table of contents.

* `markdown` (discount) fenced code does not work with html code.  Neither tilde nor backslash code fences are properly converted to `<pre><code>` tags. Angle brackets `<>` are not converted to html entities `&lt;&gt;`.

## Resources <a id="resources-"></a><sup>[▴](#contents)</sup>

[W3: Character Entity Reference Chart ⇗](https://dev.w3.org/html5/html-author/charref)  
[TeX Equation Editor ⇗](http://atomurl.net/math/)  
