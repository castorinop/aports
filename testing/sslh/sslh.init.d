#!/sbin/openrc-run
# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

start() {
	ebegin "Starting ${SVCNAME}"
	start-stop-daemon --start \
		--pidfile /var/run/${SVCNAME}.pid \
		--exec /usr/sbin/sslh -- \
			${DAEMON_OPTS} \
			-P /var/run/${SVCNAME}.pid
	eend $?
}

stop() {
	ebegin "Stopping ${SVCNAME}"
	start-stop-daemon --stop --quiet --retry 20 \
		--pidfile /var/run/${SVCNAME}.pid
	eend $?
}

