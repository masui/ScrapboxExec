#
# Firefox拡張機能用のxpiを作る
#
# XPIFILES=manifest.json exec.js exec_bg.js jquery-2.1.4.min.js p5.min.js icons
XPIFILES=manifest.json exec.js exec_bg.js jquery-2.1.4.min.js icons
xpi:
	/bin/rm -f scrapboxexec.xpi
	zip -r scrapboxexec.xpi ${XPIFILES}

# Firefox拡張機能を署名する
sign: xpi
	web-ext sign --api-key $(MOZILLA_USER) --api-secret $(MOZILLA_SECRET)
	/bin/cp web-ext-artifacts/`ls -1 -t web-ext-artifacts | head -1` scrapboxexec.xpi

#
# Chromeエクステンション公開用のzipを作る
#
ZIPFILES=manifest.json exec.js exec_bg.js jquery-2.1.4.min.js icons
zip:
	/bin/rm -f scrapboxexec.zip
	zip -r scrapboxexec.zip ${ZIPFILES}

