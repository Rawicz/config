"	Default Settings:
	unlet! skip_defaults_vim
	source /usr/share/vim/vim82/defaults.vim
	set encoding=utf-8
	set background=dark
	let g:gruvbox_contrast_dark = 'medium'
	colorscheme gruvbox
	set number
	set list
"	set listchars=tab:Â»Â»Â·
	set listchars=tab:\ \ ğ„„
	set tabstop=3
	set shiftwidth=3
"	set completeopt=menuone
	set shortmess+=c
"	set hidden
"	set path+=**
	runtime! ftplugin/man.vim

"	Java Syntax:
	au BufEnter *.java set dictionary=/usr/dic/import,/usr/dic/lang,/usr/dic/Object,/usr/dic/util
	au BufEnter *.java set complete=k
	au BufEnter *.java set fdm=syntax fdn=2
	au BufEnter *.java normal zR
	highlight Folded ctermbg=236 ctermfg=250
	let java_highlight_java_lang_ids=1
	highlight javaConstant cterm=italic ctermfg=214

"	Macros:
"	^[<80>ıa is <Esc> ???
"	n : creates new instance on right
"	rest macros are for commands below
	let @n = 'F y^$a = new €ıapa();€ıaODi'
	let iwrp = '^y$iprivate int €ıa$a;€ıa]}Opublic int get€ıapb€kr€kr€krvU$a() {return €ıapa;}public void set€ıapb€kr€kr€krvU$a(int value) {this.€ıapa = value;}€ıa'
	let dwrp = '^y$iprivate double €ıa$a;€ıa]}Opublic double get€ıapb€kr€kr€krvU$a() {return €ıapa;}public void set€ıapb€kr€kr€krvU$a(double value) {this.€ıapa = value;}€ıa'
	let swrp = '^y$iprivate String €ıa$a;€ıa]}Opublic String get€ıapb€kr€kr€krvU$a() {return €ıapa;}public void set€ıapb€kr€kr€krvU$a(String value) {this.€ıapa = value;}€ıa'
	let cwrp = '^y$iprivate char €ıa$a;€ıa]}Opublic char get€ıapb€kr€kr€krvU$a() {return €ıapa;}public void set€ıapb€kr€kr€krvU$a(char value) {this.€ıapa = value;}€ıa'
	let bwrp = '^y$iprivate boolean €ıa$a;€ıa]}Opublic boolean get€ıapb€kr€kr€krvU$a() {return €ıapa;}public void is€ıapb€kr€kr€krvU$a(boolean value) {this.€ıapa = value;}€ıa'
	let lwrp = '^y$iprivate long €ıa$a;€ıa]}Opublic long get€ıapb€kr€kr€krvU$a() {return €ıapa;}public void set€ıapb€kr€kr€krvU$a(long value) {this.€ıapa = value;}€ıa'
	let fwrp = '^y$iprivate float €ıa$a;€ıa]}Opublic float get€ıapb€kr€kr€krvU$a() {return €ıapa;}public void set€ıapb€kr€kr€krvU$a(float value) {this.€ıapa = value;}€ıa'
	let wrp = 'bve"9y^vt "8yiprivate €ıa$a;€ıa]}Opublic €ıa"8pa €ıa"9pbvUiget€ıa$a() {return €ıa"9pa;}public void €ıa"9pbvUiset€ıa$a(€ıa"8pa value) {this.€ıa"9pa = value;}€ıa'
	let cn = '[{bye€kd/{Opublic €ıapa() {}€ku€ku€ıaf)'

"	Commands:
"	Cn, Cf : create constructor and fill constructor
"	TrimVars : used for Doc
"	Doc : creates documentation for method
"	I : creates comment above
"	FX : "FIXME" at the right
"	TD : "TODO" at the bottom
"	wrp : creates getter and setter, first letter puts corresponding type
	command Cn normal @=cn
	command TrimVars normal $as;<Esc><End>bd0$<Esc>
	command Cf normal yibo@, 0<Esc>V:s/,/\r/g<CR>?@<CR>0vt@"0yddViB:g/^/TrimVars<CR>ViB:s/.*/0this.& = &;/g<CR>
	command Doc normal ^t)yib1{<Down>O/**, <CR>/<Esc><Up>$p:s/, /\r/g<CR><Down>yt/me?/\*<CR>mb<Down>:'b+1,'e-1g/^/TrimVars<CR>:'b+1,'e-1s/.*/0 @param &/g<CR>:'b+1,'e-1s/s;//g<CR>:'b+1,'e-1g/@param $/d<CR>'eO@return<Esc><Up>'bo<Esc>
	command I normal 1{<Down>O/**<CR>/<Esc><Up>
	command FX normal $a // FIXME<Esc>
	command TD normal o// TODO: 
	command Wrp normal @=wrp
	command Iwrp normal @=iwrp
	command Lwrp normal @=lwrp
	command Bwrp normal @=bwrp
	command Dwrp normal @=dwrp
	command Fwrp normal @=fwrp
	command Swrp normal @=swrp
	command Cwrp normal @=cwrp
	command Odb %s/\/\/db/\/* db *\//g
	command Cdb %s/\/\* db \*\//\/\/db/g
	command Ddb g/\/\/db\|\/\* db \*\//d
"	command Pt g/import/s/$/\=printf(" \/\/t%d", line('.')-2)
	
"	Mappings:
"	puts the last word in ()/<>, deleting the whitespace before it:
	inoremap <C-a> @, <Esc>:s/, /,/g<CR>f@T i<BS>(<Esc>f@i)<Esc>:s/,/, /g<CR>f@s<Del><Del>
	inoremap <C-s> @, <Esc>:s/, /,/g<CR>f@T i<BS><<Esc>f@i><Esc>:s/,/, /g<CR>f@s<Del><Del>
"	copy word:
	inoremap <C-c> <Esc>yiwea
"	back/end of word:
	inoremap <C-b> <Esc>bi
	inoremap <C-e> <Esc>ei<Right>
"	copies the word above/below:
	inoremap <C-y> a<BS>klyejpa
	inoremap <C-q> a<BS>jlyekpa
"	start of the line and end of the line:
	inoremap <C-f> <Esc>^i
	inoremap <C-g> <End>
"	arrow movements:
	inoremap <C-h> <Left>
	inoremap <C-l> <Right>
	inoremap <C-k> <Up>
	inoremap <C-j> <Down>
"	fastjump to a new line and backspace:
	inoremap <C-x> <End><CR>
	inoremap <C-z> <BS>
"	sets autocomplete in buffer mode and pastes the first in queue:
	inoremap <C-p> .<BS><Esc>:set complete=.,u<CR>a<C-n>
"	sets autocomplete in dictionary mode and pastes the first in queue:
	inoremap <C-_> .<BS><Esc>:set complete=k<CR>a<C-n>
"	changing between the files:
	nnoremap <S-b> :bn<CR>
	nnoremap <C-b> :bp<CR>
	nnoremap <S-Tab> :e<Space>
	nnoremap <C-I> :b<Space>
	
"	Alt Hotkeys:
	execute "set <A-;>=\e;"
	inoremap <A-;> ;<CR>
	execute "set <A-=>=\e="
	inoremap <A-=> <Space>+ 
	execute "set <A-->=\e-"
	inoremap <A--> <Space>- 
	execute "set <A-'>=\e'"
	inoremap <A-'> ""<Left>
	execute "set <A-n>=\en"
	inoremap <A-n> <Esc>@n
	execute "set <A-q>=\eq"
	inoremap <A-q> if () {<CR>}<Esc><Up>f)i
	execute "set <A-j>=\ej"
	inoremap <A-j> java.util.
	execute "set <A-w>=\ew"
	inoremap <A-w> while () {<CR>}<Esc><Up>f)i
	execute "set <A-l>=\el"
	inoremap <A-l> for () {<CR>}<Esc><Up>f)i
	execute "set <A-r>=\er"
	inoremap <A-r> for (int i = 0; i < ; i++) {<CR>}<Esc><Up>f)F;i
	execute "set <A-m>=\em"
	inoremap <A-m> public class {<CR>public static void main (String[] args) {<CR>}<CR>}<Esc><Up><Up><Up>f{i
	execute "set <A-c>=\ec"
	inoremap <A-c> public class {<CR>}<Esc><Up>f{i
	execute "set <A-v>=\ev"
	inoremap <A-v> public void () {<CR>}<Esc><Up>f(i
	execute "set <A-o>=\eo"
	inoremap <A-o> System.out.println();<Left><Left>
	execute "set <A-d>=\ed"
	inoremap <A-d> /* db */ System.out.println();<Left><Left>
	execute "set <A-i>=\ei"
	inoremap <A-i> java.util.Scanner input = new java.util.Scanner(System.in);<Esc>
	execute "set <A-x>=\ex"
	inoremap <A-x> try {<CR>} catch(Exception e) {<CR>}<Esc>
	execute "set <A-t>=\et"
	inoremap <A-t> throw new RuntimeException("");
	execute "set <A-e>=\ee"
	inoremap <A-e> catch(Exception e) {<CR>}
	execute "set <A-p>=\ep"
	inoremap <A-p> ()
	execute "set <A-b>=\eb"
	inoremap <A-b> {<CR>}<Esc><Up>$a<CR>
	execute "set <A-f>=\ef"
	imap <A-f>i public int () {<CR>}<Esc><Up>f(i
	imap <A-f>d public double () {<CR>}<Esc><Up>f(i
	imap <A-f>b public boolean () {<CR>}<Esc><Up>f(i
	imap <A-f>l public String () {<CR>}<Esc><Up>f(i
	imap <A-f>v public void () {<CR>}<Esc><Up>f(i
	imap <A-f>0 public t0 () {<CR>}<Esc><Up>f(i
	imap <A-f>1 public t1 () {<CR>}<Esc><Up>f(i
	imap <A-f>2 public t2 () {<CR>}<Esc><Up>f(i
	imap <A-f>3 public t3 () {<CR>}<Esc><Up>f(i
	imap <A-f>4 public t4 () {<CR>}<Esc><Up>f(i
	imap <A-f>5 public t5 () {<CR>}<Esc><Up>f(i
	imap <A-f>6 public t6 () {<CR>}<Esc><Up>f(i
	imap <A-f>7 public t7 () {<CR>}<Esc><Up>f(i
	imap <A-f>8 public t8 () {<CR>}<Esc><Up>f(i
	imap <A-f>9 public t9 () {<CR>}<Esc><Up>f(i
	imap <A-f>t public () {<CR>}<Esc><Up>f(i
	imap <A-f>s public static <F10>
	imap <A-f>n <F10>
	imap <A-f>r protected <F10>
	imap <A-f>p private <F10>
	imap <F10>i int () {<CR>}<Esc><Up>f(i
	imap <F10>d double () {<CR>}<Esc><Up>f(i
	imap <F10>b boolean () {<CR>}<Esc><Up>f(i
	imap <F10>l String () {<CR>}<Esc><Up>f(i
	imap <F10>v void () {<CR>}<Esc><Up>f(i
	imap <F10>0 t0 () {<CR>}<Esc><Up>f(i
	imap <F10>1 t1 () {<CR>}<Esc><Up>f(i
	imap <F10>2 t2 () {<CR>}<Esc><Up>f(i
	imap <F10>3 t3 () {<CR>}<Esc><Up>f(i
	imap <F10>4 t4 () {<CR>}<Esc><Up>f(i
	imap <F10>5 t5 () {<CR>}<Esc><Up>f(i
	imap <F10>6 t6 () {<CR>}<Esc><Up>f(i
	imap <F10>7 t7 () {<CR>}<Esc><Up>f(i
	imap <F10>8 t8 () {<CR>}<Esc><Up>f(i
	imap <F10>9 t9 () {<CR>}<Esc><Up>f(i
	imap <F10>t () {<CR>}<Esc><Up>f(i
	imap <F10>s static <F10>
	execute "set <A-s>=\es"
	inoremap <A-s>1 boolean open = true;<CR>while(open) {<CR>}<Esc>O
	inoremap <A-s>2 switch(n) {<CR>case 1:<CR>break;<CR>case 2:<CR>break;<CR>default:<CR>break;<CR>}<Esc>
	inoremap <A-s>3 switch(n) {<CR>case 1:<CR>break;<CR>case 2:<CR>break;<CR>case 3:<CR>break;<CR>default:<CR>break;<CR>}<Esc>
	inoremap <A-s>4 switch(n) {<CR>case 1:<CR>break;<CR>case 2:<CR>break;<CR>case 3:<CR>break;<CR>case 4:<CR>break;<CR>default:<CR>break;<CR>}<Esc>
	inoremap <A-s>5 switch(n) {<CR>case 1:<CR>break;<CR>case 2:<CR>break;<CR>case 3:<CR>break;<CR>case 4:<CR>break;<CR>case 5:<CR>break;<CR>default:<CR>break;<CR>}<Esc>
	inoremap <A-s>6 switch(n) {<CR>case 1:<CR>break;<CR>case 2:<CR>break;<CR>case 3:<CR>break;<CR>case 4:<CR>break;<CR>case 5:<CR>break;<CR>case 6:<CR>break;<CR>default:<CR>break;<CR>}<Esc>
	inoremap <A-s>7 switch(n) {<CR>case 1:<CR>break;<CR>case 2:<CR>break;<CR>case 3:<CR>break;<CR>case 4:<CR>break;<CR>case 5:<CR>break;<CR>case 6:<CR>break;<CR>case 7:<CR>break;<CR>default:<CR>break;<CR>}<Esc>
	inoremap <A-s>8 switch(n) {<CR>case 1:<CR>break;<CR>case 2:<CR>break;<CR>case 3:<CR>break;<CR>case 4:<CR>break;<CR>case 5:<CR>break;<CR>case 6:<CR>break;<CR>case 7:<CR>break;<CR>case 8:<CR>break;<CR>default:<CR>break;<CR>}<Esc>
	inoremap <A-s>0 while(true) {<CR>}<Esc>O
