# Emacs tips

## Use Ediff on revisions of git files.
<m> x ediff-revisions
- | - changes split horz/vert
- p - previous diff
- n,spc - next diff

## Essential Emacs tips
### 1. Documentation at your fingertips.
It is difficult to learn more (and difficult to want to learn more, even) about Emacs until you know how to get to documentation easily. There are a few tiers of useful commands here, the most useful of which are:
- C-h C-h (help about help; essential!)
- C-h k, C-h f and C-h v (show the purpose of a key, function or variable, respectively; indispensable),
- C-h r (read the Emacs manual, within Emacs).

[More information about help.](http://www.gnu.org/software/emacs/manual/html_node/emacs/Help.html)

### 2. Keyboard macros.
I have already used keyboard macros in the course of writing this article, and I'm only on #2. In most editors, macros are only useful for the simplest and most mundane of tasks because you can hardly do anything useful using the keyboard alone. Emacs is different because it has such a large toolbox of high-level commands (for starters, commands for moving around in and manipulating characters, words, lines, sentences, functions, paragraphs, pages, and entire files).

In Emacs, if you know how to perform some task on the keyboard, then it takes just a couple of extra keystrokes to repeat it as many times as you like— no programming needed! To record a macro, press F3, do whatever it is you want to be recorded, and press F4. Then press F4 F4 F4 ... to replay as many times as you like. (In contrast, when you need to learn a completely new scripting language to automate some task— say, Visual Basic, for Office— and then figure out how to do your original task in that language, that can be a huge demotivator.)

Emacs macros have two killer features: (1) Once you've defined a macro you can say, "please repeat this macro until it would cause Emacs to start beeping". If your macro does some sort of transformation on a single line and moves to the next line, then M-0 F4 causes Emacs to do that transformation on all lines until it has reached the last line. Awesome. (2) Counters let you insert a different number every time a macro is run. Useful for, among other things, making consecutively (or non-consecutively!) numbered lists.

[More information about macros.](http://www.gnu.org/software/emacs/manual/html_node/emacs/Keyboard-Macros.html)

### 3. Rectangle editing.

Even though XML is supposed to be the new hot thing, people still do a lot with columnar data. It's pretty much everywhere in a typical Unix, for starters. The Emacs rectangle commands let you manipulate, copy and move rectangles of text; you specify the rectangles by putting mark at one corner and point at the opposite corner. You can also "insert" rectangles by adding the same text in the same position on a bunch of consecutive lines.

[More information about rectangles.](http://www.gnu.org/software/emacs/manual/html_node/emacs/Rectangles.html)

### 4. The mark ring.

You should never have to scroll around randomly in a buffer to find "that place you were just looking at". Whenever you take a diversion (e.g. by searching, or pressing M-< or M->), Emacs uses the mark to save your previous position, kind of like sticking your finger behind one page of a book while you go to glance at another page. You can return to the mark with C-x C-x. However, Emacs saves up to 16 previous values of the mark, and you can jump to previous ones with C-u C-SPC. This makes mark and the mark ring a valuable navigation tool. You can use it somewhat mindlessly: if you ever find yourself asking "where was I just now?" you can often just press C-u C-SPC until you find yourself back in the right place.

(You can also set the mark explicitly yourself with C-SPC, but I almost never need to do that for navigation purposes, only for marking regions.)

[More information about the mark ring.](http://www.gnu.org/software/emacs/manual/html_node/emacs/Mark-Ring.html)

### 5. Ediff.
Ediff is an easy way to compare two versions of a file. The most common way I activate it is with M-x ediff-buffers. Emacs highlights the differing regions in the buffers and pops up a new window in which you can enter additional commands. For example, n and p move among differing regions in the buffers. For each region, you can copy the first (or second) buffer's version to the other buffer with a and b, respectively. You can even edit either buffer while Ediff is active. Then you can switch back to the Ediff window and press ! to recompute the diff. Being able to view the differences between two files interactively— while editing those files— can be really useful.

[More information about ediff.](http://www.gnu.org/software/emacs/manual/html_node/ediff/index.html)

### 6. Tramp.
Ever start up another shell so you could run Emacs to edit a file? (e.g. a root shell, or a shell on a remote host) Well, Tramp has greatly reduced the number of situations where this is necessary. It allows you to edit "remote" files as if they were local to your machine, taking care of opening up shells, retrieving and writing data for you, etc. You simply specify remote files using a special syntax in C-x C-f (and near anywhere else Emacs asks you for a filename), e.g.: /ssh:phil@remotehost:records/pizza-toppings.txt. I say "'remote'" in quotes above because Tramp is general enough that you can also use it to edit local files— as another user— via su or sudo e.g.: /sudo::/etc/hosts.

[More information about Tramp.](http://www.gnu.org/software/emacs/manual/html_node/tramp/index.html)

### 7. Compilation-mode and friends.
One common theme in Emacs is that it gives you a lot of the raw power of tools you already know how to use— your compiler, grep, etc. — and then it augments them with super-powers. For example, when you run make using M-x compile, Emacs displays the compiler output in a new window. Should any compile errors appear, Emacs highlights them and notes their line numbers. Pressing C-x ` (M-x next-error) will jump directly to the line in your source code which caused the first error; press C-x ` repeatedly to jump to successive errors. (You can also click on the entries in the compilation output buffer.) You can go forwards and backwards through the list of errors using M-g n and M-g p (next-error and previous-error respectively).

This facility is general enough that you can use the same keys to jump to line numbers that appear in the output of M-x grep or M-x occur. In short, there is really no reason for you to have to explicitly note filenames and line numbers in program output, because Emacs can jump directly to them for you.

[More information about "compilation mode".](http://www.gnu.org/software/emacs/manual/html_node/emacs/Compilation-Mode.html)

### 8. VC.
I use Git for all my personal projects, and occasionally CVS and SVN for projects that I interact with. Emacs provides a package called VC which lets me perform many version control operations from within Emacs. It provides a layer of uniformity: the commands are all the same regardless of what version control system I am using for any particular project. This is great because it means that when bzr or hg or whatever comes into vogue, I can get quite a bit of work done before I have to learn yet another VCS.

Typical workflow for me: open a file. Make and test some changes. C-x v = to show a diff. If I like it, C-x v v to prepare a commit. Emacs pops up a new window in which to type a commit message. C-c C-c there to make the commit.

VC includes many other useful features, like showing annotated versions of files, showing change logs for particular files, and helping you review historical versions and diffs.

More information about VC.

### 9. Emacs server and multi-TTY support.

Multi-TTY support, available in Emacs 23+, makes opening new Emacs frames painless and fast. You might use this when you open a file from the shell, or when you run an external program that invokes $EDITOR. (However, so much functionality is available directly from within Emacs that it makes many external programs superfluous.)

To use multi-TTY, run M-x server-start in a running instance of Emacs. The set your $EDITOR to emacsclient -t. When a program invokes the editor, emacsclient contacts your existing instance of Emacs which opens up a new frame on the TTY you were using. It looks as if you had just run emacs, except that you can access all the state of your other instance: all your buffers, kill ring entries, etc. are there. And it starts up pretty much instantly. When you are done, press C-x # to finish and close that frame.

I use emacsclient to invoke Emacs in all sorts of other places. For example, instead of reading man pages using man, I read them in Emacs. Here's a snippet of my .bashrc:

pps_man() {
    /usr/bin/emacsclient -t -e "(woman \"$1\")"
}
alias man=pps_man

### 10. global-set-key.
Everyone has a different set of commonly used commands. Whatever features of Emacs you use the most, bind them to keys to save yourself time. For example, to bind C-c s to shell globally:

(global-set-key "\C-cs" 'shell)

Users may bind C-c [any letter] for their own use, and all major and minor modes are supposed to respect that.

More information about [key bindings](http://www.gnu.org/software/emacs/manual/html_node/emacs/Key) and [key binding conventions.](http://www.gnu.org/software/emacs/manual/html_node/elisp/Key-Binding-Conventions.html)