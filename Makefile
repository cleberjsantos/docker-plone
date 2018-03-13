build:
	- docker build -t ericof/plone:latest .

test:
	- docker run -p 8080:8080 -e ADMIN_USER=admin -e ADMIN_PASSWD=foo ericof/plone find / -type f -name 'plonecli' 2>&1 | grep -v "Permission denied" | grep '/plone/bin/plonecli'
	- docker run ericof/plone [ -f /plone/etc/zope.conf ] && echo 'ok' | grep 'ok'
	- docker run ericof/plone [ -f /plone/admin.sh ] && echo 'ok' | grep 'ok'
