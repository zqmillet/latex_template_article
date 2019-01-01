\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{article}[2019/01/01 qiqi document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

\LoadClass{ctexart}

% 中文字体采用 ctex 默认配置, 调整英文字体配置
\setromanfont{Times New Roman}
\setsansfont{Arial}

% 数学配置
\RequirePackage{mathrsfs}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{bm}
\RequirePackage{mathtools}

% 设置段间距
\setlength{\parskip}{0.5\baselineskip}

% 设置标题格式
\RequirePackage{titlesec}
\titleformat*{\section}{\bfseries\fontsize{14pt}{14pt}\selectfont}
\titlespacing*{\section}{0pt}{10pt}{6pt}
\titleformat*{\subsection}{\bfseries\fontsize{12pt}{12pt}\selectfont}
\titlespacing*{\subsection}{0pt}{10pt}{6pt}
\titleformat*{\subsubsection}{\bfseries\fontsize{12pt}{12pt}\selectfont}
\titlespacing*{\subsubsection}{0pt}{10pt}{6pt}
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{1}
  
% 配置页面布局
\RequirePackage{geometry}
\geometry
{
    inner          = 1.1in,
    outer          = 1.1in,
    top            = 1.2in,
    bottom         = 1.2in,
    marginparwidth = 1.3in,
    marginparsep   = 0pt,
    headheight     = 21pt
}

% 段落首行缩进
\RequirePackage{indentfirst}

% 插图
\RequirePackage{tikz}
\usetikzlibrary{petri}

% 屏蔽宏包警告
\RequirePackage[]{silence}
\WarningsOff[hyperref]

% 设置书签、超链接等
\RequirePackage{hyperref}
\hypersetup{
    bookmarks = true,
    colorlinks,
    linkcolor = {black},
    citecolor = {blue!50!black},
    urlcolor  = black,
    bookmarksdepth = 4,
    pdfpagelabels
}

% 设置表格
\RequirePackage{tabu}
\RequirePackage{longtable}
\tabulinesep = 3pt

% 设置列表格式
\RequirePackage{enumitem}
\setenumerate[1]{itemsep = 0pt, partopsep = 0pt, parsep = 0pt, topsep = 0pt, label = (\arabic*), leftmargin = \parindent}
\setitemize[1]  {itemsep = 0pt, partopsep = 0pt, parsep = 0pt, topsep = 0pt, leftmargin = 1em}
\setitemize[2]  {itemsep = 0pt, partopsep = 0pt, parsep = 0pt, topsep = 0pt, leftmargin = 1em}
\setdescription {labelindent = 0em, itemsep = 0pt, parsep = 0pt, topsep = 0pt, partopsep = 0pt, labelsep* = 1em, leftmargin = !, style = standard, font = \normalfont}

% 设置页眉页脚
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\makeatletter
\DeclareDocumentCommand\authorname{m}{
    \gdef\qiqi@authorname{#1}
}
\DeclareDocumentCommand\maintitle{m}{
    \gdef\qiqi@title{#1}
}
\DeclareDocumentCommand\abstract{+m}{
    \long\gdef\qiqi@abstract{#1}
}

\fancypagestyle{plain}{%
    \fancyhf{}
    \fancyhead[L]{}
    \fancyhead[C]{\qiqi@title}
    \fancyhead[R]{\qiqi@authorname{}}
    \fancyfoot[C]{}
    \fancyfoot[R]{第 \thepage{} 页,共 \pageref{LastPage} 页}
    \fancyfoot[L]{\zhtoday}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0.4pt}
}

\fancypagestyle{cover}{%
    \fancyhf{}
    \fancyhead[L]{}
    \fancyhead[C]{\qiqi@title}
    \fancyhead[R]{\qiqi@authorname{}}
    \fancyfoot[C]{}
    \fancyfoot[R]{第 \thepage{} 页}
    \fancyfoot[L]{\zhtoday}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0.4pt}
}
\makeatother

\RequirePackage{pifont}
\let\proofname\relax
\RequirePackage[amsmath, amsthm, thmmarks, hyperref]{ntheorem}
\newcounter{DefinitionCounter}
\numberwithin{DefinitionCounter}{section}
\theoremstyle{plain}
\theoremsymbol{\ding{117}}
\theoremseparator{.}
\newtheorem{Definition}[DefinitionCounter]{定义}
\let\oldDefinition\Definition
\def\Definition{\oldDefinition\normalfont\kaishu}

\newcounter{CriterionCounter}
\numberwithin{CriterionCounter}{section}
\theoremstyle{plain}
\theoremsymbol{\ding{117}}
\theoremseparator{.}
\newtheorem{Criterion}[CriterionCounter]{判据}
\let\oldCriterion\Criterion
\def\Criterion{\oldCriterion\normalfont\itshape}

\newcounter{LemmaCounter}
\numberwithin{LemmaCounter}{section}
\theoremstyle{plain}
\theoremsymbol{\Circle}
\theoremseparator{.}
\newtheorem{Lemma}[LemmaCounter]{引理}
\let\oldLemma\Lemma
\def\Lemma{\oldLemma\normalfont\itshape}

\newcounter{ExampleCounter}
\numberwithin{ExampleCounter}{section}
\theoremstyle{plain}
\theoremsymbol{$\Box$}
\theoremseparator{.}
\newtheorem{Example}[ExampleCounter]{例}
\let\oldExample\Example
\def\Example{\oldExample\normalfont\itshape}

\newcounter{TheoremCounter}
\numberwithin{TheoremCounter}{section}
\theoremstyle{plain}
\theoremsymbol{$\Diamond$}
\theoremseparator{.}
\newtheorem{Theorem}[TheoremCounter]{定理}
\let\oldTheorem\Theorem
\def\Theorem{\oldTheorem\normalfont\itshape}

\newcounter{ProofCounter}
\numberwithin{ProofCounter}{section}
\theoremstyle{plain}
\theoremsymbol{\ding{110}}
\theoremseparator{.}
\newtheorem{Proof}[ProofCounter]{证明}
\let\oldProof\Proof
\def\Proof{\oldProof\normalfont\itshape}


% 设置图表标题格式
\RequirePackage{caption}
\captionsetup[figure]{
    font = {small, bf},
    labelsep = period,
    textformat = simple,
    skip = 5pt
}
\captionsetup[table]{
    font = {small, bf},
    labelsep = period,
    textformat = simple,
    skip = 5pt
}

% 设置封面、摘要和目录
\makeatletter
\AtBeginDocument{
    % page 1
    \pagestyle{empty}
    \pagenumbering{Alph}
    \pdfbookmark[1]{封面}{Cover}
    \begin{centering}
    \rule{0pt}{0pt}\\[100pt]
    {\Huge\bfseries \qiqi@title}\\[70pt]
    {\large\textbf{作者：}\qiqi@authorname}\\\vfill
    {\today}\\
    \end{centering}
    
    % page 2
    \clearpage
    \setcounter{page}{1}
    \renewcommand{\thepage}{\Roman{page}}
    % \pdfbookmark[1]{摘要}{Abstract}
    \addcontentsline{toc}{section}{摘要}
    \section*{摘要}
    \qiqi@abstract
    
    % page 3
    \clearpage
    \setcounter{tocdepth}{4}
    \pdfbookmark[1]{\contentsname}{Contents}
    \tableofcontents
    
    % page 4
    \clearpage
    \pagestyle{plain}
    \setcounter{page}{1}
    \renewcommand{\thepage}{\arabic{page}}
}
\makeatother

% 设置引用格式
\RequirePackage{cleveref}
\makeatletter
\crefformat{figure}              {图 #2#1#3}
\crefformat{section}             {第 #2#1#3 小节}
\crefformat{table}               {表 #2#1#3}
\crefformat{appendix}            {附录 #2#1#3}
\crefformat{equation}            {公式 #2(#1)#3}
\crefformat{Example}             {例 #2#1#3}
\crefformat{tcb@cnt@codebox}     {代码 #2#1#3}
\crefformat{tcb@cnt@codefilebox} {代码 #2#1#3}
\makeatother

% 设置行间距
\RequirePackage{setspace}

% 随机产生文本
\RequirePackage{lipsum}

% 设置行内代码
\RequirePackage[many, minted]{tcolorbox}
\tcbuselibrary{breakable}
\RequirePackage{minted}
\RequirePackage{color}
\makeatletter
\color{black}
\let\default@color\current@color
\def\inlinebox@true{true}
\define@key{inlinebox}{frame rule color} {\def\inlinebox@framerulecolor{#1}}
\define@key{inlinebox}{frame back color} {\def\inlinebox@framebackcolor{#1}}
\define@key{inlinebox}{frame text color} {\def\inlinebox@frametextcolor{#1}}
\define@key{inlinebox}{frame rule width} {\def\inlinebox@framerulewidth{#1}}
\define@key{inlinebox}{banner width}     {\def\inlinebox@bannerwidth{#1}}
\define@key{inlinebox}{show banner}[true]{\def\inlinebox@showbanner{#1}}
\define@key{inlinebox}{banner text color}{\def\inlinebox@bannertextcolor{#1}}
\define@key{inlinebox}{banner back color}{\def\inlinebox@bannerbackcolor{#1}}
\define@key{inlinebox}{banner text}      {\def\inlinebox@bannertext{#1}}
\NewDocumentCommand{\inlinebox}{O{} m}{%
  \setkeys{inlinebox}{%
    frame rule color  = black,
    frame back color  = white,
    frame text color  = black,
    frame rule width  = 0.4pt,
    banner width      = 8pt,
    show banner       = false,
    banner text color = white,
    banner back color = black,
    banner text       = BAN,
    #1
  }%
  \tcbox[%
    enhanced,
    tcbox raise base,
    nobeforeafter,
    boxrule           = \inlinebox@framerulewidth,
    top               = -1pt,
    bottom            = -1pt,
    right             = -1pt,
    arc               = 1pt,
    left              = \ifx\inlinebox@showbanner\inlinebox@true\inlinebox@bannerwidth-2pt\else-1pt\fi,
    colframe          = \inlinebox@framerulecolor,
    coltext           = \inlinebox@frametextcolor,
    colback           = \inlinebox@framebackcolor,
    before upper      = {\vphantom{蛤dg}},
    overlay           = {%
      \begin{tcbclipinterior} \ifx\inlinebox@showbanner\inlinebox@true
          \fill[\inlinebox@bannerbackcolor] (frame.south west) rectangle node[text = \inlinebox@bannertextcolor, scale = 0.4, font = \sffamily\bfseries, rotate = 90] {\inlinebox@bannertext} ([xshift = \inlinebox@bannerwidth]frame.north west);
        \fi
      \end{tcbclipinterior}%
    }%
  ]{#2}%
}
\makeatother
\newcommand{\inlinetext}[1]{\inlinebox{\mintinline{text}{#1}}}
\newcommand{\inlinepython}[1]{\inlinebox{\mintinline{python}{#1}}}
\newcommand{\inlinelatex}[1]{\inlinebox{\mintinline{latex}{#1}}}

% 设置行间代码
\usemintedstyle[python]{default}
\newtcblisting[auto counter, number within = section]{codebox}[1][]{%
  listing only,
  enhanced,
  breakable,
  sharp corners,
  left            = 6mm,
  top             = 0mm,
  bottom          = 0mm,
  colframe        = white,
  borderline horizontal = {0.4pt}{0pt}{black},
  colback         = white,
  colbacktitle    = white,
  coltitle        = black,
  titlerule       = 0.4pt,
  titlerule style = black,
  minted options  = {linenos, numbersep = 8pt, fontsize = \footnotesize, baselinestretch = 1.2, mathescape, breaklines = true, numbersep = 6.5pt},
  overlay         = {%
      \begin{tcbclipinterior}\draw[black] ([xshift = 6mm]frame.south west) -- ([xshift = 6mm]frame.north west);\end{tcbclipinterior}
    },
  #1%
}

\makeatletter
\def\codebox@caption{}
\def\codebox@label{}
\def\codebox@continuousnumber{false}
\def\codebox@true{true}
\def\codebox@language{python}
\define@key{codebox}{caption}{\renewcommand*{\codebox@caption}{#1}}
\define@key{codebox}{label}{\renewcommand*{\codebox@label}{#1}}
\define@key{codebox}{language}{\renewcommand*{\codebox@language}{#1}}
\define@key{codebox}{continuous number}[true]{\renewcommand*{\codebox@continuousnumber}{#1}}

\let\oldcodebox\codebox
\RenewDocumentCommand{\codebox}{O{}}{%
  \setkeys{codebox}{#1}%
  \oldcodebox[title = \hspace{-6mm}\small\bfseries 代码 \thetcbcounter. \codebox@caption, label = \codebox@label, minted language = \codebox@language]%
}

\let\oldendcodebox\endcodebox
\renewcommand{\endcodebox}{\oldendcodebox\noindent}

\let\latexbox\codebox
\let\endlatexbox\endcodebox
\makeatother
