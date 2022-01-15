#!/bin/bash

# set -o verbose
# set -o nounset
# set -o errexit
set -o pipefail

UPNPC_OPTS=""
exit_code=0

if [ -z "${FORWARDING_IP}" ];
then
	echo "FORWARDING_IP must be specified"
	exit 1
fi;

if ! [ -z "${DESCRIPTION_XML_URL}" ];
then
	UPNPC_OPTS="${UPNPC_OPTS} -u ${DESCRIPTION_XML_URL}"
fi;

if ! [ -z "${TCP_PORT_FORWARDS}" ];
then
	for p in $(echo "${TCP_PORT_FORWARDS}" | tr ',' '\n');
	do
		external_port="${p}"
		port="$(echo ${p} | cut -d ':' -f 1)"

		echo "${p}" | grep -s ":" > /dev/null 2>&1
		if [ $? -eq 0 ];
		then
			external_port="$(echo ${p} | cut -d ':' -f 1)"
			port="$(echo ${p} | cut -d ':' -f 2)"
		fi;
		echo "Forwarding port tcp port ${external_port} -> ${port}";
		upnpc ${UPNPC_OPTS} -a "${FORWARDING_IP}" "${port}" "${external_port}" tcp
		[ $? -ne 0 ] && echo "Failed to port-forward port ${port}" && exit_code=1
	done;
fi;

if ! [ -z "${UDP_PORT_FORWARDS}" ];
then
	for p in $(echo "${TCP_PORT_FORWARDS}" | tr ',' '\n');
	do
		external_port="${p}"
		port="$(echo ${p} | cut -d ':' -f 1)"

		echo "${p}" | grep -s ":" > /dev/null 2>&1
		if [ $? -eq 0 ];
		then
			external_port="$(echo ${p} | cut -d ':' -f 1)"
			port="$(echo ${p} | cut -d ':' -f 2)"
		fi;
		echo "Forwarding port udp port ${external_port} -> ${port}";
		upnpc ${UPNPC_OPTS} -a "${FORWARDING_IP}" "${port}" "${external_port}" udp
		[ $? -ne 0 ] && echo "Failed to port-forward port ${port}" && exit_code=1
	done;
fi;

exit ${exit_code}
