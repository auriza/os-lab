all: 01-proses.pdf \
	 02-fork.pdf \
	 03-signal.pdf \
	 04-shell.pdf \
	 05-thread.pdf \
	 06-thread-sync.pdf \
	 08-intro.pdf \
	 09-file.pdf \
	 09-permission-pipe.pdf \
	 10-text-process.pdf \
	 11-job-control.pdf \
	 13-shell-script.pdf \
	 14-misc.pdf

%.pdf: %.md
	pandoc -t beamer -o $@ $<

14-misc.pdf: 14-misc.md
	pandoc -t beamer -o $@ $< --latex-engine=xelatex

clean:
	rm -f *.pdf

.PHONY: all clean
