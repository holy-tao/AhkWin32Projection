#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SOCKET.ahk" { SOCKET }
#Import ".\WSAEVENT.ahk" { WSAEVENT }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */

;@region Constants

/**
 * @type {Guid}
 */
export global SOCKET_DEFAULT2_QM_POLICY := Guid("{aec2ef9c-3a4d-4d3e-8842-239942e39a47}")

/**
 * @type {Guid}
 */
export global REAL_TIME_NOTIFICATION_CAPABILITY := Guid("{6b59819a-5cae-492d-a901-2a3c2c50164f}")

/**
 * @type {Guid}
 */
export global REAL_TIME_NOTIFICATION_CAPABILITY_EX := Guid("{6843da03-154a-4616-a508-44371295f96b}")

/**
 * @type {Guid}
 */
export global ASSOCIATE_NAMERES_CONTEXT := Guid("{59a38b67-d4fe-46e1-ba3c-87ea74ca3049}")

/**
 * @type {Integer (UInt32)}
 */
export global SIO_RCVALL := 2550136833

/**
 * @type {Integer (UInt32)}
 */
export global SIO_RCVALL_MCAST := 2550136834

/**
 * @type {Integer (UInt32)}
 */
export global SIO_RCVALL_IGMPMCAST := 2550136835

/**
 * @type {Integer (UInt32)}
 */
export global SIO_KEEPALIVE_VALS := 2550136836

/**
 * @type {Integer (UInt32)}
 */
export global SIO_ABSORB_RTRALERT := 2550136837

/**
 * @type {Integer (UInt32)}
 */
export global SIO_UCAST_IF := 2550136838

/**
 * @type {Integer (UInt32)}
 */
export global SIO_LIMIT_BROADCASTS := 2550136839

/**
 * @type {Integer (UInt32)}
 */
export global SIO_INDEX_BIND := 2550136840

/**
 * @type {Integer (UInt32)}
 */
export global SIO_INDEX_MCASTIF := 2550136841

/**
 * @type {Integer (UInt32)}
 */
export global SIO_INDEX_ADD_MCAST := 2550136842

/**
 * @type {Integer (UInt32)}
 */
export global SIO_INDEX_DEL_MCAST := 2550136843

/**
 * @type {Integer (UInt32)}
 */
export global SIO_RCVALL_MCAST_IF := 2550136845

/**
 * @type {Integer (UInt32)}
 */
export global SIO_RCVALL_IF := 2550136846

/**
 * @type {Integer (UInt32)}
 */
export global SIO_LOOPBACK_FAST_PATH := 2550136848

/**
 * @type {Integer (UInt32)}
 */
export global SIO_TCP_INITIAL_RTO := 2550136849

/**
 * @type {Integer (UInt32)}
 */
export global SIO_APPLY_TRANSPORT_SETTING := 2550136851

/**
 * @type {Integer (UInt32)}
 */
export global SIO_QUERY_TRANSPORT_SETTING := 2550136852

/**
 * @type {Integer (UInt32)}
 */
export global SIO_TCP_SET_ICW := 2550136854

/**
 * @type {Integer (UInt32)}
 */
export global SIO_TCP_SET_ACK_FREQUENCY := 2550136855

/**
 * @type {Integer (UInt32)}
 */
export global SIO_SET_PRIORITY_HINT := 2550136856

/**
 * @type {Integer (UInt32)}
 */
export global SIO_PRIORITY_HINT := 2550136856

/**
 * @type {Integer (UInt32)}
 */
export global SIO_TCP_INFO := 3623878695

/**
 * @type {Integer (UInt32)}
 */
export global SIO_CPU_AFFINITY := 2550136853

/**
 * @type {Integer (UInt32)}
 */
export global SIO_TIMESTAMPING := 2550137067

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMPING_FLAG_RX := 1

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMPING_FLAG_TX := 2

/**
 * @type {Integer (UInt32)}
 */
export global SO_TIMESTAMP := 12298

/**
 * @type {Integer (UInt32)}
 */
export global SO_TIMESTAMP_ID := 12299

/**
 * @type {Integer (UInt32)}
 */
export global SIO_GET_TX_TIMESTAMP := 2550137066

/**
 * @type {Integer (UInt16)}
 */
export global TCP_INITIAL_RTO_UNSPECIFIED_MAX_SYN_RETRANSMISSIONS := 65535

/**
 * @type {Integer (UInt32)}
 */
export global TCP_INITIAL_RTO_DEFAULT_RTT := 0

/**
 * @type {Integer (UInt32)}
 */
export global TCP_INITIAL_RTO_DEFAULT_MAX_SYN_RETRANSMISSIONS := 0

/**
 * @type {Integer (UInt16)}
 */
export global TCP_INITIAL_RTO_NO_SYN_RETRANSMISSIONS := 65534

/**
 * @type {Integer (UInt32)}
 */
export global SIO_ACQUIRE_PORT_RESERVATION := 2550136932

/**
 * @type {Integer (UInt32)}
 */
export global SIO_RELEASE_PORT_RESERVATION := 2550136933

/**
 * @type {Integer (UInt32)}
 */
export global SIO_ASSOCIATE_PORT_RESERVATION := 2550136934

/**
 * @type {Integer (UInt32)}
 */
export global SIO_SET_SECURITY := 2550137032

/**
 * @type {Integer (UInt32)}
 */
export global SIO_QUERY_SECURITY := 3623878857

/**
 * @type {Integer (UInt32)}
 */
export global SIO_SET_PEER_TARGET_NAME := 2550137034

/**
 * @type {Integer (UInt32)}
 */
export global SIO_DELETE_PEER_TARGET_NAME := 2550137035

/**
 * @type {Integer (UInt32)}
 */
export global SIO_QUERY_WFP_CONNECTION_REDIRECT_RECORDS := 2550137052

/**
 * @type {Integer (UInt32)}
 */
export global SIO_QUERY_WFP_CONNECTION_REDIRECT_CONTEXT := 2550137053

/**
 * @type {Integer (UInt32)}
 */
export global SIO_SET_WFP_CONNECTION_REDIRECT_RECORDS := 2550137054

/**
 * @type {Integer (UInt32)}
 */
export global SIO_SOCKET_USAGE_NOTIFICATION := 2550137036

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_SETTINGS_GUARANTEE_ENCRYPTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_SETTINGS_ALLOW_INSECURE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_SETTINGS_IPSEC_SKIP_FILTER_INSTANTIATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_SETTINGS_IPSEC_OPTIONAL_PEER_NAME_VERIFICATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_SETTINGS_IPSEC_ALLOW_FIRST_INBOUND_PKT_UNENCRYPTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_SETTINGS_IPSEC_PEER_NAME_IS_RAW_FORMAT := 8

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_QUERY_IPSEC2_ABORT_CONNECTION_ON_FIELD_CHANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_QUERY_IPSEC2_FIELD_MASK_MM_SA_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_QUERY_IPSEC2_FIELD_MASK_QM_SA_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_INFO_CONNECTION_SECURED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_INFO_CONNECTION_ENCRYPTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOCKET_INFO_CONNECTION_IMPERSONATED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SIO_QUERY_WFP_ALE_ENDPOINT_HANDLE := 1476395213

/**
 * @type {Integer (UInt32)}
 */
export global SIO_QUERY_RSS_SCALABILITY_INFO := 1476395218

/**
 * @type {Integer (UInt32)}
 */
export global IN4ADDR_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global IN4ADDR_LOOPBACK := 16777343

/**
 * @type {Integer (UInt32)}
 */
export global IN4ADDR_BROADCAST := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global IN4ADDR_LOOPBACKPREFIX_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global IN4ADDR_LINKLOCALPREFIX_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global IN4ADDR_MULTICASTPREFIX_LENGTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global SIO_SET_COMPATIBILITY_MODE := 2550137132

/**
 * @type {Integer (UInt32)}
 */
export global RIO_MSG_DONT_NOTIFY := 1

/**
 * @type {Integer (UInt32)}
 */
export global RIO_MSG_DEFER := 2

/**
 * @type {Integer (UInt32)}
 */
export global RIO_MSG_WAITALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global RIO_MSG_COMMIT_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global RIO_MAX_CQ_SIZE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global RIO_CORRUPT_CQ := 4294967295

/**
 * @type {Integer (UInt16)}
 */
export global AF_UNIX := 1

/**
 * @type {Integer (UInt16)}
 */
export global AF_IMPLINK := 3

/**
 * @type {Integer (UInt16)}
 */
export global AF_PUP := 4

/**
 * @type {Integer (UInt16)}
 */
export global AF_CHAOS := 5

/**
 * @type {Integer (UInt16)}
 */
export global AF_NS := 6

/**
 * @type {Integer (UInt16)}
 */
export global AF_IPX := 6

/**
 * @type {Integer (UInt16)}
 */
export global AF_ISO := 7

/**
 * @type {Integer (UInt16)}
 */
export global AF_OSI := 7

/**
 * @type {Integer (UInt16)}
 */
export global AF_ECMA := 8

/**
 * @type {Integer (UInt16)}
 */
export global AF_DATAKIT := 9

/**
 * @type {Integer (UInt16)}
 */
export global AF_CCITT := 10

/**
 * @type {Integer (UInt16)}
 */
export global AF_SNA := 11

/**
 * @type {Integer (UInt16)}
 */
export global AF_DECnet := 12

/**
 * @type {Integer (UInt16)}
 */
export global AF_DLI := 13

/**
 * @type {Integer (UInt16)}
 */
export global AF_LAT := 14

/**
 * @type {Integer (UInt16)}
 */
export global AF_HYLINK := 15

/**
 * @type {Integer (UInt16)}
 */
export global AF_APPLETALK := 16

/**
 * @type {Integer (UInt16)}
 */
export global AF_NETBIOS := 17

/**
 * @type {Integer (UInt16)}
 */
export global AF_VOICEVIEW := 18

/**
 * @type {Integer (UInt16)}
 */
export global AF_FIREFOX := 19

/**
 * @type {Integer (UInt16)}
 */
export global AF_UNKNOWN1 := 20

/**
 * @type {Integer (UInt16)}
 */
export global AF_BAN := 21

/**
 * @type {Integer (UInt16)}
 */
export global AF_ATM := 22

/**
 * @type {Integer (UInt16)}
 */
export global AF_CLUSTER := 24

/**
 * @type {Integer (UInt16)}
 */
export global AF_12844 := 25

/**
 * @type {Integer (UInt16)}
 */
export global AF_IRDA := 26

/**
 * @type {Integer (UInt16)}
 */
export global AF_NETDES := 28

/**
 * @type {Integer (UInt16)}
 */
export global AF_MAX := 29

/**
 * @type {Integer (UInt16)}
 */
export global AF_TCNPROCESS := 29

/**
 * @type {Integer (UInt16)}
 */
export global AF_TCNMESSAGE := 30

/**
 * @type {Integer (UInt16)}
 */
export global AF_ICLFXBM := 31

/**
 * @type {Integer (UInt16)}
 */
export global AF_LINK := 33

/**
 * @type {Integer (UInt16)}
 */
export global AF_HYPERV := 34

/**
 * @type {Integer (Int32)}
 */
export global SOL_SOCKET := 65535

/**
 * @type {Integer (UInt32)}
 */
export global SOL_IP := 65531

/**
 * @type {Integer (UInt32)}
 */
export global SOL_IPV6 := 65530

/**
 * @type {Integer (Int32)}
 */
export global SO_DEBUG := 1

/**
 * @type {Integer (Int32)}
 */
export global SO_ACCEPTCONN := 2

/**
 * @type {Integer (Int32)}
 */
export global SO_REUSEADDR := 4

/**
 * @type {Integer (Int32)}
 */
export global SO_KEEPALIVE := 8

/**
 * @type {Integer (Int32)}
 */
export global SO_DONTROUTE := 16

/**
 * @type {Integer (Int32)}
 */
export global SO_BROADCAST := 32

/**
 * @type {Integer (Int32)}
 */
export global SO_USELOOPBACK := 64

/**
 * @type {Integer (Int32)}
 */
export global SO_LINGER := 128

/**
 * @type {Integer (Int32)}
 */
export global SO_OOBINLINE := 256

/**
 * @type {Integer (Int32)}
 */
export global SO_SNDBUF := 4097

/**
 * @type {Integer (Int32)}
 */
export global SO_RCVBUF := 4098

/**
 * @type {Integer (Int32)}
 */
export global SO_SNDLOWAT := 4099

/**
 * @type {Integer (Int32)}
 */
export global SO_RCVLOWAT := 4100

/**
 * @type {Integer (Int32)}
 */
export global SO_SNDTIMEO := 4101

/**
 * @type {Integer (Int32)}
 */
export global SO_RCVTIMEO := 4102

/**
 * @type {Integer (Int32)}
 */
export global SO_ERROR := 4103

/**
 * @type {Integer (Int32)}
 */
export global SO_TYPE := 4104

/**
 * @type {Integer (Int32)}
 */
export global SO_BSP_STATE := 4105

/**
 * @type {Integer (Int32)}
 */
export global SO_GROUP_ID := 8193

/**
 * @type {Integer (Int32)}
 */
export global SO_GROUP_PRIORITY := 8194

/**
 * @type {Integer (Int32)}
 */
export global SO_MAX_MSG_SIZE := 8195

/**
 * @type {Integer (Int32)}
 */
export global SO_CONDITIONAL_ACCEPT := 12290

/**
 * @type {Integer (UInt32)}
 */
export global SO_PAUSE_ACCEPT := 12291

/**
 * @type {Integer (UInt32)}
 */
export global SO_COMPARTMENT_ID := 12292

/**
 * @type {Integer (Int32)}
 */
export global SO_RANDOMIZE_PORT := 12293

/**
 * @type {Integer (Int32)}
 */
export global SO_PORT_SCALABILITY := 12294

/**
 * @type {Integer (Int32)}
 */
export global SO_REUSE_UNICASTPORT := 12295

/**
 * @type {Integer (Int32)}
 */
export global SO_REUSE_MULTICASTPORT := 12296

/**
 * @type {Integer (UInt32)}
 */
export global SO_ORIGINAL_DST := 12303

/**
 * @type {Integer (UInt32)}
 */
export global IP6T_SO_ORIGINAL_DST := 12303

/**
 * @type {Integer (UInt32)}
 */
export global SO_RECEIVED_HOPLIMIT := 12304

/**
 * @type {Integer (UInt32)}
 */
export global SO_RECEIVED_PROCESSOR := 12305

/**
 * @type {Integer (UInt32)}
 */
export global WSK_SO_BASE := 16384

/**
 * @type {Integer (Int32)}
 */
export global TCP_NODELAY := 1

/**
 * @type {Integer (UInt32)}
 */
export global _SS_MAXSIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global IOC_UNIX := 0

/**
 * @type {Integer (UInt32)}
 */
export global IOC_WS2 := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global IOC_PROTOCOL := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global IOC_VENDOR := 402653184

/**
 * @type {Integer (UInt32)}
 */
export global SIO_ASSOCIATE_HANDLE := 2281701377

/**
 * @type {Integer (UInt32)}
 */
export global SIO_ENABLE_CIRCULAR_QUEUEING := 671088642

/**
 * @type {Integer (UInt32)}
 */
export global SIO_FIND_ROUTE := 1207959555

/**
 * @type {Integer (UInt32)}
 */
export global SIO_FLUSH := 671088644

/**
 * @type {Integer (UInt32)}
 */
export global SIO_GET_BROADCAST_ADDRESS := 1207959557

/**
 * @type {Integer (UInt32)}
 */
export global SIO_GET_EXTENSION_FUNCTION_POINTER := 3355443206

/**
 * @type {Integer (UInt32)}
 */
export global SIO_GET_QOS := 3355443207

/**
 * @type {Integer (UInt32)}
 */
export global SIO_GET_GROUP_QOS := 3355443208

/**
 * @type {Integer (UInt32)}
 */
export global SIO_MULTIPOINT_LOOPBACK := 2281701385

/**
 * @type {Integer (UInt32)}
 */
export global SIO_MULTICAST_SCOPE := 2281701386

/**
 * @type {Integer (UInt32)}
 */
export global SIO_SET_QOS := 2281701387

/**
 * @type {Integer (UInt32)}
 */
export global SIO_SET_GROUP_QOS := 2281701388

/**
 * @type {Integer (UInt32)}
 */
export global SIO_TRANSLATE_HANDLE := 3355443213

/**
 * @type {Integer (UInt32)}
 */
export global SIO_ROUTING_INTERFACE_QUERY := 3355443220

/**
 * @type {Integer (UInt32)}
 */
export global SIO_ROUTING_INTERFACE_CHANGE := 2281701397

/**
 * @type {Integer (UInt32)}
 */
export global SIO_ADDRESS_LIST_QUERY := 1207959574

/**
 * @type {Integer (UInt32)}
 */
export global SIO_ADDRESS_LIST_CHANGE := 671088663

/**
 * @type {Integer (UInt32)}
 */
export global SIO_QUERY_TARGET_PNP_HANDLE := 1207959576

/**
 * @type {Integer (UInt32)}
 */
export global SIO_QUERY_RSS_PROCESSOR_INFO := 1207959589

/**
 * @type {Integer (UInt32)}
 */
export global SIO_ADDRESS_LIST_SORT := 3355443225

/**
 * @type {Integer (UInt32)}
 */
export global SIO_RESERVED_1 := 2281701402

/**
 * @type {Integer (UInt32)}
 */
export global SIO_RESERVED_2 := 2281701409

/**
 * @type {Integer (UInt32)}
 */
export global SIO_GET_MULTIPLE_EXTENSION_FUNCTION_POINTER := 3355443236

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_TCPMUX := 1

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_ECHO := 7

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_DISCARD := 9

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_SYSTAT := 11

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_DAYTIME := 13

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_NETSTAT := 15

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_QOTD := 17

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_MSP := 18

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_CHARGEN := 19

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_FTP_DATA := 20

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_FTP := 21

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_TELNET := 23

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_SMTP := 25

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_TIMESERVER := 37

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_NAMESERVER := 42

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_WHOIS := 43

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_MTP := 57

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_TFTP := 69

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_RJE := 77

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_FINGER := 79

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_TTYLINK := 87

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_SUPDUP := 95

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_POP3 := 110

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_NTP := 123

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_EPMAP := 135

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_NETBIOS_NS := 137

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_NETBIOS_DGM := 138

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_NETBIOS_SSN := 139

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_IMAP := 143

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_SNMP := 161

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_SNMP_TRAP := 162

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_IMAP3 := 220

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_LDAP := 389

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_HTTPS := 443

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_MICROSOFT_DS := 445

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_EXECSERVER := 512

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_LOGINSERVER := 513

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_CMDSERVER := 514

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_EFSSERVER := 520

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_BIFFUDP := 512

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_WHOSERVER := 513

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_ROUTESERVER := 520

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_RESERVED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_REGISTERED_MIN := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_REGISTERED_MAX := 49151

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_DYNAMIC_MIN := 49152

/**
 * @type {Integer (UInt32)}
 */
export global IPPORT_DYNAMIC_MAX := 65535

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSA_NET := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSA_NSHIFT := 24

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSA_HOST := 16777215

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSA_MAX := 128

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSB_NET := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSB_NSHIFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSB_HOST := 65535

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSB_MAX := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSC_NET := 4294967040

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSC_NSHIFT := 8

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSC_HOST := 255

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSD_NET := 4026531840

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSD_NSHIFT := 28

/**
 * @type {Integer (UInt32)}
 */
export global IN_CLASSD_HOST := 268435455

/**
 * @type {Integer (UInt32)}
 */
export global INADDR_LOOPBACK := 2130706433

/**
 * @type {Integer (UInt32)}
 */
export global INADDR_NONE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global IOCPARM_MASK := 127

/**
 * @type {Integer (UInt32)}
 */
export global IOC_VOID := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global IOC_OUT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global IOC_IN := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global MSG_TRUNC := 256

/**
 * @type {Integer (UInt32)}
 */
export global MSG_CTRUNC := 512

/**
 * @type {Integer (UInt32)}
 */
export global MSG_BCAST := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MSG_MCAST := 2048

/**
 * @type {Integer (UInt32)}
 */
export global MSG_ERRQUEUE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global AI_PASSIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global AI_CANONNAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global AI_NUMERICHOST := 4

/**
 * @type {Integer (UInt32)}
 */
export global AI_NUMERICSERV := 8

/**
 * @type {Integer (UInt32)}
 */
export global AI_DNS_ONLY := 16

/**
 * @type {Integer (UInt32)}
 */
export global AI_FORCE_CLEAR_TEXT := 32

/**
 * @type {Integer (UInt32)}
 */
export global AI_BYPASS_DNS_CACHE := 64

/**
 * @type {Integer (UInt32)}
 */
export global AI_RETURN_TTL := 128

/**
 * @type {Integer (UInt32)}
 */
export global AI_ALL := 256

/**
 * @type {Integer (UInt32)}
 */
export global AI_ADDRCONFIG := 1024

/**
 * @type {Integer (UInt32)}
 */
export global AI_V4MAPPED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global AI_NON_AUTHORITATIVE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global AI_SECURE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global AI_RETURN_PREFERRED_NAMES := 65536

/**
 * @type {Integer (UInt32)}
 */
export global AI_FQDN := 131072

/**
 * @type {Integer (UInt32)}
 */
export global AI_FILESERVER := 262144

/**
 * @type {Integer (UInt32)}
 */
export global AI_DISABLE_IDN_ENCODING := 524288

/**
 * @type {Integer (UInt32)}
 */
export global AI_SECURE_WITH_FALLBACK := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global AI_EXCLUSIVE_CUSTOM_SERVERS := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global AI_RETURN_RESPONSE_FLAGS := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global AI_REQUIRE_SECURE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global AI_RESOLUTION_HANDLE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global AI_EXTENDED := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global ADDRINFOEX_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global ADDRINFOEX_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global ADDRINFOEX_VERSION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global ADDRINFOEX_VERSION_5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global ADDRINFOEX_VERSION_6 := 6

/**
 * @type {Integer (UInt32)}
 */
export global ADDRINFOEX_VERSION_7 := 7

/**
 * @type {Integer (UInt32)}
 */
export global AI_DNS_SERVER_TYPE_UDP := 1

/**
 * @type {Integer (UInt32)}
 */
export global AI_DNS_SERVER_TYPE_DOH := 2

/**
 * @type {Integer (UInt32)}
 */
export global AI_DNS_SERVER_TYPE_DOT := 3

/**
 * @type {Integer (UInt32)}
 */
export global AI_DNS_SERVER_UDP_FALLBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global AI_DNS_RESPONSE_SECURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global AI_DNS_RESPONSE_HOSTFILE := 2

/**
 * @type {Integer (UInt64)}
 */
export global AI_EXTRA_DNSSEC_REQUIRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global NS_ALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global NS_SAP := 1

/**
 * @type {Integer (UInt32)}
 */
export global NS_NDS := 2

/**
 * @type {Integer (UInt32)}
 */
export global NS_PEER_BROWSE := 3

/**
 * @type {Integer (UInt32)}
 */
export global NS_SLP := 5

/**
 * @type {Integer (UInt32)}
 */
export global NS_DHCP := 6

/**
 * @type {Integer (UInt32)}
 */
export global NS_TCPIP_LOCAL := 10

/**
 * @type {Integer (UInt32)}
 */
export global NS_TCPIP_HOSTS := 11

/**
 * @type {Integer (UInt32)}
 */
export global NS_DNS := 12

/**
 * @type {Integer (UInt32)}
 */
export global NS_NETBT := 13

/**
 * @type {Integer (UInt32)}
 */
export global NS_WINS := 14

/**
 * @type {Integer (UInt32)}
 */
export global NS_NLA := 15

/**
 * @type {Integer (UInt32)}
 */
export global NS_NBP := 20

/**
 * @type {Integer (UInt32)}
 */
export global NS_MS := 30

/**
 * @type {Integer (UInt32)}
 */
export global NS_STDA := 31

/**
 * @type {Integer (UInt32)}
 */
export global NS_NTDS := 32

/**
 * @type {Integer (UInt32)}
 */
export global NS_EMAIL := 37

/**
 * @type {Integer (UInt32)}
 */
export global NS_X500 := 40

/**
 * @type {Integer (UInt32)}
 */
export global NS_NIS := 41

/**
 * @type {Integer (UInt32)}
 */
export global NS_NISPLUS := 42

/**
 * @type {Integer (UInt32)}
 */
export global NS_WRQ := 50

/**
 * @type {Integer (UInt32)}
 */
export global NS_NETDES := 60

/**
 * @type {Integer (UInt32)}
 */
export global NI_NOFQDN := 1

/**
 * @type {Integer (UInt32)}
 */
export global NI_NUMERICHOST := 2

/**
 * @type {Integer (UInt32)}
 */
export global NI_NAMEREQD := 4

/**
 * @type {Integer (UInt32)}
 */
export global NI_NUMERICSERV := 8

/**
 * @type {Integer (UInt32)}
 */
export global NI_DGRAM := 16

/**
 * @type {Integer (UInt32)}
 */
export global NI_MAXHOST := 1025

/**
 * @type {Integer (UInt32)}
 */
export global NI_MAXSERV := 32

/**
 * @type {Integer (UInt32)}
 */
export global IFF_UP := 1

/**
 * @type {Integer (UInt32)}
 */
export global IFF_BROADCAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global IFF_LOOPBACK := 4

/**
 * @type {Integer (UInt32)}
 */
export global IFF_POINTTOPOINT := 8

/**
 * @type {Integer (UInt32)}
 */
export global IFF_MULTICAST := 16

/**
 * @type {Integer (Int32)}
 */
export global IP_OPTIONS := 1

/**
 * @type {Integer (Int32)}
 */
export global IP_HDRINCL := 2

/**
 * @type {Integer (Int32)}
 */
export global IP_TOS := 3

/**
 * @type {Integer (Int32)}
 */
export global IP_TTL := 4

/**
 * @type {Integer (Int32)}
 */
export global IP_MULTICAST_IF := 9

/**
 * @type {Integer (Int32)}
 */
export global IP_MULTICAST_TTL := 10

/**
 * @type {Integer (Int32)}
 */
export global IP_MULTICAST_LOOP := 11

/**
 * @type {Integer (Int32)}
 */
export global IP_ADD_MEMBERSHIP := 12

/**
 * @type {Integer (Int32)}
 */
export global IP_DROP_MEMBERSHIP := 13

/**
 * @type {Integer (Int32)}
 */
export global IP_DONTFRAGMENT := 14

/**
 * @type {Integer (Int32)}
 */
export global IP_ADD_SOURCE_MEMBERSHIP := 15

/**
 * @type {Integer (Int32)}
 */
export global IP_DROP_SOURCE_MEMBERSHIP := 16

/**
 * @type {Integer (Int32)}
 */
export global IP_BLOCK_SOURCE := 17

/**
 * @type {Integer (Int32)}
 */
export global IP_UNBLOCK_SOURCE := 18

/**
 * @type {Integer (Int32)}
 */
export global IP_PKTINFO := 19

/**
 * @type {Integer (Int32)}
 */
export global IP_HOPLIMIT := 21

/**
 * @type {Integer (Int32)}
 */
export global IP_RECVTTL := 21

/**
 * @type {Integer (Int32)}
 */
export global IP_RECEIVE_BROADCAST := 22

/**
 * @type {Integer (Int32)}
 */
export global IP_RECVIF := 24

/**
 * @type {Integer (Int32)}
 */
export global IP_RECVDSTADDR := 25

/**
 * @type {Integer (Int32)}
 */
export global IP_IFLIST := 28

/**
 * @type {Integer (Int32)}
 */
export global IP_ADD_IFLIST := 29

/**
 * @type {Integer (Int32)}
 */
export global IP_DEL_IFLIST := 30

/**
 * @type {Integer (Int32)}
 */
export global IP_UNICAST_IF := 31

/**
 * @type {Integer (Int32)}
 */
export global IP_RTHDR := 32

/**
 * @type {Integer (Int32)}
 */
export global IP_GET_IFLIST := 33

/**
 * @type {Integer (Int32)}
 */
export global IP_RECVRTHDR := 38

/**
 * @type {Integer (Int32)}
 */
export global IP_TCLASS := 39

/**
 * @type {Integer (Int32)}
 */
export global IP_RECVTCLASS := 40

/**
 * @type {Integer (Int32)}
 */
export global IP_RECVTOS := 40

/**
 * @type {Integer (Int32)}
 */
export global IP_ORIGINAL_ARRIVAL_IF := 47

/**
 * @type {Integer (Int32)}
 */
export global IP_ECN := 50

/**
 * @type {Integer (Int32)}
 */
export global IP_RECVECN := 50

/**
 * @type {Integer (Int32)}
 */
export global IP_PKTINFO_EX := 51

/**
 * @type {Integer (Int32)}
 */
export global IP_WFP_REDIRECT_RECORDS := 60

/**
 * @type {Integer (Int32)}
 */
export global IP_WFP_REDIRECT_CONTEXT := 70

/**
 * @type {Integer (Int32)}
 */
export global IP_MTU_DISCOVER := 71

/**
 * @type {Integer (Int32)}
 */
export global IP_MTU := 73

/**
 * @type {Integer (Int32)}
 */
export global IP_NRT_INTERFACE := 74

/**
 * @type {Integer (Int32)}
 */
export global IP_RECVERR := 75

/**
 * @type {Integer (Int32)}
 */
export global IP_USER_MTU := 76

/**
 * @type {Integer (Int32)}
 */
export global IP_UNSPECIFIED_TYPE_OF_SERVICE := -1

/**
 * @type {Integer (UInt32)}
 */
export global IP_UNSPECIFIED_USER_MTU := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global IN6ADDR_LINKLOCALPREFIX_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global IN6ADDR_MULTICASTPREFIX_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global IN6ADDR_SOLICITEDNODEMULTICASTPREFIX_LENGTH := 104

/**
 * @type {Integer (UInt32)}
 */
export global IN6ADDR_V4MAPPEDPREFIX_LENGTH := 96

/**
 * @type {Integer (UInt32)}
 */
export global IN6ADDR_6TO4PREFIX_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global IN6ADDR_TEREDOPREFIX_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_JOIN_GROUP := 41

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_LEAVE_GROUP := 42

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_BLOCK_SOURCE := 43

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_UNBLOCK_SOURCE := 44

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_JOIN_SOURCE_GROUP := 45

/**
 * @type {Integer (UInt32)}
 */
export global MCAST_LEAVE_SOURCE_GROUP := 46

/**
 * @type {Integer (Int32)}
 */
export global IPV6_HOPOPTS := 1

/**
 * @type {Integer (Int32)}
 */
export global IPV6_HDRINCL := 2

/**
 * @type {Integer (Int32)}
 */
export global IPV6_UNICAST_HOPS := 4

/**
 * @type {Integer (Int32)}
 */
export global IPV6_MULTICAST_IF := 9

/**
 * @type {Integer (Int32)}
 */
export global IPV6_MULTICAST_HOPS := 10

/**
 * @type {Integer (Int32)}
 */
export global IPV6_MULTICAST_LOOP := 11

/**
 * @type {Integer (Int32)}
 */
export global IPV6_ADD_MEMBERSHIP := 12

/**
 * @type {Integer (Int32)}
 */
export global IPV6_JOIN_GROUP := 12

/**
 * @type {Integer (Int32)}
 */
export global IPV6_DROP_MEMBERSHIP := 13

/**
 * @type {Integer (Int32)}
 */
export global IPV6_LEAVE_GROUP := 13

/**
 * @type {Integer (Int32)}
 */
export global IPV6_DONTFRAG := 14

/**
 * @type {Integer (Int32)}
 */
export global IPV6_PKTINFO := 19

/**
 * @type {Integer (Int32)}
 */
export global IPV6_HOPLIMIT := 21

/**
 * @type {Integer (Int32)}
 */
export global IPV6_PROTECTION_LEVEL := 23

/**
 * @type {Integer (Int32)}
 */
export global IPV6_RECVIF := 24

/**
 * @type {Integer (Int32)}
 */
export global IPV6_RECVDSTADDR := 25

/**
 * @type {Integer (Int32)}
 */
export global IPV6_CHECKSUM := 26

/**
 * @type {Integer (Int32)}
 */
export global IPV6_V6ONLY := 27

/**
 * @type {Integer (Int32)}
 */
export global IPV6_IFLIST := 28

/**
 * @type {Integer (Int32)}
 */
export global IPV6_ADD_IFLIST := 29

/**
 * @type {Integer (Int32)}
 */
export global IPV6_DEL_IFLIST := 30

/**
 * @type {Integer (Int32)}
 */
export global IPV6_UNICAST_IF := 31

/**
 * @type {Integer (Int32)}
 */
export global IPV6_RTHDR := 32

/**
 * @type {Integer (Int32)}
 */
export global IPV6_GET_IFLIST := 33

/**
 * @type {Integer (Int32)}
 */
export global IPV6_RECVRTHDR := 38

/**
 * @type {Integer (Int32)}
 */
export global IPV6_TCLASS := 39

/**
 * @type {Integer (Int32)}
 */
export global IPV6_RECVTCLASS := 40

/**
 * @type {Integer (Int32)}
 */
export global IPV6_ECN := 50

/**
 * @type {Integer (Int32)}
 */
export global IPV6_RECVECN := 50

/**
 * @type {Integer (Int32)}
 */
export global IPV6_PKTINFO_EX := 51

/**
 * @type {Integer (Int32)}
 */
export global IPV6_WFP_REDIRECT_RECORDS := 60

/**
 * @type {Integer (Int32)}
 */
export global IPV6_WFP_REDIRECT_CONTEXT := 70

/**
 * @type {Integer (Int32)}
 */
export global IPV6_MTU_DISCOVER := 71

/**
 * @type {Integer (Int32)}
 */
export global IPV6_MTU := 72

/**
 * @type {Integer (Int32)}
 */
export global IPV6_NRT_INTERFACE := 74

/**
 * @type {Integer (Int32)}
 */
export global IPV6_RECVERR := 75

/**
 * @type {Integer (Int32)}
 */
export global IPV6_USER_MTU := 76

/**
 * @type {Integer (Int32)}
 */
export global IP_UNSPECIFIED_HOP_LIMIT := -1

/**
 * @type {Integer (Int32)}
 */
export global IP_PROTECTION_LEVEL := 23

/**
 * @type {Integer (UInt32)}
 */
export global PROTECTION_LEVEL_UNRESTRICTED := 10

/**
 * @type {Integer (UInt32)}
 */
export global PROTECTION_LEVEL_EDGERESTRICTED := 20

/**
 * @type {Integer (UInt32)}
 */
export global PROTECTION_LEVEL_RESTRICTED := 30

/**
 * @type {Integer (UInt32)}
 */
export global PROTECTION_LEVEL_DEFAULT := 20

/**
 * @type {Integer (UInt32)}
 */
export global INET_ADDRSTRLEN := 22

/**
 * @type {Integer (UInt32)}
 */
export global INET6_ADDRSTRLEN := 65

/**
 * @type {Integer (Int32)}
 */
export global TCP_OFFLOAD_NO_PREFERENCE := 0

/**
 * @type {Integer (Int32)}
 */
export global TCP_OFFLOAD_NOT_PREFERRED := 1

/**
 * @type {Integer (Int32)}
 */
export global TCP_OFFLOAD_PREFERRED := 2

/**
 * @type {Integer (Int32)}
 */
export global TCP_EXPEDITED_1122 := 2

/**
 * @type {Integer (Int32)}
 */
export global TCP_KEEPALIVE := 3

/**
 * @type {Integer (Int32)}
 */
export global TCP_MAXSEG := 4

/**
 * @type {Integer (Int32)}
 */
export global TCP_MAXRT := 5

/**
 * @type {Integer (Int32)}
 */
export global TCP_STDURG := 6

/**
 * @type {Integer (Int32)}
 */
export global TCP_NOURG := 7

/**
 * @type {Integer (Int32)}
 */
export global TCP_ATMARK := 8

/**
 * @type {Integer (Int32)}
 */
export global TCP_NOSYNRETRIES := 9

/**
 * @type {Integer (Int32)}
 */
export global TCP_TIMESTAMPS := 10

/**
 * @type {Integer (Int32)}
 */
export global TCP_OFFLOAD_PREFERENCE := 11

/**
 * @type {Integer (Int32)}
 */
export global TCP_CONGESTION_ALGORITHM := 12

/**
 * @type {Integer (Int32)}
 */
export global TCP_DELAY_FIN_ACK := 13

/**
 * @type {Integer (Int32)}
 */
export global TCP_MAXRTMS := 14

/**
 * @type {Integer (Int32)}
 */
export global TCP_FASTOPEN := 15

/**
 * @type {Integer (Int32)}
 */
export global TCP_KEEPCNT := 16

/**
 * @type {Integer (Int32)}
 */
export global TCP_KEEPIDLE := 3

/**
 * @type {Integer (Int32)}
 */
export global TCP_KEEPINTVL := 17

/**
 * @type {Integer (Int32)}
 */
export global TCP_FAIL_CONNECT_ON_ICMP_ERROR := 18

/**
 * @type {Integer (Int32)}
 */
export global TCP_ICMP_ERROR_INFO := 19

/**
 * @type {Integer (Int32)}
 */
export global UDP_SEND_MSG_SIZE := 2

/**
 * @type {Integer (Int32)}
 */
export global UDP_RECV_MAX_COALESCED_SIZE := 3

/**
 * @type {Integer (UInt32)}
 */
export global UDP_COALESCED_INFO := 3

/**
 * @type {Integer (UInt32)}
 */
export global WINDOWS_AF_IRDA := 26

/**
 * @type {Integer (UInt32)}
 */
export global WINDOWS_PF_IRDA := 26

/**
 * @type {Integer (UInt32)}
 */
export global WCE_AF_IRDA := 22

/**
 * @type {Integer (UInt32)}
 */
export global WCE_PF_IRDA := 22

/**
 * @type {Integer (UInt32)}
 */
export global IRDA_PROTO_SOCK_STREAM := 1

/**
 * @type {Integer (UInt16)}
 */
export global PF_IRDA := 26

/**
 * @type {Integer (Int32)}
 */
export global SOL_IRLMP := 255

/**
 * @type {Integer (Int32)}
 */
export global IRLMP_ENUMDEVICES := 16

/**
 * @type {Integer (Int32)}
 */
export global IRLMP_IAS_SET := 17

/**
 * @type {Integer (Int32)}
 */
export global IRLMP_IAS_QUERY := 18

/**
 * @type {Integer (Int32)}
 */
export global IRLMP_SEND_PDU_LEN := 19

/**
 * @type {Integer (Int32)}
 */
export global IRLMP_EXCLUSIVE_MODE := 20

/**
 * @type {Integer (Int32)}
 */
export global IRLMP_IRLPT_MODE := 21

/**
 * @type {Integer (Int32)}
 */
export global IRLMP_9WIRE_MODE := 22

/**
 * @type {Integer (Int32)}
 */
export global IRLMP_TINYTP_MODE := 23

/**
 * @type {Integer (Int32)}
 */
export global IRLMP_PARAMETERS := 24

/**
 * @type {Integer (Int32)}
 */
export global IRLMP_DISCOVERY_MODE := 25

/**
 * @type {Integer (Int32)}
 */
export global IRLMP_SHARP_MODE := 32

/**
 * @type {Integer (UInt32)}
 */
export global IAS_ATTRIB_NO_CLASS := 16

/**
 * @type {Integer (UInt32)}
 */
export global IAS_ATTRIB_NO_ATTRIB := 0

/**
 * @type {Integer (UInt32)}
 */
export global IAS_ATTRIB_INT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IAS_ATTRIB_OCTETSEQ := 2

/**
 * @type {Integer (UInt32)}
 */
export global IAS_ATTRIB_STR := 3

/**
 * @type {Integer (UInt32)}
 */
export global IAS_MAX_USER_STRING := 256

/**
 * @type {Integer (UInt32)}
 */
export global IAS_MAX_OCTET_STRING := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IAS_MAX_CLASSNAME := 64

/**
 * @type {Integer (UInt32)}
 */
export global IAS_MAX_ATTRIBNAME := 256

/**
 * @type {Integer (UInt32)}
 */
export global LmCharSetASCII := 0

/**
 * @type {Integer (UInt32)}
 */
export global LmCharSetISO_8859_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global LmCharSetISO_8859_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global LmCharSetISO_8859_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global LmCharSetISO_8859_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global LmCharSetISO_8859_5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global LmCharSetISO_8859_6 := 6

/**
 * @type {Integer (UInt32)}
 */
export global LmCharSetISO_8859_7 := 7

/**
 * @type {Integer (UInt32)}
 */
export global LmCharSetISO_8859_8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global LmCharSetISO_8859_9 := 9

/**
 * @type {Integer (UInt32)}
 */
export global LmCharSetUNICODE := 255

/**
 * @type {Integer (UInt32)}
 */
export global LM_BAUD_1200 := 1200

/**
 * @type {Integer (UInt32)}
 */
export global LM_BAUD_2400 := 2400

/**
 * @type {Integer (UInt32)}
 */
export global LM_BAUD_9600 := 9600

/**
 * @type {Integer (UInt32)}
 */
export global LM_BAUD_19200 := 19200

/**
 * @type {Integer (UInt32)}
 */
export global LM_BAUD_38400 := 38400

/**
 * @type {Integer (UInt32)}
 */
export global LM_BAUD_57600 := 57600

/**
 * @type {Integer (UInt32)}
 */
export global LM_BAUD_115200 := 115200

/**
 * @type {Integer (UInt32)}
 */
export global LM_BAUD_576K := 576000

/**
 * @type {Integer (UInt32)}
 */
export global LM_BAUD_1152K := 1152000

/**
 * @type {Integer (UInt32)}
 */
export global LM_BAUD_4M := 4000000

/**
 * @type {Integer (UInt32)}
 */
export global LM_BAUD_16M := 16000000

/**
 * @type {Integer (Int32)}
 */
export global SO_CONNDATA := 28672

/**
 * @type {Integer (Int32)}
 */
export global SO_CONNOPT := 28673

/**
 * @type {Integer (Int32)}
 */
export global SO_DISCDATA := 28674

/**
 * @type {Integer (Int32)}
 */
export global SO_DISCOPT := 28675

/**
 * @type {Integer (Int32)}
 */
export global SO_CONNDATALEN := 28676

/**
 * @type {Integer (Int32)}
 */
export global SO_CONNOPTLEN := 28677

/**
 * @type {Integer (Int32)}
 */
export global SO_DISCDATALEN := 28678

/**
 * @type {Integer (Int32)}
 */
export global SO_DISCOPTLEN := 28679

/**
 * @type {Integer (Int32)}
 */
export global SO_OPENTYPE := 28680

/**
 * @type {Integer (UInt32)}
 */
export global SO_SYNCHRONOUS_ALERT := 16

/**
 * @type {Integer (UInt32)}
 */
export global SO_SYNCHRONOUS_NONALERT := 32

/**
 * @type {Integer (Int32)}
 */
export global SO_MAXDG := 28681

/**
 * @type {Integer (Int32)}
 */
export global SO_MAXPATHDG := 28682

/**
 * @type {Integer (Int32)}
 */
export global SO_UPDATE_ACCEPT_CONTEXT := 28683

/**
 * @type {Integer (Int32)}
 */
export global SO_CONNECT_TIME := 28684

/**
 * @type {Integer (Int32)}
 */
export global SO_UPDATE_CONNECT_CONTEXT := 28688

/**
 * @type {Integer (Int32)}
 */
export global TCP_BSDURGENT := 28672

/**
 * @type {Integer (UInt32)}
 */
export global SIO_UDP_CONNRESET := 2550136844

/**
 * @type {Integer (UInt32)}
 */
export global SIO_SOCKET_CLOSE_NOTIFY := 2550136845

/**
 * @type {Integer (UInt32)}
 */
export global SIO_UDP_NETRESET := 2550136847

/**
 * @type {Integer (UInt32)}
 */
export global TF_DISCONNECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global TF_REUSE_SOCKET := 2

/**
 * @type {Integer (UInt32)}
 */
export global TF_WRITE_BEHIND := 4

/**
 * @type {Integer (UInt32)}
 */
export global TF_USE_DEFAULT_WORKER := 0

/**
 * @type {Integer (UInt32)}
 */
export global TF_USE_SYSTEM_THREAD := 16

/**
 * @type {Integer (UInt32)}
 */
export global TF_USE_KERNEL_APC := 32

/**
 * @type {Guid}
 */
export global WSAID_TRANSMITFILE := Guid("{b5367df0-cbac-11cf-95ca-00805f48a192}")

/**
 * @type {Guid}
 */
export global WSAID_ACCEPTEX := Guid("{b5367df1-cbac-11cf-95ca-00805f48a192}")

/**
 * @type {Guid}
 */
export global WSAID_GETACCEPTEXSOCKADDRS := Guid("{b5367df2-cbac-11cf-95ca-00805f48a192}")

/**
 * @type {Integer (UInt32)}
 */
export global TP_ELEMENT_MEMORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global TP_ELEMENT_FILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TP_ELEMENT_EOP := 4

/**
 * @type {Integer (UInt32)}
 */
export global TP_DISCONNECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global TP_REUSE_SOCKET := 2

/**
 * @type {Integer (UInt32)}
 */
export global TP_USE_DEFAULT_WORKER := 0

/**
 * @type {Integer (UInt32)}
 */
export global TP_USE_SYSTEM_THREAD := 16

/**
 * @type {Integer (UInt32)}
 */
export global TP_USE_KERNEL_APC := 32

/**
 * @type {Guid}
 */
export global WSAID_TRANSMITPACKETS := Guid("{d9689da0-1f90-11d3-9971-00c04f68c876}")

/**
 * @type {Guid}
 */
export global WSAID_CONNECTEX := Guid("{25a207b9-ddf3-4660-8ee9-76e58c74063e}")

/**
 * @type {Guid}
 */
export global WSAID_DISCONNECTEX := Guid("{7fda2e11-8630-436f-a031-f536a6eec157}")

/**
 * @type {Integer (UInt32)}
 */
export global DE_REUSE_SOCKET := 2

/**
 * @type {Guid}
 */
export global NLA_NAMESPACE_GUID := Guid("{6642243a-3ba8-4aa6-baa5-2e0bd71fdd83}")

/**
 * @type {Guid}
 */
export global NLA_SERVICE_CLASS_GUID := Guid("{0037e515-b5c9-4a43-bada-8b48a87ad239}")

/**
 * @type {Integer (UInt32)}
 */
export global NLA_ALLUSERS_NETWORK := 1

/**
 * @type {Integer (UInt32)}
 */
export global NLA_FRIENDLY_NAME := 2

/**
 * @type {Guid}
 */
export global WSAID_WSARECVMSG := Guid("{f689d7c8-6f1f-436b-8a53-e54fe351c322}")

/**
 * @type {Integer (UInt32)}
 */
export global SIO_BSP_HANDLE := 1207959579

/**
 * @type {Integer (UInt32)}
 */
export global SIO_BSP_HANDLE_SELECT := 1207959580

/**
 * @type {Integer (UInt32)}
 */
export global SIO_BSP_HANDLE_POLL := 1207959581

/**
 * @type {Integer (UInt32)}
 */
export global SIO_BASE_HANDLE := 1207959586

/**
 * @type {Integer (UInt32)}
 */
export global SIO_EXT_SELECT := 3355443230

/**
 * @type {Integer (UInt32)}
 */
export global SIO_EXT_POLL := 3355443231

/**
 * @type {Integer (UInt32)}
 */
export global SIO_EXT_SENDMSG := 3355443232

/**
 * @type {Guid}
 */
export global WSAID_WSASENDMSG := Guid("{a441e712-754f-43ca-84a7-0dee44cf606d}")

/**
 * @type {Guid}
 */
export global WSAID_WSAPOLL := Guid("{18c76f85-dc66-4964-972e-23c27238312b}")

/**
 * @type {Guid}
 */
export global WSAID_MULTIPLE_RIO := Guid("{8509e081-96dd-4005-b165-9e2ee8c79e3f}")

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_RESOURCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_SERVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_LOCAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_FLAG_DEFER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_FLAG_HARD := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROP_COMMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROP_LOCALE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROP_DISPLAY_HINT := 4

/**
 * @type {Integer (UInt32)}
 */
export global PROP_VERSION := 8

/**
 * @type {Integer (UInt32)}
 */
export global PROP_START_TIME := 16

/**
 * @type {Integer (UInt32)}
 */
export global PROP_MACHINE := 32

/**
 * @type {Integer (UInt32)}
 */
export global PROP_ADDRESSES := 256

/**
 * @type {Integer (UInt32)}
 */
export global PROP_SD := 512

/**
 * @type {Integer (UInt32)}
 */
export global PROP_ALL := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ADDRESS_FLAG_RPC_CN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ADDRESS_FLAG_RPC_DG := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ADDRESS_FLAG_RPC_NB := 4

/**
 * @type {Integer (UInt32)}
 */
export global NS_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global NS_VNS := 50

/**
 * @type {Integer (UInt32)}
 */
export global NSTYPE_HIERARCHICAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global NSTYPE_DYNAMIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global NSTYPE_ENUMERABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global NSTYPE_WORKGROUP := 8

/**
 * @type {Integer (UInt32)}
 */
export global XP_CONNECTIONLESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global XP_GUARANTEED_DELIVERY := 2

/**
 * @type {Integer (UInt32)}
 */
export global XP_GUARANTEED_ORDER := 4

/**
 * @type {Integer (UInt32)}
 */
export global XP_MESSAGE_ORIENTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global XP_PSEUDO_STREAM := 16

/**
 * @type {Integer (UInt32)}
 */
export global XP_GRACEFUL_CLOSE := 32

/**
 * @type {Integer (UInt32)}
 */
export global XP_EXPEDITED_DATA := 64

/**
 * @type {Integer (UInt32)}
 */
export global XP_CONNECT_DATA := 128

/**
 * @type {Integer (UInt32)}
 */
export global XP_DISCONNECT_DATA := 256

/**
 * @type {Integer (UInt32)}
 */
export global XP_SUPPORTS_BROADCAST := 512

/**
 * @type {Integer (UInt32)}
 */
export global XP_SUPPORTS_MULTICAST := 1024

/**
 * @type {Integer (UInt32)}
 */
export global XP_BANDWIDTH_ALLOCATION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global XP_FRAGMENTATION := 4096

/**
 * @type {Integer (UInt32)}
 */
export global XP_ENCRYPTS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global RES_SOFT_SEARCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global RES_FIND_MULTIPLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RES_SERVICE := 4

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_SAPIDA := "SapId"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_SAPIDW := "SapId"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_CONNA := "ConnectionOriented"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_CONNW := "ConnectionOriented"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_TCPPORTA := "TcpPort"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_TCPPORTW := "TcpPort"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_UDPPORTA := "UdpPort"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_UDPPORTW := "UdpPort"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_SAPID := "SapId"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_CONN := "ConnectionOriented"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_TCPPORT := "TcpPort"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_UDPPORT := "UdpPort"

/**
 * @type {Integer (UInt32)}
 */
export global SET_SERVICE_PARTIAL_SUCCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global FD_SETSIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global IMPLINK_IP := 155

/**
 * @type {Integer (UInt32)}
 */
export global IMPLINK_LOWEXPER := 156

/**
 * @type {Integer (UInt32)}
 */
export global IMPLINK_HIGHEXPER := 158

/**
 * @type {Integer (UInt32)}
 */
export global WSADESCRIPTION_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global WSASYS_STATUS_LEN := 128

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEFAULT_MULTICAST_TTL := 1

/**
 * @type {Integer (UInt32)}
 */
export global IP_DEFAULT_MULTICAST_LOOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global IP_MAX_MEMBERSHIPS := 20

/**
 * @type {Integer (Int32)}
 */
export global SOCKET_ERROR := -1

/**
 * @type {Integer (UInt16)}
 */
export global PF_UNIX := 1

/**
 * @type {Integer (UInt16)}
 */
export global PF_IMPLINK := 3

/**
 * @type {Integer (UInt16)}
 */
export global PF_PUP := 4

/**
 * @type {Integer (UInt16)}
 */
export global PF_CHAOS := 5

/**
 * @type {Integer (UInt16)}
 */
export global PF_NS := 6

/**
 * @type {Integer (UInt16)}
 */
export global PF_IPX := 6

/**
 * @type {Integer (UInt16)}
 */
export global PF_ISO := 7

/**
 * @type {Integer (UInt16)}
 */
export global PF_OSI := 7

/**
 * @type {Integer (UInt16)}
 */
export global PF_ECMA := 8

/**
 * @type {Integer (UInt16)}
 */
export global PF_DATAKIT := 9

/**
 * @type {Integer (UInt16)}
 */
export global PF_CCITT := 10

/**
 * @type {Integer (UInt16)}
 */
export global PF_SNA := 11

/**
 * @type {Integer (UInt16)}
 */
export global PF_DECnet := 12

/**
 * @type {Integer (UInt16)}
 */
export global PF_DLI := 13

/**
 * @type {Integer (UInt16)}
 */
export global PF_LAT := 14

/**
 * @type {Integer (UInt16)}
 */
export global PF_HYLINK := 15

/**
 * @type {Integer (UInt16)}
 */
export global PF_APPLETALK := 16

/**
 * @type {Integer (UInt16)}
 */
export global PF_VOICEVIEW := 18

/**
 * @type {Integer (UInt16)}
 */
export global PF_FIREFOX := 19

/**
 * @type {Integer (UInt16)}
 */
export global PF_UNKNOWN1 := 20

/**
 * @type {Integer (UInt16)}
 */
export global PF_BAN := 21

/**
 * @type {Integer (UInt16)}
 */
export global PF_MAX := 29

/**
 * @type {Integer (UInt32)}
 */
export global SOMAXCONN := 5

/**
 * @type {Integer (UInt32)}
 */
export global MSG_MAXIOVLEN := 16

/**
 * @type {Integer (UInt32)}
 */
export global MSG_PARTIAL := 32768

/**
 * @type {Integer (UInt32)}
 */
export global MAXGETHOSTSTRUCT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FD_READ := 1

/**
 * @type {Integer (UInt32)}
 */
export global FD_WRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FD_OOB := 4

/**
 * @type {Integer (UInt32)}
 */
export global FD_ACCEPT := 8

/**
 * @type {Integer (UInt32)}
 */
export global FD_CONNECT := 16

/**
 * @type {Integer (UInt32)}
 */
export global FD_CLOSE := 32

/**
 * @type {Integer (UInt32)}
 */
export global INCL_WINSOCK_API_PROTOTYPES := 1

/**
 * @type {Integer (UInt32)}
 */
export global INCL_WINSOCK_API_TYPEDEFS := 0

/**
 * @type {Integer (UInt32)}
 */
export global ADDR_ANY := 0

/**
 * @type {Integer (Int32)}
 */
export global FROM_PROTOCOL_INFO := -1

/**
 * @type {Integer (Int32)}
 */
export global SO_PROTOCOL_INFOA := 8196

/**
 * @type {Integer (Int32)}
 */
export global SO_PROTOCOL_INFOW := 8197

/**
 * @type {Integer (Int32)}
 */
export global SO_PROTOCOL_INFO := 8197

/**
 * @type {Integer (Int32)}
 */
export global PVD_CONFIG := 12289

/**
 * @type {Integer (UInt16)}
 */
export global PF_ATM := 22

/**
 * @type {Integer (UInt32)}
 */
export global MSG_INTERRUPT := 16

/**
 * @type {Integer (UInt32)}
 */
export global FD_READ_BIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global FD_WRITE_BIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FD_OOB_BIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global FD_ACCEPT_BIT := 3

/**
 * @type {Integer (UInt32)}
 */
export global FD_CONNECT_BIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global FD_CLOSE_BIT := 5

/**
 * @type {Integer (UInt32)}
 */
export global FD_QOS_BIT := 6

/**
 * @type {Integer (UInt32)}
 */
export global FD_GROUP_QOS_BIT := 7

/**
 * @type {Integer (UInt32)}
 */
export global FD_ROUTING_INTERFACE_CHANGE_BIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global FD_ADDRESS_LIST_CHANGE_BIT := 9

/**
 * @type {Integer (UInt32)}
 */
export global FD_MAX_EVENTS := 10

/**
 * @type {Integer (UInt32)}
 */
export global WSA_MAXIMUM_WAIT_EVENTS := 64

/**
 * @type {Integer (UInt32)}
 */
export global WSA_WAIT_FAILED := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global WSA_WAIT_TIMEOUT := 258

/**
 * @type {Integer (UInt32)}
 */
export global CF_ACCEPT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CF_REJECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CF_DEFER := 2

/**
 * @type {Integer (UInt32)}
 */
export global SG_UNCONSTRAINED_GROUP := 1

/**
 * @type {Integer (UInt32)}
 */
export global SG_CONSTRAINED_GROUP := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PROTOCOL_CHAIN := 7

/**
 * @type {Integer (UInt32)}
 */
export global BASE_PROTOCOL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LAYERED_PROTOCOL := 0

/**
 * @type {Integer (UInt32)}
 */
export global WSAPROTOCOL_LEN := 255

/**
 * @type {Integer (UInt32)}
 */
export global PFL_MULTIPLE_PROTO_ENTRIES := 1

/**
 * @type {Integer (UInt32)}
 */
export global PFL_RECOMMENDED_PROTO_ENTRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global PFL_HIDDEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global PFL_MATCHES_PROTOCOL_ZERO := 8

/**
 * @type {Integer (UInt32)}
 */
export global PFL_NETWORKDIRECT_PROVIDER := 16

/**
 * @type {Integer (UInt32)}
 */
export global XP1_CONNECTIONLESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global XP1_GUARANTEED_DELIVERY := 2

/**
 * @type {Integer (UInt32)}
 */
export global XP1_GUARANTEED_ORDER := 4

/**
 * @type {Integer (UInt32)}
 */
export global XP1_MESSAGE_ORIENTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global XP1_PSEUDO_STREAM := 16

/**
 * @type {Integer (UInt32)}
 */
export global XP1_GRACEFUL_CLOSE := 32

/**
 * @type {Integer (UInt32)}
 */
export global XP1_EXPEDITED_DATA := 64

/**
 * @type {Integer (UInt32)}
 */
export global XP1_CONNECT_DATA := 128

/**
 * @type {Integer (UInt32)}
 */
export global XP1_DISCONNECT_DATA := 256

/**
 * @type {Integer (UInt32)}
 */
export global XP1_SUPPORT_BROADCAST := 512

/**
 * @type {Integer (UInt32)}
 */
export global XP1_SUPPORT_MULTIPOINT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global XP1_MULTIPOINT_CONTROL_PLANE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global XP1_MULTIPOINT_DATA_PLANE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global XP1_QOS_SUPPORTED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global XP1_INTERRUPT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global XP1_UNI_SEND := 32768

/**
 * @type {Integer (UInt32)}
 */
export global XP1_UNI_RECV := 65536

/**
 * @type {Integer (UInt32)}
 */
export global XP1_IFS_HANDLES := 131072

/**
 * @type {Integer (UInt32)}
 */
export global XP1_PARTIAL_MESSAGE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global XP1_SAN_SUPPORT_SDP := 524288

/**
 * @type {Integer (UInt32)}
 */
export global BIGENDIAN := 0

/**
 * @type {Integer (UInt32)}
 */
export global LITTLEENDIAN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_PROTOCOL_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global JL_SENDER_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global JL_RECEIVER_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global JL_BOTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global WSA_FLAG_OVERLAPPED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSA_FLAG_MULTIPOINT_C_ROOT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WSA_FLAG_MULTIPOINT_C_LEAF := 4

/**
 * @type {Integer (UInt32)}
 */
export global WSA_FLAG_MULTIPOINT_D_ROOT := 8

/**
 * @type {Integer (UInt32)}
 */
export global WSA_FLAG_MULTIPOINT_D_LEAF := 16

/**
 * @type {Integer (UInt32)}
 */
export global WSA_FLAG_ACCESS_SYSTEM_SECURITY := 64

/**
 * @type {Integer (UInt32)}
 */
export global WSA_FLAG_NO_HANDLE_INHERIT := 128

/**
 * @type {Integer (UInt32)}
 */
export global WSA_FLAG_REGISTERED_IO := 256

/**
 * @type {Integer (UInt32)}
 */
export global SIO_NSP_NOTIFY_CHANGE := 2281701401

/**
 * @type {Integer (UInt32)}
 */
export global TH_NETDEV := 1

/**
 * @type {Integer (UInt32)}
 */
export global TH_TAPI := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_MULTIPLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global NS_LOCALNAME := 19

/**
 * @type {Integer (UInt32)}
 */
export global RES_UNUSED_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global RES_FLUSH_CACHE := 2

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_IPXPORTA := "IpxSocket"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_IPXPORTW := "IpxSocket"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_OBJECTIDA := "ObjectId"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_OBJECTIDW := "ObjectId"

/**
 * @type {String}
 */
export global SERVICE_TYPE_VALUE_OBJECTID := "ObjectId"

/**
 * @type {Integer (UInt32)}
 */
export global LUP_DEEP := 1

/**
 * @type {Integer (UInt32)}
 */
export global LUP_CONTAINERS := 2

/**
 * @type {Integer (UInt32)}
 */
export global LUP_NOCONTAINERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global LUP_NEAREST := 8

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_NAME := 16

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_TYPE := 32

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_VERSION := 64

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_COMMENT := 128

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_ADDR := 256

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_BLOB := 512

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_ALIASES := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_QUERY_STRING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_ALL := 4080

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RES_SERVICE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LUP_FLUSHCACHE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LUP_FLUSHPREVIOUS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LUP_NON_AUTHORITATIVE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LUP_SECURE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_PREFERRED_NAMES := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LUP_DNS_ONLY := 131072

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_RESPONSE_FLAGS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RESERVED_UNUSED := 524288

/**
 * @type {Integer (UInt32)}
 */
export global LUP_ADDRCONFIG := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global LUP_DUAL_ADDR := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global LUP_FILESERVER := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global LUP_DISABLE_IDN_ENCODING := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global LUP_API_ANSI := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global LUP_EXTENDED_QUERYSET := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global LUP_SECURE_WITH_FALLBACK := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global LUP_EXCLUSIVE_CUSTOM_SERVERS := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global LUP_REQUIRE_SECURE := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RETURN_TTL := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global LUP_FORCE_CLEAR_TEXT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global LUP_RESOLUTION_HANDLE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global RESULT_IS_ALIAS := 1

/**
 * @type {Integer (UInt32)}
 */
export global RESULT_IS_ADDED := 16

/**
 * @type {Integer (UInt32)}
 */
export global RESULT_IS_CHANGED := 32

/**
 * @type {Integer (UInt32)}
 */
export global RESULT_IS_DELETED := 64

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_REGISTER_EVENT_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_REGISTER_EVENT_IN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_REGISTER_EVENT_OUT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_REGISTER_EVENT_HANGUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_EVENT_IN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_EVENT_OUT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_EVENT_HANGUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_EVENT_ERR := 64

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_EVENT_REMOVE := 128

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_OP_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_OP_ENABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_OP_DISABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_OP_REMOVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_TRIGGER_ONESHOT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_TRIGGER_PERSISTENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_TRIGGER_LEVEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global SOCK_NOTIFY_TRIGGER_EDGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global ATMPROTO_AALUSER := 0

/**
 * @type {Integer (UInt32)}
 */
export global ATMPROTO_AAL1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global ATMPROTO_AAL2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global ATMPROTO_AAL34 := 3

/**
 * @type {Integer (UInt32)}
 */
export global ATMPROTO_AAL5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global SAP_FIELD_ABSENT := 4294967294

/**
 * @type {Integer (UInt32)}
 */
export global SAP_FIELD_ANY := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global SAP_FIELD_ANY_AESA_SEL := 4294967290

/**
 * @type {Integer (UInt32)}
 */
export global SAP_FIELD_ANY_AESA_REST := 4294967291

/**
 * @type {Integer (UInt32)}
 */
export global ATM_E164 := 1

/**
 * @type {Integer (UInt32)}
 */
export global ATM_NSAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global ATM_AESA := 2

/**
 * @type {Integer (UInt32)}
 */
export global ATM_ADDR_SIZE := 20

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_ISO_1745 := 1

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_Q921 := 2

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_X25L := 6

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_X25M := 7

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_ELAPB := 8

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_HDLC_ARM := 9

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_HDLC_NRM := 10

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_HDLC_ABM := 11

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_LLC := 12

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_X75 := 13

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_Q922 := 14

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_USER_SPECIFIED := 16

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_ISO_7776 := 17

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_X25 := 6

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_ISO_8208 := 7

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_X223 := 8

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_SIO_8473 := 9

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_T70 := 10

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_ISO_TR9577 := 11

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_USER_SPECIFIED := 16

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_IPI_SNAP := 128

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_IPI_IP := 204

/**
 * @type {Integer (UInt32)}
 */
export global BHLI_ISO := 0

/**
 * @type {Integer (UInt32)}
 */
export global BHLI_UserSpecific := 1

/**
 * @type {Integer (UInt32)}
 */
export global BHLI_HighLayerProfile := 2

/**
 * @type {Integer (UInt32)}
 */
export global BHLI_VendorSpecificAppId := 3

/**
 * @type {Integer (UInt32)}
 */
export global AAL5_MODE_MESSAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global AAL5_MODE_STREAMING := 2

/**
 * @type {Integer (UInt32)}
 */
export global AAL5_SSCS_NULL := 0

/**
 * @type {Integer (UInt32)}
 */
export global AAL5_SSCS_SSCOP_ASSURED := 1

/**
 * @type {Integer (UInt32)}
 */
export global AAL5_SSCS_SSCOP_NON_ASSURED := 2

/**
 * @type {Integer (UInt32)}
 */
export global AAL5_SSCS_FRAME_RELAY := 4

/**
 * @type {Integer (UInt32)}
 */
export global BCOB_A := 1

/**
 * @type {Integer (UInt32)}
 */
export global BCOB_C := 3

/**
 * @type {Integer (UInt32)}
 */
export global BCOB_X := 16

/**
 * @type {Integer (UInt32)}
 */
export global TT_NOIND := 0

/**
 * @type {Integer (UInt32)}
 */
export global TT_CBR := 4

/**
 * @type {Integer (UInt32)}
 */
export global TT_VBR := 8

/**
 * @type {Integer (UInt32)}
 */
export global TR_NOIND := 0

/**
 * @type {Integer (UInt32)}
 */
export global TR_END_TO_END := 1

/**
 * @type {Integer (UInt32)}
 */
export global TR_NO_END_TO_END := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLIP_NOT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLIP_SUS := 32

/**
 * @type {Integer (UInt32)}
 */
export global UP_P2P := 0

/**
 * @type {Integer (UInt32)}
 */
export global UP_P2MP := 1

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_MODE_NORMAL := 64

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L2_MODE_EXT := 128

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_MODE_NORMAL := 64

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_MODE_EXT := 128

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_PACKET_16 := 4

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_PACKET_32 := 5

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_PACKET_64 := 6

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_PACKET_128 := 7

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_PACKET_256 := 8

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_PACKET_512 := 9

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_PACKET_1024 := 10

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_PACKET_2048 := 11

/**
 * @type {Integer (UInt32)}
 */
export global BLLI_L3_PACKET_4096 := 12

/**
 * @type {Integer (UInt32)}
 */
export global PI_ALLOWED := 0

/**
 * @type {Integer (UInt32)}
 */
export global PI_RESTRICTED := 64

/**
 * @type {Integer (UInt32)}
 */
export global PI_NUMBER_NOT_AVAILABLE := 128

/**
 * @type {Integer (UInt32)}
 */
export global SI_USER_NOT_SCREENED := 0

/**
 * @type {Integer (UInt32)}
 */
export global SI_USER_PASSED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SI_USER_FAILED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SI_NETWORK := 3

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_LOC_USER := 0

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_LOC_PRIVATE_LOCAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_LOC_PUBLIC_LOCAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_LOC_TRANSIT_NETWORK := 3

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_LOC_PUBLIC_REMOTE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_LOC_PRIVATE_REMOTE := 5

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_LOC_INTERNATIONAL_NETWORK := 7

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_LOC_BEYOND_INTERWORKING := 10

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_UNALLOCATED_NUMBER := 1

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_NO_ROUTE_TO_TRANSIT_NETWORK := 2

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_NO_ROUTE_TO_DESTINATION := 3

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_VPI_VCI_UNACCEPTABLE := 10

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_NORMAL_CALL_CLEARING := 16

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_USER_BUSY := 17

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_NO_USER_RESPONDING := 18

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_CALL_REJECTED := 21

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_NUMBER_CHANGED := 22

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_USER_REJECTS_CLIR := 23

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_DESTINATION_OUT_OF_ORDER := 27

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_INVALID_NUMBER_FORMAT := 28

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_STATUS_ENQUIRY_RESPONSE := 30

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_NORMAL_UNSPECIFIED := 31

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_VPI_VCI_UNAVAILABLE := 35

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_NETWORK_OUT_OF_ORDER := 38

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_TEMPORARY_FAILURE := 41

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_ACCESS_INFORMAION_DISCARDED := 43

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_NO_VPI_VCI_AVAILABLE := 45

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_RESOURCE_UNAVAILABLE := 47

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_QOS_UNAVAILABLE := 49

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_USER_CELL_RATE_UNAVAILABLE := 51

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_BEARER_CAPABILITY_UNAUTHORIZED := 57

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_BEARER_CAPABILITY_UNAVAILABLE := 58

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_OPTION_UNAVAILABLE := 63

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_BEARER_CAPABILITY_UNIMPLEMENTED := 65

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_UNSUPPORTED_TRAFFIC_PARAMETERS := 73

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_INVALID_CALL_REFERENCE := 81

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_CHANNEL_NONEXISTENT := 82

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_INCOMPATIBLE_DESTINATION := 88

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_INVALID_ENDPOINT_REFERENCE := 89

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_INVALID_TRANSIT_NETWORK_SELECTION := 91

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_TOO_MANY_PENDING_ADD_PARTY := 92

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_AAL_PARAMETERS_UNSUPPORTED := 93

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_MANDATORY_IE_MISSING := 96

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_UNIMPLEMENTED_MESSAGE_TYPE := 97

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_UNIMPLEMENTED_IE := 99

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_INVALID_IE_CONTENTS := 100

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_INVALID_STATE_FOR_MESSAGE := 101

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_RECOVERY_ON_TIMEOUT := 102

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_INCORRECT_MESSAGE_LENGTH := 104

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_PROTOCOL_ERROR := 111

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_COND_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_COND_PERMANENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_COND_TRANSIENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_REASON_USER := 0

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_REASON_IE_MISSING := 4

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_REASON_IE_INSUFFICIENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_PU_PROVIDER := 0

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_PU_USER := 8

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_NA_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CAUSE_NA_ABNORMAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global QOS_CLASS0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global QOS_CLASS1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global QOS_CLASS2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global QOS_CLASS3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global QOS_CLASS4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global TNS_TYPE_NATIONAL := 64

/**
 * @type {Integer (UInt32)}
 */
export global TNS_PLAN_CARRIER_ID_CODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SIO_GET_NUMBER_OF_ATM_DEVICES := 1343619073

/**
 * @type {Integer (UInt32)}
 */
export global SIO_GET_ATM_ADDRESS := 3491102722

/**
 * @type {Integer (UInt32)}
 */
export global SIO_ASSOCIATE_PVC := 2417360899

/**
 * @type {Integer (UInt32)}
 */
export global SIO_GET_ATM_CONNECTION_ID := 1343619076

/**
 * @type {Integer (UInt32)}
 */
export global WSPDESCRIPTION_LEN := 255

/**
 * @type {Integer (Int32)}
 */
export global WSS_OPERATION_IN_PROGRESS := 259

/**
 * @type {Integer (UInt32)}
 */
export global LSP_SYSTEM := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global LSP_INSPECTOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global LSP_REDIRECTOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global LSP_PROXY := 4

/**
 * @type {Integer (UInt32)}
 */
export global LSP_FIREWALL := 8

/**
 * @type {Integer (UInt32)}
 */
export global LSP_INBOUND_MODIFY := 16

/**
 * @type {Integer (UInt32)}
 */
export global LSP_OUTBOUND_MODIFY := 32

/**
 * @type {Integer (UInt32)}
 */
export global LSP_CRYPTO_COMPRESS := 64

/**
 * @type {Integer (UInt32)}
 */
export global LSP_LOCAL_CACHE := 128

/**
 * @type {Integer (Int32)}
 */
export global UDP_NOCHECKSUM := 1

/**
 * @type {Integer (Int32)}
 */
export global UDP_CHECKSUM_COVERAGE := 20

/**
 * @type {Integer (UInt32)}
 */
export global GAI_STRERROR_BUFFER_SIZE := 1024

/**
 * @type {Integer (Int32)}
 */
export global IPX_PTYPE := 16384

/**
 * @type {Integer (Int32)}
 */
export global IPX_FILTERPTYPE := 16385

/**
 * @type {Integer (Int32)}
 */
export global IPX_STOPFILTERPTYPE := 16387

/**
 * @type {Integer (Int32)}
 */
export global IPX_DSTYPE := 16386

/**
 * @type {Integer (Int32)}
 */
export global IPX_EXTENDED_ADDRESS := 16388

/**
 * @type {Integer (Int32)}
 */
export global IPX_RECVHDR := 16389

/**
 * @type {Integer (Int32)}
 */
export global IPX_MAXSIZE := 16390

/**
 * @type {Integer (Int32)}
 */
export global IPX_ADDRESS := 16391

/**
 * @type {Integer (Int32)}
 */
export global IPX_GETNETINFO := 16392

/**
 * @type {Integer (Int32)}
 */
export global IPX_GETNETINFO_NORIP := 16393

/**
 * @type {Integer (Int32)}
 */
export global IPX_SPXGETCONNECTIONSTATUS := 16395

/**
 * @type {Integer (Int32)}
 */
export global IPX_ADDRESS_NOTIFY := 16396

/**
 * @type {Integer (Int32)}
 */
export global IPX_MAX_ADAPTER_NUM := 16397

/**
 * @type {Integer (Int32)}
 */
export global IPX_RERIPNETNUMBER := 16398

/**
 * @type {Integer (Int32)}
 */
export global IPX_RECEIVE_BROADCAST := 16399

/**
 * @type {Integer (Int32)}
 */
export global IPX_IMMEDIATESPXACK := 16400

/**
 * @type {Integer (UInt32)}
 */
export global MAX_MCAST_TTL := 255

/**
 * @type {Integer (Int32)}
 */
export global RM_OPTIONSBASE := 1000

/**
 * @type {Integer (Int32)}
 */
export global RM_RATE_WINDOW_SIZE := 1001

/**
 * @type {Integer (Int32)}
 */
export global RM_SET_MESSAGE_BOUNDARY := 1002

/**
 * @type {Integer (Int32)}
 */
export global RM_FLUSHCACHE := 1003

/**
 * @type {Integer (Int32)}
 */
export global RM_SENDER_WINDOW_ADVANCE_METHOD := 1004

/**
 * @type {Integer (Int32)}
 */
export global RM_SENDER_STATISTICS := 1005

/**
 * @type {Integer (Int32)}
 */
export global RM_LATEJOIN := 1006

/**
 * @type {Integer (Int32)}
 */
export global RM_SET_SEND_IF := 1007

/**
 * @type {Integer (Int32)}
 */
export global RM_ADD_RECEIVE_IF := 1008

/**
 * @type {Integer (Int32)}
 */
export global RM_DEL_RECEIVE_IF := 1009

/**
 * @type {Integer (Int32)}
 */
export global RM_SEND_WINDOW_ADV_RATE := 1010

/**
 * @type {Integer (Int32)}
 */
export global RM_USE_FEC := 1011

/**
 * @type {Integer (Int32)}
 */
export global RM_SET_MCAST_TTL := 1012

/**
 * @type {Integer (Int32)}
 */
export global RM_RECEIVER_STATISTICS := 1013

/**
 * @type {Integer (Int32)}
 */
export global RM_HIGH_SPEED_INTRANET_OPT := 1014

/**
 * @type {Integer (UInt32)}
 */
export global SENDER_DEFAULT_RATE_KBITS_PER_SEC := 56

/**
 * @type {Integer (UInt32)}
 */
export global SENDER_DEFAULT_WINDOW_ADV_PERCENTAGE := 15

/**
 * @type {Integer (UInt32)}
 */
export global MAX_WINDOW_INCREMENT_PERCENTAGE := 25

/**
 * @type {Integer (UInt32)}
 */
export global SENDER_DEFAULT_LATE_JOINER_PERCENTAGE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SENDER_MAX_LATE_JOINER_PERCENTAGE := 75

/**
 * @type {Integer (UInt32)}
 */
export global BITS_PER_BYTE := 8

/**
 * @type {Integer (UInt32)}
 */
export global LOG2_BITS_PER_BYTE := 3

/**
 * @type {Integer (UInt32)}
 */
export global UNIX_PATH_MAX := 108

/**
 * @type {Integer (UInt32)}
 */
export global SIO_AF_UNIX_GETPEERPID := 1476395264

/**
 * @type {Integer (UInt32)}
 */
export global SIO_AF_UNIX_SETBINDPARENTPATH := 2550137089

/**
 * @type {Integer (UInt32)}
 */
export global SIO_AF_UNIX_SETCONNPARENTPATH := 2550137090

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_TP0 := 25

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_TP1 := 26

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_TP2 := 27

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_TP3 := 28

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_TP4 := 29

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_TP := 29

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_CLTP := 30

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_CLNP := 31

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_X25 := 32

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_INACT_NL := 33

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_ESIS := 34

/**
 * @type {Integer (UInt32)}
 */
export global ISOPROTO_INTRAISIS := 35

/**
 * @type {Integer (UInt32)}
 */
export global ISO_MAX_ADDR_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global ISO_HIERARCHICAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global ISO_NON_HIERARCHICAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISO_EXP_DATA_USE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ISO_EXP_DATA_NUSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global NSPROTO_IPX := 1000

/**
 * @type {Integer (UInt32)}
 */
export global NSPROTO_SPX := 1256

/**
 * @type {Integer (UInt32)}
 */
export global NSPROTO_SPXII := 1257

/**
 * @type {Integer (UInt32)}
 */
export global NETBIOS_NAME_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global NETBIOS_UNIQUE_NAME := 0

/**
 * @type {Integer (UInt32)}
 */
export global NETBIOS_GROUP_NAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global NETBIOS_TYPE_QUICK_UNIQUE := 2

/**
 * @type {Integer (UInt32)}
 */
export global NETBIOS_TYPE_QUICK_GROUP := 3

/**
 * @type {Integer (UInt32)}
 */
export global VNSPROTO_IPC := 1

/**
 * @type {Integer (UInt32)}
 */
export global VNSPROTO_RELIABLE_IPC := 2

/**
 * @type {Integer (UInt32)}
 */
export global VNSPROTO_SPP := 3

/**
 * @type {Integer (UInt32)}
 */
export global _LITTLE_ENDIAN := 1234

/**
 * @type {Integer (UInt32)}
 */
export global _BIG_ENDIAN := 4321

/**
 * @type {Integer (UInt32)}
 */
export global _PDP_ENDIAN := 3412

/**
 * @type {Integer (UInt32)}
 */
export global BYTE_ORDER := 1234

/**
 * @type {Integer (UInt32)}
 */
export global DL_ADDRESS_LENGTH_MAXIMUM := 32

/**
 * @type {Integer (UInt32)}
 */
export global DL_HEADER_LENGTH_MAXIMUM := 64

/**
 * @type {Integer (UInt32)}
 */
export global SNAP_DSAP := 170

/**
 * @type {Integer (UInt32)}
 */
export global SNAP_SSAP := 170

/**
 * @type {Integer (UInt32)}
 */
export global SNAP_CONTROL := 3

/**
 * @type {Integer (UInt32)}
 */
export global SNAP_OUI := 0

/**
 * @type {Integer (UInt32)}
 */
export global ETH_LENGTH_OF_HEADER := 14

/**
 * @type {Integer (UInt32)}
 */
export global ETH_LENGTH_OF_VLAN_HEADER := 4

/**
 * @type {Integer (UInt32)}
 */
export global ETH_LENGTH_OF_SNAP_HEADER := 8

/**
 * @type {Integer (UInt32)}
 */
export global ETHERNET_TYPE_MINIMUM := 1536

/**
 * @type {Integer (UInt32)}
 */
export global ETHERNET_TYPE_IPV4 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ETHERNET_TYPE_ARP := 2054

/**
 * @type {Integer (UInt32)}
 */
export global ETHERNET_TYPE_IPV6 := 34525

/**
 * @type {Integer (UInt32)}
 */
export global ETHERNET_TYPE_802_1Q := 33024

/**
 * @type {Integer (UInt32)}
 */
export global ETHERNET_TYPE_802_1AD := 34984

/**
 * @type {Integer (UInt32)}
 */
export global IP_VER_MASK := 240

/**
 * @type {Integer (UInt32)}
 */
export global IPV4_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global MAX_IPV4_PACKET := 65535

/**
 * @type {Integer (UInt32)}
 */
export global MAX_IPV4_HLEN := 60

/**
 * @type {Integer (UInt32)}
 */
export global IPV4_MINIMUM_MTU := 576

/**
 * @type {Integer (UInt32)}
 */
export global IPV4_MIN_MINIMUM_MTU := 352

/**
 * @type {Integer (UInt32)}
 */
export global IPV4_MAX_MINIMUM_MTU := 576

/**
 * @type {Integer (UInt32)}
 */
export global SIZEOF_IP_OPT_ROUTING_HEADER := 3

/**
 * @type {Integer (UInt32)}
 */
export global SIZEOF_IP_OPT_TIMESTAMP_HEADER := 4

/**
 * @type {Integer (UInt32)}
 */
export global SIZEOF_IP_OPT_SECURITY := 11

/**
 * @type {Integer (UInt32)}
 */
export global SIZEOF_IP_OPT_STREAMIDENTIFIER := 4

/**
 * @type {Integer (UInt32)}
 */
export global SIZEOF_IP_OPT_ROUTERALERT := 4

/**
 * @type {Integer (UInt32)}
 */
export global IP4_OFF_MASK := 65311

/**
 * @type {Integer (UInt32)}
 */
export global ICMPV4_INVALID_PREFERENCE_LEVEL := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global IGMP_QUERY_TYPE := 17

/**
 * @type {Integer (UInt32)}
 */
export global IGMP_VERSION1_REPORT_TYPE := 18

/**
 * @type {Integer (UInt32)}
 */
export global IGMP_VERSION2_REPORT_TYPE := 22

/**
 * @type {Integer (UInt32)}
 */
export global IGMP_LEAVE_GROUP_TYPE := 23

/**
 * @type {Integer (UInt32)}
 */
export global IGMP_VERSION3_REPORT_TYPE := 34

/**
 * @type {Integer (UInt32)}
 */
export global IPV6_VERSION := 96

/**
 * @type {Integer (UInt32)}
 */
export global IPV6_TRAFFIC_CLASS_MASK := 49167

/**
 * @type {Integer (UInt32)}
 */
export global IPV6_FULL_TRAFFIC_CLASS_MASK := 61455

/**
 * @type {Integer (UInt32)}
 */
export global IPV6_ECN_MASK := 12288

/**
 * @type {Integer (UInt32)}
 */
export global IPV6_FLOW_LABEL_MASK := 4294905600

/**
 * @type {Integer (UInt32)}
 */
export global MAX_IPV6_PAYLOAD := 65535

/**
 * @type {Integer (UInt32)}
 */
export global IPV6_ECN_SHIFT := 12

/**
 * @type {Integer (UInt32)}
 */
export global IPV6_MINIMUM_MTU := 1280

/**
 * @type {Integer (UInt32)}
 */
export global IP6F_OFF_MASK := 63743

/**
 * @type {Integer (UInt32)}
 */
export global IP6F_RESERVED_MASK := 1536

/**
 * @type {Integer (UInt32)}
 */
export global IP6F_MORE_FRAG := 256

/**
 * @type {Integer (UInt32)}
 */
export global EXT_LEN_UNIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global IP6OPT_TYPE_SKIP := 0

/**
 * @type {Integer (UInt32)}
 */
export global IP6OPT_TYPE_DISCARD := 64

/**
 * @type {Integer (UInt32)}
 */
export global IP6OPT_TYPE_FORCEICMP := 128

/**
 * @type {Integer (UInt32)}
 */
export global IP6OPT_TYPE_ICMP := 192

/**
 * @type {Integer (UInt32)}
 */
export global IP6OPT_MUTABLE := 32

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_DST_UNREACH_NOROUTE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_DST_UNREACH_ADMIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_DST_UNREACH_BEYONDSCOPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_DST_UNREACH_ADDR := 3

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_DST_UNREACH_NOPORT := 4

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_TIME_EXCEED_TRANSIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_TIME_EXCEED_REASSEMBLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_PARAMPROB_HEADER := 0

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_PARAMPROB_NEXTHEADER := 1

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_PARAMPROB_OPTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global ICMP6_PARAMPROB_FIRSTFRAGMENT := 3

/**
 * @type {Integer (UInt32)}
 */
export global ICMPV6_ECHO_REQUEST_FLAG_REVERSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ND_RA_FLAG_MANAGED := 128

/**
 * @type {Integer (UInt32)}
 */
export global ND_RA_FLAG_OTHER := 64

/**
 * @type {Integer (UInt32)}
 */
export global ND_RA_FLAG_HOME_AGENT := 32

/**
 * @type {Integer (UInt32)}
 */
export global ND_RA_FLAG_PREFERENCE := 24

/**
 * @type {Integer (UInt32)}
 */
export global ND_NA_FLAG_ROUTER := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global ND_NA_FLAG_SOLICITED := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global ND_NA_FLAG_OVERRIDE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global ND_OPT_PI_FLAG_ONLINK := 128

/**
 * @type {Integer (UInt32)}
 */
export global ND_OPT_PI_FLAG_AUTO := 64

/**
 * @type {Integer (UInt32)}
 */
export global ND_OPT_PI_FLAG_ROUTER_ADDR := 32

/**
 * @type {Integer (UInt32)}
 */
export global ND_OPT_PI_FLAG_SITE_PREFIX := 16

/**
 * @type {Integer (UInt32)}
 */
export global ND_OPT_PI_FLAG_ROUTE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ND_OPT_RI_FLAG_PREFERENCE := 24

/**
 * @type {Integer (UInt32)}
 */
export global ND_OPT_RDNSS_MIN_LEN := 24

/**
 * @type {Integer (UInt32)}
 */
export global ND_OPT_DNSSL_MIN_LEN := 16

/**
 * @type {Integer (UInt32)}
 */
export global IN6_EMBEDDEDV4_UOCTET_POSITION := 8

/**
 * @type {Integer (UInt32)}
 */
export global IN6_EMBEDDEDV4_BITS_IN_BYTE := 8

/**
 * @type {Integer (UInt32)}
 */
export global TH_MAX_LEN := 60

/**
 * @type {Integer (UInt32)}
 */
export global TH_FIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global TH_SYN := 2

/**
 * @type {Integer (UInt32)}
 */
export global TH_RST := 4

/**
 * @type {Integer (UInt32)}
 */
export global TH_PSH := 8

/**
 * @type {Integer (UInt32)}
 */
export global TH_ACK := 16

/**
 * @type {Integer (UInt32)}
 */
export global TH_URG := 32

/**
 * @type {Integer (UInt32)}
 */
export global TH_ECE := 64

/**
 * @type {Integer (UInt32)}
 */
export global TH_CWR := 128

/**
 * @type {Integer (UInt32)}
 */
export global TH_OPT_EOL := 0

/**
 * @type {Integer (UInt32)}
 */
export global TH_OPT_NOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global TH_OPT_MSS := 2

/**
 * @type {Integer (UInt32)}
 */
export global TH_OPT_WS := 3

/**
 * @type {Integer (UInt32)}
 */
export global TH_OPT_SACK_PERMITTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global TH_OPT_SACK := 5

/**
 * @type {Integer (UInt32)}
 */
export global TH_OPT_TS := 8

/**
 * @type {Integer (UInt32)}
 */
export global TH_OPT_FASTOPEN := 34

/**
 * @type {String}
 */
export global NMR_REG_KEY_PATH := "\Registry\Machine\System\CurrentControlSet\Control\NMR\providers"

/**
 * @type {SOCKET}
 */
export global INVALID_SOCKET := SOCKET(-1)

/**
 * @type {Integer (UInt32)}
 */
export global WSA_INFINITE := 4294967295

/**
 * @type {WSAEVENT}
 */
export global WSA_INVALID_EVENT := WSAEVENT(0)

/**
 * @type {Integer (UInt32)}
 */
export global IOC_INOUT := 3221225472

/**
 * @type {Integer (Int32)}
 */
export global FIONREAD := 1074030207

/**
 * @type {Integer (Int32)}
 */
export global FIONBIO := -2147195266

/**
 * @type {Integer (Int32)}
 */
export global FIOASYNC := -2147195267

/**
 * @type {Integer (Int32)}
 */
export global SIOCSHIWAT := -2147192064

/**
 * @type {Integer (Int32)}
 */
export global SIOCGHIWAT := 1074033409

/**
 * @type {Integer (Int32)}
 */
export global SIOCSLOWAT := -2147192062

/**
 * @type {Integer (Int32)}
 */
export global SIOCGLOWAT := 1074033411

/**
 * @type {Integer (Int32)}
 */
export global SIOCATMARK := 1074033415

/**
 * @type {Integer (UInt32)}
 */
export global INADDR_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global INADDR_BROADCAST := 4294967295

/**
 * @type {Integer (Int32)}
 */
export global SO_DONTLINGER := -129

/**
 * @type {Integer (Int32)}
 */
export global SO_EXCLUSIVEADDRUSE := -5

/**
 * @type {Integer (Int32)}
 */
export global LM_HB_Extension := 128

/**
 * @type {Integer (Int32)}
 */
export global LM_HB1_PnP := 1

/**
 * @type {Integer (Int32)}
 */
export global LM_HB1_PDA_Palmtop := 2

/**
 * @type {Integer (Int32)}
 */
export global LM_HB1_Computer := 4

/**
 * @type {Integer (Int32)}
 */
export global LM_HB1_Printer := 8

/**
 * @type {Integer (Int32)}
 */
export global LM_HB1_Modem := 16

/**
 * @type {Integer (Int32)}
 */
export global LM_HB1_Fax := 32

/**
 * @type {Integer (Int32)}
 */
export global LM_HB1_LANAccess := 64

/**
 * @type {Integer (Int32)}
 */
export global LM_HB2_Telephony := 1

/**
 * @type {Integer (Int32)}
 */
export global LM_HB2_FileServer := 2
;@endregion Constants
