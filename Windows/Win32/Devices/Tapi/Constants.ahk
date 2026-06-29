#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Tapi
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global TAPI_CURRENT_VERSION := 131074

/**
 * @type {Integer (Int32)}
 */
export global LINE_ADDRESSSTATE := 0

/**
 * @type {Integer (Int32)}
 */
export global LINE_CALLINFO := 1

/**
 * @type {Integer (Int32)}
 */
export global LINE_CALLSTATE := 2

/**
 * @type {Integer (Int32)}
 */
export global LINE_CLOSE := 3

/**
 * @type {Integer (Int32)}
 */
export global LINE_DEVSPECIFIC := 4

/**
 * @type {Integer (Int32)}
 */
export global LINE_DEVSPECIFICFEATURE := 5

/**
 * @type {Integer (Int32)}
 */
export global LINE_GATHERDIGITS := 6

/**
 * @type {Integer (Int32)}
 */
export global LINE_GENERATE := 7

/**
 * @type {Integer (Int32)}
 */
export global LINE_LINEDEVSTATE := 8

/**
 * @type {Integer (Int32)}
 */
export global LINE_MONITORDIGITS := 9

/**
 * @type {Integer (Int32)}
 */
export global LINE_MONITORMEDIA := 10

/**
 * @type {Integer (Int32)}
 */
export global LINE_MONITORTONE := 11

/**
 * @type {Integer (Int32)}
 */
export global LINE_REPLY := 12

/**
 * @type {Integer (Int32)}
 */
export global LINE_REQUEST := 13

/**
 * @type {Integer (Int32)}
 */
export global PHONE_BUTTON := 14

/**
 * @type {Integer (Int32)}
 */
export global PHONE_CLOSE := 15

/**
 * @type {Integer (Int32)}
 */
export global PHONE_DEVSPECIFIC := 16

/**
 * @type {Integer (Int32)}
 */
export global PHONE_REPLY := 17

/**
 * @type {Integer (Int32)}
 */
export global PHONE_STATE := 18

/**
 * @type {Integer (Int32)}
 */
export global LINE_CREATE := 19

/**
 * @type {Integer (Int32)}
 */
export global PHONE_CREATE := 20

/**
 * @type {Integer (Int32)}
 */
export global LINE_AGENTSPECIFIC := 21

/**
 * @type {Integer (Int32)}
 */
export global LINE_AGENTSTATUS := 22

/**
 * @type {Integer (Int32)}
 */
export global LINE_APPNEWCALL := 23

/**
 * @type {Integer (Int32)}
 */
export global LINE_PROXYREQUEST := 24

/**
 * @type {Integer (Int32)}
 */
export global LINE_REMOVE := 25

/**
 * @type {Integer (Int32)}
 */
export global PHONE_REMOVE := 26

/**
 * @type {Integer (Int32)}
 */
export global LINE_AGENTSESSIONSTATUS := 27

/**
 * @type {Integer (Int32)}
 */
export global LINE_QUEUESTATUS := 28

/**
 * @type {Integer (Int32)}
 */
export global LINE_AGENTSTATUSEX := 29

/**
 * @type {Integer (Int32)}
 */
export global LINE_GROUPSTATUS := 30

/**
 * @type {Integer (Int32)}
 */
export global LINE_PROXYSTATUS := 31

/**
 * @type {Integer (Int32)}
 */
export global LINE_APPNEWCALLHUB := 32

/**
 * @type {Integer (Int32)}
 */
export global LINE_CALLHUBCLOSE := 33

/**
 * @type {Integer (Int32)}
 */
export global LINE_DEVSPECIFICEX := 34

/**
 * @type {Integer (UInt32)}
 */
export global INITIALIZE_NEGOTIATION := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_FWDNUMRINGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_PICKUPGROUPID := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_SECURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_BLOCKIDDEFAULT := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_BLOCKIDOVERRIDE := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_DIALED := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_ORIGOFFHOOK := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_DESTOFFHOOK := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_FWDCONSULT := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_SETUPCONFNULL := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_AUTORECONNECT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_COMPLETIONID := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_TRANSFERHELD := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_TRANSFERMAKE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_CONFERENCEHELD := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_CONFERENCEMAKE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_PARTIALDIAL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_FWDSTATUSVALID := 131072

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_FWDINTEXTADDR := 262144

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_FWDBUSYNAADDR := 524288

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_ACCEPTTOALERT := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_CONFDROP := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_PICKUPCALLWAIT := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_PREDICTIVEDIALER := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_QUEUE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_ROUTEPOINT := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_HOLDMAKESNEW := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_NOINTERNALCALLS := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_NOEXTERNALCALLS := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_SETCALLINGID := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_ACDGROUP := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRCAPFLAGS_NOPSTNADDRESSTRANSLATION := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSMODE_ADDRESSID := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSMODE_DIALABLEADDR := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSHARING_PRIVATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSHARING_BRIDGEDEXCL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSHARING_BRIDGEDNEW := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSHARING_BRIDGEDSHARED := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSHARING_MONITORED := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSTATE_OTHER := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSTATE_DEVSPECIFIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSTATE_INUSEZERO := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSTATE_INUSEONE := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSTATE_INUSEMANY := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSTATE_NUMCALLS := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSTATE_FORWARD := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSTATE_TERMINALS := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSSTATE_CAPSCHANGE := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSTYPE_PHONENUMBER := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSTYPE_SDP := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSTYPE_EMAILNAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSTYPE_DOMAINNAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRESSTYPE_IPADDRESS := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_FORWARD := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_MAKECALL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_PICKUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_SETMEDIACONTROL := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_SETTERMINAL := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_SETUPCONF := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_UNCOMPLETECALL := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_UNPARK := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_PICKUPHELD := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_PICKUPGROUP := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_PICKUPDIRECT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_PICKUPWAITING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_FORWARDFWD := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LINEADDRFEATURE_FORWARDDND := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTFEATURE_SETAGENTGROUP := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTFEATURE_SETAGENTSTATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTFEATURE_SETAGENTACTIVITY := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTFEATURE_AGENTSPECIFIC := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTFEATURE_GETAGENTACTIVITYLIST := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTFEATURE_GETAGENTGROUP := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATE_LOGGEDOFF := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATE_NOTREADY := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATE_READY := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATE_BUSYACD := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATE_BUSYINCOMING := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATE_BUSYOUTBOUND := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATE_BUSYOTHER := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATE_WORKINGAFTERCALL := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATE_UNKNOWN := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATE_UNAVAIL := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUS_GROUP := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUS_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUS_NEXTSTATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUS_ACTIVITY := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUS_ACTIVITYLIST := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUS_GROUPLIST := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUS_CAPSCHANGE := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUS_VALIDSTATES := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUS_VALIDNEXTSTATES := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATEEX_NOTREADY := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATEEX_READY := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATEEX_BUSYACD := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATEEX_BUSYINCOMING := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATEEX_BUSYOUTGOING := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATEEX_UNKNOWN := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATEEX_RELEASED := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUSEX_NEWAGENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUSEX_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSTATUSEX_UPDATEINFO := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSESSIONSTATE_NOTREADY := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSESSIONSTATE_READY := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSESSIONSTATE_BUSYONCALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSESSIONSTATE_BUSYWRAPUP := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSESSIONSTATE_ENDED := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSESSIONSTATE_RELEASED := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSESSIONSTATUS_NEWSESSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSESSIONSTATUS_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEAGENTSESSIONSTATUS_UPDATEINFO := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEQUEUESTATUS_UPDATEINFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEQUEUESTATUS_NEWQUEUE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEQUEUESTATUS_QUEUEREMOVED := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEGROUPSTATUS_NEWGROUP := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEGROUPSTATUS_GROUPREMOVED := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYSTATUS_OPEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYSTATUS_CLOSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYSTATUS_ALLOPENFORACD := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEANSWERMODE_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEANSWERMODE_DROP := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEANSWERMODE_HOLD := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEBEARERMODE_VOICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEBEARERMODE_SPEECH := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEBEARERMODE_MULTIUSE := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEBEARERMODE_DATA := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEBEARERMODE_ALTSPEECHDATA := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEBEARERMODE_NONCALLSIGNALING := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEBEARERMODE_PASSTHROUGH := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEBEARERMODE_RESTRICTEDDATA := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEBUSYMODE_STATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEBUSYMODE_TRUNK := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEBUSYMODE_UNKNOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEBUSYMODE_UNAVAIL := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLCOMPLCOND_BUSY := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLCOMPLCOND_NOANSWER := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLCOMPLMODE_CAMPON := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLCOMPLMODE_CALLBACK := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLCOMPLMODE_INTRUDE := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLCOMPLMODE_MESSAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_ACCEPT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_ADDTOCONF := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_ANSWER := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_BLINDTRANSFER := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_COMPLETECALL := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_COMPLETETRANSF := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_DIAL := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_DROP := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_GATHERDIGITS := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_GENERATEDIGITS := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_GENERATETONE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_HOLD := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_MONITORDIGITS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_MONITORMEDIA := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_MONITORTONES := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_PARK := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_PREPAREADDCONF := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_REDIRECT := 131072

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_REMOVEFROMCONF := 262144

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_SECURECALL := 524288

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_SENDUSERUSER := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_SETCALLPARAMS := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_SETMEDIACONTROL := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_SETTERMINAL := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_SETUPCONF := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_SETUPTRANSFER := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_SWAPHOLD := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_UNHOLD := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_RELEASEUSERUSERINFO := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_SETTREATMENT := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_SETQOS := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE_SETCALLDATA := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE2_NOHOLDCONFERENCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE2_ONESTEPTRANSFER := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE2_COMPLCAMPON := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE2_COMPLCALLBACK := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE2_COMPLINTRUDE := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE2_COMPLMESSAGE := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE2_TRANSFERNORM := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE2_TRANSFERCONF := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE2_PARKDIRECT := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLFEATURE2_PARKNONDIRECT := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLHUBTRACKING_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLHUBTRACKING_PROVIDERLEVEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLHUBTRACKING_ALLCALLS := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_OTHER := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_DEVSPECIFIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_BEARERMODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_RATE := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_MEDIAMODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_APPSPECIFIC := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_CALLID := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_RELATEDCALLID := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_ORIGIN := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_REASON := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_COMPLETIONID := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_NUMOWNERINCR := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_NUMOWNERDECR := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_NUMMONITORS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_TRUNK := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_CALLERID := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_CALLEDID := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_CONNECTEDID := 131072

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_REDIRECTIONID := 262144

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_REDIRECTINGID := 524288

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_DISPLAY := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_USERUSERINFO := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_HIGHLEVELCOMP := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_LOWLEVELCOMP := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_CHARGINGINFO := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_TERMINAL := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_DIALPARAMS := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_MONITORMODES := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_TREATMENT := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_QOS := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLINFOSTATE_CALLDATA := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLORIGIN_OUTBOUND := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLORIGIN_INTERNAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLORIGIN_EXTERNAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLORIGIN_UNKNOWN := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLORIGIN_UNAVAIL := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLORIGIN_CONFERENCE := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLORIGIN_INBOUND := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARAMFLAGS_SECURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARAMFLAGS_IDLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARAMFLAGS_BLOCKID := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARAMFLAGS_ORIGOFFHOOK := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARAMFLAGS_DESTOFFHOOK := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARAMFLAGS_NOHOLDCONFERENCE := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARAMFLAGS_PREDICTIVEDIAL := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARAMFLAGS_ONESTEPTRANSFER := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARTYID_BLOCKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARTYID_OUTOFAREA := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARTYID_NAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARTYID_ADDRESS := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARTYID_PARTIAL := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARTYID_UNKNOWN := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPARTYID_UNAVAIL := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPRIVILEGE_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPRIVILEGE_MONITOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLPRIVILEGE_OWNER := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_DIRECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_FWDBUSY := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_FWDNOANSWER := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_FWDUNCOND := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_PICKUP := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_UNPARK := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_REDIRECT := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_CALLCOMPLETION := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_TRANSFER := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_REMINDER := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_UNKNOWN := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_UNAVAIL := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_INTRUDE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_PARKED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_CAMPEDON := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLREASON_ROUTEREQUEST := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSELECT_LINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSELECT_ADDRESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSELECT_CALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSELECT_DEVICEID := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSELECT_CALLID := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_IDLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_OFFERING := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_ACCEPTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_DIALTONE := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_DIALING := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_RINGBACK := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_BUSY := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_SPECIALINFO := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_CONNECTED := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_PROCEEDING := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_ONHOLD := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_CONFERENCED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_ONHOLDPENDCONF := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_ONHOLDPENDTRANSFER := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_DISCONNECTED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLSTATE_UNKNOWN := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLTREATMENT_SILENCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLTREATMENT_RINGBACK := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLTREATMENT_BUSY := 3

/**
 * @type {Integer (UInt32)}
 */
export global LINECALLTREATMENT_MUSIC := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECARDOPTION_PREDEFINED := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECARDOPTION_HIDDEN := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECONNECTEDMODE_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINECONNECTEDMODE_INACTIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINECONNECTEDMODE_ACTIVEHELD := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINECONNECTEDMODE_INACTIVEHELD := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINECONNECTEDMODE_CONFIRMED := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_CROSSADDRCONF := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_HIGHLEVCOMP := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_LOWLEVCOMP := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_MEDIACONTROL := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_MULTIPLEADDR := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_CLOSEDROP := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_DIALBILLING := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_DIALQUIET := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_DIALDIALTONE := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_MSP := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_CALLHUB := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_CALLHUBTRACKING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_PRIVATEOBJECTS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVCAPFLAGS_LOCAL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_OTHER := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_RINGING := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_CONNECTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_DISCONNECTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_MSGWAITON := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_MSGWAITOFF := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_INSERVICE := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_OUTOFSERVICE := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_MAINTENANCE := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_OPEN := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_CLOSE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_NUMCALLS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_NUMCOMPLETIONS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_TERMINALS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_ROAMMODE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_BATTERY := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_SIGNAL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_DEVSPECIFIC := 131072

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_REINIT := 262144

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_LOCK := 524288

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_CAPSCHANGE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_CONFIGCHANGE := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_TRANSLATECHANGE := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_COMPLCANCEL := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATE_REMOVED := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATUSFLAGS_CONNECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATUSFLAGS_MSGWAIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATUSFLAGS_INSERVICE := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEDEVSTATUSFLAGS_LOCKED := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEDIALTONEMODE_NORMAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEDIALTONEMODE_SPECIAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEDIALTONEMODE_INTERNAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEDIALTONEMODE_EXTERNAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEDIALTONEMODE_UNKNOWN := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEDIALTONEMODE_UNAVAIL := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEDIGITMODE_PULSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEDIGITMODE_DTMF := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEDIGITMODE_DTMFEND := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_NORMAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_UNKNOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_REJECT := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_PICKUP := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_FORWARDED := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_BUSY := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_NOANSWER := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_BADADDRESS := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_UNREACHABLE := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_CONGESTION := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_INCOMPATIBLE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_UNAVAIL := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_NODIALTONE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_NUMBERCHANGED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_OUTOFORDER := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_TEMPFAILURE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_QOSUNAVAIL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_BLOCKED := 131072

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_DONOTDISTURB := 262144

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_CANCELLED := 524288

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_DESTINATIONBARRED := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global LINEDISCONNECTMODE_FDNRESTRICT := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_ALLOCATED := 2147483649

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_BADDEVICEID := 2147483650

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_BEARERMODEUNAVAIL := 2147483651

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_CALLUNAVAIL := 2147483653

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_COMPLETIONOVERRUN := 2147483654

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_CONFERENCEFULL := 2147483655

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_DIALBILLING := 2147483656

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_DIALDIALTONE := 2147483657

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_DIALPROMPT := 2147483658

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_DIALQUIET := 2147483659

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INCOMPATIBLEAPIVERSION := 2147483660

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INCOMPATIBLEEXTVERSION := 2147483661

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INIFILECORRUPT := 2147483662

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INUSE := 2147483663

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALADDRESS := 2147483664

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALADDRESSID := 2147483665

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALADDRESSMODE := 2147483666

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALADDRESSSTATE := 2147483667

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALAPPHANDLE := 2147483668

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALAPPNAME := 2147483669

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALBEARERMODE := 2147483670

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCALLCOMPLMODE := 2147483671

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCALLHANDLE := 2147483672

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCALLPARAMS := 2147483673

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCALLPRIVILEGE := 2147483674

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCALLSELECT := 2147483675

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCALLSTATE := 2147483676

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCALLSTATELIST := 2147483677

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCARD := 2147483678

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCOMPLETIONID := 2147483679

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCONFCALLHANDLE := 2147483680

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCONSULTCALLHANDLE := 2147483681

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALCOUNTRYCODE := 2147483682

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALDEVICECLASS := 2147483683

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALDEVICEHANDLE := 2147483684

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALDIALPARAMS := 2147483685

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALDIGITLIST := 2147483686

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALDIGITMODE := 2147483687

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALDIGITS := 2147483688

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALEXTVERSION := 2147483689

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALGROUPID := 2147483690

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALLINEHANDLE := 2147483691

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALLINESTATE := 2147483692

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALLOCATION := 2147483693

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALMEDIALIST := 2147483694

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALMEDIAMODE := 2147483695

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALMESSAGEID := 2147483696

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALPARAM := 2147483698

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALPARKID := 2147483699

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALPARKMODE := 2147483700

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALPOINTER := 2147483701

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALPRIVSELECT := 2147483702

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALRATE := 2147483703

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALREQUESTMODE := 2147483704

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALTERMINALID := 2147483705

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALTERMINALMODE := 2147483706

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALTIMEOUT := 2147483707

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALTONE := 2147483708

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALTONELIST := 2147483709

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALTONEMODE := 2147483710

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALTRANSFERMODE := 2147483711

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_LINEMAPPERFAILED := 2147483712

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_NOCONFERENCE := 2147483713

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_NODEVICE := 2147483714

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_NODRIVER := 2147483715

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_NOMEM := 2147483716

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_NOREQUEST := 2147483717

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_NOTOWNER := 2147483718

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_NOTREGISTERED := 2147483719

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_OPERATIONFAILED := 2147483720

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_OPERATIONUNAVAIL := 2147483721

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_RATEUNAVAIL := 2147483722

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_RESOURCEUNAVAIL := 2147483723

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_REQUESTOVERRUN := 2147483724

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_STRUCTURETOOSMALL := 2147483725

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_TARGETNOTFOUND := 2147483726

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_TARGETSELF := 2147483727

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_UNINITIALIZED := 2147483728

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_USERUSERINFOTOOBIG := 2147483729

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_REINIT := 2147483730

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_ADDRESSBLOCKED := 2147483731

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_BILLINGREJECTED := 2147483732

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALFEATURE := 2147483733

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_NOMULTIPLEINSTANCE := 2147483734

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALAGENTID := 2147483735

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALAGENTGROUP := 2147483736

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALPASSWORD := 2147483737

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALAGENTSTATE := 2147483738

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALAGENTACTIVITY := 2147483739

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_DIALVOICEDETECT := 2147483740

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_USERCANCELLED := 2147483741

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALADDRESSTYPE := 2147483742

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_INVALAGENTSESSIONSTATE := 2147483743

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_DISCONNECTED := 2147483744

/**
 * @type {Integer (UInt32)}
 */
export global LINEERR_SERVICE_NOT_RUNNING := 2147483745

/**
 * @type {Integer (UInt32)}
 */
export global LINEFEATURE_DEVSPECIFIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEFEATURE_DEVSPECIFICFEAT := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEFEATURE_FORWARD := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEFEATURE_MAKECALL := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEFEATURE_SETMEDIACONTROL := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEFEATURE_SETTERMINAL := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEFEATURE_SETDEVSTATUS := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEFEATURE_FORWARDFWD := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEFEATURE_FORWARDDND := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_UNCOND := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_UNCONDINTERNAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_UNCONDEXTERNAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_UNCONDSPECIFIC := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_BUSY := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_BUSYINTERNAL := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_BUSYEXTERNAL := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_BUSYSPECIFIC := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_NOANSW := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_NOANSWINTERNAL := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_NOANSWEXTERNAL := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_NOANSWSPECIFIC := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_BUSYNA := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_BUSYNAINTERNAL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_BUSYNAEXTERNAL := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_BUSYNASPECIFIC := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_UNKNOWN := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LINEFORWARDMODE_UNAVAIL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global LINEGATHERTERM_BUFFERFULL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEGATHERTERM_TERMDIGIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEGATHERTERM_FIRSTTIMEOUT := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEGATHERTERM_INTERTIMEOUT := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEGATHERTERM_CANCEL := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEGENERATETERM_DONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEGENERATETERM_CANCEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEINITIALIZEEXOPTION_USEHIDDENWINDOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEINITIALIZEEXOPTION_USEEVENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEINITIALIZEEXOPTION_USECOMPLETIONPORT := 3

/**
 * @type {Integer (UInt32)}
 */
export global LINEINITIALIZEEXOPTION_CALLHUBTRACKING := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global LINELOCATIONOPTION_PULSEDIAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEMAPPER := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIACONTROL_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIACONTROL_START := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIACONTROL_RESET := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIACONTROL_PAUSE := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIACONTROL_RESUME := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIACONTROL_RATEUP := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIACONTROL_RATEDOWN := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIACONTROL_RATENORMAL := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIACONTROL_VOLUMEUP := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIACONTROL_VOLUMEDOWN := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIACONTROL_VOLUMENORMAL := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_UNKNOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_INTERACTIVEVOICE := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_AUTOMATEDVOICE := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_DATAMODEM := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_G3FAX := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_TDD := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_G4FAX := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_DIGITALDATA := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_TELETEX := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_VIDEOTEX := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_TELEX := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_MIXED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_ADSI := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_VOICEVIEW := 16384

/**
 * @type {Integer (UInt32)}
 */
export global LINEMEDIAMODE_VIDEO := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LAST_LINEMEDIAMODE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LINEOFFERINGMODE_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEOFFERINGMODE_INACTIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEOPENOPTION_SINGLEADDRESS := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global LINEOPENOPTION_PROXY := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global LINEPARKMODE_DIRECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEPARKMODE_NONDIRECTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_SETAGENTGROUP := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_SETAGENTSTATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_SETAGENTACTIVITY := 3

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_GETAGENTCAPS := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_GETAGENTSTATUS := 5

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_AGENTSPECIFIC := 6

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_GETAGENTACTIVITYLIST := 7

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_GETAGENTGROUPLIST := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_CREATEAGENT := 9

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_SETAGENTMEASUREMENTPERIOD := 10

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_GETAGENTINFO := 11

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_CREATEAGENTSESSION := 12

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_GETAGENTSESSIONLIST := 13

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_SETAGENTSESSIONSTATE := 14

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_GETAGENTSESSIONINFO := 15

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_GETQUEUELIST := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_SETQUEUEMEASUREMENTPERIOD := 17

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_GETQUEUEINFO := 18

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_GETGROUPLIST := 19

/**
 * @type {Integer (UInt32)}
 */
export global LINEPROXYREQUEST_SETAGENTSTATEEX := 20

/**
 * @type {Integer (UInt32)}
 */
export global LINEREMOVEFROMCONF_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEREMOVEFROMCONF_LAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEREMOVEFROMCONF_ANY := 3

/**
 * @type {Integer (UInt32)}
 */
export global LINEREQUESTMODE_MAKECALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEREQUESTMODE_MEDIACALL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEREQUESTMODE_DROP := 4

/**
 * @type {Integer (UInt32)}
 */
export global LAST_LINEREQUESTMODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEROAMMODE_UNKNOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEROAMMODE_UNAVAIL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEROAMMODE_HOME := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINEROAMMODE_ROAMA := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINEROAMMODE_ROAMB := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINESPECIALINFO_NOCIRCUIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINESPECIALINFO_CUSTIRREG := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINESPECIALINFO_REORDER := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINESPECIALINFO_UNKNOWN := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINESPECIALINFO_UNAVAIL := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMDEV_PHONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMDEV_HEADSET := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMDEV_SPEAKER := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMMODE_BUTTONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMMODE_LAMPS := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMMODE_DISPLAY := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMMODE_RINGER := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMMODE_HOOKSWITCH := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMMODE_MEDIATOLINE := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMMODE_MEDIAFROMLINE := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMMODE_MEDIABIDIRECT := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMSHARING_PRIVATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMSHARING_SHAREDEXCL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINETERMSHARING_SHAREDCONF := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINETOLLLISTOPTION_ADD := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINETOLLLISTOPTION_REMOVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINETONEMODE_CUSTOM := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINETONEMODE_RINGBACK := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINETONEMODE_BUSY := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINETONEMODE_BEEP := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINETONEMODE_BILLING := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSFERMODE_TRANSFER := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSFERMODE_CONFERENCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATEOPTION_CARDOVERRIDE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATEOPTION_CANCELCALLWAITING := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATEOPTION_FORCELOCAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATEOPTION_FORCELD := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_CANONICAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_INTERNATIONAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_LONGDISTANCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_LOCAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_INTOLLLIST := 16

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_NOTINTOLLLIST := 32

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_DIALBILLING := 64

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_DIALQUIET := 128

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_DIALDIALTONE := 256

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_DIALPROMPT := 512

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_VOICEDETECT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LINETRANSLATERESULT_NOTRANSLATION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_CONFERENCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_TRANSFER := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_DROP := 3

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_HOLD := 4

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_RECALL := 5

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_DISCONNECT := 6

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_CONNECT := 7

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_MSGWAITON := 8

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_MSGWAITOFF := 9

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_SELECTRING := 10

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_ABBREVDIAL := 11

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_FORWARD := 12

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_PICKUP := 13

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_RINGAGAIN := 14

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_PARK := 15

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_REJECT := 16

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_REDIRECT := 17

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_MUTE := 18

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_VOLUMEUP := 19

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_VOLUMEDOWN := 20

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_SPEAKERON := 21

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_SPEAKEROFF := 22

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_FLASH := 23

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_DATAON := 24

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_DATAOFF := 25

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_DONOTDISTURB := 26

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_INTERCOM := 27

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_BRIDGEDAPP := 28

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_BUSY := 29

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_CALLAPP := 30

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_DATETIME := 31

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_DIRECTORY := 32

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_COVER := 33

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_CALLID := 34

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_LASTNUM := 35

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_NIGHTSRV := 36

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_SENDCALLS := 37

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_MSGINDICATOR := 38

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_REPDIAL := 39

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_SETREPDIAL := 40

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_SYSTEMSPEED := 41

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_STATIONSPEED := 42

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_CAMPON := 43

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_SAVEREPEAT := 44

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_QUEUECALL := 45

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_NONE := 46

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONFUNCTION_SEND := 47

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONMODE_DUMMY := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONMODE_CALL := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONMODE_FEATURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONMODE_KEYPAD := 8

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONMODE_LOCAL := 16

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONMODE_DISPLAY := 32

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONSTATE_UP := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONSTATE_DOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONSTATE_UNKNOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global PHONEBUTTONSTATE_UNAVAIL := 8

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_ALLOCATED := 2415919105

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_BADDEVICEID := 2415919106

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INCOMPATIBLEAPIVERSION := 2415919107

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INCOMPATIBLEEXTVERSION := 2415919108

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INIFILECORRUPT := 2415919109

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INUSE := 2415919110

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALAPPHANDLE := 2415919111

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALAPPNAME := 2415919112

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALBUTTONLAMPID := 2415919113

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALBUTTONMODE := 2415919114

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALBUTTONSTATE := 2415919115

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALDATAID := 2415919116

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALDEVICECLASS := 2415919117

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALEXTVERSION := 2415919118

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALHOOKSWITCHDEV := 2415919119

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALHOOKSWITCHMODE := 2415919120

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALLAMPMODE := 2415919121

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALPARAM := 2415919122

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALPHONEHANDLE := 2415919123

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALPHONESTATE := 2415919124

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALPOINTER := 2415919125

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALPRIVILEGE := 2415919126

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_INVALRINGMODE := 2415919127

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_NODEVICE := 2415919128

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_NODRIVER := 2415919129

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_NOMEM := 2415919130

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_NOTOWNER := 2415919131

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_OPERATIONFAILED := 2415919132

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_OPERATIONUNAVAIL := 2415919133

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_RESOURCEUNAVAIL := 2415919135

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_REQUESTOVERRUN := 2415919136

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_STRUCTURETOOSMALL := 2415919137

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_UNINITIALIZED := 2415919138

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_REINIT := 2415919139

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_DISCONNECTED := 2415919140

/**
 * @type {Integer (UInt32)}
 */
export global PHONEERR_SERVICE_NOT_RUNNING := 2415919141

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETBUTTONINFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETDATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETDISPLAY := 4

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETGAINHANDSET := 8

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETGAINSPEAKER := 16

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETGAINHEADSET := 32

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETHOOKSWITCHHANDSET := 64

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETHOOKSWITCHSPEAKER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETHOOKSWITCHHEADSET := 256

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETLAMP := 512

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETRING := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETVOLUMEHANDSET := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETVOLUMESPEAKER := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GETVOLUMEHEADSET := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETBUTTONINFO := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETDATA := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETDISPLAY := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETGAINHANDSET := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETGAINSPEAKER := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETGAINHEADSET := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETHOOKSWITCHHANDSET := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETHOOKSWITCHSPEAKER := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETHOOKSWITCHHEADSET := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETLAMP := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETRING := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETVOLUMEHANDSET := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETVOLUMESPEAKER := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_SETVOLUMEHEADSET := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global PHONEFEATURE_GENERICPHONE := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global PHONEHOOKSWITCHDEV_HANDSET := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHONEHOOKSWITCHDEV_SPEAKER := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHONEHOOKSWITCHDEV_HEADSET := 4

/**
 * @type {Integer (UInt32)}
 */
export global PHONEHOOKSWITCHMODE_ONHOOK := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHONEHOOKSWITCHMODE_MIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHONEHOOKSWITCHMODE_SPEAKER := 4

/**
 * @type {Integer (UInt32)}
 */
export global PHONEHOOKSWITCHMODE_MICSPEAKER := 8

/**
 * @type {Integer (UInt32)}
 */
export global PHONEHOOKSWITCHMODE_UNKNOWN := 16

/**
 * @type {Integer (UInt32)}
 */
export global PHONEINITIALIZEEXOPTION_USEHIDDENWINDOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHONEINITIALIZEEXOPTION_USEEVENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHONEINITIALIZEEXOPTION_USECOMPLETIONPORT := 3

/**
 * @type {Integer (UInt32)}
 */
export global PHONELAMPMODE_DUMMY := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHONELAMPMODE_OFF := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHONELAMPMODE_STEADY := 4

/**
 * @type {Integer (UInt32)}
 */
export global PHONELAMPMODE_WINK := 8

/**
 * @type {Integer (UInt32)}
 */
export global PHONELAMPMODE_FLASH := 16

/**
 * @type {Integer (UInt32)}
 */
export global PHONELAMPMODE_FLUTTER := 32

/**
 * @type {Integer (UInt32)}
 */
export global PHONELAMPMODE_BROKENFLUTTER := 64

/**
 * @type {Integer (UInt32)}
 */
export global PHONELAMPMODE_UNKNOWN := 128

/**
 * @type {Integer (UInt32)}
 */
export global PHONEPRIVILEGE_MONITOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHONEPRIVILEGE_OWNER := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_OTHER := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_CONNECTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_DISCONNECTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_OWNER := 8

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_MONITORS := 16

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_DISPLAY := 32

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_LAMP := 64

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_RINGMODE := 128

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_RINGVOLUME := 256

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_HANDSETHOOKSWITCH := 512

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_HANDSETVOLUME := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_HANDSETGAIN := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_SPEAKERHOOKSWITCH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_SPEAKERVOLUME := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_SPEAKERGAIN := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_HEADSETHOOKSWITCH := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_HEADSETVOLUME := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_HEADSETGAIN := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_SUSPEND := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_RESUME := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_DEVSPECIFIC := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_REINIT := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_CAPSCHANGE := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATE_REMOVED := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATUSFLAGS_CONNECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PHONESTATUSFLAGS_SUSPENDED := 2

/**
 * @type {Integer (UInt32)}
 */
export global STRINGFORMAT_ASCII := 1

/**
 * @type {Integer (UInt32)}
 */
export global STRINGFORMAT_DBCS := 2

/**
 * @type {Integer (UInt32)}
 */
export global STRINGFORMAT_UNICODE := 3

/**
 * @type {Integer (UInt32)}
 */
export global STRINGFORMAT_BINARY := 4

/**
 * @type {Integer (UInt32)}
 */
export global TAPI_REPLY := 1123

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_CONNECTED := 0

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_DROPPED := -1

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_NOREQUESTRECIPIENT := -2

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_REQUESTQUEUEFULL := -3

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_INVALDESTADDRESS := -4

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_INVALWINDOWHANDLE := -5

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_INVALDEVICECLASS := -6

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_INVALDEVICEID := -7

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_DEVICECLASSUNAVAIL := -8

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_DEVICEIDUNAVAIL := -9

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_DEVICEINUSE := -10

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_DESTBUSY := -11

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_DESTNOANSWER := -12

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_DESTUNAVAIL := -13

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_UNKNOWNWINHANDLE := -14

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_UNKNOWNREQUESTID := -15

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_REQUESTFAILED := -16

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_REQUESTCANCELLED := -17

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_INVALPOINTER := -18

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_NOTADMIN := -19

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_MMCWRITELOCKED := -20

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_PROVIDERALREADYINSTALLED := -21

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_SCP_ALREADY_EXISTS := -22

/**
 * @type {Integer (Int32)}
 */
export global TAPIERR_SCP_DOES_NOT_EXIST := -23

/**
 * @type {Integer (Int32)}
 */
export global TAPIMAXDESTADDRESSSIZE := 80

/**
 * @type {Integer (Int32)}
 */
export global TAPIMAXAPPNAMESIZE := 40

/**
 * @type {Integer (Int32)}
 */
export global TAPIMAXCALLEDPARTYSIZE := 40

/**
 * @type {Integer (Int32)}
 */
export global TAPIMAXCOMMENTSIZE := 80

/**
 * @type {Integer (Int32)}
 */
export global TAPIMAXDEVICECLASSSIZE := 40

/**
 * @type {Integer (Int32)}
 */
export global TAPIMAXDEVICEIDSIZE := 40

/**
 * @type {Integer (UInt32)}
 */
export global INTERFACEMASK := 16711680

/**
 * @type {Integer (UInt32)}
 */
export global DISPIDMASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global IDISPTAPI := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IDISPTAPICALLCENTER := 131072

/**
 * @type {Integer (UInt32)}
 */
export global IDISPCALLINFO := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IDISPBASICCALLCONTROL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global IDISPLEGACYCALLMEDIACONTROL := 196608

/**
 * @type {Integer (UInt32)}
 */
export global IDISPAGGREGATEDMSPCALLOBJ := 262144

/**
 * @type {Integer (UInt32)}
 */
export global IDISPADDRESS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IDISPADDRESSCAPABILITIES := 131072

/**
 * @type {Integer (UInt32)}
 */
export global IDISPMEDIASUPPORT := 196608

/**
 * @type {Integer (UInt32)}
 */
export global IDISPADDRESSTRANSLATION := 262144

/**
 * @type {Integer (UInt32)}
 */
export global IDISPLEGACYADDRESSMEDIACONTROL := 327680

/**
 * @type {Integer (UInt32)}
 */
export global IDISPAGGREGATEDMSPADDRESSOBJ := 393216

/**
 * @type {Integer (UInt32)}
 */
export global IDISPPHONE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IDISPAPC := 131072

/**
 * @type {Integer (UInt32)}
 */
export global IDISPMULTITRACK := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IDISPMEDIACONTROL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global IDISPMEDIARECORD := 196608

/**
 * @type {Integer (UInt32)}
 */
export global IDISPMEDIAPLAYBACK := 262144

/**
 * @type {Integer (UInt32)}
 */
export global IDISPFILETRACK := 65536

/**
 * @type {Integer (UInt32)}
 */
export global TAPIMEDIATYPE_AUDIO := 8

/**
 * @type {Integer (UInt32)}
 */
export global TAPIMEDIATYPE_VIDEO := 32768

/**
 * @type {Integer (UInt32)}
 */
export global TAPIMEDIATYPE_DATAMODEM := 16

/**
 * @type {Integer (UInt32)}
 */
export global TAPIMEDIATYPE_G3FAX := 32

/**
 * @type {Integer (UInt32)}
 */
export global TAPIMEDIATYPE_MULTITRACK := 65536

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_MESSAGE_BASE := 500

/**
 * @type {Integer (UInt32)}
 */
export global LINETSPIOPTION_NONREENTRANT := 1

/**
 * @type {Integer (Int32)}
 */
export global TUISPIDLL_OBJECT_LINEID := 1

/**
 * @type {Integer (Int32)}
 */
export global TUISPIDLL_OBJECT_PHONEID := 2

/**
 * @type {Integer (Int32)}
 */
export global TUISPIDLL_OBJECT_PROVIDERID := 3

/**
 * @type {Integer (Int32)}
 */
export global TUISPIDLL_OBJECT_DIALOGINSTANCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRIVATEOBJECT_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRIVATEOBJECT_CALLID := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRIVATEOBJECT_LINE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PRIVATEOBJECT_CALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRIVATEOBJECT_PHONE := 5

/**
 * @type {Integer (UInt32)}
 */
export global PRIVATEOBJECT_ADDRESS := 6

/**
 * @type {Integer (UInt32)}
 */
export global LINEQOSREQUESTTYPE_SERVICELEVEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEQOSSERVICELEVEL_NEEDED := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEQOSSERVICELEVEL_IFAVAILABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEQOSSERVICELEVEL_BESTEFFORT := 3

/**
 * @type {Integer (UInt32)}
 */
export global LINEEQOSINFO_NOQOS := 1

/**
 * @type {Integer (UInt32)}
 */
export global LINEEQOSINFO_ADMISSIONFAILURE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINEEQOSINFO_POLICYFAILURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global LINEEQOSINFO_GENERICERROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PROC_BASE := 500

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEACCEPT := 500

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEADDTOCONFERENCE := 501

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEANSWER := 502

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEBLINDTRANSFER := 503

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINECLOSE := 504

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINECLOSECALL := 505

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINECOMPLETECALL := 506

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINECOMPLETETRANSFER := 507

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINECONDITIONALMEDIADETECTION := 508

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINECONFIGDIALOG := 509

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEDEVSPECIFIC := 510

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEDEVSPECIFICFEATURE := 511

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEDIAL := 512

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEDROP := 513

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEFORWARD := 514

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGATHERDIGITS := 515

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGENERATEDIGITS := 516

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGENERATETONE := 517

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETADDRESSCAPS := 518

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETADDRESSID := 519

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETADDRESSSTATUS := 520

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETCALLADDRESSID := 521

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETCALLINFO := 522

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETCALLSTATUS := 523

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETDEVCAPS := 524

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETDEVCONFIG := 525

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETEXTENSIONID := 526

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETICON := 527

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETID := 528

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETLINEDEVSTATUS := 529

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETNUMADDRESSIDS := 530

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEHOLD := 531

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEMAKECALL := 532

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEMONITORDIGITS := 533

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEMONITORMEDIA := 534

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEMONITORTONES := 535

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINENEGOTIATEEXTVERSION := 536

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINENEGOTIATETSPIVERSION := 537

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEOPEN := 538

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEPARK := 539

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEPICKUP := 540

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEPREPAREADDTOCONFERENCE := 541

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEREDIRECT := 542

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEREMOVEFROMCONFERENCE := 543

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESECURECALL := 544

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESELECTEXTVERSION := 545

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESENDUSERUSERINFO := 546

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETAPPSPECIFIC := 547

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETCALLPARAMS := 548

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETDEFAULTMEDIADETECTION := 549

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETDEVCONFIG := 550

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETMEDIACONTROL := 551

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETMEDIAMODE := 552

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETSTATUSMESSAGES := 553

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETTERMINAL := 554

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETUPCONFERENCE := 555

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETUPTRANSFER := 556

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESWAPHOLD := 557

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEUNCOMPLETECALL := 558

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEUNHOLD := 559

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEUNPARK := 560

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONECLOSE := 561

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONECONFIGDIALOG := 562

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEDEVSPECIFIC := 563

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETBUTTONINFO := 564

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETDATA := 565

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETDEVCAPS := 566

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETDISPLAY := 567

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETEXTENSIONID := 568

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETGAIN := 569

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETHOOKSWITCH := 570

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETICON := 571

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETID := 572

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETLAMP := 573

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETRING := 574

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETSTATUS := 575

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEGETVOLUME := 576

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONENEGOTIATEEXTVERSION := 577

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONENEGOTIATETSPIVERSION := 578

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONEOPEN := 579

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONESELECTEXTVERSION := 580

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONESETBUTTONINFO := 581

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONESETDATA := 582

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONESETDISPLAY := 583

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONESETGAIN := 584

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONESETHOOKSWITCH := 585

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONESETLAMP := 586

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONESETRING := 587

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONESETSTATUSMESSAGES := 588

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PHONESETVOLUME := 589

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PROVIDERCONFIG := 590

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PROVIDERINIT := 591

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PROVIDERINSTALL := 592

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PROVIDERREMOVE := 593

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PROVIDERSHUTDOWN := 594

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PROVIDERENUMDEVICES := 595

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEDROPONCLOSE := 596

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEDROPNOOWNER := 597

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PROVIDERCREATELINEDEVICE := 598

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_PROVIDERCREATEPHONEDEVICE := 599

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETCURRENTLOCATION := 600

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINECONFIGDIALOGEDIT := 601

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINERELEASEUSERUSERINFO := 602

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETCALLID := 603

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEGETCALLHUBTRACKING := 604

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINESETCALLHUBTRACKING := 605

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINERECEIVEMSPDATA := 606

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINEMSPIDENTIFY := 607

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINECREATEMSPINSTANCE := 608

/**
 * @type {Integer (UInt32)}
 */
export global TSPI_LINECLOSEMSPINSTANCE := 609

/**
 * @type {Integer (UInt32)}
 */
export global IDISPDIROBJECT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IDISPDIROBJCONFERENCE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global IDISPDIROBJUSER := 196608

/**
 * @type {Integer (UInt32)}
 */
export global IDISPDIRECTORY := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IDISPILSCONFIG := 131072

/**
 * @type {Integer (UInt32)}
 */
export global RENDBIND_AUTHENTICATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RENDBIND_DEFAULTDOMAINNAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global RENDBIND_DEFAULTUSERNAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global RENDBIND_DEFAULTPASSWORD := 8

/**
 * @type {Integer (UInt32)}
 */
export global RENDBIND_DEFAULTCREDENTIALS := 14

/**
 * @type {Integer (UInt32)}
 */
export global STRM_INITIAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global STRM_TERMINALSELECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global STRM_CONFIGURED := 2

/**
 * @type {Integer (UInt32)}
 */
export global STRM_RUNNING := 4

/**
 * @type {Integer (UInt32)}
 */
export global STRM_PAUSED := 8

/**
 * @type {Integer (UInt32)}
 */
export global STRM_STOPPED := 16

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOTENOUGHMEMORY := -2147221503

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOITEMS := -2147221502

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOTSUPPORTED := -2147221501

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALIDMEDIATYPE := -2147221500

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_OPERATIONFAILED := -2147221499

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_ALLOCATED := -2147221498

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_CALLUNAVAIL := -2147221497

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_COMPLETIONOVERRUN := -2147221496

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_CONFERENCEFULL := -2147221495

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_DIALMODIFIERNOTSUPPORTED := -2147221494

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INUSE := -2147221493

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALADDRESS := -2147221492

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALADDRESSSTATE := -2147221491

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALCALLPARAMS := -2147221490

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALCALLPRIVILEGE := -2147221489

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALCALLSTATE := -2147221488

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALCARD := -2147221487

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALCOMPLETIONID := -2147221486

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALCOUNTRYCODE := -2147221485

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALDEVICECLASS := -2147221484

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALDIALPARAMS := -2147221483

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALDIGITS := -2147221482

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALGROUPID := -2147221481

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALLOCATION := -2147221480

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALMESSAGEID := -2147221479

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALPARKID := -2147221478

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALRATE := -2147221477

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALTIMEOUT := -2147221476

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALTONE := -2147221475

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALLIST := -2147221474

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALMODE := -2147221473

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOCONFERENCE := -2147221472

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NODEVICE := -2147221471

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOREQUEST := -2147221470

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOTOWNER := -2147221469

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOTREGISTERED := -2147221468

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_REQUESTOVERRUN := -2147221467

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_TARGETNOTFOUND := -2147221466

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_TARGETSELF := -2147221465

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_USERUSERINFOTOOBIG := -2147221464

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_REINIT := -2147221463

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_ADDRESSBLOCKED := -2147221462

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_BILLINGREJECTED := -2147221461

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALFEATURE := -2147221460

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALBUTTONLAMPID := -2147221459

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALBUTTONSTATE := -2147221458

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALDATAID := -2147221457

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALHOOKSWITCHDEV := -2147221456

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_DROPPED := -2147221455

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOREQUESTRECIPIENT := -2147221454

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_REQUESTQUEUEFULL := -2147221453

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_DESTBUSY := -2147221452

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_DESTNOANSWER := -2147221451

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_DESTUNAVAIL := -2147221450

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_REQUESTFAILED := -2147221449

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_REQUESTCANCELLED := -2147221448

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALPRIVILEGE := -2147221447

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALIDDIRECTION := -2147221446

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALIDTERMINAL := -2147221445

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALIDTERMINALCLASS := -2147221444

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NODRIVER := -2147221443

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_MAXSTREAMS := -2147221442

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOTERMINALSELECTED := -2147221441

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_TERMINALINUSE := -2147221440

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOTSTOPPED := -2147221439

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_MAXTERMINALS := -2147221438

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALIDSTREAM := -2147221437

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_TIMEOUT := -2147221436

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_CALLCENTER_GROUP_REMOVED := -2147221435

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_CALLCENTER_QUEUE_REMOVED := -2147221434

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_CALLCENTER_NO_AGENT_ID := -2147221433

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_CALLCENTER_INVALAGENTID := -2147221432

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_CALLCENTER_INVALAGENTGROUP := -2147221431

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_CALLCENTER_INVALPASSWORD := -2147221430

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_CALLCENTER_INVALAGENTSTATE := -2147221429

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_CALLCENTER_INVALAGENTACTIVITY := -2147221428

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_REGISTRY_SETTING_CORRUPT := -2147221427

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_TERMINAL_PEER := -2147221426

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_PEER_NOT_SET := -2147221425

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOEVENT := -2147221424

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALADDRESSTYPE := -2147221423

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_RESOURCEUNAVAIL := -2147221422

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_PHONENOTOPEN := -2147221421

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_CALLNOTSELECTED := -2147221420

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_WRONGEVENT := -2147221419

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOFORMAT := -2147221418

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_INVALIDSTREAMSTATE := -2147221417

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_WRONG_STATE := -2147221416

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_NOT_INITIALIZED := -2147221415

/**
 * @type {Integer (Int32)}
 */
export global TAPI_E_SERVICE_NOT_RUNNING := -2147221414

/**
 * @type {String}
 */
export global OPENTNEFSTREAM := "OpenTnefStream"

/**
 * @type {String}
 */
export global OPENTNEFSTREAMEX := "OpenTnefStreamEx"

/**
 * @type {String}
 */
export global GETTNEFSTREAMCODEPAGE := "GetTnefStreamCodePage"

/**
 * @type {Integer (UInt32)}
 */
export global cbDisplayName := 41

/**
 * @type {Integer (UInt32)}
 */
export global cbEmailName := 11

/**
 * @type {Integer (UInt32)}
 */
export global cbSeverName := 12

/**
 * @type {Integer (UInt32)}
 */
export global cbTYPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global cbMaxIdData := 200

/**
 * @type {Integer (UInt32)}
 */
export global prioLow := 3

/**
 * @type {Integer (UInt32)}
 */
export global prioNorm := 2

/**
 * @type {Integer (UInt32)}
 */
export global prioHigh := 1

/**
 * @type {Integer (Int32)}
 */
export global atypNull := 0

/**
 * @type {Integer (Int32)}
 */
export global atypFile := 1

/**
 * @type {Integer (Int32)}
 */
export global atypOle := 2

/**
 * @type {Integer (Int32)}
 */
export global atypPicture := 3

/**
 * @type {Integer (Int32)}
 */
export global atypMax := 4
;@endregion Constants
