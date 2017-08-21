#!/bin/bash

HEADER_FILE="header_cdn.html"
FOOTER_FILE="footer_cdn.html"

INPUT_FILE=md_evaluation.md

###########################
### DISCOUNT `markdown` ###
###########################
### NOTE: Discount `markdown` and MultiMarkdown `markdown` have the same command name.
### Thus, Discount `markdown` and MultiMarkdown `markdown` are mutually exclusive brew installs.
### However, Discount `markdown` can be manually installed to not be `markdown` in $PATH
# links            # Allow links.
# image            # Allow images.
# smarty           # Enable smartypants.
# pants            # Enable smartypants.
# html             # Allow raw html.
# strict           # Disable superscript, strikethrough & relaxed emphasis. ## too narrow. can not add tables back
# ext              # Enable pseudo-protocols.
# cdata            # Generate code for xml ![CDATA[...]].
# superscript      # Enable superscript processing.
# emphasis         # Emphasis happens everywhere. ## `*` always on. toggles `_`
# tables           # Don't process PHP Markdown Extra tables.
# del              # Enable ~~strikethrough~~.
# strikethrough    # Enable ~~strikethrough~~.
# toc              # Enable table-of-contents processing.
# autolink         # Make http://foo.com a link even without <>.
# safelink         # Paranoid check for link protocol.
# header           # Process pandoc-style header blocks.
# tabstop          # Expand tabs to 4 spaces.
# divquote         # Allow >%class% blocks.
# alphalist        # Allow alphabetic lists.
# definitionlist   # Allow definition lists at all (default). Use dldiscount and dlextra to control which syntaxes are respected.
# dldiscount       # Enable discount-style definition lists (default).
# dlextra          # Enable extra-style definition lists (not default). Both styles may be enabled simultaneously.
# footnote         # Allow markdown extra-style footnotes.
# style            # Extract <style> blocks from the output.
# fencedcode       # Allow fenced code blocks (not default).
# idanchor         # Use id= anchors for table-of-contents links instead of <a name=/> (not default).
# githubtags       # Allow underscore and dash in passed through element names (not default).
# urlencodedanchor # Use url-encoded chars for multibyte and nonalphanumeric chars rather than dots in toc links.

### all preferred settings
BODY_FILE="test.discount.a"
OPTIONS="+tabstop"
OPTIONS="$OPTIONS,-smarty"
### `+emphasis` enables intraword `_` emphasis
OPTIONS="$OPTIONS,+emphasis"
OPTIONS="$OPTIONS,+strikethrough"
OPTIONS="$OPTIONS,+footnote"
OPTIONS="$OPTIONS,+fencedcode"
OPTIONS="$OPTIONS,+latex"
/opt/discount/current/bin/markdown \
  -f $OPTIONS \
  -o $BODY_FILE.txt \
  $INPUT_FILE
cat $HEADER_FILE $BODY_FILE.txt $FOOTER_FILE > $BODY_FILE.html

### without LaTeX
BODY_FILE="test.discount.b"
OPTIONS="+tabstop"
OPTIONS="$OPTIONS,-smarty"
OPTIONS="$OPTIONS,-emphasis"
OPTIONS="$OPTIONS,-superscript"
OPTIONS="$OPTIONS,+strikethrough"
OPTIONS="$OPTIONS,+footnote"
OPTIONS="$OPTIONS,+fencedcode"
OPTIONS="$OPTIONS,+latex"
/opt/discount/current/bin/markdown \
  -f $OPTIONS \
  -o $BODY_FILE.txt \
  $INPUT_FILE
cat $HEADER_FILE $BODY_FILE.txt $FOOTER_FILE > $BODY_FILE.html

###############
### HOEDOWN ###
###############
# Main options:
#  --max-nesting=N  Maximum level of block nesting parsed. Default is 16.
#  --toc-level=N    Maximum level for headers included in the TOC. Zero disables TOC (the default).
#  --html           Render (X)HTML. The default.
#  --html-toc       Render the Table of Contents in (X)HTML.
#  --time           Show time spent in rendering.
#  --input-unit=N   Reading block size. Default is 1024.
#  --output-unit=N  Writing block size. Default is 64.
#  --help           Print this help text.
#  --version        Print Hoedown version.
# 
# Block extensions (--all-block):
#  --tables         Parse PHP-Markdown style tables.
#  --fenced-code    Parse fenced code blocks.
#  --footnotes      Parse footnotes.
# 
# Span extensions (--all-span):
#  --autolink       Automatically turn safe URLs into links.
#  --strikethrough  Parse ~~stikethrough~~ spans.
#  --underline      Parse _underline_ instead of emphasis.
#  --highlight      Parse ==highlight== spans.
#  --quote          Render `"quotes"` as `<q>quotes</q>`. different from <quoteblock>
#  --superscript    Parse super^script.
#  --math           Parse TeX $$math$$ syntax, Kramdown style.
# 
# Other flags (--all-flags):
#  --disable-intra-emphasis  Disable emphasis_between_words. Both `_` and `*`
#  --space-headers  Require a space after '#' in headers.
#  --math-explicit  Instead of guessing by context, parse $inline math$ and $$always block math$$ (requires --math).
# 
# Negative flags (--all-negative):
#  --disable-indented-code  Don't parse indented code blocks.
# 
# HTML-specific options:
#  --skip-html      Strip all HTML tags.
#  --escape         Escape all HTML.
#  --hard-wrap      Render each linebreak as <br>.
#  --xhtml          Render XHTML.

# baseline settings
BODY_FILE="test.hoedown.a"
hoedown \
  --strikethrough \
  --tables \
  --fenced-code \
  --footnotes \
  --math \
  -- \
  $INPUT_FILE \
  > $BODY_FILE.txt
cat $HEADER_FILE $BODY_FILE.txt $FOOTER_FILE > $BODY_FILE.html

## B ## all (my) preferred settings <<<
BODY_FILE="test.hoedown.b"
hoedown \
  --strikethrough \
  --tables \
  --fenced-code \
  --footnotes \
  --math --math-explicit \
  -- \
  $INPUT_FILE \
  > $BODY_FILE.txt
cat $HEADER_FILE $BODY_FILE.txt $FOOTER_FILE > $BODY_FILE.html

#################################
### MULTIMARKDOWN: `markdown` ###
#################################
### NOTE: Discount `markdown` and MultiMarkdown `markdown` have the same command name.
### Thus, Discount `markdown` and MultiMarkdown `markdown` mutually exclusive brew installs.
# multimarkdown  [OPTION...] [FILE...]
# 
# Options:
# -h, --help             Show help
#     --help-all         Show more help options ... does not work.
# -v, --version          Show version information
# -o, --output=FILE      Send output to FILE
# -t, --to=FORMAT        Convert to FORMAT
# Available FORMATs: html(default), latex, beamer, memoir, odf, opml, lyx, mmd
# -b, --batch            Process each file separately
# -c, --compatibility    Markdown compatibility mode. XHTML
# -f, --full             Force a complete document
# -s, --snippet          Force a snippet
# --process-html         Process Markdown inside of raw HTML
# -m, --metadata-keys    List all metadata keys
# -e, --extract          Extract specified metadata
# -x, --manifest         Show manifest of all transcluded files
# --random               Use random numbers for footnote anchors
# 
# -a, --accept           Accept all CriticMarkup changes
# -r, --reject           Reject all CriticMarkup changes
# 
# --smart, --nosmart     Toggle smart typography
# --notes, --nonotes     Toggle footnotes
# --labels, --nolabels   Disable id attributes for headers
# --mask, --nomask       Mask email addresses in HTML
# --escaped-line-breaks  Enable escaped line breaks
# 

# all preferred settings
BODY_FILE="test.multimarkdown.a"
multimarkdown \
  --nosmart \
  --notes \
  --nolabels \
  $INPUT_FILE \
  > $BODY_FILE.txt
cat $HEADER_FILE $BODY_FILE.txt $FOOTER_FILE > $BODY_FILE.html

##############
### PANDOC ###
##############
## http://pandoc.org/MANUAL.html#pandocs-markdown
# 
# -blank_before_header # disable Pandoc markdown `blank_before_header` extension
# basic settings
BODY_FILE="test.pandoc.a"
OPTIONS="markdown"
OPTIONS="$OPTIONS-auto_identifiers"
OPTIONS="$OPTIONS-blank_before_header"
OPTIONS="$OPTIONS-markdown_in_html_blocks"
OPTIONS="$OPTIONS-table_captions"
OPTIONS="$OPTIONS-blank_before_blockquote"
### INLINE
OPTIONS="$OPTIONS-subscript"
OPTIONS="$OPTIONS-superscript"
## `+intraword_underscores` disables intra_word underscore
## `-intraword_underscores` enables intra_word underscore
OPTIONS="$OPTIONS-intraword_underscores"
### TABLES
OPTIONS="$OPTIONS-simple_tables"
OPTIONS="$OPTIONS-multiline_tables"
OPTIONS="$OPTIONS-grid_tables"
OPTIONS="$OPTIONS+pipe_tables"
### FOOTNOTES
#OPTIONS="$OPTIONS+footnotes"
OPTIONS="$OPTIONS-inline_notes"
### MATH
OPTIONS="$OPTIONS+tex_math_double_backslash"
OPTIONS="$OPTIONS-tex_math_single_backslash"
OPTIONS="$OPTIONS+tex_math_dollars"
OPTIONS="$OPTIONS-raw_tex"
OPTIONS="$OPTIONS-latex_macros"
pandoc \
  --from=$OPTIONS \
  --to=html5 \
  --no-highlight \
  --mathjax \
  --output=$BODY_FILE.txt \
  $INPUT_FILE 
cat $HEADER_FILE $BODY_FILE.txt $FOOTER_FILE > $BODY_FILE.html

## B ## strict baseline. all (my) preferred settings <<<
BODY_FILE="test.pandoc.b"
OPTIONS="markdown_strict"
OPTIONS="$OPTIONS+strikeout"
## `+intraword_underscores` disables intra_word underscore
#OPTIONS="$OPTIONS+intraword_underscores"
#OPTIONS="$OPTIONS-blank_before_header"
#OPTIONS="$OPTIONS+table_captions"
#OPTIONS="$OPTIONS+simple_tables"
#OPTIONS="$OPTIONS+multiline_tables"
#OPTIONS="$OPTIONS+grid_tables"
OPTIONS="$OPTIONS+pipe_tables"
#### CODE BLOCKS
OPTIONS="$OPTIONS+fenced_code_blocks"
OPTIONS="$OPTIONS+backtick_code_blocks"
##inline_code_attributes # verbatim text attribute attachment `<$>`{.haskell}
#### FOOTNOTES
OPTIONS="$OPTIONS+footnotes"
#OPTIONS="$OPTIONS-inline_notes"
### MATH
OPTIONS="$OPTIONS+tex_math_double_backslash"
OPTIONS="$OPTIONS+tex_math_dollars"
pandoc \
  --from=$OPTIONS \
  --no-highlight \
  --to=html5 \
  --mathjax \
  --output=$BODY_FILE.txt \
  $INPUT_FILE 
cat $HEADER_FILE $BODY_FILE.txt $FOOTER_FILE > $BODY_FILE.html

