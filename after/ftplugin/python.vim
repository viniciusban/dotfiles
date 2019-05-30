setlocal foldmethod=indent
setlocal foldlevel=5
setlocal nofoldenable

setlocal tabstop=4
setlocal expandtab " Spaces, not tabs

setlocal equalprg=~/.local/bin/binscripts/python-style
setlocal list


" Python tools and helpers
" ------------------------

" Indent
map <silent> <buffer> == :write<CR>gg=G

" Linter
map <buffer> <localleader>m :update<CR>:make %<CR>

" Look for annotations (TODO/NOTE/FIXME) in project
map <buffer> <localleader>TO :grep '(\#\\|//) *(TODO\\|NOTE\\|FIXME)'


" Mappings to help with tests
" ===========================
"
" This is a big section.
"
" All mappings are prefixed with \t.
"
" Read documentation for running Python from inside vim in python_test.vim.

if !exists("g:test_command")
	let g:test_command = $DEV_TEST_COMMAND
endif
if !exists("g:test_target")
	let g:test_target = ""
endif

" \tt runs tests.
map <localleader>tt :wall <CR>:execute Ban_Run('run-test '. g:test_command .' '. g:test_target)<CR>
map t<CR> <localleader>tt

" \tC configure the test command (along with its arguments).
" Examples:
"   - pytest --pyargs
"   - python manage.py test -v 2
"   - python -m unittest
map <localleader>tC :let g:test_command="<c-r>=g:test_command<cr>"

" \tn Make a test name from current line contents
map <buffer> <localleader>tn :call ban#python#MakeValidPythonTestName() <CR>

" Mark the target and run tests
" -----------------------------

map <buffer> <localleader>ta :call ban#python#RunAllTestSuite() <CR>
map <buffer> <localleader>tp :call ban#python#RunCurrentTestPackage() <CR>
map <buffer> <localleader>tf :call ban#python#RunCurrentTestModule() <CR>
map <buffer> <localleader>tc :call ban#python#RunCurrentTestCase() <CR>
map <buffer> <localleader>tm :call ban#python#RunCurrentTestMethod() <CR>
