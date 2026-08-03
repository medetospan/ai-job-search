% Intro Options
\ProvidesClass{deedy-resume-openfont}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=2.3cm, vmargin=2.3cm]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage{fontspec,xltxtra,xunicode}

% Publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Color definitions
\usepackage[usenames,dvipsnames]{xcolor} 
\definecolor{date}{HTML}{666666} 
\definecolor{primary}{HTML}{2b2b2b} 
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}

% Set main fonts
% NOTE: this is cover_ru.cls, a Cyrillic-capable fork of cover.cls.
% The bundled OpenFonts (Raleway/Lato) have zero Cyrillic glyphs, so every
% \fontspec call below is mapped to a matching Helvetica Neue weight
% (installed system-wide on macOS with full Cyrillic coverage) instead of
% the Path-based OpenFonts files. Weight hierarchy preserved:
%   Lato-Hai (Hairline)     -> Helvetica Neue UltraLight
%   Lato-Lig (Light)        -> Helvetica Neue Light
%   Lato-Reg (bold role)    -> Helvetica Neue (Regular)
%   Lato-Bol (Bold)         -> Helvetica Neue Bold
%   Raleway-ExtraLight      -> Helvetica Neue Thin
%   Raleway-Medium          -> Helvetica Neue Medium
%   Raleway-Bold            -> Helvetica Neue Bold
\usepackage{fontspec}
\setmainfont[Color=primary,BoldItalicFont=Helvetica Neue Italic,BoldFont=Helvetica Neue,ItalicFont=Helvetica Neue Light Italic]{Helvetica Neue Light}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text]{Helvetica Neue Thin}

% Date command
\usepackage[absolute]{textpos}
% \usepackage[UKenglish]{isodate}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(155,5)
\color{date}\fontspec{Helvetica Neue Thin}\fontsize{8pt}{10pt}\selectfont
Last Updated on \today
\end{textblock}}

% Name command
\newcommand{\namesection}[3]{
\centering{
\fontsize{40pt}{60pt}
\fontspec{Helvetica Neue UltraLight}\selectfont #1
\fontspec{Helvetica Neue Light}\selectfont #2
} \\[5pt]
\centering{
\color{headings}
\fontspec{Helvetica Neue Medium}\fontsize{11pt}{14pt}\selectfont #3}
\noindent\makebox[\linewidth]{\color{headings}\rule{\paperwidth}{0.0pt}}
\vspace{0pt}
}

% Section seperators
\usepackage{titlesec}
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{8pt}}

% Headings command
\titleformat{\section}{\color{headings}
\scshape\fontspec{Helvetica Neue Light}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{}{0em}{}

% Subeadings command
\titleformat{\subsection}{
\color{subheadings}\fontspec{Helvetica Neue Bold}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}

\newcommand{\runsubsection}[1]{
\color{subheadings}\fontspec{Helvetica Neue Bold}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{
\color{subheadings}\raggedright\scshape\fontspec{Helvetica Neue Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{
\color{headings}\raggedright\fontspec{Helvetica Neue Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}

% Cover Letter
\newcommand{\companyname}[1]{\raggedright\fontspec{Helvetica Neue Bold}\fontsize{12pt}{14pt}\selectfont {#1 \\} \normalfont}

\newcommand{\companyaddress}[1]{\raggedright\fontspec{Helvetica Neue Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\}\mbox{}\\\mbox{}\\ \normalfont}

\newcommand{\currentdate}[1]{\raggedleft\fontspec{Helvetica Neue Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

% Letter content command
\newcommand{\lettercontent}[1]{\raggedright\fontspec{Helvetica Neue Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\}\mbox{}\\ \normalfont}

\newcommand{\closing}[1]{\raggedright\fontspec{Helvetica Neue Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\}\mbox{}\\\mbox{}\\ \normalfont}

\newcommand{\signature}[1]{\raggedright\fontspec{Helvetica Neue Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}