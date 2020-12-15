all: 01-proses.pdf \
	 02-fork.pdf \
	 03-shell.pdf \
	 04-signal.pdf \
	 05-thread.pdf \
	 06-thread-sync.pdf \
	 08-intro-cli.pdf \
	 09-file.pdf \
	 10-permission-pipe.pdf \
	 11-text-process.pdf \
	 12-job-control.pdf \
	 13-shell-script.pdf \
	 14-misc.pdf

%.pdf: %.md
	pandoc -t beamer -o $@ $<

14-misc.pdf: 14-misc.md
	pandoc -t beamer -o $@ $< --pdf-engine=xelatex

clean:
	rm -f *.pdf

.PHONY: all clean
