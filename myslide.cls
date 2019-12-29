\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myslide}[2019/12/29 made by chenboshuo]

\def\myclasstype{article}% make sure a default is defined
\def\myclassoptions{a4paper,12pt} % 一般不加载

% 标志
\newif\if@Ebook
\newif\if@Beamer
\newif\if@Plain


% reference https://tex.stackexchange.com/questions/173643/how-can-i-set-up-my-custom-class-to-load-a-different-class-depending-on-the-clas
\RequirePackage{xkeyval}% better option processing - there are many other possibilities as you probably know so just adapt as needed

% 移动设备模式
\DeclareOptionX{ebook}{
  \gdef\myclasstype{article}
  \gdef\myclassoptions{12pt}
  \@Ebooktrue
}

% 幻灯片模式
\DeclareOptionX{slide}{
  \gdef\myclasstype{beamer}
  \gdef\myclassoptions{aspectratio=169}
  \@Beamertrue
}

% 打印模式
\DeclareOptionX{plain}{
  \gdef\myclasstype{article}
  \gdef\myclassoptions{a4paper,12pt}
  \@Plaintrue
  % \LoadClass[12pt]{article}
  % \RequirePackage[noxcolor]{beamerarticle}
  % \RequirePackage[papersize={108mm,144mm},margin=2mm]{geometry}
}
\DeclareOptionX*{%
  \PassOptionsToClass{\CurrentOption}{\myclasstype}%
}

\ProcessOptionsX
\LoadClass[\myclassoptions]{\myclasstype}

% 加载移动版选项
\if@Ebook
  \RequirePackage[noxcolor]{beamerarticle}
  \RequirePackage[papersize={108mm,144mm},margin=2mm]{geometry}
\fi

% 加载幻灯片选项
\if@Beamer
  \usetheme{metropolis}           % Use metropolis theme

  \metroset{sectionpage=progressbar,% 在每节标题下加进度条
            numbering=counter,% 展示页码
            block=fill%
            }
\fi

% 加载打印版选项
\if@Plain
  \RequirePackage[noxcolor]{beamerarticle}
\fi

% 包
\RequirePackage{ctex} % 中文包

% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
% 设置颜色
\RequirePackage{xcolor}
% 插入图片
\RequirePackage{graphicx}
\RequirePackage{float}
% 物理单位
\RequirePackage{siunitx}

% 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
% 图片路径
\graphicspath{{./figures/}}

% \newtheorem{definition}{定义}

% 矢量
\renewcommand{\vec}[1]{\overrightarrow{#1}}
% \renewcommand{\vec}[1]{\boldsymbol{#1}}

% 微分命令
  %% 参考 https://liam.page/2017/05/01/the-correct-way-to-use-differential-operator/
\newcommand*{\dif}{\mathop{}\!\mathrm{d}}

\endinput
