#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class Tapi {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static TAPI_CURRENT_VERSION => 131074

    /**
     * @type {Integer (Int32)}
     */
    static LINE_ADDRESSSTATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static LINE_CALLINFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static LINE_CALLSTATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static LINE_CLOSE => 3

    /**
     * @type {Integer (Int32)}
     */
    static LINE_DEVSPECIFIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static LINE_DEVSPECIFICFEATURE => 5

    /**
     * @type {Integer (Int32)}
     */
    static LINE_GATHERDIGITS => 6

    /**
     * @type {Integer (Int32)}
     */
    static LINE_GENERATE => 7

    /**
     * @type {Integer (Int32)}
     */
    static LINE_LINEDEVSTATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static LINE_MONITORDIGITS => 9

    /**
     * @type {Integer (Int32)}
     */
    static LINE_MONITORMEDIA => 10

    /**
     * @type {Integer (Int32)}
     */
    static LINE_MONITORTONE => 11

    /**
     * @type {Integer (Int32)}
     */
    static LINE_REPLY => 12

    /**
     * @type {Integer (Int32)}
     */
    static LINE_REQUEST => 13

    /**
     * @type {Integer (Int32)}
     */
    static PHONE_BUTTON => 14

    /**
     * @type {Integer (Int32)}
     */
    static PHONE_CLOSE => 15

    /**
     * @type {Integer (Int32)}
     */
    static PHONE_DEVSPECIFIC => 16

    /**
     * @type {Integer (Int32)}
     */
    static PHONE_REPLY => 17

    /**
     * @type {Integer (Int32)}
     */
    static PHONE_STATE => 18

    /**
     * @type {Integer (Int32)}
     */
    static LINE_CREATE => 19

    /**
     * @type {Integer (Int32)}
     */
    static PHONE_CREATE => 20

    /**
     * @type {Integer (Int32)}
     */
    static LINE_AGENTSPECIFIC => 21

    /**
     * @type {Integer (Int32)}
     */
    static LINE_AGENTSTATUS => 22

    /**
     * @type {Integer (Int32)}
     */
    static LINE_APPNEWCALL => 23

    /**
     * @type {Integer (Int32)}
     */
    static LINE_PROXYREQUEST => 24

    /**
     * @type {Integer (Int32)}
     */
    static LINE_REMOVE => 25

    /**
     * @type {Integer (Int32)}
     */
    static PHONE_REMOVE => 26

    /**
     * @type {Integer (Int32)}
     */
    static LINE_AGENTSESSIONSTATUS => 27

    /**
     * @type {Integer (Int32)}
     */
    static LINE_QUEUESTATUS => 28

    /**
     * @type {Integer (Int32)}
     */
    static LINE_AGENTSTATUSEX => 29

    /**
     * @type {Integer (Int32)}
     */
    static LINE_GROUPSTATUS => 30

    /**
     * @type {Integer (Int32)}
     */
    static LINE_PROXYSTATUS => 31

    /**
     * @type {Integer (Int32)}
     */
    static LINE_APPNEWCALLHUB => 32

    /**
     * @type {Integer (Int32)}
     */
    static LINE_CALLHUBCLOSE => 33

    /**
     * @type {Integer (Int32)}
     */
    static LINE_DEVSPECIFICEX => 34

    /**
     * @type {Integer (UInt32)}
     */
    static INITIALIZE_NEGOTIATION => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_FWDNUMRINGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_PICKUPGROUPID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_SECURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_BLOCKIDDEFAULT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_BLOCKIDOVERRIDE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_DIALED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_ORIGOFFHOOK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_DESTOFFHOOK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_FWDCONSULT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_SETUPCONFNULL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_AUTORECONNECT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_COMPLETIONID => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_TRANSFERHELD => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_TRANSFERMAKE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_CONFERENCEHELD => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_CONFERENCEMAKE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_PARTIALDIAL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_FWDSTATUSVALID => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_FWDINTEXTADDR => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_FWDBUSYNAADDR => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_ACCEPTTOALERT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_CONFDROP => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_PICKUPCALLWAIT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_PREDICTIVEDIALER => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_QUEUE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_ROUTEPOINT => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_HOLDMAKESNEW => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_NOINTERNALCALLS => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_NOEXTERNALCALLS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_SETCALLINGID => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_ACDGROUP => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRCAPFLAGS_NOPSTNADDRESSTRANSLATION => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSMODE_ADDRESSID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSMODE_DIALABLEADDR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSHARING_PRIVATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSHARING_BRIDGEDEXCL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSHARING_BRIDGEDNEW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSHARING_BRIDGEDSHARED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSHARING_MONITORED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSTATE_OTHER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSTATE_DEVSPECIFIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSTATE_INUSEZERO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSTATE_INUSEONE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSTATE_INUSEMANY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSTATE_NUMCALLS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSTATE_FORWARD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSTATE_TERMINALS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSSTATE_CAPSCHANGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSTYPE_PHONENUMBER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSTYPE_SDP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSTYPE_EMAILNAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSTYPE_DOMAINNAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRESSTYPE_IPADDRESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_FORWARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_MAKECALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_PICKUP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_SETMEDIACONTROL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_SETTERMINAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_SETUPCONF => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_UNCOMPLETECALL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_UNPARK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_PICKUPHELD => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_PICKUPGROUP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_PICKUPDIRECT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_PICKUPWAITING => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_FORWARDFWD => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LINEADDRFEATURE_FORWARDDND => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTFEATURE_SETAGENTGROUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTFEATURE_SETAGENTSTATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTFEATURE_SETAGENTACTIVITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTFEATURE_AGENTSPECIFIC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTFEATURE_GETAGENTACTIVITYLIST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTFEATURE_GETAGENTGROUP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATE_LOGGEDOFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATE_NOTREADY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATE_READY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATE_BUSYACD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATE_BUSYINCOMING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATE_BUSYOUTBOUND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATE_BUSYOTHER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATE_WORKINGAFTERCALL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATE_UNKNOWN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATE_UNAVAIL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUS_GROUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUS_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUS_NEXTSTATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUS_ACTIVITY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUS_ACTIVITYLIST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUS_GROUPLIST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUS_CAPSCHANGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUS_VALIDSTATES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUS_VALIDNEXTSTATES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATEEX_NOTREADY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATEEX_READY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATEEX_BUSYACD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATEEX_BUSYINCOMING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATEEX_BUSYOUTGOING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATEEX_UNKNOWN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATEEX_RELEASED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUSEX_NEWAGENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUSEX_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSTATUSEX_UPDATEINFO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSESSIONSTATE_NOTREADY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSESSIONSTATE_READY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSESSIONSTATE_BUSYONCALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSESSIONSTATE_BUSYWRAPUP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSESSIONSTATE_ENDED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSESSIONSTATE_RELEASED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSESSIONSTATUS_NEWSESSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSESSIONSTATUS_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEAGENTSESSIONSTATUS_UPDATEINFO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEQUEUESTATUS_UPDATEINFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEQUEUESTATUS_NEWQUEUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEQUEUESTATUS_QUEUEREMOVED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEGROUPSTATUS_NEWGROUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEGROUPSTATUS_GROUPREMOVED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYSTATUS_OPEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYSTATUS_CLOSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYSTATUS_ALLOPENFORACD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEANSWERMODE_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEANSWERMODE_DROP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEANSWERMODE_HOLD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBEARERMODE_VOICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBEARERMODE_SPEECH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBEARERMODE_MULTIUSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBEARERMODE_DATA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBEARERMODE_ALTSPEECHDATA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBEARERMODE_NONCALLSIGNALING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBEARERMODE_PASSTHROUGH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBEARERMODE_RESTRICTEDDATA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBUSYMODE_STATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBUSYMODE_TRUNK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBUSYMODE_UNKNOWN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEBUSYMODE_UNAVAIL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLCOMPLCOND_BUSY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLCOMPLCOND_NOANSWER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLCOMPLMODE_CAMPON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLCOMPLMODE_CALLBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLCOMPLMODE_INTRUDE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLCOMPLMODE_MESSAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_ACCEPT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_ADDTOCONF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_ANSWER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_BLINDTRANSFER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_COMPLETECALL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_COMPLETETRANSF => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_DIAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_DROP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_GATHERDIGITS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_GENERATEDIGITS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_GENERATETONE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_HOLD => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_MONITORDIGITS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_MONITORMEDIA => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_MONITORTONES => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_PARK => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_PREPAREADDCONF => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_REDIRECT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_REMOVEFROMCONF => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_SECURECALL => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_SENDUSERUSER => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_SETCALLPARAMS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_SETMEDIACONTROL => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_SETTERMINAL => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_SETUPCONF => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_SETUPTRANSFER => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_SWAPHOLD => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_UNHOLD => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_RELEASEUSERUSERINFO => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_SETTREATMENT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_SETQOS => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE_SETCALLDATA => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE2_NOHOLDCONFERENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE2_ONESTEPTRANSFER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE2_COMPLCAMPON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE2_COMPLCALLBACK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE2_COMPLINTRUDE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE2_COMPLMESSAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE2_TRANSFERNORM => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE2_TRANSFERCONF => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE2_PARKDIRECT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLFEATURE2_PARKNONDIRECT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLHUBTRACKING_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLHUBTRACKING_PROVIDERLEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLHUBTRACKING_ALLCALLS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_OTHER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_DEVSPECIFIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_BEARERMODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_RATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_MEDIAMODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_APPSPECIFIC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_CALLID => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_RELATEDCALLID => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_ORIGIN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_REASON => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_COMPLETIONID => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_NUMOWNERINCR => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_NUMOWNERDECR => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_NUMMONITORS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_TRUNK => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_CALLERID => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_CALLEDID => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_CONNECTEDID => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_REDIRECTIONID => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_REDIRECTINGID => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_DISPLAY => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_USERUSERINFO => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_HIGHLEVELCOMP => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_LOWLEVELCOMP => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_CHARGINGINFO => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_TERMINAL => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_DIALPARAMS => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_MONITORMODES => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_TREATMENT => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_QOS => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLINFOSTATE_CALLDATA => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLORIGIN_OUTBOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLORIGIN_INTERNAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLORIGIN_EXTERNAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLORIGIN_UNKNOWN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLORIGIN_UNAVAIL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLORIGIN_CONFERENCE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLORIGIN_INBOUND => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARAMFLAGS_SECURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARAMFLAGS_IDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARAMFLAGS_BLOCKID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARAMFLAGS_ORIGOFFHOOK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARAMFLAGS_DESTOFFHOOK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARAMFLAGS_NOHOLDCONFERENCE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARAMFLAGS_PREDICTIVEDIAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARAMFLAGS_ONESTEPTRANSFER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARTYID_BLOCKED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARTYID_OUTOFAREA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARTYID_NAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARTYID_ADDRESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARTYID_PARTIAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARTYID_UNKNOWN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPARTYID_UNAVAIL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPRIVILEGE_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPRIVILEGE_MONITOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLPRIVILEGE_OWNER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_DIRECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_FWDBUSY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_FWDNOANSWER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_FWDUNCOND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_PICKUP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_UNPARK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_REDIRECT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_CALLCOMPLETION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_TRANSFER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_REMINDER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_UNKNOWN => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_UNAVAIL => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_INTRUDE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_PARKED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_CAMPEDON => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLREASON_ROUTEREQUEST => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSELECT_LINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSELECT_ADDRESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSELECT_CALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSELECT_DEVICEID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSELECT_CALLID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_IDLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_OFFERING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_ACCEPTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_DIALTONE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_DIALING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_RINGBACK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_BUSY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_SPECIALINFO => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_CONNECTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_PROCEEDING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_ONHOLD => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_CONFERENCED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_ONHOLDPENDCONF => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_ONHOLDPENDTRANSFER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_DISCONNECTED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLSTATE_UNKNOWN => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLTREATMENT_SILENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLTREATMENT_RINGBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLTREATMENT_BUSY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LINECALLTREATMENT_MUSIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECARDOPTION_PREDEFINED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECARDOPTION_HIDDEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECONNECTEDMODE_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINECONNECTEDMODE_INACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINECONNECTEDMODE_ACTIVEHELD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINECONNECTEDMODE_INACTIVEHELD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINECONNECTEDMODE_CONFIRMED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_CROSSADDRCONF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_HIGHLEVCOMP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_LOWLEVCOMP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_MEDIACONTROL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_MULTIPLEADDR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_CLOSEDROP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_DIALBILLING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_DIALQUIET => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_DIALDIALTONE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_MSP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_CALLHUB => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_CALLHUBTRACKING => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_PRIVATEOBJECTS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVCAPFLAGS_LOCAL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_OTHER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_RINGING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_CONNECTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_DISCONNECTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_MSGWAITON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_MSGWAITOFF => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_INSERVICE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_OUTOFSERVICE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_MAINTENANCE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_OPEN => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_CLOSE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_NUMCALLS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_NUMCOMPLETIONS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_TERMINALS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_ROAMMODE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_BATTERY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_SIGNAL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_DEVSPECIFIC => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_REINIT => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_LOCK => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_CAPSCHANGE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_CONFIGCHANGE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_TRANSLATECHANGE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_COMPLCANCEL => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATE_REMOVED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATUSFLAGS_CONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATUSFLAGS_MSGWAIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATUSFLAGS_INSERVICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDEVSTATUSFLAGS_LOCKED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDIALTONEMODE_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDIALTONEMODE_SPECIAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDIALTONEMODE_INTERNAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDIALTONEMODE_EXTERNAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDIALTONEMODE_UNKNOWN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDIALTONEMODE_UNAVAIL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDIGITMODE_PULSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDIGITMODE_DTMF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDIGITMODE_DTMFEND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_UNKNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_REJECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_PICKUP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_FORWARDED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_BUSY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_NOANSWER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_BADADDRESS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_UNREACHABLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_CONGESTION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_INCOMPATIBLE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_UNAVAIL => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_NODIALTONE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_NUMBERCHANGED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_OUTOFORDER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_TEMPFAILURE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_QOSUNAVAIL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_BLOCKED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_DONOTDISTURB => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_CANCELLED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_DESTINATIONBARRED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static LINEDISCONNECTMODE_FDNRESTRICT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_ALLOCATED => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_BADDEVICEID => 2147483650

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_BEARERMODEUNAVAIL => 2147483651

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_CALLUNAVAIL => 2147483653

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_COMPLETIONOVERRUN => 2147483654

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_CONFERENCEFULL => 2147483655

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_DIALBILLING => 2147483656

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_DIALDIALTONE => 2147483657

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_DIALPROMPT => 2147483658

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_DIALQUIET => 2147483659

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INCOMPATIBLEAPIVERSION => 2147483660

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INCOMPATIBLEEXTVERSION => 2147483661

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INIFILECORRUPT => 2147483662

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INUSE => 2147483663

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALADDRESS => 2147483664

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALADDRESSID => 2147483665

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALADDRESSMODE => 2147483666

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALADDRESSSTATE => 2147483667

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALAPPHANDLE => 2147483668

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALAPPNAME => 2147483669

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALBEARERMODE => 2147483670

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCALLCOMPLMODE => 2147483671

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCALLHANDLE => 2147483672

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCALLPARAMS => 2147483673

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCALLPRIVILEGE => 2147483674

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCALLSELECT => 2147483675

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCALLSTATE => 2147483676

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCALLSTATELIST => 2147483677

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCARD => 2147483678

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCOMPLETIONID => 2147483679

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCONFCALLHANDLE => 2147483680

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCONSULTCALLHANDLE => 2147483681

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALCOUNTRYCODE => 2147483682

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALDEVICECLASS => 2147483683

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALDEVICEHANDLE => 2147483684

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALDIALPARAMS => 2147483685

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALDIGITLIST => 2147483686

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALDIGITMODE => 2147483687

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALDIGITS => 2147483688

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALEXTVERSION => 2147483689

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALGROUPID => 2147483690

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALLINEHANDLE => 2147483691

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALLINESTATE => 2147483692

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALLOCATION => 2147483693

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALMEDIALIST => 2147483694

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALMEDIAMODE => 2147483695

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALMESSAGEID => 2147483696

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALPARAM => 2147483698

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALPARKID => 2147483699

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALPARKMODE => 2147483700

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALPOINTER => 2147483701

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALPRIVSELECT => 2147483702

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALRATE => 2147483703

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALREQUESTMODE => 2147483704

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALTERMINALID => 2147483705

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALTERMINALMODE => 2147483706

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALTIMEOUT => 2147483707

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALTONE => 2147483708

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALTONELIST => 2147483709

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALTONEMODE => 2147483710

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALTRANSFERMODE => 2147483711

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_LINEMAPPERFAILED => 2147483712

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_NOCONFERENCE => 2147483713

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_NODEVICE => 2147483714

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_NODRIVER => 2147483715

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_NOMEM => 2147483716

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_NOREQUEST => 2147483717

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_NOTOWNER => 2147483718

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_NOTREGISTERED => 2147483719

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_OPERATIONFAILED => 2147483720

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_OPERATIONUNAVAIL => 2147483721

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_RATEUNAVAIL => 2147483722

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_RESOURCEUNAVAIL => 2147483723

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_REQUESTOVERRUN => 2147483724

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_STRUCTURETOOSMALL => 2147483725

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_TARGETNOTFOUND => 2147483726

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_TARGETSELF => 2147483727

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_UNINITIALIZED => 2147483728

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_USERUSERINFOTOOBIG => 2147483729

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_REINIT => 2147483730

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_ADDRESSBLOCKED => 2147483731

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_BILLINGREJECTED => 2147483732

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALFEATURE => 2147483733

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_NOMULTIPLEINSTANCE => 2147483734

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALAGENTID => 2147483735

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALAGENTGROUP => 2147483736

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALPASSWORD => 2147483737

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALAGENTSTATE => 2147483738

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALAGENTACTIVITY => 2147483739

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_DIALVOICEDETECT => 2147483740

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_USERCANCELLED => 2147483741

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALADDRESSTYPE => 2147483742

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_INVALAGENTSESSIONSTATE => 2147483743

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_DISCONNECTED => 2147483744

    /**
     * @type {Integer (UInt32)}
     */
    static LINEERR_SERVICE_NOT_RUNNING => 2147483745

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFEATURE_DEVSPECIFIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFEATURE_DEVSPECIFICFEAT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFEATURE_FORWARD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFEATURE_MAKECALL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFEATURE_SETMEDIACONTROL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFEATURE_SETTERMINAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFEATURE_SETDEVSTATUS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFEATURE_FORWARDFWD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFEATURE_FORWARDDND => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_UNCOND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_UNCONDINTERNAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_UNCONDEXTERNAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_UNCONDSPECIFIC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_BUSY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_BUSYINTERNAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_BUSYEXTERNAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_BUSYSPECIFIC => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_NOANSW => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_NOANSWINTERNAL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_NOANSWEXTERNAL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_NOANSWSPECIFIC => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_BUSYNA => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_BUSYNAINTERNAL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_BUSYNAEXTERNAL => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_BUSYNASPECIFIC => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_UNKNOWN => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static LINEFORWARDMODE_UNAVAIL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static LINEGATHERTERM_BUFFERFULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEGATHERTERM_TERMDIGIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEGATHERTERM_FIRSTTIMEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEGATHERTERM_INTERTIMEOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEGATHERTERM_CANCEL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEGENERATETERM_DONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEGENERATETERM_CANCEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEINITIALIZEEXOPTION_USEHIDDENWINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEINITIALIZEEXOPTION_USEEVENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEINITIALIZEEXOPTION_USECOMPLETIONPORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LINEINITIALIZEEXOPTION_CALLHUBTRACKING => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static LINELOCATIONOPTION_PULSEDIAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMAPPER => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIACONTROL_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIACONTROL_START => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIACONTROL_RESET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIACONTROL_PAUSE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIACONTROL_RESUME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIACONTROL_RATEUP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIACONTROL_RATEDOWN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIACONTROL_RATENORMAL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIACONTROL_VOLUMEUP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIACONTROL_VOLUMEDOWN => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIACONTROL_VOLUMENORMAL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_UNKNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_INTERACTIVEVOICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_AUTOMATEDVOICE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_DATAMODEM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_G3FAX => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_TDD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_G4FAX => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_DIGITALDATA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_TELETEX => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_VIDEOTEX => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_TELEX => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_MIXED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_ADSI => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_VOICEVIEW => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LINEMEDIAMODE_VIDEO => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LAST_LINEMEDIAMODE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LINEOFFERINGMODE_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEOFFERINGMODE_INACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEOPENOPTION_SINGLEADDRESS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static LINEOPENOPTION_PROXY => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPARKMODE_DIRECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPARKMODE_NONDIRECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_SETAGENTGROUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_SETAGENTSTATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_SETAGENTACTIVITY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_GETAGENTCAPS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_GETAGENTSTATUS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_AGENTSPECIFIC => 6

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_GETAGENTACTIVITYLIST => 7

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_GETAGENTGROUPLIST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_CREATEAGENT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_SETAGENTMEASUREMENTPERIOD => 10

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_GETAGENTINFO => 11

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_CREATEAGENTSESSION => 12

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_GETAGENTSESSIONLIST => 13

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_SETAGENTSESSIONSTATE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_GETAGENTSESSIONINFO => 15

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_GETQUEUELIST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_SETQUEUEMEASUREMENTPERIOD => 17

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_GETQUEUEINFO => 18

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_GETGROUPLIST => 19

    /**
     * @type {Integer (UInt32)}
     */
    static LINEPROXYREQUEST_SETAGENTSTATEEX => 20

    /**
     * @type {Integer (UInt32)}
     */
    static LINEREMOVEFROMCONF_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEREMOVEFROMCONF_LAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEREMOVEFROMCONF_ANY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LINEREQUESTMODE_MAKECALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEREQUESTMODE_MEDIACALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEREQUESTMODE_DROP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LAST_LINEREQUESTMODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEROAMMODE_UNKNOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEROAMMODE_UNAVAIL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEROAMMODE_HOME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINEROAMMODE_ROAMA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINEROAMMODE_ROAMB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINESPECIALINFO_NOCIRCUIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINESPECIALINFO_CUSTIRREG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINESPECIALINFO_REORDER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINESPECIALINFO_UNKNOWN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINESPECIALINFO_UNAVAIL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMDEV_PHONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMDEV_HEADSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMDEV_SPEAKER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMMODE_BUTTONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMMODE_LAMPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMMODE_DISPLAY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMMODE_RINGER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMMODE_HOOKSWITCH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMMODE_MEDIATOLINE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMMODE_MEDIAFROMLINE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMMODE_MEDIABIDIRECT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMSHARING_PRIVATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMSHARING_SHAREDEXCL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINETERMSHARING_SHAREDCONF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINETOLLLISTOPTION_ADD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINETOLLLISTOPTION_REMOVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINETONEMODE_CUSTOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINETONEMODE_RINGBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINETONEMODE_BUSY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINETONEMODE_BEEP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINETONEMODE_BILLING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSFERMODE_TRANSFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSFERMODE_CONFERENCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATEOPTION_CARDOVERRIDE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATEOPTION_CANCELCALLWAITING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATEOPTION_FORCELOCAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATEOPTION_FORCELD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_CANONICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_INTERNATIONAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_LONGDISTANCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_LOCAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_INTOLLLIST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_NOTINTOLLLIST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_DIALBILLING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_DIALQUIET => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_DIALDIALTONE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_DIALPROMPT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_VOICEDETECT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LINETRANSLATERESULT_NOTRANSLATION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_CONFERENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_TRANSFER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_DROP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_HOLD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_RECALL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_DISCONNECT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_CONNECT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_MSGWAITON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_MSGWAITOFF => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_SELECTRING => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_ABBREVDIAL => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_FORWARD => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_PICKUP => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_RINGAGAIN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_PARK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_REJECT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_REDIRECT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_MUTE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_VOLUMEUP => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_VOLUMEDOWN => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_SPEAKERON => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_SPEAKEROFF => 22

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_FLASH => 23

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_DATAON => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_DATAOFF => 25

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_DONOTDISTURB => 26

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_INTERCOM => 27

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_BRIDGEDAPP => 28

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_BUSY => 29

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_CALLAPP => 30

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_DATETIME => 31

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_DIRECTORY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_COVER => 33

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_CALLID => 34

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_LASTNUM => 35

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_NIGHTSRV => 36

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_SENDCALLS => 37

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_MSGINDICATOR => 38

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_REPDIAL => 39

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_SETREPDIAL => 40

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_SYSTEMSPEED => 41

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_STATIONSPEED => 42

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_CAMPON => 43

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_SAVEREPEAT => 44

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_QUEUECALL => 45

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_NONE => 46

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONFUNCTION_SEND => 47

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONMODE_DUMMY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONMODE_CALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONMODE_FEATURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONMODE_KEYPAD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONMODE_LOCAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONMODE_DISPLAY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONSTATE_UP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONSTATE_DOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONSTATE_UNKNOWN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEBUTTONSTATE_UNAVAIL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_ALLOCATED => 2415919105

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_BADDEVICEID => 2415919106

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INCOMPATIBLEAPIVERSION => 2415919107

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INCOMPATIBLEEXTVERSION => 2415919108

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INIFILECORRUPT => 2415919109

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INUSE => 2415919110

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALAPPHANDLE => 2415919111

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALAPPNAME => 2415919112

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALBUTTONLAMPID => 2415919113

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALBUTTONMODE => 2415919114

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALBUTTONSTATE => 2415919115

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALDATAID => 2415919116

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALDEVICECLASS => 2415919117

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALEXTVERSION => 2415919118

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALHOOKSWITCHDEV => 2415919119

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALHOOKSWITCHMODE => 2415919120

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALLAMPMODE => 2415919121

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALPARAM => 2415919122

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALPHONEHANDLE => 2415919123

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALPHONESTATE => 2415919124

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALPOINTER => 2415919125

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALPRIVILEGE => 2415919126

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_INVALRINGMODE => 2415919127

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_NODEVICE => 2415919128

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_NODRIVER => 2415919129

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_NOMEM => 2415919130

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_NOTOWNER => 2415919131

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_OPERATIONFAILED => 2415919132

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_OPERATIONUNAVAIL => 2415919133

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_RESOURCEUNAVAIL => 2415919135

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_REQUESTOVERRUN => 2415919136

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_STRUCTURETOOSMALL => 2415919137

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_UNINITIALIZED => 2415919138

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_REINIT => 2415919139

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_DISCONNECTED => 2415919140

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEERR_SERVICE_NOT_RUNNING => 2415919141

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETBUTTONINFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETDATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETDISPLAY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETGAINHANDSET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETGAINSPEAKER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETGAINHEADSET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETHOOKSWITCHHANDSET => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETHOOKSWITCHSPEAKER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETHOOKSWITCHHEADSET => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETLAMP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETRING => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETVOLUMEHANDSET => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETVOLUMESPEAKER => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GETVOLUMEHEADSET => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETBUTTONINFO => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETDATA => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETDISPLAY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETGAINHANDSET => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETGAINSPEAKER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETGAINHEADSET => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETHOOKSWITCHHANDSET => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETHOOKSWITCHSPEAKER => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETHOOKSWITCHHEADSET => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETLAMP => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETRING => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETVOLUMEHANDSET => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETVOLUMESPEAKER => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_SETVOLUMEHEADSET => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEFEATURE_GENERICPHONE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEHOOKSWITCHDEV_HANDSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEHOOKSWITCHDEV_SPEAKER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEHOOKSWITCHDEV_HEADSET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEHOOKSWITCHMODE_ONHOOK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEHOOKSWITCHMODE_MIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEHOOKSWITCHMODE_SPEAKER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEHOOKSWITCHMODE_MICSPEAKER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEHOOKSWITCHMODE_UNKNOWN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEINITIALIZEEXOPTION_USEHIDDENWINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEINITIALIZEEXOPTION_USEEVENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEINITIALIZEEXOPTION_USECOMPLETIONPORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PHONELAMPMODE_DUMMY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHONELAMPMODE_OFF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHONELAMPMODE_STEADY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHONELAMPMODE_WINK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PHONELAMPMODE_FLASH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PHONELAMPMODE_FLUTTER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PHONELAMPMODE_BROKENFLUTTER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PHONELAMPMODE_UNKNOWN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEPRIVILEGE_MONITOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHONEPRIVILEGE_OWNER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_OTHER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_CONNECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_DISCONNECTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_OWNER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_MONITORS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_DISPLAY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_LAMP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_RINGMODE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_RINGVOLUME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_HANDSETHOOKSWITCH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_HANDSETVOLUME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_HANDSETGAIN => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_SPEAKERHOOKSWITCH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_SPEAKERVOLUME => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_SPEAKERGAIN => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_HEADSETHOOKSWITCH => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_HEADSETVOLUME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_HEADSETGAIN => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_SUSPEND => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_RESUME => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_DEVSPECIFIC => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_REINIT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_CAPSCHANGE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATE_REMOVED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATUSFLAGS_CONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHONESTATUSFLAGS_SUSPENDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STRINGFORMAT_ASCII => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STRINGFORMAT_DBCS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STRINGFORMAT_UNICODE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STRINGFORMAT_BINARY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TAPI_REPLY => 1123

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_CONNECTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_DROPPED => -1

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_NOREQUESTRECIPIENT => -2

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_REQUESTQUEUEFULL => -3

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_INVALDESTADDRESS => -4

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_INVALWINDOWHANDLE => -5

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_INVALDEVICECLASS => -6

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_INVALDEVICEID => -7

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_DEVICECLASSUNAVAIL => -8

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_DEVICEIDUNAVAIL => -9

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_DEVICEINUSE => -10

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_DESTBUSY => -11

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_DESTNOANSWER => -12

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_DESTUNAVAIL => -13

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_UNKNOWNWINHANDLE => -14

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_UNKNOWNREQUESTID => -15

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_REQUESTFAILED => -16

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_REQUESTCANCELLED => -17

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_INVALPOINTER => -18

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_NOTADMIN => -19

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_MMCWRITELOCKED => -20

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_PROVIDERALREADYINSTALLED => -21

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_SCP_ALREADY_EXISTS => -22

    /**
     * @type {Integer (Int32)}
     */
    static TAPIERR_SCP_DOES_NOT_EXIST => -23

    /**
     * @type {Integer (Int32)}
     */
    static TAPIMAXDESTADDRESSSIZE => 80

    /**
     * @type {Integer (Int32)}
     */
    static TAPIMAXAPPNAMESIZE => 40

    /**
     * @type {Integer (Int32)}
     */
    static TAPIMAXCALLEDPARTYSIZE => 40

    /**
     * @type {Integer (Int32)}
     */
    static TAPIMAXCOMMENTSIZE => 80

    /**
     * @type {Integer (Int32)}
     */
    static TAPIMAXDEVICECLASSSIZE => 40

    /**
     * @type {Integer (Int32)}
     */
    static TAPIMAXDEVICEIDSIZE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static INTERFACEMASK => 16711680

    /**
     * @type {Integer (UInt32)}
     */
    static DISPIDMASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPTAPI => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPTAPICALLCENTER => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPCALLINFO => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPBASICCALLCONTROL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPLEGACYCALLMEDIACONTROL => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPAGGREGATEDMSPCALLOBJ => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPADDRESS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPADDRESSCAPABILITIES => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPMEDIASUPPORT => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPADDRESSTRANSLATION => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPLEGACYADDRESSMEDIACONTROL => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPAGGREGATEDMSPADDRESSOBJ => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPPHONE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPAPC => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPMULTITRACK => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPMEDIACONTROL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPMEDIARECORD => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPMEDIAPLAYBACK => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPFILETRACK => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TAPIMEDIATYPE_AUDIO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TAPIMEDIATYPE_VIDEO => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static TAPIMEDIATYPE_DATAMODEM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TAPIMEDIATYPE_G3FAX => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TAPIMEDIATYPE_MULTITRACK => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_MESSAGE_BASE => 500

    /**
     * @type {Integer (UInt32)}
     */
    static LINETSPIOPTION_NONREENTRANT => 1

    /**
     * @type {Integer (Int32)}
     */
    static TUISPIDLL_OBJECT_LINEID => 1

    /**
     * @type {Integer (Int32)}
     */
    static TUISPIDLL_OBJECT_PHONEID => 2

    /**
     * @type {Integer (Int32)}
     */
    static TUISPIDLL_OBJECT_PROVIDERID => 3

    /**
     * @type {Integer (Int32)}
     */
    static TUISPIDLL_OBJECT_DIALOGINSTANCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVATEOBJECT_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVATEOBJECT_CALLID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVATEOBJECT_LINE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVATEOBJECT_CALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVATEOBJECT_PHONE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVATEOBJECT_ADDRESS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static LINEQOSREQUESTTYPE_SERVICELEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEQOSSERVICELEVEL_NEEDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEQOSSERVICELEVEL_IFAVAILABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEQOSSERVICELEVEL_BESTEFFORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LINEEQOSINFO_NOQOS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LINEEQOSINFO_ADMISSIONFAILURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINEEQOSINFO_POLICYFAILURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LINEEQOSINFO_GENERICERROR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PROC_BASE => 500

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEACCEPT => 500

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEADDTOCONFERENCE => 501

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEANSWER => 502

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEBLINDTRANSFER => 503

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINECLOSE => 504

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINECLOSECALL => 505

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINECOMPLETECALL => 506

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINECOMPLETETRANSFER => 507

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINECONDITIONALMEDIADETECTION => 508

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINECONFIGDIALOG => 509

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEDEVSPECIFIC => 510

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEDEVSPECIFICFEATURE => 511

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEDIAL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEDROP => 513

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEFORWARD => 514

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGATHERDIGITS => 515

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGENERATEDIGITS => 516

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGENERATETONE => 517

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETADDRESSCAPS => 518

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETADDRESSID => 519

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETADDRESSSTATUS => 520

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETCALLADDRESSID => 521

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETCALLINFO => 522

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETCALLSTATUS => 523

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETDEVCAPS => 524

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETDEVCONFIG => 525

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETEXTENSIONID => 526

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETICON => 527

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETID => 528

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETLINEDEVSTATUS => 529

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETNUMADDRESSIDS => 530

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEHOLD => 531

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEMAKECALL => 532

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEMONITORDIGITS => 533

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEMONITORMEDIA => 534

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEMONITORTONES => 535

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINENEGOTIATEEXTVERSION => 536

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINENEGOTIATETSPIVERSION => 537

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEOPEN => 538

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEPARK => 539

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEPICKUP => 540

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEPREPAREADDTOCONFERENCE => 541

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEREDIRECT => 542

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEREMOVEFROMCONFERENCE => 543

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESECURECALL => 544

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESELECTEXTVERSION => 545

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESENDUSERUSERINFO => 546

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETAPPSPECIFIC => 547

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETCALLPARAMS => 548

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETDEFAULTMEDIADETECTION => 549

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETDEVCONFIG => 550

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETMEDIACONTROL => 551

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETMEDIAMODE => 552

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETSTATUSMESSAGES => 553

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETTERMINAL => 554

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETUPCONFERENCE => 555

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETUPTRANSFER => 556

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESWAPHOLD => 557

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEUNCOMPLETECALL => 558

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEUNHOLD => 559

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEUNPARK => 560

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONECLOSE => 561

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONECONFIGDIALOG => 562

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEDEVSPECIFIC => 563

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETBUTTONINFO => 564

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETDATA => 565

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETDEVCAPS => 566

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETDISPLAY => 567

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETEXTENSIONID => 568

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETGAIN => 569

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETHOOKSWITCH => 570

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETICON => 571

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETID => 572

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETLAMP => 573

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETRING => 574

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETSTATUS => 575

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEGETVOLUME => 576

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONENEGOTIATEEXTVERSION => 577

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONENEGOTIATETSPIVERSION => 578

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONEOPEN => 579

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONESELECTEXTVERSION => 580

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONESETBUTTONINFO => 581

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONESETDATA => 582

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONESETDISPLAY => 583

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONESETGAIN => 584

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONESETHOOKSWITCH => 585

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONESETLAMP => 586

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONESETRING => 587

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONESETSTATUSMESSAGES => 588

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PHONESETVOLUME => 589

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PROVIDERCONFIG => 590

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PROVIDERINIT => 591

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PROVIDERINSTALL => 592

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PROVIDERREMOVE => 593

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PROVIDERSHUTDOWN => 594

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PROVIDERENUMDEVICES => 595

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEDROPONCLOSE => 596

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEDROPNOOWNER => 597

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PROVIDERCREATELINEDEVICE => 598

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_PROVIDERCREATEPHONEDEVICE => 599

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETCURRENTLOCATION => 600

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINECONFIGDIALOGEDIT => 601

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINERELEASEUSERUSERINFO => 602

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETCALLID => 603

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEGETCALLHUBTRACKING => 604

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINESETCALLHUBTRACKING => 605

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINERECEIVEMSPDATA => 606

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINEMSPIDENTIFY => 607

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINECREATEMSPINSTANCE => 608

    /**
     * @type {Integer (UInt32)}
     */
    static TSPI_LINECLOSEMSPINSTANCE => 609

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPDIROBJECT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPDIROBJCONFERENCE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPDIROBJUSER => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPDIRECTORY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IDISPILSCONFIG => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static RENDBIND_AUTHENTICATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RENDBIND_DEFAULTDOMAINNAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RENDBIND_DEFAULTUSERNAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RENDBIND_DEFAULTPASSWORD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RENDBIND_DEFAULTCREDENTIALS => 14

    /**
     * @type {Integer (UInt32)}
     */
    static STRM_INITIAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STRM_TERMINALSELECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STRM_CONFIGURED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STRM_RUNNING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STRM_PAUSED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STRM_STOPPED => 16

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOTENOUGHMEMORY => -2147221503

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOITEMS => -2147221502

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOTSUPPORTED => -2147221501

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALIDMEDIATYPE => -2147221500

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_OPERATIONFAILED => -2147221499

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_ALLOCATED => -2147221498

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_CALLUNAVAIL => -2147221497

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_COMPLETIONOVERRUN => -2147221496

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_CONFERENCEFULL => -2147221495

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_DIALMODIFIERNOTSUPPORTED => -2147221494

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INUSE => -2147221493

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALADDRESS => -2147221492

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALADDRESSSTATE => -2147221491

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALCALLPARAMS => -2147221490

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALCALLPRIVILEGE => -2147221489

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALCALLSTATE => -2147221488

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALCARD => -2147221487

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALCOMPLETIONID => -2147221486

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALCOUNTRYCODE => -2147221485

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALDEVICECLASS => -2147221484

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALDIALPARAMS => -2147221483

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALDIGITS => -2147221482

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALGROUPID => -2147221481

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALLOCATION => -2147221480

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALMESSAGEID => -2147221479

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALPARKID => -2147221478

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALRATE => -2147221477

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALTIMEOUT => -2147221476

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALTONE => -2147221475

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALLIST => -2147221474

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALMODE => -2147221473

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOCONFERENCE => -2147221472

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NODEVICE => -2147221471

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOREQUEST => -2147221470

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOTOWNER => -2147221469

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOTREGISTERED => -2147221468

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_REQUESTOVERRUN => -2147221467

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_TARGETNOTFOUND => -2147221466

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_TARGETSELF => -2147221465

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_USERUSERINFOTOOBIG => -2147221464

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_REINIT => -2147221463

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_ADDRESSBLOCKED => -2147221462

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_BILLINGREJECTED => -2147221461

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALFEATURE => -2147221460

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALBUTTONLAMPID => -2147221459

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALBUTTONSTATE => -2147221458

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALDATAID => -2147221457

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALHOOKSWITCHDEV => -2147221456

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_DROPPED => -2147221455

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOREQUESTRECIPIENT => -2147221454

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_REQUESTQUEUEFULL => -2147221453

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_DESTBUSY => -2147221452

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_DESTNOANSWER => -2147221451

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_DESTUNAVAIL => -2147221450

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_REQUESTFAILED => -2147221449

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_REQUESTCANCELLED => -2147221448

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALPRIVILEGE => -2147221447

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALIDDIRECTION => -2147221446

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALIDTERMINAL => -2147221445

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALIDTERMINALCLASS => -2147221444

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NODRIVER => -2147221443

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_MAXSTREAMS => -2147221442

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOTERMINALSELECTED => -2147221441

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_TERMINALINUSE => -2147221440

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOTSTOPPED => -2147221439

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_MAXTERMINALS => -2147221438

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALIDSTREAM => -2147221437

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_TIMEOUT => -2147221436

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_CALLCENTER_GROUP_REMOVED => -2147221435

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_CALLCENTER_QUEUE_REMOVED => -2147221434

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_CALLCENTER_NO_AGENT_ID => -2147221433

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_CALLCENTER_INVALAGENTID => -2147221432

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_CALLCENTER_INVALAGENTGROUP => -2147221431

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_CALLCENTER_INVALPASSWORD => -2147221430

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_CALLCENTER_INVALAGENTSTATE => -2147221429

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_CALLCENTER_INVALAGENTACTIVITY => -2147221428

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_REGISTRY_SETTING_CORRUPT => -2147221427

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_TERMINAL_PEER => -2147221426

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_PEER_NOT_SET => -2147221425

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOEVENT => -2147221424

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALADDRESSTYPE => -2147221423

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_RESOURCEUNAVAIL => -2147221422

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_PHONENOTOPEN => -2147221421

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_CALLNOTSELECTED => -2147221420

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_WRONGEVENT => -2147221419

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOFORMAT => -2147221418

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_INVALIDSTREAMSTATE => -2147221417

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_WRONG_STATE => -2147221416

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_NOT_INITIALIZED => -2147221415

    /**
     * @type {Integer (Int32)}
     */
    static TAPI_E_SERVICE_NOT_RUNNING => -2147221414

    /**
     * @type {String}
     */
    static OPENTNEFSTREAM => "OpenTnefStream"

    /**
     * @type {String}
     */
    static OPENTNEFSTREAMEX => "OpenTnefStreamEx"

    /**
     * @type {String}
     */
    static GETTNEFSTREAMCODEPAGE => "GetTnefStreamCodePage"

    /**
     * @type {Integer (UInt32)}
     */
    static cbDisplayName => 41

    /**
     * @type {Integer (UInt32)}
     */
    static cbEmailName => 11

    /**
     * @type {Integer (UInt32)}
     */
    static cbSeverName => 12

    /**
     * @type {Integer (UInt32)}
     */
    static cbTYPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static cbMaxIdData => 200

    /**
     * @type {Integer (UInt32)}
     */
    static prioLow => 3

    /**
     * @type {Integer (UInt32)}
     */
    static prioNorm => 2

    /**
     * @type {Integer (UInt32)}
     */
    static prioHigh => 1

    /**
     * @type {Integer (Int32)}
     */
    static atypNull => 0

    /**
     * @type {Integer (Int32)}
     */
    static atypFile => 1

    /**
     * @type {Integer (Int32)}
     */
    static atypOle => 2

    /**
     * @type {Integer (Int32)}
     */
    static atypPicture => 3

    /**
     * @type {Integer (Int32)}
     */
    static atypMax => 4
;@endregion Constants

;@region Methods
    /**
     * The lineAccept function accepts the specified offered call. It can optionally send the specified user-user information to the calling party.
     * @param {Integer} hCall Handle to the call to be accepted. The application must be an owner of the call. Call state of <i>hCall</i> must be <i>offering</i>.
     * @param {Pointer<Byte>} lpsUserUserInfo Pointer to a <b>null</b>-terminated string containing user-user information to be sent to the remote party as part of the call accept. This pointer can be left <b>NULL</b> if no user-user information is to be sent. User-user information is only sent if supported by the underlying network (see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>). The protocol discriminator member for the user-user information, if required, should appear as the first byte of the buffer pointed to by <i>lpsUserUserInfo</i>, and must be accounted for in <i>dwSize</i>.
     * @param {Integer} dwSize Size of the user-user information in <i>lpsUserUserInfo</i> (including the <b>null</b> terminator), in bytes. If <i>lpsUserUserInfo</i> is <b>NULL</b>, no user-user information is sent to the calling party and <i>dwSize</i> is ignored.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds, or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_INVALCALLSTATE, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_NOTOWNER, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED, LINEERR_USERUSERINFOTOOBIG.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineaccept
     */
    static lineAccept(hCall, lpsUserUserInfo, dwSize) {
        lpsUserUserInfo := lpsUserUserInfo is String? StrPtr(lpsUserUserInfo) : lpsUserUserInfo

        result := DllCall("TAPI32.dll\lineAccept", "uint", hCall, "ptr", lpsUserUserInfo, "uint", dwSize, "int")
        return result
    }

    /**
     * The lineAddProvider function installs a new telephony service provider into the telephony system.
     * @param {Pointer<Byte>} lpszProviderFilename Pointer to a <b></b>
     * 
     * <b>null</b>-terminated string containing the path of the service provider to be added.
     * @param {Pointer<Void>} hwndOwner Handle to a window in which any dialog boxes that need to be displayed as part of the installation process (for example, by the service provider's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_providerinstall">TSPI_providerInstall</a> function) would be attached. Can be <b>NULL</b> to indicate that any window created during the function should have no owner window.
     * @param {Pointer<UInt32>} lpdwPermanentProviderID Pointer to a variable that receives the permanent provider identifier of the newly installed service provider.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INIFILECORRUPT, LINEERR_INVALPARAM, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_NOMULTIPLEINSTANCE, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineaddprovider
     */
    static lineAddProvider(lpszProviderFilename, hwndOwner, lpdwPermanentProviderID) {
        lpszProviderFilename := lpszProviderFilename is String? StrPtr(lpszProviderFilename) : lpszProviderFilename

        result := DllCall("TAPI32.dll\lineAddProvider", "ptr", lpszProviderFilename, "ptr", hwndOwner, "uint*", lpdwPermanentProviderID, "int")
        return result
    }

    /**
     * The lineAddProvider function installs a new telephony service provider into the telephony system.
     * @param {Pointer<Byte>} lpszProviderFilename Pointer to a <b></b>
     * 
     * <b>null</b>-terminated string containing the path of the service provider to be added.
     * @param {Pointer<Void>} hwndOwner Handle to a window in which any dialog boxes that need to be displayed as part of the installation process (for example, by the service provider's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_providerinstall">TSPI_providerInstall</a> function) would be attached. Can be <b>NULL</b> to indicate that any window created during the function should have no owner window.
     * @param {Pointer<UInt32>} lpdwPermanentProviderID Pointer to a variable that receives the permanent provider identifier of the newly installed service provider.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INIFILECORRUPT, LINEERR_INVALPARAM, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_NOMULTIPLEINSTANCE, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineaddprovidera
     */
    static lineAddProviderA(lpszProviderFilename, hwndOwner, lpdwPermanentProviderID) {
        lpszProviderFilename := lpszProviderFilename is String? StrPtr(lpszProviderFilename) : lpszProviderFilename

        result := DllCall("TAPI32.dll\lineAddProviderA", "ptr", lpszProviderFilename, "ptr", hwndOwner, "uint*", lpdwPermanentProviderID, "int")
        return result
    }

    /**
     * The lineAddProvider function installs a new telephony service provider into the telephony system.
     * @param {Pointer<Char>} lpszProviderFilename Pointer to a <b></b>
     * 
     * <b>null</b>-terminated string containing the path of the service provider to be added.
     * @param {Pointer<Void>} hwndOwner Handle to a window in which any dialog boxes that need to be displayed as part of the installation process (for example, by the service provider's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_providerinstall">TSPI_providerInstall</a> function) would be attached. Can be <b>NULL</b> to indicate that any window created during the function should have no owner window.
     * @param {Pointer<UInt32>} lpdwPermanentProviderID Pointer to a variable that receives the permanent provider identifier of the newly installed service provider.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INIFILECORRUPT, LINEERR_INVALPARAM, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_NOMULTIPLEINSTANCE, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineaddproviderw
     */
    static lineAddProviderW(lpszProviderFilename, hwndOwner, lpdwPermanentProviderID) {
        lpszProviderFilename := lpszProviderFilename is String? StrPtr(lpszProviderFilename) : lpszProviderFilename

        result := DllCall("TAPI32.dll\lineAddProviderW", "ptr", lpszProviderFilename, "ptr", hwndOwner, "uint*", lpdwPermanentProviderID, "int")
        return result
    }

    /**
     * The lineAddToConference function adds the call specified by hConsultCall to the conference call specified by hConfCall.
     * @param {Integer} hConfCall Handle to the conference call. The application must be an owner of this call. Any monitoring (media, tones, digits) on a conference call applies only to the <i>hConfCall</i>, not to the individual participating calls. Call state of <i>hConfCall</i> must be <i>onHoldPendingConference</i> or <i>onHold</i>.
     * @param {Integer} hConsultCall Handle to the call to be added to the conference call. The application must be an owner of this call. This call cannot be a parent of another conference or a participant in any conference. Depending on the device capabilities indicated in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddresscaps">LINEADDRESSCAPS</a>, the <i>hConsultCall</i> may not necessarily have been established using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetupconference">lineSetupConference</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineprepareaddtoconference">linePrepareAddToConference</a>. The call state of <i>hConsultCall</i> must be <i>connected</i>, <i>onHold</i>, <i>proceeding</i>, or <i>ringback</i>. Many PBXs allow calls to be added to conferences before they are actually answered.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds, or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_CONFERENCEFULL, LINEERR_NOTOWNER, LINEERR_INVALCONFCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLSTATE, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineaddtoconference
     */
    static lineAddToConference(hConfCall, hConsultCall) {
        result := DllCall("TAPI32.dll\lineAddToConference", "uint", hConfCall, "uint", hConsultCall, "int")
        return result
    }

    /**
     * The lineAgentSpecific function allows the application to access proprietary handler-specific functions of the agent handler associated with the address.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the open line device. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwAgentExtensionIDIndex Position in the <b>ExtensionIDList</b> structure in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentcaps">LINEAGENTCAPS</a> of the agent handler extension being invoked.
     * @param {Pointer<Void>} lpParams Pointer to a memory area used to hold a parameter block. The format of this parameter block is device specific and its contents are passed by TAPI to and from the agent handler application on the telephony server. This parameter block must specify the function to be invoked and include sufficient room for any data to be returned.
     * @param {Integer} dwSize Size of the parameter block area, in bytes. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If <i>lpParams</i> is a pointer to a string, the size must include the <b>NULL</b> terminator. </div>
     * <div> </div>
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, this function returns one of these negative error values:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_INVALAGENTID, LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_STRUCTURETOOSMALL, LINEERR_UNINITIALIZED.
     * 
     * Additional return values are specific to the agent handler.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineagentspecific
     */
    static lineAgentSpecific(hLine, dwAddressID, dwAgentExtensionIDIndex, lpParams, dwSize) {
        result := DllCall("TAPI32.dll\lineAgentSpecific", "uint", hLine, "uint", dwAddressID, "uint", dwAgentExtensionIDIndex, "ptr", lpParams, "uint", dwSize, "int")
        return result
    }

    /**
     * The lineAnswer function answers the specified offering call.
     * @param {Integer} hCall Handle to the call to be answered. The application must be an owner of this call. The call state of <i>hCall</i> must be <i>offering</i> or <i>accepted</i>.
     * @param {Pointer<Byte>} lpsUserUserInfo Pointer to a <b>null</b>-terminated string containing user-user information to be sent to the remote party at the time the call is answered. This pointer can be left <b>NULL</b> if no user-user information is to be sent. User-user information is only sent if supported by the underlying network (see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>). The protocol discriminator field for the user-user information, if required, should appear as the first byte of the buffer pointed to by <i>lpsUserUserInfo</i>, and must be accounted for in <i>dwSize</i>.
     * @param {Integer} dwSize Size of the user-user information in <i>lpsUserUserInfo</i> (including the <b>null</b> terminator), in bytes If <i>lpsUserUserInfo</i> is <b>NULL</b>, no user-user information is sent to the calling party and <i>dwSize</i> is ignored.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INUSE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLSTATE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_USERUSERINFOTOOBIG, LINEERR_NOTOWNER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineanswer
     */
    static lineAnswer(hCall, lpsUserUserInfo, dwSize) {
        lpsUserUserInfo := lpsUserUserInfo is String? StrPtr(lpsUserUserInfo) : lpsUserUserInfo

        result := DllCall("TAPI32.dll\lineAnswer", "uint", hCall, "ptr", lpsUserUserInfo, "uint", dwSize, "int")
        return result
    }

    /**
     * The lineBlindTransfer function performs a blind or single-step transfer of the specified call to the specified destination address.
     * @param {Integer} hCall Handle to the call to be transferred. The application must be an owner of this call. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Pointer<Byte>} lpszDestAddress TBD
     * @param {Integer} dwCountryCode Country or region code of the destination. This is used by the implementation to select the call progress protocols for the destination address. If a value of 0 is specified, a default call-progress protocol defined by the service provider is used.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_INVALCOUNTRYCODE, LINEERR_INVALCALLSTATE, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_OPERATIONUNAVAIL, LINEERR_NOTOWNER, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALADDRESS, LINEERR_UNINITIALIZED, LINEERR_ADDRESSBLOCKED, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineblindtransfer
     */
    static lineBlindTransfer(hCall, lpszDestAddress, dwCountryCode) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineBlindTransfer", "uint", hCall, "ptr", lpszDestAddress, "uint", dwCountryCode, "int")
        return result
    }

    /**
     * The lineBlindTransfer function performs a blind or single-step transfer of the specified call to the specified destination address.
     * @param {Integer} hCall Handle to the call to be transferred. The application must be an owner of this call. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Pointer<Byte>} lpszDestAddress TBD
     * @param {Integer} dwCountryCode Country or region code of the destination. This is used by the implementation to select the call progress protocols for the destination address. If a value of 0 is specified, a default call-progress protocol defined by the service provider is used.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_INVALCOUNTRYCODE, LINEERR_INVALCALLSTATE, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_OPERATIONUNAVAIL, LINEERR_NOTOWNER, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALADDRESS, LINEERR_UNINITIALIZED, LINEERR_ADDRESSBLOCKED, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineblindtransfera
     */
    static lineBlindTransferA(hCall, lpszDestAddress, dwCountryCode) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineBlindTransferA", "uint", hCall, "ptr", lpszDestAddress, "uint", dwCountryCode, "int")
        return result
    }

    /**
     * The lineBlindTransfer function performs a blind or single-step transfer of the specified call to the specified destination address.
     * @param {Integer} hCall Handle to the call to be transferred. The application must be an owner of this call. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Pointer<Char>} lpszDestAddressW Pointer to a null-terminated string identifying where the call is to be transferred to. The destination address uses the standard dialable number format.
     * @param {Integer} dwCountryCode Country or region code of the destination. This is used by the implementation to select the call progress protocols for the destination address. If a value of 0 is specified, a default call-progress protocol defined by the service provider is used.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_INVALCOUNTRYCODE, LINEERR_INVALCALLSTATE, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_OPERATIONUNAVAIL, LINEERR_NOTOWNER, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALADDRESS, LINEERR_UNINITIALIZED, LINEERR_ADDRESSBLOCKED, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineblindtransferw
     */
    static lineBlindTransferW(hCall, lpszDestAddressW, dwCountryCode) {
        lpszDestAddressW := lpszDestAddressW is String? StrPtr(lpszDestAddressW) : lpszDestAddressW

        result := DllCall("TAPI32.dll\lineBlindTransferW", "uint", hCall, "ptr", lpszDestAddressW, "uint", dwCountryCode, "int")
        return result
    }

    /**
     * The lineClose function closes the specified open line device.
     * @param {Integer} hLine Handle to the open line device to be closed. After the line has been successfully closed, this handle is no longer valid.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineclose
     */
    static lineClose(hLine) {
        result := DllCall("TAPI32.dll\lineClose", "uint", hLine, "int")
        return result
    }

    /**
     * The lineCompleteCall function specifies how a call that could not be connected normally should be completed instead.
     * @param {Integer} hCall Handle to the call whose completion is requested. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>busy</i> or <i>ringback</i>.
     * @param {Pointer<UInt32>} lpdwCompletionID Pointer to a <b>DWORD</b>-sized memory location. The completion identifier is used to identify individual completion requests in progress. A completion identifier becomes invalid and can be reused after the request completes or after an outstanding request is canceled.
     * @param {Integer} dwCompletionMode Way in which the call is to be completed. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallcomplmode--constants">LINECALLCOMPLMODE_ Constants</a>.
     * @param {Integer} dwMessageID Message that is to be sent when completing the call using LINECALLCOMPLMODE_MESSAGE. This identifier selects the message from a small number of predefined messages.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_COMPLETIONOVERRUN, LINEERR_NOMEM, LINEERR_INVALCALLCOMPLMODE, LINEERR_NOTOWNER, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALMESSAGEID, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linecompletecall
     */
    static lineCompleteCall(hCall, lpdwCompletionID, dwCompletionMode, dwMessageID) {
        result := DllCall("TAPI32.dll\lineCompleteCall", "uint", hCall, "uint*", lpdwCompletionID, "uint", dwCompletionMode, "uint", dwMessageID, "int")
        return result
    }

    /**
     * The lineCompleteTransfer function completes the transfer of the specified call to the party connected in the consultation call.
     * @param {Integer} hCall Handle to the call to be transferred. The application must be an owner of this call. The call state of <i>hCall</i> must be <i>onHold</i> or <i>onHoldPendingTransfer</i>.
     * @param {Integer} hConsultCall Handle to the call that represents a connection with the destination of the transfer. The application must be an owner of this call. The call state of <i>hConsultCall</i> must be <i>connected</i>, <i>ringback</i>, <i>busy</i>, or <i>proceeding</i>.
     * @param {Pointer<UInt32>} lphConfCall Pointer to a memory location where an <i>hCall</i> handle can be returned. If <i>dwTransferMode</i> is LINETRANSFERMODE_CONFERENCE, the newly created conference call is returned in <i>lphConfCall</i> and the application becomes the sole owner of the conference call. Otherwise, this parameter is ignored by TAPI.
     * @param {Integer} dwTransferMode How the initiated transfer request is to be resolved. This parameter uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetransfermode--constants">LINETRANSFERMODE_ Constants</a>.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_NOTOWNER, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCONSULTCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALTRANSFERMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linecompletetransfer
     */
    static lineCompleteTransfer(hCall, hConsultCall, lphConfCall, dwTransferMode) {
        result := DllCall("TAPI32.dll\lineCompleteTransfer", "uint", hCall, "uint", hConsultCall, "uint*", lphConfCall, "uint", dwTransferMode, "int")
        return result
    }

    /**
     * The lineConfigDialog function causes the provider of the specified line device to display a dialog box (attached to hwndOwner of the application) to allow the user to configure parameters related to the line device.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be <b>NULL</b> to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest level configuration is selected.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_OPERATIONFAILED, LINEERR_INVALDEVICECLASS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPARAM, LINEERR_UNINITIALIZED, LINEERR_INVALPOINTER, LINEERR_OPERATIONUNAVAIL, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineconfigdialog
     */
    static lineConfigDialog(dwDeviceID, hwndOwner, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineConfigDialog", "uint", dwDeviceID, "ptr", hwndOwner, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineConfigDialog function causes the provider of the specified line device to display a dialog box (attached to hwndOwner of the application) to allow the user to configure parameters related to the line device.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be <b>NULL</b> to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest level configuration is selected.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_OPERATIONFAILED, LINEERR_INVALDEVICECLASS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPARAM, LINEERR_UNINITIALIZED, LINEERR_INVALPOINTER, LINEERR_OPERATIONUNAVAIL, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineconfigdialoga
     */
    static lineConfigDialogA(dwDeviceID, hwndOwner, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineConfigDialogA", "uint", dwDeviceID, "ptr", hwndOwner, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineConfigDialog function causes the provider of the specified line device to display a dialog box (attached to hwndOwner of the application) to allow the user to configure parameters related to the line device.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be <b>NULL</b> to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Char>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest level configuration is selected.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_OPERATIONFAILED, LINEERR_INVALDEVICECLASS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPARAM, LINEERR_UNINITIALIZED, LINEERR_INVALPOINTER, LINEERR_OPERATIONUNAVAIL, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineconfigdialogw
     */
    static lineConfigDialogW(dwDeviceID, hwndOwner, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineConfigDialogW", "uint", dwDeviceID, "ptr", hwndOwner, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineConfigDialogEdit function causes the provider of the specified line device to display a dialog box (attached to hwndOwner of the application) to allow the user to configure parameters related to the line device.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be <b>NULL</b> to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest level configuration is selected.
     * @param {Pointer<Void>} lpDeviceConfigIn Pointer to the opaque configuration data structure that was returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> (or a previous invocation of 
     * <b>lineConfigDialogEdit</b>) in the variable portion of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure.
     * @param {Integer} dwSize Number of bytes in the structure pointed to by <i>lpDeviceConfigIn</i>. This value is returned in the <b>dwStringSize</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> or a previous invocation of 
     * <b>lineConfigDialogEdit</b>.
     * @param {Pointer<VARSTRING>} lpDeviceConfigOut Pointer to the memory location of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> where the device configuration structure is returned. Upon successful completion of the request, this location is filled with the device configuration. The <b>dwStringFormat</b> member in the 
     * <b>VARSTRING</b> structure is set to STRINGFORMAT_BINARY. Prior to calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> (or a future invocation of 
     * <b>lineConfigDialogEdit</b>), the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_OPERATIONFAILED, LINEERR_INVALDEVICECLASS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPARAM, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NODRIVER, LINEERR_OPERATIONUNAVAIL, LINEERR_NOMEM, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineconfigdialogedit
     */
    static lineConfigDialogEdit(dwDeviceID, hwndOwner, lpszDeviceClass, lpDeviceConfigIn, dwSize, lpDeviceConfigOut) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineConfigDialogEdit", "uint", dwDeviceID, "ptr", hwndOwner, "ptr", lpszDeviceClass, "ptr", lpDeviceConfigIn, "uint", dwSize, "ptr", lpDeviceConfigOut, "int")
        return result
    }

    /**
     * The lineConfigDialogEdit function causes the provider of the specified line device to display a dialog box (attached to hwndOwner of the application) to allow the user to configure parameters related to the line device.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be <b>NULL</b> to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest level configuration is selected.
     * @param {Pointer<Void>} lpDeviceConfigIn Pointer to the opaque configuration data structure that was returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> (or a previous invocation of 
     * <b>lineConfigDialogEdit</b>) in the variable portion of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure.
     * @param {Integer} dwSize Number of bytes in the structure pointed to by <i>lpDeviceConfigIn</i>. This value is returned in the <b>dwStringSize</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> or a previous invocation of 
     * <b>lineConfigDialogEdit</b>.
     * @param {Pointer<VARSTRING>} lpDeviceConfigOut Pointer to the memory location of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> where the device configuration structure is returned. Upon successful completion of the request, this location is filled with the device configuration. The <b>dwStringFormat</b> member in the 
     * <b>VARSTRING</b> structure is set to STRINGFORMAT_BINARY. Prior to calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> (or a future invocation of 
     * <b>lineConfigDialogEdit</b>), the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_OPERATIONFAILED, LINEERR_INVALDEVICECLASS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPARAM, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NODRIVER, LINEERR_OPERATIONUNAVAIL, LINEERR_NOMEM, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineconfigdialogedita
     */
    static lineConfigDialogEditA(dwDeviceID, hwndOwner, lpszDeviceClass, lpDeviceConfigIn, dwSize, lpDeviceConfigOut) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineConfigDialogEditA", "uint", dwDeviceID, "ptr", hwndOwner, "ptr", lpszDeviceClass, "ptr", lpDeviceConfigIn, "uint", dwSize, "ptr", lpDeviceConfigOut, "int")
        return result
    }

    /**
     * The lineConfigDialogEdit function causes the provider of the specified line device to display a dialog box (attached to hwndOwner of the application) to allow the user to configure parameters related to the line device.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be <b>NULL</b> to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Char>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest level configuration is selected.
     * @param {Pointer<Void>} lpDeviceConfigIn Pointer to the opaque configuration data structure that was returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> (or a previous invocation of 
     * <b>lineConfigDialogEdit</b>) in the variable portion of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure.
     * @param {Integer} dwSize Number of bytes in the structure pointed to by <i>lpDeviceConfigIn</i>. This value is returned in the <b>dwStringSize</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> or a previous invocation of 
     * <b>lineConfigDialogEdit</b>.
     * @param {Pointer<VARSTRING>} lpDeviceConfigOut Pointer to the memory location of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> where the device configuration structure is returned. Upon successful completion of the request, this location is filled with the device configuration. The <b>dwStringFormat</b> member in the 
     * <b>VARSTRING</b> structure is set to STRINGFORMAT_BINARY. Prior to calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> (or a future invocation of 
     * <b>lineConfigDialogEdit</b>), the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_OPERATIONFAILED, LINEERR_INVALDEVICECLASS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPARAM, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NODRIVER, LINEERR_OPERATIONUNAVAIL, LINEERR_NOMEM, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineconfigdialogeditw
     */
    static lineConfigDialogEditW(dwDeviceID, hwndOwner, lpszDeviceClass, lpDeviceConfigIn, dwSize, lpDeviceConfigOut) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineConfigDialogEditW", "uint", dwDeviceID, "ptr", hwndOwner, "ptr", lpszDeviceClass, "ptr", lpDeviceConfigIn, "uint", dwSize, "ptr", lpDeviceConfigOut, "int")
        return result
    }

    /**
     * The lineConfigProvider function causes a service provider to display its configuration dialog box.
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the configuration dialog box (displayed by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_providerconfig">TSPI_providerConfig</a>) is attached. Can be <b>NULL</b> to indicate that any window created during the function should have no owner window.
     * @param {Integer} dwPermanentProviderID Permanent provider identifier of the service provider to be configured.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INIFILECORRUPT, LINEERR_NOMEM, LINEERR_INVALPARAM, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineconfigprovider
     */
    static lineConfigProvider(hwndOwner, dwPermanentProviderID) {
        result := DllCall("TAPI32.dll\lineConfigProvider", "ptr", hwndOwner, "uint", dwPermanentProviderID, "int")
        return result
    }

    /**
     * The lineCreateAgent function creates a new Agent object. It generates a LINE_PROXYREQUEST message to be sent to a registered proxy function handler, referencing a LINEPROXYREQUEST structure of type LINEPROXYREQUEST_CREATEAGENT.
     * @param {Integer} hLine Handle to the line device.
     * @param {Pointer<Char>} lpszAgentID Pointer to a <b>null</b>-terminated Unicode string containing the agent identifier. Used when working with legacy ACD systems. With an ACD system that uses the operating system's user login for authentication, <i>lpszAgentID</i> is set to <b>NULL</b>.
     * @param {Pointer<Char>} lpszAgentPIN Pointer to a <b>null</b>-terminated Unicode string containing the agent PIN or password. Used when working with legacy ACD systems. With an ACD system that uses the operating system's user login for authentication, <i>lpszAgentPIN</i> is set to <b>NULL</b>.
     * @param {Pointer<UInt32>} lphAgent Handle to the created agent, returned by the ACD proxy. It is the responsibility of the agent handler proxy application to generate and maintain uniqueness of this identifier.
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linecreateagentw
     */
    static lineCreateAgentW(hLine, lpszAgentID, lpszAgentPIN, lphAgent) {
        lpszAgentID := lpszAgentID is String? StrPtr(lpszAgentID) : lpszAgentID
        lpszAgentPIN := lpszAgentPIN is String? StrPtr(lpszAgentPIN) : lpszAgentPIN

        result := DllCall("TAPI32.dll\lineCreateAgentW", "uint", hLine, "ptr", lpszAgentID, "ptr", lpszAgentPIN, "uint*", lphAgent, "int")
        return result
    }

    /**
     * The lineCreateAgent function creates a new Agent object. It generates a LINE_PROXYREQUEST message to be sent to a registered proxy function handler, referencing a LINEPROXYREQUEST structure of type LINEPROXYREQUEST_CREATEAGENT.
     * @param {Integer} hLine Handle to the line device.
     * @param {Pointer<Byte>} lpszAgentID Pointer to a <b>null</b>-terminated Unicode string containing the agent identifier. Used when working with legacy ACD systems. With an ACD system that uses the operating system's user login for authentication, <i>lpszAgentID</i> is set to <b>NULL</b>.
     * @param {Pointer<Byte>} lpszAgentPIN Pointer to a <b>null</b>-terminated Unicode string containing the agent PIN or password. Used when working with legacy ACD systems. With an ACD system that uses the operating system's user login for authentication, <i>lpszAgentPIN</i> is set to <b>NULL</b>.
     * @param {Pointer<UInt32>} lphAgent Handle to the created agent, returned by the ACD proxy. It is the responsibility of the agent handler proxy application to generate and maintain uniqueness of this identifier.
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linecreateagenta
     */
    static lineCreateAgentA(hLine, lpszAgentID, lpszAgentPIN, lphAgent) {
        lpszAgentID := lpszAgentID is String? StrPtr(lpszAgentID) : lpszAgentID
        lpszAgentPIN := lpszAgentPIN is String? StrPtr(lpszAgentPIN) : lpszAgentPIN

        result := DllCall("TAPI32.dll\lineCreateAgentA", "uint", hLine, "ptr", lpszAgentID, "ptr", lpszAgentPIN, "uint*", lphAgent, "int")
        return result
    }

    /**
     * The lineCreateAgentSession function creates a new AgentSession object. It generates a LINE_PROXYREQUEST message to be sent to a registered proxy function handler, referencing a LINEPROXYREQUEST structure of type LINEPROXYREQUEST_CREATEAGENTSESSION.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} hAgent Identifier of the agent for whom the session is to be created.
     * @param {Pointer<Char>} lpszAgentPIN Pointer to a <b>null</b>-terminated Unicode string containing the agent PIN or password. Used when working with legacy ACD systems that require a separate PIN for each session created (or group logged into). With an ACD system that uses the operating system's user login for authentication, <i>lpszAgentPIN</i> is set to <b>NULL</b>.
     * @param {Integer} dwWorkingAddressID Identifier of the address on which the agent will receive calls for this session.
     * @param {Pointer<Guid>} lpGroupID Pointer to a GUID that identifies the group for which the session is being created.
     * @param {Pointer<UInt32>} lphAgentSession Handle to the created agent session, returned by the ACD proxy. It is the responsibility of the agent handler proxy application to generate and maintain uniqueness of these identifiers.
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linecreateagentsessionw
     */
    static lineCreateAgentSessionW(hLine, hAgent, lpszAgentPIN, dwWorkingAddressID, lpGroupID, lphAgentSession) {
        lpszAgentPIN := lpszAgentPIN is String? StrPtr(lpszAgentPIN) : lpszAgentPIN

        result := DllCall("TAPI32.dll\lineCreateAgentSessionW", "uint", hLine, "uint", hAgent, "ptr", lpszAgentPIN, "uint", dwWorkingAddressID, "ptr", lpGroupID, "uint*", lphAgentSession, "int")
        return result
    }

    /**
     * The lineCreateAgentSession function creates a new AgentSession object. It generates a LINE_PROXYREQUEST message to be sent to a registered proxy function handler, referencing a LINEPROXYREQUEST structure of type LINEPROXYREQUEST_CREATEAGENTSESSION.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} hAgent Identifier of the agent for whom the session is to be created.
     * @param {Pointer<Byte>} lpszAgentPIN Pointer to a <b>null</b>-terminated Unicode string containing the agent PIN or password. Used when working with legacy ACD systems that require a separate PIN for each session created (or group logged into). With an ACD system that uses the operating system's user login for authentication, <i>lpszAgentPIN</i> is set to <b>NULL</b>.
     * @param {Integer} dwWorkingAddressID Identifier of the address on which the agent will receive calls for this session.
     * @param {Pointer<Guid>} lpGroupID Pointer to a GUID that identifies the group for which the session is being created.
     * @param {Pointer<UInt32>} lphAgentSession Handle to the created agent session, returned by the ACD proxy. It is the responsibility of the agent handler proxy application to generate and maintain uniqueness of these identifiers.
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linecreateagentsessiona
     */
    static lineCreateAgentSessionA(hLine, hAgent, lpszAgentPIN, dwWorkingAddressID, lpGroupID, lphAgentSession) {
        lpszAgentPIN := lpszAgentPIN is String? StrPtr(lpszAgentPIN) : lpszAgentPIN

        result := DllCall("TAPI32.dll\lineCreateAgentSessionA", "uint", hLine, "uint", hAgent, "ptr", lpszAgentPIN, "uint", dwWorkingAddressID, "ptr", lpGroupID, "uint*", lphAgentSession, "int")
        return result
    }

    /**
     * Deallocates the specified call handle.
     * @param {Integer} hCall The call handle to be deallocated. An application with monitoring privileges for a call can always deallocate its handle for that call. An application with owner privilege for a call can deallocate its handle unless it is the sole owner of the call and the call is not in the <i>idle</i> state. The call handle is no longer valid after it has been deallocated.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values include:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLSTATE, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linedeallocatecall
     */
    static lineDeallocateCall(hCall) {
        result := DllCall("TAPI32.dll\lineDeallocateCall", "uint", hCall, "int")
        return result
    }

    /**
     * The lineDevSpecific function enables service providers to provide access to features not offered by other TAPI functions.
     * @param {Integer} hLine Handle to a line device. This parameter is required.
     * @param {Integer} dwAddressID Address identifier on the given line device. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} hCall Handle to a call. This parameter is optional, but if it is specified, the call it represents must belong to the <i>hLine</i> line device. The call state of <i>hCall</i> is device specific.
     * @param {Pointer<Void>} lpParams Pointer to a memory area used to hold a parameter block. The format of this parameter block is device specific and its contents are passed by TAPI to or from the service provider.
     * @param {Integer} dwSize Size of the parameter block area, in bytes.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds, or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * 
     * Additional return values are device specific.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linedevspecific
     */
    static lineDevSpecific(hLine, dwAddressID, hCall, lpParams, dwSize) {
        result := DllCall("TAPI32.dll\lineDevSpecific", "uint", hLine, "uint", dwAddressID, "uint", hCall, "ptr", lpParams, "uint", dwSize, "int")
        return result
    }

    /**
     * The lineDevSpecificFeature function enables service providers to provide access to features not offered by other TAPI functions.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} dwFeature Feature to invoke on the line device. This parameter uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonebuttonfunction--constants">PHONEBUTTONFUNCTION_ Constants</a>.
     * @param {Pointer<Void>} lpParams Pointer to a memory area used to hold a feature-dependent parameter block. The format of this parameter block is device specific and its contents are passed through by TAPI to or from the service provider.
     * @param {Integer} dwSize Size of the buffer, in bytes.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALFEATURE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALLINEHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * 
     * Additional return values are device specific.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linedevspecificfeature
     */
    static lineDevSpecificFeature(hLine, dwFeature, lpParams, dwSize) {
        result := DllCall("TAPI32.dll\lineDevSpecificFeature", "uint", hLine, "uint", dwFeature, "ptr", lpParams, "uint", dwSize, "int")
        return result
    }

    /**
     * The lineDial function dials the specified dialable number on the specified call.
     * @param {Integer} hCall Handle to the call on which a number is to be dialed. The application must be an owner of the call. The call state of <i>hCall</i> can be any state except <i>idle</i> and <i>disconnected</i>.
     * @param {Pointer<Byte>} lpszDestAddress Destination to be dialed using the standard dialable number format.
     * @param {Integer} dwCountryCode Country or region code of the destination. This is used by the implementation to select the call progress protocols for the destination address. If a value of 0 is specified, a service provider-defined default call progress protocol is used.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_ADDRESSBLOCKED, LINEERR_INVALPOINTER, LINEERR_DIALBILLING, LINEERR_NOMEM, LINEERR_DIALDIALTONE, LINEERR_NOTOWNER, LINEERR_DIALPROMPT, LINEERR_OPERATIONFAILED, LINEERR_DIALQUIET, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_UNINITIALIZED, LINEERR_INVALCOUNTRYCODE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linedial
     */
    static lineDial(hCall, lpszDestAddress, dwCountryCode) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineDial", "uint", hCall, "ptr", lpszDestAddress, "uint", dwCountryCode, "int")
        return result
    }

    /**
     * The lineDial function dials the specified dialable number on the specified call.
     * @param {Integer} hCall Handle to the call on which a number is to be dialed. The application must be an owner of the call. The call state of <i>hCall</i> can be any state except <i>idle</i> and <i>disconnected</i>.
     * @param {Pointer<Byte>} lpszDestAddress Destination to be dialed using the standard dialable number format.
     * @param {Integer} dwCountryCode Country or region code of the destination. This is used by the implementation to select the call progress protocols for the destination address. If a value of 0 is specified, a service provider-defined default call progress protocol is used.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_ADDRESSBLOCKED, LINEERR_INVALPOINTER, LINEERR_DIALBILLING, LINEERR_NOMEM, LINEERR_DIALDIALTONE, LINEERR_NOTOWNER, LINEERR_DIALPROMPT, LINEERR_OPERATIONFAILED, LINEERR_DIALQUIET, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_UNINITIALIZED, LINEERR_INVALCOUNTRYCODE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linediala
     */
    static lineDialA(hCall, lpszDestAddress, dwCountryCode) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineDialA", "uint", hCall, "ptr", lpszDestAddress, "uint", dwCountryCode, "int")
        return result
    }

    /**
     * The lineDial function dials the specified dialable number on the specified call.
     * @param {Integer} hCall Handle to the call on which a number is to be dialed. The application must be an owner of the call. The call state of <i>hCall</i> can be any state except <i>idle</i> and <i>disconnected</i>.
     * @param {Pointer<Char>} lpszDestAddress Destination to be dialed using the standard dialable number format.
     * @param {Integer} dwCountryCode Country or region code of the destination. This is used by the implementation to select the call progress protocols for the destination address. If a value of 0 is specified, a service provider-defined default call progress protocol is used.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_ADDRESSBLOCKED, LINEERR_INVALPOINTER, LINEERR_DIALBILLING, LINEERR_NOMEM, LINEERR_DIALDIALTONE, LINEERR_NOTOWNER, LINEERR_DIALPROMPT, LINEERR_OPERATIONFAILED, LINEERR_DIALQUIET, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_UNINITIALIZED, LINEERR_INVALCOUNTRYCODE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linedialw
     */
    static lineDialW(hCall, lpszDestAddress, dwCountryCode) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineDialW", "uint", hCall, "ptr", lpszDestAddress, "uint", dwCountryCode, "int")
        return result
    }

    /**
     * The lineDrop function drops or disconnects the specified call. The application has the option to specify user-user information to be transmitted as part of the call disconnect.
     * @param {Integer} hCall Handle to the call to be dropped. The application must be an owner of the call. The call state of <i>hCall</i> can be any state except <i>idle</i>.
     * @param {Pointer<Byte>} lpsUserUserInfo Pointer to a string containing user-user information to be sent to the remote party as part of the call disconnect. This pointer can be left <b>NULL</b> if no user-user information is to be sent. User-user information is only sent if supported by the underlying network (see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>). The protocol discriminator field for the user-user information, if required, should appear as the first byte of the buffer pointed to by <i>lpsUserUserInfo</i>, and must be accounted for in <i>dwSize</i>.
     * @param {Integer} dwSize Size of the user-user information in <i>lpsUserUserInfo</i>, in bytes. If <i>lpsUserUserInfo</i> is <b>NULL</b>, no user-user information is sent to the calling party and <i>dwSize</i> is ignored.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_NOTOWNER, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_USERUSERINFOTOOBIG, LINEERR_INVALCALLSTATE, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linedrop
     */
    static lineDrop(hCall, lpsUserUserInfo, dwSize) {
        lpsUserUserInfo := lpsUserUserInfo is String? StrPtr(lpsUserUserInfo) : lpsUserUserInfo

        result := DllCall("TAPI32.dll\lineDrop", "uint", hCall, "ptr", lpsUserUserInfo, "uint", dwSize, "int")
        return result
    }

    /**
     * The lineForward function forwards calls destined for the specified address on the specified line, according to the specified forwarding instructions.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} bAllAddresses Specifies whether all originating addresses on the line or just the one specified is to be forwarded. If <b>TRUE</b>, all addresses on the line are forwarded and <i>dwAddressID</i> is ignored; if <b>FALSE</b>, only the address specified as <i>dwAddressID</i> is forwarded.
     * @param {Integer} dwAddressID Address on the specified line whose incoming calls are to be forwarded. This parameter is ignored if <i>bAllAddresses</i> is <b>TRUE</b>. 
     * 
     * 
     * 
     * 
     * An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<LINEFORWARDLIST>} lpForwardList Pointer to a variably sized data structure that describes the specific forwarding instructions, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineforwardlist">LINEFORWARDLIST</a>.
     * @param {Integer} dwNumRingsNoAnswer Number of rings before a call is considered a "no answer." If <i>dwNumRingsNoAnswer</i> is out of range, the actual value is set to the nearest value in the allowable range.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an HCALL location. In some telephony environments, this location is loaded with a handle to a consultation call that is used to consult the party that is being forwarded to, and the application becomes the initial sole owner of this call. This pointer must be valid even in environments where call forwarding does not require a consultation call. This handle is set to <b>NULL</b> if no consultation call is created.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a>. This pointer is ignored unless 
     * <b>lineForward</b> requires the establishment of a call to the forwarding destination (and <i>lphConsultCall</i> is returned, in which case <i>lpCallParams</i> is optional). If <b>NULL</b>, default call parameters are used. Otherwise, the specified call parameters are used for establishing <i>hConsultCall</i>.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_NOMEM, LINEERR_INVALADDRESSID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESS, LINEERR_OPERATIONFAILED, LINEERR_INVALCOUNTRYCODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPARAM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineforward
     */
    static lineForward(hLine, bAllAddresses, dwAddressID, lpForwardList, dwNumRingsNoAnswer, lphConsultCall, lpCallParams) {
        result := DllCall("TAPI32.dll\lineForward", "uint", hLine, "uint", bAllAddresses, "uint", dwAddressID, "ptr", lpForwardList, "uint", dwNumRingsNoAnswer, "uint*", lphConsultCall, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineForward function forwards calls destined for the specified address on the specified line, according to the specified forwarding instructions.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} bAllAddresses Specifies whether all originating addresses on the line or just the one specified is to be forwarded. If <b>TRUE</b>, all addresses on the line are forwarded and <i>dwAddressID</i> is ignored; if <b>FALSE</b>, only the address specified as <i>dwAddressID</i> is forwarded.
     * @param {Integer} dwAddressID Address on the specified line whose incoming calls are to be forwarded. This parameter is ignored if <i>bAllAddresses</i> is <b>TRUE</b>. 
     * 
     * 
     * 
     * 
     * An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<LINEFORWARDLIST>} lpForwardList Pointer to a variably sized data structure that describes the specific forwarding instructions, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineforwardlist">LINEFORWARDLIST</a>.
     * @param {Integer} dwNumRingsNoAnswer Number of rings before a call is considered a "no answer." If <i>dwNumRingsNoAnswer</i> is out of range, the actual value is set to the nearest value in the allowable range.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an HCALL location. In some telephony environments, this location is loaded with a handle to a consultation call that is used to consult the party that is being forwarded to, and the application becomes the initial sole owner of this call. This pointer must be valid even in environments where call forwarding does not require a consultation call. This handle is set to <b>NULL</b> if no consultation call is created.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a>. This pointer is ignored unless 
     * <b>lineForward</b> requires the establishment of a call to the forwarding destination (and <i>lphConsultCall</i> is returned, in which case <i>lpCallParams</i> is optional). If <b>NULL</b>, default call parameters are used. Otherwise, the specified call parameters are used for establishing <i>hConsultCall</i>.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_NOMEM, LINEERR_INVALADDRESSID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESS, LINEERR_OPERATIONFAILED, LINEERR_INVALCOUNTRYCODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPARAM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineforwarda
     */
    static lineForwardA(hLine, bAllAddresses, dwAddressID, lpForwardList, dwNumRingsNoAnswer, lphConsultCall, lpCallParams) {
        result := DllCall("TAPI32.dll\lineForwardA", "uint", hLine, "uint", bAllAddresses, "uint", dwAddressID, "ptr", lpForwardList, "uint", dwNumRingsNoAnswer, "uint*", lphConsultCall, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineForward function forwards calls destined for the specified address on the specified line, according to the specified forwarding instructions.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} bAllAddresses Specifies whether all originating addresses on the line or just the one specified is to be forwarded. If <b>TRUE</b>, all addresses on the line are forwarded and <i>dwAddressID</i> is ignored; if <b>FALSE</b>, only the address specified as <i>dwAddressID</i> is forwarded.
     * @param {Integer} dwAddressID Address on the specified line whose incoming calls are to be forwarded. This parameter is ignored if <i>bAllAddresses</i> is <b>TRUE</b>. 
     * 
     * 
     * 
     * 
     * An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<LINEFORWARDLIST>} lpForwardList Pointer to a variably sized data structure that describes the specific forwarding instructions, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineforwardlist">LINEFORWARDLIST</a>.
     * @param {Integer} dwNumRingsNoAnswer Number of rings before a call is considered a "no answer." If <i>dwNumRingsNoAnswer</i> is out of range, the actual value is set to the nearest value in the allowable range.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an HCALL location. In some telephony environments, this location is loaded with a handle to a consultation call that is used to consult the party that is being forwarded to, and the application becomes the initial sole owner of this call. This pointer must be valid even in environments where call forwarding does not require a consultation call. This handle is set to <b>NULL</b> if no consultation call is created.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a>. This pointer is ignored unless 
     * <b>lineForward</b> requires the establishment of a call to the forwarding destination (and <i>lphConsultCall</i> is returned, in which case <i>lpCallParams</i> is optional). If <b>NULL</b>, default call parameters are used. Otherwise, the specified call parameters are used for establishing <i>hConsultCall</i>.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_NOMEM, LINEERR_INVALADDRESSID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESS, LINEERR_OPERATIONFAILED, LINEERR_INVALCOUNTRYCODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPARAM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineforwardw
     */
    static lineForwardW(hLine, bAllAddresses, dwAddressID, lpForwardList, dwNumRingsNoAnswer, lphConsultCall, lpCallParams) {
        result := DllCall("TAPI32.dll\lineForwardW", "uint", hLine, "uint", bAllAddresses, "uint", dwAddressID, "ptr", lpForwardList, "uint", dwNumRingsNoAnswer, "uint*", lphConsultCall, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineGatherDigits function initiates the buffered gathering of digits on the specified call. The application specifies a buffer in which to place the digits and the maximum number of digits to be collected.
     * @param {Integer} hCall Handle to the call on which digits are to be gathered. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @param {Integer} dwDigitModes Digit modes to be monitored. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * @param {Pointer<Byte>} lpsDigits Pointer to the buffer where detected digits are to be stored as text characters. Digits may not show up in the buffer one at a time as they are collected. Only after a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-gatherdigits">LINE_GATHERDIGITS</a> message is received should the content of the buffer be assumed to be valid. If <i>lpsDigits</i> is <b>NULL</b>, the digit gathering currently in progress on the call is terminated and <i>dwNumDigits</i> is ignored. Otherwise, <i>lpsDigits</i> is assumed to have room for <i>dwNumDigits</i> digits.
     * @param {Integer} dwNumDigits Number of digits to be collected before a LINE_GATHERDIGITS message is sent to the application. The <i>dwNumDigits</i> parameter is ignored when <i>lpsDigits</i> is <b>NULL</b>. This function fails if <i>dwNumDigits</i> is zero.
     * @param {Pointer<Byte>} lpszTerminationDigits <b>Null</b>-terminated string of termination digits as text characters. If one of the digits in the string is detected, that termination digit is appended to the buffer, digit collection is terminated, and the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-gatherdigits">LINE_GATHERDIGITS</a> message is sent to the application. 
     * 
     * 
     * 
     * 
     * The list of valid characters is dependent on the constant provided in <i>dwDigitModes</i>. For a list of the valid characters for each possible mode, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * 
     * If this pointer is <b>NULL</b>, or if it points to an empty string, the function behaves as though no termination digits were supplied.
     * @param {Integer} dwFirstDigitTimeout Time duration in milliseconds in which the first digit is expected. If the first digit is not received in this timeframe, digit collection is aborted and a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-gatherdigits">LINE_GATHERDIGITS</a> message is sent to the application. The buffer only contains the <b>NULL</b> character, indicating that no digits were received and the first digit timeout terminated digit gathering. The call's line-device capabilities specify the valid range for this parameter or indicate that timeouts are not supported.
     * @param {Integer} dwInterDigitTimeout Maximum time duration in milliseconds between consecutive digits. If no digit is received in this timeframe, digit collection is aborted and a LINE_GATHERDIGITS message is sent to the application. The buffer only contains the digits collected up to this point followed by a <b>NULL</b> character, indicating that an interdigit timeout terminated digit gathering. The call's line-device capabilities specify the valid range for this parameter or indicate that timeouts are not supported.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_NOMEM, LINEERR_INVALCALLSTATE, LINEERR_NOTOWNER, LINEERR_INVALDIGITMODE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALDIGITS, LINEERR_OPERATIONFAILED, LINEERR_INVALPARAM, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegatherdigits
     */
    static lineGatherDigits(hCall, dwDigitModes, lpsDigits, dwNumDigits, lpszTerminationDigits, dwFirstDigitTimeout, dwInterDigitTimeout) {
        lpsDigits := lpsDigits is String? StrPtr(lpsDigits) : lpsDigits
        lpszTerminationDigits := lpszTerminationDigits is String? StrPtr(lpszTerminationDigits) : lpszTerminationDigits

        result := DllCall("TAPI32.dll\lineGatherDigits", "uint", hCall, "uint", dwDigitModes, "ptr", lpsDigits, "uint", dwNumDigits, "ptr", lpszTerminationDigits, "uint", dwFirstDigitTimeout, "uint", dwInterDigitTimeout, "int")
        return result
    }

    /**
     * The lineGatherDigits function initiates the buffered gathering of digits on the specified call. The application specifies a buffer in which to place the digits and the maximum number of digits to be collected.
     * @param {Integer} hCall Handle to the call on which digits are to be gathered. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @param {Integer} dwDigitModes Digit modes to be monitored. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * @param {Pointer<Byte>} lpsDigits Pointer to the buffer where detected digits are to be stored as text characters. Digits may not show up in the buffer one at a time as they are collected. Only after a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-gatherdigits">LINE_GATHERDIGITS</a> message is received should the content of the buffer be assumed to be valid. If <i>lpsDigits</i> is <b>NULL</b>, the digit gathering currently in progress on the call is terminated and <i>dwNumDigits</i> is ignored. Otherwise, <i>lpsDigits</i> is assumed to have room for <i>dwNumDigits</i> digits.
     * @param {Integer} dwNumDigits Number of digits to be collected before a LINE_GATHERDIGITS message is sent to the application. The <i>dwNumDigits</i> parameter is ignored when <i>lpsDigits</i> is <b>NULL</b>. This function fails if <i>dwNumDigits</i> is zero.
     * @param {Pointer<Byte>} lpszTerminationDigits <b>Null</b>-terminated string of termination digits as text characters. If one of the digits in the string is detected, that termination digit is appended to the buffer, digit collection is terminated, and the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-gatherdigits">LINE_GATHERDIGITS</a> message is sent to the application. 
     * 
     * 
     * 
     * 
     * The list of valid characters is dependent on the constant provided in <i>dwDigitModes</i>. For a list of the valid characters for each possible mode, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * 
     * If this pointer is <b>NULL</b>, or if it points to an empty string, the function behaves as though no termination digits were supplied.
     * @param {Integer} dwFirstDigitTimeout Time duration in milliseconds in which the first digit is expected. If the first digit is not received in this timeframe, digit collection is aborted and a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-gatherdigits">LINE_GATHERDIGITS</a> message is sent to the application. The buffer only contains the <b>NULL</b> character, indicating that no digits were received and the first digit timeout terminated digit gathering. The call's line-device capabilities specify the valid range for this parameter or indicate that timeouts are not supported.
     * @param {Integer} dwInterDigitTimeout Maximum time duration in milliseconds between consecutive digits. If no digit is received in this timeframe, digit collection is aborted and a LINE_GATHERDIGITS message is sent to the application. The buffer only contains the digits collected up to this point followed by a <b>NULL</b> character, indicating that an interdigit timeout terminated digit gathering. The call's line-device capabilities specify the valid range for this parameter or indicate that timeouts are not supported.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_NOMEM, LINEERR_INVALCALLSTATE, LINEERR_NOTOWNER, LINEERR_INVALDIGITMODE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALDIGITS, LINEERR_OPERATIONFAILED, LINEERR_INVALPARAM, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegatherdigitsa
     */
    static lineGatherDigitsA(hCall, dwDigitModes, lpsDigits, dwNumDigits, lpszTerminationDigits, dwFirstDigitTimeout, dwInterDigitTimeout) {
        lpsDigits := lpsDigits is String? StrPtr(lpsDigits) : lpsDigits
        lpszTerminationDigits := lpszTerminationDigits is String? StrPtr(lpszTerminationDigits) : lpszTerminationDigits

        result := DllCall("TAPI32.dll\lineGatherDigitsA", "uint", hCall, "uint", dwDigitModes, "ptr", lpsDigits, "uint", dwNumDigits, "ptr", lpszTerminationDigits, "uint", dwFirstDigitTimeout, "uint", dwInterDigitTimeout, "int")
        return result
    }

    /**
     * The lineGatherDigits function initiates the buffered gathering of digits on the specified call. The application specifies a buffer in which to place the digits and the maximum number of digits to be collected.
     * @param {Integer} hCall Handle to the call on which digits are to be gathered. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @param {Integer} dwDigitModes Digit modes to be monitored. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * @param {Pointer<Char>} lpsDigits Pointer to the buffer where detected digits are to be stored as text characters. Digits may not show up in the buffer one at a time as they are collected. Only after a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-gatherdigits">LINE_GATHERDIGITS</a> message is received should the content of the buffer be assumed to be valid. If <i>lpsDigits</i> is <b>NULL</b>, the digit gathering currently in progress on the call is terminated and <i>dwNumDigits</i> is ignored. Otherwise, <i>lpsDigits</i> is assumed to have room for <i>dwNumDigits</i> digits.
     * @param {Integer} dwNumDigits Number of digits to be collected before a LINE_GATHERDIGITS message is sent to the application. The <i>dwNumDigits</i> parameter is ignored when <i>lpsDigits</i> is <b>NULL</b>. This function fails if <i>dwNumDigits</i> is zero.
     * @param {Pointer<Char>} lpszTerminationDigits <b>Null</b>-terminated string of termination digits as text characters. If one of the digits in the string is detected, that termination digit is appended to the buffer, digit collection is terminated, and the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-gatherdigits">LINE_GATHERDIGITS</a> message is sent to the application. 
     * 
     * 
     * 
     * 
     * The list of valid characters is dependent on the constant provided in <i>dwDigitModes</i>. For a list of the valid characters for each possible mode, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * 
     * If this pointer is <b>NULL</b>, or if it points to an empty string, the function behaves as though no termination digits were supplied.
     * @param {Integer} dwFirstDigitTimeout Time duration in milliseconds in which the first digit is expected. If the first digit is not received in this timeframe, digit collection is aborted and a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-gatherdigits">LINE_GATHERDIGITS</a> message is sent to the application. The buffer only contains the <b>NULL</b> character, indicating that no digits were received and the first digit timeout terminated digit gathering. The call's line-device capabilities specify the valid range for this parameter or indicate that timeouts are not supported.
     * @param {Integer} dwInterDigitTimeout Maximum time duration in milliseconds between consecutive digits. If no digit is received in this timeframe, digit collection is aborted and a LINE_GATHERDIGITS message is sent to the application. The buffer only contains the digits collected up to this point followed by a <b>NULL</b> character, indicating that an interdigit timeout terminated digit gathering. The call's line-device capabilities specify the valid range for this parameter or indicate that timeouts are not supported.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_NOMEM, LINEERR_INVALCALLSTATE, LINEERR_NOTOWNER, LINEERR_INVALDIGITMODE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALDIGITS, LINEERR_OPERATIONFAILED, LINEERR_INVALPARAM, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegatherdigitsw
     */
    static lineGatherDigitsW(hCall, dwDigitModes, lpsDigits, dwNumDigits, lpszTerminationDigits, dwFirstDigitTimeout, dwInterDigitTimeout) {
        lpsDigits := lpsDigits is String? StrPtr(lpsDigits) : lpsDigits
        lpszTerminationDigits := lpszTerminationDigits is String? StrPtr(lpszTerminationDigits) : lpszTerminationDigits

        result := DllCall("TAPI32.dll\lineGatherDigitsW", "uint", hCall, "uint", dwDigitModes, "ptr", lpsDigits, "uint", dwNumDigits, "ptr", lpszTerminationDigits, "uint", dwFirstDigitTimeout, "uint", dwInterDigitTimeout, "int")
        return result
    }

    /**
     * Initiates the generation of the specified digits on the specified call as inband tones using the specified signaling mode.
     * @param {Integer} hCall Handle to the call. The application must be an owner of the call. Call state of <i>hCall</i> can be any state. TAPI does not impose any callstate requirements, however some Tapi Service Providers may require that the hCall be in the LINECALLSTATE_CONNECTED state.
     * @param {Integer} dwDigitMode Format to be used for signaling these digits. Be aware that <i>dwDigitMode</i> can only have a single flag set. This parameter uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * @param {Pointer<Byte>} lpszDigits Pointer to a <b>null</b>-terminated character buffer that contains the digits to be generated. Valid characters are those specified for the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a> provided in <i>dwDigitModes</i>. 
     * 
     * 
     * 
     * 
     * In addition, the comma (,)  is also a valid character. A comma injects an extra delay between the signaling of the previous and next digits it separates. The duration of this pause is configuration defined, and the line device capabilities indicate this duration. Multiple commas can be used to inject longer pauses. Invalid digits are ignored during the generation, rather than being reported as errors.
     * 
     * The exclamation (!) is a valid character. This character causes a "hookflash" operation, as described for <a href="https://docs.microsoft.com/windows/win32/tapi/address-ovr">dialable addresses</a>.
     * @param {Integer} dwDuration Both the duration in milliseconds of DTMF digits and pulse and DTMF inter-digit spacing. A value of 0 uses a default value. The <i>dwDuration</i> parameter must be within the range specified by <b>MinDialParams</b> and <b>MaxDialParams</b> in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>. If out of range, the actual value is set to the nearest value in the range.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_NOTOWNER, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALDIGITMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegeneratedigits
     */
    static lineGenerateDigits(hCall, dwDigitMode, lpszDigits, dwDuration) {
        lpszDigits := lpszDigits is String? StrPtr(lpszDigits) : lpszDigits

        result := DllCall("TAPI32.dll\lineGenerateDigits", "uint", hCall, "uint", dwDigitMode, "ptr", lpszDigits, "uint", dwDuration, "int")
        return result
    }

    /**
     * Initiates the generation of the specified digits on the specified call as inband tones using the specified signaling mode.
     * @param {Integer} hCall Handle to the call. The application must be an owner of the call. Call state of <i>hCall</i> can be any state. TAPI does not impose any callstate requirements, however some Tapi Service Providers may require that the hCall be in the LINECALLSTATE_CONNECTED state.
     * @param {Integer} dwDigitMode Format to be used for signaling these digits. Be aware that <i>dwDigitMode</i> can only have a single flag set. This parameter uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * @param {Pointer<Byte>} lpszDigits Pointer to a <b>null</b>-terminated character buffer that contains the digits to be generated. Valid characters are those specified for the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a> provided in <i>dwDigitModes</i>. 
     * 
     * 
     * 
     * 
     * In addition, the comma (,)  is also a valid character. A comma injects an extra delay between the signaling of the previous and next digits it separates. The duration of this pause is configuration defined, and the line device capabilities indicate this duration. Multiple commas can be used to inject longer pauses. Invalid digits are ignored during the generation, rather than being reported as errors.
     * 
     * The exclamation (!) is a valid character. This character causes a "hookflash" operation, as described for <a href="https://docs.microsoft.com/windows/win32/tapi/address-ovr">dialable addresses</a>.
     * @param {Integer} dwDuration Both the duration in milliseconds of DTMF digits and pulse and DTMF inter-digit spacing. A value of 0 uses a default value. The <i>dwDuration</i> parameter must be within the range specified by <b>MinDialParams</b> and <b>MaxDialParams</b> in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>. If out of range, the actual value is set to the nearest value in the range.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_NOTOWNER, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALDIGITMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegeneratedigitsa
     */
    static lineGenerateDigitsA(hCall, dwDigitMode, lpszDigits, dwDuration) {
        lpszDigits := lpszDigits is String? StrPtr(lpszDigits) : lpszDigits

        result := DllCall("TAPI32.dll\lineGenerateDigitsA", "uint", hCall, "uint", dwDigitMode, "ptr", lpszDigits, "uint", dwDuration, "int")
        return result
    }

    /**
     * Initiates the generation of the specified digits on the specified call as inband tones using the specified signaling mode.
     * @param {Integer} hCall Handle to the call. The application must be an owner of the call. Call state of <i>hCall</i> can be any state. TAPI does not impose any callstate requirements, however some Tapi Service Providers may require that the hCall be in the LINECALLSTATE_CONNECTED state.
     * @param {Integer} dwDigitMode Format to be used for signaling these digits. Be aware that <i>dwDigitMode</i> can only have a single flag set. This parameter uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * @param {Pointer<Char>} lpszDigits Pointer to a <b>null</b>-terminated character buffer that contains the digits to be generated. Valid characters are those specified for the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a> provided in <i>dwDigitModes</i>. 
     * 
     * 
     * 
     * 
     * In addition, the comma (,)  is also a valid character. A comma injects an extra delay between the signaling of the previous and next digits it separates. The duration of this pause is configuration defined, and the line device capabilities indicate this duration. Multiple commas can be used to inject longer pauses. Invalid digits are ignored during the generation, rather than being reported as errors.
     * 
     * The exclamation (!) is a valid character. This character causes a "hookflash" operation, as described for <a href="https://docs.microsoft.com/windows/win32/tapi/address-ovr">dialable addresses</a>.
     * @param {Integer} dwDuration Both the duration in milliseconds of DTMF digits and pulse and DTMF inter-digit spacing. A value of 0 uses a default value. The <i>dwDuration</i> parameter must be within the range specified by <b>MinDialParams</b> and <b>MaxDialParams</b> in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>. If out of range, the actual value is set to the nearest value in the range.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_NOTOWNER, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALDIGITMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegeneratedigitsw
     */
    static lineGenerateDigitsW(hCall, dwDigitMode, lpszDigits, dwDuration) {
        lpszDigits := lpszDigits is String? StrPtr(lpszDigits) : lpszDigits

        result := DllCall("TAPI32.dll\lineGenerateDigitsW", "uint", hCall, "uint", dwDigitMode, "ptr", lpszDigits, "uint", dwDuration, "int")
        return result
    }

    /**
     * The lineGenerateTone function generates the specified inband tone over the specified call.
     * @param {Integer} hCall Handle to the call on which a tone is to be generated. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @param {Integer} dwToneMode Defines the tone to be generated. Tones can be either standard or custom. A custom tone is composed of a set of arbitrary frequencies. A small number of standard tones are predefined. The duration of the tone is specified with <i>dwDuration</i> for both standard and custom tones. The <i>dwToneMode</i> parameter can only have one bit set. If no bits are set (the value 0 is passed), tone generation is canceled. This parameter uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetonemode--constants">LINETONEMODE_ Constants</a>.
     * @param {Integer} dwDuration Duration in milliseconds during which the tone should be sustained. A value of 0 for <i>dwDuration</i> uses a default duration for the specified tone. Default values are: 
     * 
     * 
     * 
     * 
     * CUSTOM: The tone is sustained until it is shut off, usually by user interaction or an equipment time-out.
     * 
     * RINGBACK: The tone is sustained until it is shut off, usually by user interaction or an equipment time-out.
     * 
     * BUSY: The tone is sustained until it is shut off, usually by user interaction or an equipment time-out.
     * 
     * BEEP: The tone is sustained until it is shut off, usually by user interaction or an equipment time-out.
     * 
     * BILLING: Fixed (single cycle).
     * @param {Integer} dwNumTones Number of entries in the <i>lpTones</i> array. This parameter is ignored if <i>dwToneMode</i> is not equal to CUSTOM.
     * @param {Pointer<LINEGENERATETONE>} lpTones Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linegeneratetone">LINEGENERATETONE</a> array that specifies the tone's components. This parameter is ignored for standard 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetonemode--constants">LINETONEMODE_ Constants</a> tones such as LINETONEMODE_BUSY. If <i>lpTones</i> is a multifrequency tone, the various tones are played simultaneously.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_NOTOWNER, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALPOINTER, LINEERR_OPERATIONFAILED, LINEERR_INVALTONEMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALTONE, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegeneratetone
     */
    static lineGenerateTone(hCall, dwToneMode, dwDuration, dwNumTones, lpTones) {
        result := DllCall("TAPI32.dll\lineGenerateTone", "uint", hCall, "uint", dwToneMode, "uint", dwDuration, "uint", dwNumTones, "ptr", lpTones, "int")
        return result
    }

    /**
     * The lineGetAddressCaps function queries the specified address on the specified line device to determine its telephony capabilities.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Line device containing the address to be queried.
     * @param {Integer} dwAddressID Address on the given line device whose capabilities are to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwAPIVersion Version number of the Telephony API to be used. The high-order word contains the major version number; the low-order word contains the minor version number. This number is obtained by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Version number of the service provider-specific extensions to be used. This number can be set to zero if no device-specific extensions are to be used. Otherwise, the high-order word contains the major version number; and the low-order word contains the minor version number.
     * @param {Pointer<LINEADDRESSCAPS>} lpAddressCaps Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddresscaps">LINEADDRESSCAPS</a>. Upon successful completion of the request, this structure is filled with address capabilities information. Prior to calling 
     * <b>lineGetAddressCaps</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NOMEM, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_OPERATIONFAILED, LINEERR_INCOMPATIBLEEXTVERSION, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALADDRESSID, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALAPPHANDLE, LINEERR_UNINITIALIZED, LINEERR_INVALPOINTER, LINEERR_OPERATIONUNAVAIL, LINEERR_NODRIVER, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetaddresscaps
     */
    static lineGetAddressCaps(hLineApp, dwDeviceID, dwAddressID, dwAPIVersion, dwExtVersion, lpAddressCaps) {
        result := DllCall("TAPI32.dll\lineGetAddressCaps", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAddressID, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", lpAddressCaps, "int")
        return result
    }

    /**
     * The lineGetAddressCaps function queries the specified address on the specified line device to determine its telephony capabilities.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Line device containing the address to be queried.
     * @param {Integer} dwAddressID Address on the given line device whose capabilities are to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwAPIVersion Version number of the Telephony API to be used. The high-order word contains the major version number; the low-order word contains the minor version number. This number is obtained by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Version number of the service provider-specific extensions to be used. This number can be set to zero if no device-specific extensions are to be used. Otherwise, the high-order word contains the major version number; and the low-order word contains the minor version number.
     * @param {Pointer<LINEADDRESSCAPS>} lpAddressCaps Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddresscaps">LINEADDRESSCAPS</a>. Upon successful completion of the request, this structure is filled with address capabilities information. Prior to calling 
     * <b>lineGetAddressCaps</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NOMEM, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_OPERATIONFAILED, LINEERR_INCOMPATIBLEEXTVERSION, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALADDRESSID, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALAPPHANDLE, LINEERR_UNINITIALIZED, LINEERR_INVALPOINTER, LINEERR_OPERATIONUNAVAIL, LINEERR_NODRIVER, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetaddresscapsa
     */
    static lineGetAddressCapsA(hLineApp, dwDeviceID, dwAddressID, dwAPIVersion, dwExtVersion, lpAddressCaps) {
        result := DllCall("TAPI32.dll\lineGetAddressCapsA", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAddressID, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", lpAddressCaps, "int")
        return result
    }

    /**
     * The lineGetAddressCaps function queries the specified address on the specified line device to determine its telephony capabilities.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Line device containing the address to be queried.
     * @param {Integer} dwAddressID Address on the given line device whose capabilities are to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwAPIVersion Version number of the Telephony API to be used. The high-order word contains the major version number; the low-order word contains the minor version number. This number is obtained by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Version number of the service provider-specific extensions to be used. This number can be set to zero if no device-specific extensions are to be used. Otherwise, the high-order word contains the major version number; and the low-order word contains the minor version number.
     * @param {Pointer<LINEADDRESSCAPS>} lpAddressCaps Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddresscaps">LINEADDRESSCAPS</a>. Upon successful completion of the request, this structure is filled with address capabilities information. Prior to calling 
     * <b>lineGetAddressCaps</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NOMEM, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_OPERATIONFAILED, LINEERR_INCOMPATIBLEEXTVERSION, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALADDRESSID, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALAPPHANDLE, LINEERR_UNINITIALIZED, LINEERR_INVALPOINTER, LINEERR_OPERATIONUNAVAIL, LINEERR_NODRIVER, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetaddresscapsw
     */
    static lineGetAddressCapsW(hLineApp, dwDeviceID, dwAddressID, dwAPIVersion, dwExtVersion, lpAddressCaps) {
        result := DllCall("TAPI32.dll\lineGetAddressCapsW", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAddressID, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", lpAddressCaps, "int")
        return result
    }

    /**
     * The lineGetAddressID function returns the address identifier associated with an address in a different format on the specified line.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Pointer<UInt32>} lpdwAddressID Pointer to a <b>DWORD</b>-sized memory location where the address identifier is returned. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwAddressMode Address mode of the address contained in <i>lpsAddress</i>. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddressmode--constants">LINEADDRESSMODE_ Constants</a>. You must specify LINEADDRESSMODE_DIALABLEADDR.
     * @param {Pointer<Byte>} lpsAddress Pointer to a data structure holding the address assigned to the specified line device. The format of the address is determined by <i>dwAddressMode</i>. Because the only valid value is LINEADDRESSMODE_DIALABLEADDR, <i>lpsAddress</i> uses the common dialable number format and is null-terminated.
     * @param {Integer} dwSize Size, in bytes, of the address contained in <i>lpsAddress</i>. The size of the string must include the null terminator.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESSMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALADDRESS, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetaddressid
     */
    static lineGetAddressID(hLine, lpdwAddressID, dwAddressMode, lpsAddress, dwSize) {
        lpsAddress := lpsAddress is String? StrPtr(lpsAddress) : lpsAddress

        result := DllCall("TAPI32.dll\lineGetAddressID", "uint", hLine, "uint*", lpdwAddressID, "uint", dwAddressMode, "ptr", lpsAddress, "uint", dwSize, "int")
        return result
    }

    /**
     * The lineGetAddressID function returns the address identifier associated with an address in a different format on the specified line.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Pointer<UInt32>} lpdwAddressID Pointer to a <b>DWORD</b>-sized memory location where the address identifier is returned. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwAddressMode Address mode of the address contained in <i>lpsAddress</i>. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddressmode--constants">LINEADDRESSMODE_ Constants</a>. You must specify LINEADDRESSMODE_DIALABLEADDR.
     * @param {Pointer<Byte>} lpsAddress Pointer to a data structure holding the address assigned to the specified line device. The format of the address is determined by <i>dwAddressMode</i>. Because the only valid value is LINEADDRESSMODE_DIALABLEADDR, <i>lpsAddress</i> uses the common dialable number format and is null-terminated.
     * @param {Integer} dwSize Size, in bytes, of the address contained in <i>lpsAddress</i>. The size of the string must include the null terminator.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESSMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALADDRESS, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetaddressida
     */
    static lineGetAddressIDA(hLine, lpdwAddressID, dwAddressMode, lpsAddress, dwSize) {
        lpsAddress := lpsAddress is String? StrPtr(lpsAddress) : lpsAddress

        result := DllCall("TAPI32.dll\lineGetAddressIDA", "uint", hLine, "uint*", lpdwAddressID, "uint", dwAddressMode, "ptr", lpsAddress, "uint", dwSize, "int")
        return result
    }

    /**
     * The lineGetAddressID function returns the address identifier associated with an address in a different format on the specified line.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Pointer<UInt32>} lpdwAddressID Pointer to a <b>DWORD</b>-sized memory location where the address identifier is returned. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwAddressMode Address mode of the address contained in <i>lpsAddress</i>. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddressmode--constants">LINEADDRESSMODE_ Constants</a>. You must specify LINEADDRESSMODE_DIALABLEADDR.
     * @param {Pointer<Char>} lpsAddress Pointer to a data structure holding the address assigned to the specified line device. The format of the address is determined by <i>dwAddressMode</i>. Because the only valid value is LINEADDRESSMODE_DIALABLEADDR, <i>lpsAddress</i> uses the common dialable number format and is null-terminated.
     * @param {Integer} dwSize Size, in bytes, of the address contained in <i>lpsAddress</i>. The size of the string must include the null terminator.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESSMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALADDRESS, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetaddressidw
     */
    static lineGetAddressIDW(hLine, lpdwAddressID, dwAddressMode, lpsAddress, dwSize) {
        lpsAddress := lpsAddress is String? StrPtr(lpsAddress) : lpsAddress

        result := DllCall("TAPI32.dll\lineGetAddressIDW", "uint", hLine, "uint*", lpdwAddressID, "uint", dwAddressMode, "ptr", lpsAddress, "uint", dwSize, "int")
        return result
    }

    /**
     * The lineGetAddressStatus function allows an application to query the specified address for its current status.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the given open line device. This is the address to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<LINEADDRESSSTATUS>} lpAddressStatus Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddressstatus">LINEADDRESSSTATUS</a>. Prior to calling 
     * <b>lineGetAddressStatus</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINEHANDLE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_OPERATIONUNAVAIL, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetaddressstatus
     */
    static lineGetAddressStatus(hLine, dwAddressID, lpAddressStatus) {
        result := DllCall("TAPI32.dll\lineGetAddressStatus", "uint", hLine, "uint", dwAddressID, "ptr", lpAddressStatus, "int")
        return result
    }

    /**
     * The lineGetAddressStatus function allows an application to query the specified address for its current status.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the given open line device. This is the address to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<LINEADDRESSSTATUS>} lpAddressStatus Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddressstatus">LINEADDRESSSTATUS</a>. Prior to calling 
     * <b>lineGetAddressStatus</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINEHANDLE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_OPERATIONUNAVAIL, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetaddressstatusa
     */
    static lineGetAddressStatusA(hLine, dwAddressID, lpAddressStatus) {
        result := DllCall("TAPI32.dll\lineGetAddressStatusA", "uint", hLine, "uint", dwAddressID, "ptr", lpAddressStatus, "int")
        return result
    }

    /**
     * The lineGetAddressStatus function allows an application to query the specified address for its current status.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the given open line device. This is the address to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<LINEADDRESSSTATUS>} lpAddressStatus Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddressstatus">LINEADDRESSSTATUS</a>. Prior to calling 
     * <b>lineGetAddressStatus</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINEHANDLE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_OPERATIONUNAVAIL, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetaddressstatusw
     */
    static lineGetAddressStatusW(hLine, dwAddressID, lpAddressStatus) {
        result := DllCall("TAPI32.dll\lineGetAddressStatusW", "uint", hLine, "uint", dwAddressID, "ptr", lpAddressStatus, "int")
        return result
    }

    /**
     * The lineGetAgentActivityList function obtains the identities of activities that the application can select using lineSetAgentActivity to indicate what function the agent is actually performing at the moment.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the open line device whose agent status is to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<LINEAGENTACTIVITYLIST>} lpAgentActivityList Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentactivitylist">LINEAGENTACTIVITYLIST</a>. Upon successful completion of the request, this structure is filled with a list of the agent activity codes that can be selected using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentactivity">lineSetAgentActivity</a>. Prior to calling 
     * <b>lineGetAgentActivityList</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, this function returns one of these negative error values:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_OPERATIONFAILED, LINEERR_INVALAGENTID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetagentactivitylista
     */
    static lineGetAgentActivityListA(hLine, dwAddressID, lpAgentActivityList) {
        result := DllCall("TAPI32.dll\lineGetAgentActivityListA", "uint", hLine, "uint", dwAddressID, "ptr", lpAgentActivityList, "int")
        return result
    }

    /**
     * The lineGetAgentActivityList function obtains the identities of activities that the application can select using lineSetAgentActivity to indicate what function the agent is actually performing at the moment.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the open line device whose agent status is to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<LINEAGENTACTIVITYLIST>} lpAgentActivityList Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentactivitylist">LINEAGENTACTIVITYLIST</a>. Upon successful completion of the request, this structure is filled with a list of the agent activity codes that can be selected using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentactivity">lineSetAgentActivity</a>. Prior to calling 
     * <b>lineGetAgentActivityList</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, this function returns one of these negative error values:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_OPERATIONFAILED, LINEERR_INVALAGENTID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetagentactivitylistw
     */
    static lineGetAgentActivityListW(hLine, dwAddressID, lpAgentActivityList) {
        result := DllCall("TAPI32.dll\lineGetAgentActivityListW", "uint", hLine, "uint", dwAddressID, "ptr", lpAgentActivityList, "int")
        return result
    }

    /**
     * The lineGetAgentCaps function obtains the agent-related capabilities supported on the specified line device. If a specific agent is named, the capabilities include a listing of ACD groups into which the agent is permitted to log in.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Line device containing the address to be queried.
     * @param {Integer} dwAddressID Address on the given line device whose capabilities are to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwAppAPIVersion Highest API version supported by the application. This should not be the value negotiated using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on the device being queried.
     * @param {Pointer<LINEAGENTCAPS>} lpAgentCaps Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentcaps">LINEAGENTCAPS</a>. Upon successful completion of the request, this structure is filled with agent capabilities information. Prior to calling 
     * <b>lineGetAgentCaps</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, this function returns one of these negative error values:
     * 
     * LINEERR_BADDEVICEID, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_INVALADDRESSID, LINEERR_INVALAPPHANDLE, LINEERR_INVALPOINTER, LINEERR_NODEVICE, LINEERR_NODRIVER, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_STRUCTURETOOSMALL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetagentcapsa
     */
    static lineGetAgentCapsA(hLineApp, dwDeviceID, dwAddressID, dwAppAPIVersion, lpAgentCaps) {
        result := DllCall("TAPI32.dll\lineGetAgentCapsA", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAddressID, "uint", dwAppAPIVersion, "ptr", lpAgentCaps, "int")
        return result
    }

    /**
     * The lineGetAgentCaps function obtains the agent-related capabilities supported on the specified line device. If a specific agent is named, the capabilities include a listing of ACD groups into which the agent is permitted to log in.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Line device containing the address to be queried.
     * @param {Integer} dwAddressID Address on the given line device whose capabilities are to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwAppAPIVersion Highest API version supported by the application. This should not be the value negotiated using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on the device being queried.
     * @param {Pointer<LINEAGENTCAPS>} lpAgentCaps Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentcaps">LINEAGENTCAPS</a>. Upon successful completion of the request, this structure is filled with agent capabilities information. Prior to calling 
     * <b>lineGetAgentCaps</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, this function returns one of these negative error values:
     * 
     * LINEERR_BADDEVICEID, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_INVALADDRESSID, LINEERR_INVALAPPHANDLE, LINEERR_INVALPOINTER, LINEERR_NODEVICE, LINEERR_NODRIVER, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_STRUCTURETOOSMALL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetagentcapsw
     */
    static lineGetAgentCapsW(hLineApp, dwDeviceID, dwAddressID, dwAppAPIVersion, lpAgentCaps) {
        result := DllCall("TAPI32.dll\lineGetAgentCapsW", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAddressID, "uint", dwAppAPIVersion, "ptr", lpAgentCaps, "int")
        return result
    }

    /**
     * The lineGetAgentGroupList function obtains the identities of agent groups (combination of queue, supervisor, skill level, and so on) into which the agent currently logged in on the workstation is permitted to log into on the automatic call distributor.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the open line device whose agent status is to be queried.
     * @param {Pointer<LINEAGENTGROUPLIST>} lpAgentGroupList Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgrouplist">LINEAGENTGROUPLIST</a>. Upon successful completion of the request, this structure is filled with a list of the agent groups into which the agent can log in at this time (which should include any groups into which the agent is already logged in, if any).
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, this function returns one of these negative error values:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_INVALAGENTID, LINEERR_INVALLINEHANDLE, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_STRUCTURETOOSMALL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetagentgrouplista
     */
    static lineGetAgentGroupListA(hLine, dwAddressID, lpAgentGroupList) {
        result := DllCall("TAPI32.dll\lineGetAgentGroupListA", "uint", hLine, "uint", dwAddressID, "ptr", lpAgentGroupList, "int")
        return result
    }

    /**
     * The lineGetAgentGroupList function obtains the identities of agent groups (combination of queue, supervisor, skill level, and so on) into which the agent currently logged in on the workstation is permitted to log into on the automatic call distributor.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the open line device whose agent status is to be queried.
     * @param {Pointer<LINEAGENTGROUPLIST>} lpAgentGroupList Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgrouplist">LINEAGENTGROUPLIST</a>. Upon successful completion of the request, this structure is filled with a list of the agent groups into which the agent can log in at this time (which should include any groups into which the agent is already logged in, if any).
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, this function returns one of these negative error values:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_INVALAGENTID, LINEERR_INVALLINEHANDLE, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_STRUCTURETOOSMALL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetagentgrouplistw
     */
    static lineGetAgentGroupListW(hLine, dwAddressID, lpAgentGroupList) {
        result := DllCall("TAPI32.dll\lineGetAgentGroupListW", "uint", hLine, "uint", dwAddressID, "ptr", lpAgentGroupList, "int")
        return result
    }

    /**
     * The lineGetAgentInfo function returns a structure holding the ACD information associated with a particular agent handle.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} hAgent Identifier of the agent whose information is to be retrieved.
     * @param {Pointer<LINEAGENTINFO>} lpAgentInfo Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentinfo">LINEAGENTINFO</a>. If the request succeeds, this structure is filled with the agent statistics.
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetagentinfo
     */
    static lineGetAgentInfo(hLine, hAgent, lpAgentInfo) {
        result := DllCall("TAPI32.dll\lineGetAgentInfo", "uint", hLine, "uint", hAgent, "ptr", lpAgentInfo, "int")
        return result
    }

    /**
     * The lineGetAgentSessionInfo function returns a structure that holds the ACD information associated with a particular agent session handle.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} hAgentSession Identifier of the agent session whose information is to be retrieved.
     * @param {Pointer<LINEAGENTSESSIONINFO>} lpAgentSessionInfo Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentsessioninfo">LINEAGENTSESSIONINFO</a>. Upon successful completion of the request, this structure is filled with the agent session statistics. Prior to calling the 
     * <b>lineGetAgentSessionInfo</b> function, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that memory could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetagentsessioninfo
     */
    static lineGetAgentSessionInfo(hLine, hAgentSession, lpAgentSessionInfo) {
        result := DllCall("TAPI32.dll\lineGetAgentSessionInfo", "uint", hLine, "uint", hAgentSession, "ptr", lpAgentSessionInfo, "int")
        return result
    }

    /**
     * The lineGetAgentSessionList function returns a list of agent sessions created for the specified agent.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} hAgent Identifier of the agent whose information is to be retrieved.
     * @param {Pointer<LINEAGENTSESSIONLIST>} lpAgentSessionList Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentsessionlist">LINEAGENTSESSIONLIST</a>. Upon successful completion of the request, this structure is filled with a list of the agent sessions that have been created for this agent. Prior to calling the 
     * <b>lineGetAgentSessionList</b> function, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that memory could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetagentsessionlist
     */
    static lineGetAgentSessionList(hLine, hAgent, lpAgentSessionList) {
        result := DllCall("TAPI32.dll\lineGetAgentSessionList", "uint", hLine, "uint", hAgent, "ptr", lpAgentSessionList, "int")
        return result
    }

    /**
     * The lineGetAgentStatus function obtains the agent-related status on the specified address.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the open line device whose agent status is to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<LINEAGENTSTATUS>} lpAgentStatus Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentstatus">LINEAGENTSTATUS</a>. Upon successful completion of the request, this structure is filled with agent status information. Prior to calling 
     * <b>lineGetAgentStatus</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that memory could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, one of these negative error values:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_INVALLINEHANDLE, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_STRUCTURETOOSMALL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetagentstatusa
     */
    static lineGetAgentStatusA(hLine, dwAddressID, lpAgentStatus) {
        result := DllCall("TAPI32.dll\lineGetAgentStatusA", "uint", hLine, "uint", dwAddressID, "ptr", lpAgentStatus, "int")
        return result
    }

    /**
     * The lineGetAgentStatus function obtains the agent-related status on the specified address.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the open line device whose agent status is to be queried. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<LINEAGENTSTATUS>} lpAgentStatus Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentstatus">LINEAGENTSTATUS</a>. Upon successful completion of the request, this structure is filled with agent status information. Prior to calling 
     * <b>lineGetAgentStatus</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that memory could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, one of these negative error values:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_INVALLINEHANDLE, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_STRUCTURETOOSMALL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetagentstatusw
     */
    static lineGetAgentStatusW(hLine, dwAddressID, lpAgentStatus) {
        result := DllCall("TAPI32.dll\lineGetAgentStatusW", "uint", hLine, "uint", dwAddressID, "ptr", lpAgentStatus, "int")
        return result
    }

    /**
     * Enables an application to determine whether or not it is in the handoff priority list for a particular media mode or Assisted Telephony request mode and, if so, its position in the priority list.
     * @param {Pointer<Byte>} lpszAppFilename A pointer to a string that contains the application executable module file name, without directory data. In API version 2.0 or later, the parameter can be in long file name format, of which the 8.3 file name format is a proper subset. Long file names, unlike 8.3 file names, are case preserving. Neither file name format is case sensitive. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">File Name Conventions</a>. In API versions earlier than 2.0, the parameter must specify a file name in the 8.3 format; long file names cannot be used.
     * @param {Integer} dwMediaMode A media mode for which the priority data is to be obtained. The value can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>; only a single bit can be on. The value 0 should be used if verifying application priority for Assisted Telephony requests.
     * @param {Pointer<LINEEXTENSIONID>} lpExtensionID A pointer to structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineextensionid">LINEEXTENSIONID</a>. This parameter is ignored.
     * @param {Integer} dwRequestMode The conditions for this parameter are, if the <i>dwMediaMode</i> parameter is zero, this parameter specifies the Assisted Telephony request mode for which priority is to be checked. It must be LINEREQUESTMODE_MAKECALL. This parameter is ignored if <i>dwMediaMode</i> is non-zero.
     * @param {Pointer<VARSTRING>} lpExtensionName This parameter is ignored.
     * @param {Pointer<UInt32>} lpdwPriority A pointer to a <b>DWORD</b>-size memory location into which TAPI writes the priority of the application for the specified media or request mode. The value 0 is returned if the application is not in the stored priority list and does not currently have any line device open with ownership requested of the specified media mode or having registered for the specified request mode. 
     * 
     * 
     * 
     * 
     * In API versions earlier than 2.0, the value –1 (0xFFFFFFFF) is returned if the application has the line open for the specified media mode or has registered for the specified requests, but the application is not in the stored priority list; that is, it is in the temporary priority list only. In API version 2.0 or later, the value 0 is returned to indicate this condition.
     * 
     * Otherwise, the value indicates the application position in the list; 1 being highest priority, and increasing values indicating decreasing priority.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * <b>LINEERR_INIFILECORRUPT</b>, <b>LINEERR_INVALREQUESTMODE</b>, <b>LINEERR_INVALAPPNAME</b>, <b>LINEERR_NOMEM</b>, <b>LINEERR_INVALMEDIAMODE</b>, <b>LINEERR_OPERATIONFAILED</b>, <b>LINEERR_INVALPOINTER</b>, <b>LINEERR_STRUCTURETOOSMALL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetapppriority
     */
    static lineGetAppPriority(lpszAppFilename, dwMediaMode, lpExtensionID, dwRequestMode, lpExtensionName, lpdwPriority) {
        lpszAppFilename := lpszAppFilename is String? StrPtr(lpszAppFilename) : lpszAppFilename

        result := DllCall("TAPI32.dll\lineGetAppPriority", "ptr", lpszAppFilename, "uint", dwMediaMode, "ptr", lpExtensionID, "uint", dwRequestMode, "ptr", lpExtensionName, "uint*", lpdwPriority, "int")
        return result
    }

    /**
     * Enables an application to determine whether or not it is in the handoff priority list for a particular media mode or Assisted Telephony request mode and, if so, its position in the priority list.
     * @param {Pointer<Byte>} lpszAppFilename A pointer to a string that contains the application executable module file name, without directory data. In API version 2.0 or later, the parameter can be in long file name format, of which the 8.3 file name format is a proper subset. Long file names, unlike 8.3 file names, are case preserving. Neither file name format is case sensitive. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">File Name Conventions</a>. In API versions earlier than 2.0, the parameter must specify a file name in the 8.3 format; long file names cannot be used.
     * @param {Integer} dwMediaMode A media mode for which the priority data is to be obtained. The value can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>; only a single bit can be on. The value 0 should be used if verifying application priority for Assisted Telephony requests.
     * @param {Pointer<LINEEXTENSIONID>} lpExtensionID A pointer to structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineextensionid">LINEEXTENSIONID</a>. This parameter is ignored.
     * @param {Integer} dwRequestMode The conditions for this parameter are, if the <i>dwMediaMode</i> parameter is zero, this parameter specifies the Assisted Telephony request mode for which priority is to be checked. It must be LINEREQUESTMODE_MAKECALL. This parameter is ignored if <i>dwMediaMode</i> is non-zero.
     * @param {Pointer<VARSTRING>} lpExtensionName This parameter is ignored.
     * @param {Pointer<UInt32>} lpdwPriority A pointer to a <b>DWORD</b>-size memory location into which TAPI writes the priority of the application for the specified media or request mode. The value 0 is returned if the application is not in the stored priority list and does not currently have any line device open with ownership requested of the specified media mode or having registered for the specified request mode. 
     * 
     * 
     * 
     * 
     * In API versions earlier than 2.0, the value –1 (0xFFFFFFFF) is returned if the application has the line open for the specified media mode or has registered for the specified requests, but the application is not in the stored priority list; that is, it is in the temporary priority list only. In API version 2.0 or later, the value 0 is returned to indicate this condition.
     * 
     * Otherwise, the value indicates the application position in the list; 1 being highest priority, and increasing values indicating decreasing priority.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * <b>LINEERR_INIFILECORRUPT</b>, <b>LINEERR_INVALREQUESTMODE</b>, <b>LINEERR_INVALAPPNAME</b>, <b>LINEERR_NOMEM</b>, <b>LINEERR_INVALMEDIAMODE</b>, <b>LINEERR_OPERATIONFAILED</b>, <b>LINEERR_INVALPOINTER</b>, <b>LINEERR_STRUCTURETOOSMALL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetappprioritya
     */
    static lineGetAppPriorityA(lpszAppFilename, dwMediaMode, lpExtensionID, dwRequestMode, lpExtensionName, lpdwPriority) {
        lpszAppFilename := lpszAppFilename is String? StrPtr(lpszAppFilename) : lpszAppFilename

        result := DllCall("TAPI32.dll\lineGetAppPriorityA", "ptr", lpszAppFilename, "uint", dwMediaMode, "ptr", lpExtensionID, "uint", dwRequestMode, "ptr", lpExtensionName, "uint*", lpdwPriority, "int")
        return result
    }

    /**
     * Enables an application to determine whether or not it is in the handoff priority list for a particular media mode or Assisted Telephony request mode and, if so, its position in the priority list.
     * @param {Pointer<Char>} lpszAppFilename A pointer to a string that contains the application executable module file name, without directory data. In API version 2.0 or later, the parameter can be in long file name format, of which the 8.3 file name format is a proper subset. Long file names, unlike 8.3 file names, are case preserving. Neither file name format is case sensitive. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">File Name Conventions</a>. In API versions earlier than 2.0, the parameter must specify a file name in the 8.3 format; long file names cannot be used.
     * @param {Integer} dwMediaMode A media mode for which the priority data is to be obtained. The value can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>; only a single bit can be on. The value 0 should be used if verifying application priority for Assisted Telephony requests.
     * @param {Pointer<LINEEXTENSIONID>} lpExtensionID A pointer to structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineextensionid">LINEEXTENSIONID</a>. This parameter is ignored.
     * @param {Integer} dwRequestMode The conditions for this parameter are, if the <i>dwMediaMode</i> parameter is zero, this parameter specifies the Assisted Telephony request mode for which priority is to be checked. It must be LINEREQUESTMODE_MAKECALL. This parameter is ignored if <i>dwMediaMode</i> is non-zero.
     * @param {Pointer<VARSTRING>} lpExtensionName This parameter is ignored.
     * @param {Pointer<UInt32>} lpdwPriority A pointer to a <b>DWORD</b>-size memory location into which TAPI writes the priority of the application for the specified media or request mode. The value 0 is returned if the application is not in the stored priority list and does not currently have any line device open with ownership requested of the specified media mode or having registered for the specified request mode. 
     * 
     * 
     * 
     * 
     * In API versions earlier than 2.0, the value –1 (0xFFFFFFFF) is returned if the application has the line open for the specified media mode or has registered for the specified requests, but the application is not in the stored priority list; that is, it is in the temporary priority list only. In API version 2.0 or later, the value 0 is returned to indicate this condition.
     * 
     * Otherwise, the value indicates the application position in the list; 1 being highest priority, and increasing values indicating decreasing priority.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * <b>LINEERR_INIFILECORRUPT</b>, <b>LINEERR_INVALREQUESTMODE</b>, <b>LINEERR_INVALAPPNAME</b>, <b>LINEERR_NOMEM</b>, <b>LINEERR_INVALMEDIAMODE</b>, <b>LINEERR_OPERATIONFAILED</b>, <b>LINEERR_INVALPOINTER</b>, <b>LINEERR_STRUCTURETOOSMALL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetapppriorityw
     */
    static lineGetAppPriorityW(lpszAppFilename, dwMediaMode, lpExtensionID, dwRequestMode, lpExtensionName, lpdwPriority) {
        lpszAppFilename := lpszAppFilename is String? StrPtr(lpszAppFilename) : lpszAppFilename

        result := DllCall("TAPI32.dll\lineGetAppPriorityW", "ptr", lpszAppFilename, "uint", dwMediaMode, "ptr", lpExtensionID, "uint", dwRequestMode, "ptr", lpExtensionName, "uint*", lpdwPriority, "int")
        return result
    }

    /**
     * The lineGetCallInfo function enables an application to obtain fixed information about the specified call.
     * @param {Integer} hCall Handle to the call to be queried. The call state of <i>hCall</i> can be any state.
     * @param {Pointer<LINECALLINFO>} lpCallInfo Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a>. Upon successful completion of the request, this structure is filled with call-related information. Prior to calling 
     * <b>lineGetCallInfo</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetcallinfo
     */
    static lineGetCallInfo(hCall, lpCallInfo) {
        result := DllCall("TAPI32.dll\lineGetCallInfo", "uint", hCall, "ptr", lpCallInfo, "int")
        return result
    }

    /**
     * The lineGetCallInfo function enables an application to obtain fixed information about the specified call.
     * @param {Integer} hCall Handle to the call to be queried. The call state of <i>hCall</i> can be any state.
     * @param {Pointer<LINECALLINFO>} lpCallInfo Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a>. Upon successful completion of the request, this structure is filled with call-related information. Prior to calling 
     * <b>lineGetCallInfo</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetcallinfoa
     */
    static lineGetCallInfoA(hCall, lpCallInfo) {
        result := DllCall("TAPI32.dll\lineGetCallInfoA", "uint", hCall, "ptr", lpCallInfo, "int")
        return result
    }

    /**
     * The lineGetCallInfo function enables an application to obtain fixed information about the specified call.
     * @param {Integer} hCall Handle to the call to be queried. The call state of <i>hCall</i> can be any state.
     * @param {Pointer<LINECALLINFO>} lpCallInfo Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a>. Upon successful completion of the request, this structure is filled with call-related information. Prior to calling 
     * <b>lineGetCallInfo</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetcallinfow
     */
    static lineGetCallInfoW(hCall, lpCallInfo) {
        result := DllCall("TAPI32.dll\lineGetCallInfoW", "uint", hCall, "ptr", lpCallInfo, "int")
        return result
    }

    /**
     * The lineGetCallStatus function returns the current status of the specified call.
     * @param {Integer} hCall Handle to the call to be queried. The call state of <i>hCall</i> can be any state.
     * @param {Pointer<LINECALLSTATUS>} lpCallStatus Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallstatus">LINECALLSTATUS</a>. Upon successful completion of the request, this structure is filled with call status information. Prior to calling 
     * <b>lineGetCallStatus</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetcallstatus
     */
    static lineGetCallStatus(hCall, lpCallStatus) {
        result := DllCall("TAPI32.dll\lineGetCallStatus", "uint", hCall, "ptr", lpCallStatus, "int")
        return result
    }

    /**
     * The lineGetConfRelatedCalls function returns a list of call handles that are part of the same conference call as the specified call.
     * @param {Integer} hCall Handle to a call. This is either a conference call or a participant call in a conference call. For a conference parent call, the call state of <i>hCall</i> can be any state. For a conference participant call, it must be in the <i>conferenced</i> state.
     * @param {Pointer<LINECALLLIST>} lpCallList Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecalllist">LINECALLLIST</a>. Upon successful completion of the request, call handles to all calls in the conference call are returned in this structure. The first call in the list is the conference call, the other calls are the participant calls. The application is granted monitor privilege to those calls for which it does not already have handles; the privileges to calls in the list for which the application already has handles is unchanged. Prior to calling 
     * <b>lineGetConfRelatedCalls</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_NOCONFERENCE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetconfrelatedcalls
     */
    static lineGetConfRelatedCalls(hCall, lpCallList) {
        result := DllCall("TAPI32.dll\lineGetConfRelatedCalls", "uint", hCall, "ptr", lpCallList, "int")
        return result
    }

    /**
     * The lineGetCountry function fetches the stored dialing rules and other information related to a specified country/region, the first country/region in the country/region list, or all countries/regions.
     * @param {Integer} dwCountryID Country/region identifier (not the country code) of the country/region for which information is to be obtained. If the value 1 is specified, information on the first country/region in the country/region list is obtained. If the value 0 is specified, information on all countries/regions is obtained (which can require a great deal of memory — 20 KB or more).
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<LINECOUNTRYLIST>} lpLineCountryList Pointer to a location to which a <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecountrylist">LINECOUNTRYLIST</a> structure is loaded. Prior to calling 
     * <b>lineGetCountry</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INIFILECORRUPT, LINEERR_OPERATIONFAILED, LINEERR_INVALCOUNTRYCODE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetcountry
     */
    static lineGetCountry(dwCountryID, dwAPIVersion, lpLineCountryList) {
        result := DllCall("TAPI32.dll\lineGetCountry", "uint", dwCountryID, "uint", dwAPIVersion, "ptr", lpLineCountryList, "int")
        return result
    }

    /**
     * The lineGetCountry function fetches the stored dialing rules and other information related to a specified country/region, the first country/region in the country/region list, or all countries/regions.
     * @param {Integer} dwCountryID Country/region identifier (not the country code) of the country/region for which information is to be obtained. If the value 1 is specified, information on the first country/region in the country/region list is obtained. If the value 0 is specified, information on all countries/regions is obtained (which can require a great deal of memory — 20 KB or more).
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<LINECOUNTRYLIST>} lpLineCountryList Pointer to a location to which a <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecountrylist">LINECOUNTRYLIST</a> structure is loaded. Prior to calling 
     * <b>lineGetCountry</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INIFILECORRUPT, LINEERR_OPERATIONFAILED, LINEERR_INVALCOUNTRYCODE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetcountrya
     */
    static lineGetCountryA(dwCountryID, dwAPIVersion, lpLineCountryList) {
        result := DllCall("TAPI32.dll\lineGetCountryA", "uint", dwCountryID, "uint", dwAPIVersion, "ptr", lpLineCountryList, "int")
        return result
    }

    /**
     * The lineGetCountry function fetches the stored dialing rules and other information related to a specified country/region, the first country/region in the country/region list, or all countries/regions.
     * @param {Integer} dwCountryID Country/region identifier (not the country code) of the country/region for which information is to be obtained. If the value 1 is specified, information on the first country/region in the country/region list is obtained. If the value 0 is specified, information on all countries/regions is obtained (which can require a great deal of memory — 20 KB or more).
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<LINECOUNTRYLIST>} lpLineCountryList Pointer to a location to which a <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecountrylist">LINECOUNTRYLIST</a> structure is loaded. Prior to calling 
     * <b>lineGetCountry</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INIFILECORRUPT, LINEERR_OPERATIONFAILED, LINEERR_INVALCOUNTRYCODE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetcountryw
     */
    static lineGetCountryW(dwCountryID, dwAPIVersion, lpLineCountryList) {
        result := DllCall("TAPI32.dll\lineGetCountryW", "uint", dwCountryID, "uint", dwAPIVersion, "ptr", lpLineCountryList, "int")
        return result
    }

    /**
     * The lineGetDevCaps function queries a specified line device to determine its telephony capabilities. The returned information is valid for all addresses on the line device.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifier of the line device to be queried.
     * @param {Integer} dwAPIVersion Version number of the Telephony API to be used. The high-order word contains the major version number; the low-order word contains the minor version number. This number is obtained by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Version number of the service provider-specific extensions to be used. This number is obtained by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateextversion">lineNegotiateExtVersion</a>. It can be left zero if no device-specific extensions are to be used. Otherwise, the high-order word contains the major version number; the low-order word contains the minor version number.
     * @param {Pointer<LINEDEVCAPS>} lpLineDevCaps Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>. Upon successful completion of the request, this structure is filled with line device capabilities information. Prior to calling 
     * <b>lineGetDevCaps</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NOMEM, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_OPERATIONFAILED, LINEERR_INCOMPATIBLEEXTVERSION, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALAPPHANDLE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NODRIVER, LINEERR_OPERATIONUNAVAIL, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetdevcaps
     */
    static lineGetDevCaps(hLineApp, dwDeviceID, dwAPIVersion, dwExtVersion, lpLineDevCaps) {
        result := DllCall("TAPI32.dll\lineGetDevCaps", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", lpLineDevCaps, "int")
        return result
    }

    /**
     * The lineGetDevCaps function queries a specified line device to determine its telephony capabilities. The returned information is valid for all addresses on the line device.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifier of the line device to be queried.
     * @param {Integer} dwAPIVersion Version number of the Telephony API to be used. The high-order word contains the major version number; the low-order word contains the minor version number. This number is obtained by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Version number of the service provider-specific extensions to be used. This number is obtained by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateextversion">lineNegotiateExtVersion</a>. It can be left zero if no device-specific extensions are to be used. Otherwise, the high-order word contains the major version number; the low-order word contains the minor version number.
     * @param {Pointer<LINEDEVCAPS>} lpLineDevCaps Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>. Upon successful completion of the request, this structure is filled with line device capabilities information. Prior to calling 
     * <b>lineGetDevCaps</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NOMEM, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_OPERATIONFAILED, LINEERR_INCOMPATIBLEEXTVERSION, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALAPPHANDLE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NODRIVER, LINEERR_OPERATIONUNAVAIL, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetdevcapsa
     */
    static lineGetDevCapsA(hLineApp, dwDeviceID, dwAPIVersion, dwExtVersion, lpLineDevCaps) {
        result := DllCall("TAPI32.dll\lineGetDevCapsA", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", lpLineDevCaps, "int")
        return result
    }

    /**
     * The lineGetDevCaps function queries a specified line device to determine its telephony capabilities. The returned information is valid for all addresses on the line device.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifier of the line device to be queried.
     * @param {Integer} dwAPIVersion Version number of the Telephony API to be used. The high-order word contains the major version number; the low-order word contains the minor version number. This number is obtained by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Version number of the service provider-specific extensions to be used. This number is obtained by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateextversion">lineNegotiateExtVersion</a>. It can be left zero if no device-specific extensions are to be used. Otherwise, the high-order word contains the major version number; the low-order word contains the minor version number.
     * @param {Pointer<LINEDEVCAPS>} lpLineDevCaps Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>. Upon successful completion of the request, this structure is filled with line device capabilities information. Prior to calling 
     * <b>lineGetDevCaps</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NOMEM, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_OPERATIONFAILED, LINEERR_INCOMPATIBLEEXTVERSION, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALAPPHANDLE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NODRIVER, LINEERR_OPERATIONUNAVAIL, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetdevcapsw
     */
    static lineGetDevCapsW(hLineApp, dwDeviceID, dwAPIVersion, dwExtVersion, lpLineDevCaps) {
        result := DllCall("TAPI32.dll\lineGetDevCapsW", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", lpLineDevCaps, "int")
        return result
    }

    /**
     * The lineGetDevConfig function returns an &quot;opaque&quot; data structure object, the contents of which are specific to the line (service provider) and device class.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<VARSTRING>} lpDeviceConfig Pointer to the memory location of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> where the device configuration structure is returned. Upon successful completion of the request, this location is filled with the device configuration. The <b>dwStringFormat</b> member in the 
     * <b>VARSTRING</b> structure is set to STRINGFORMAT_BINARY. Prior to calling 
     * <b>lineGetDevConfig</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose configuration is requested. Valid device class 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a> strings are the same as those specified for the function.
     * @returns {Integer} Returns zero if the function succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INVALDEVICECLASS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_STRUCTURETOOSMALL, LINEERR_OPERATIONFAILED, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetdevconfig
     */
    static lineGetDevConfig(dwDeviceID, lpDeviceConfig, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineGetDevConfig", "uint", dwDeviceID, "ptr", lpDeviceConfig, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineGetDevConfig function returns an &quot;opaque&quot; data structure object, the contents of which are specific to the line (service provider) and device class.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<VARSTRING>} lpDeviceConfig Pointer to the memory location of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> where the device configuration structure is returned. Upon successful completion of the request, this location is filled with the device configuration. The <b>dwStringFormat</b> member in the 
     * <b>VARSTRING</b> structure is set to STRINGFORMAT_BINARY. Prior to calling 
     * <b>lineGetDevConfig</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose configuration is requested. Valid device class 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a> strings are the same as those specified for the function.
     * @returns {Integer} Returns zero if the function succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INVALDEVICECLASS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_STRUCTURETOOSMALL, LINEERR_OPERATIONFAILED, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetdevconfiga
     */
    static lineGetDevConfigA(dwDeviceID, lpDeviceConfig, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineGetDevConfigA", "uint", dwDeviceID, "ptr", lpDeviceConfig, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineGetDevConfig function returns an &quot;opaque&quot; data structure object, the contents of which are specific to the line (service provider) and device class.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<VARSTRING>} lpDeviceConfig Pointer to the memory location of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> where the device configuration structure is returned. Upon successful completion of the request, this location is filled with the device configuration. The <b>dwStringFormat</b> member in the 
     * <b>VARSTRING</b> structure is set to STRINGFORMAT_BINARY. Prior to calling 
     * <b>lineGetDevConfig</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @param {Pointer<Char>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose configuration is requested. Valid device class 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a> strings are the same as those specified for the function.
     * @returns {Integer} Returns zero if the function succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INVALDEVICECLASS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_STRUCTURETOOSMALL, LINEERR_OPERATIONFAILED, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetdevconfigw
     */
    static lineGetDevConfigW(dwDeviceID, lpDeviceConfig, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineGetDevConfigW", "uint", dwDeviceID, "ptr", lpDeviceConfig, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineGetGroupList function returns a list of ACD groups available on the ACD system.
     * @param {Integer} hLine Handle to the line device.
     * @param {Pointer<LINEAGENTGROUPLIST>} lpGroupList Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgrouplist">LINEAGENTGROUPLIST</a>. Upon successful completion of the request, this structure is filled with a list of the available ACD groups. Prior to calling the 
     * <b>lineGetGroupList</b> function, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetgrouplista
     */
    static lineGetGroupListA(hLine, lpGroupList) {
        result := DllCall("TAPI32.dll\lineGetGroupListA", "uint", hLine, "ptr", lpGroupList, "int")
        return result
    }

    /**
     * The lineGetGroupList function returns a list of ACD groups available on the ACD system.
     * @param {Integer} hLine Handle to the line device.
     * @param {Pointer<LINEAGENTGROUPLIST>} lpGroupList Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgrouplist">LINEAGENTGROUPLIST</a>. Upon successful completion of the request, this structure is filled with a list of the available ACD groups. Prior to calling the 
     * <b>lineGetGroupList</b> function, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetgrouplistw
     */
    static lineGetGroupListW(hLine, lpGroupList) {
        result := DllCall("TAPI32.dll\lineGetGroupListW", "uint", hLine, "ptr", lpGroupList, "int")
        return result
    }

    /**
     * The lineGetIcon function allows an application to retrieve a service line device-specific (or provider-specific) icon for display to the user.
     * @param {Integer} dwDeviceID Identifier of the line device whose icon is requested.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific sub-icon applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest-level icon associated with the line device rather than a specified media stream device would be selected.
     * @param {Pointer<Void>} lphIcon Pointer to a memory location in which the handle to the icon is returned.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALDEVICECLASS, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegeticon
     */
    static lineGetIcon(dwDeviceID, lpszDeviceClass, lphIcon) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineGetIcon", "uint", dwDeviceID, "ptr", lpszDeviceClass, "ptr", lphIcon, "int")
        return result
    }

    /**
     * The lineGetIcon function allows an application to retrieve a service line device-specific (or provider-specific) icon for display to the user.
     * @param {Integer} dwDeviceID Identifier of the line device whose icon is requested.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific sub-icon applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest-level icon associated with the line device rather than a specified media stream device would be selected.
     * @param {Pointer<Void>} lphIcon Pointer to a memory location in which the handle to the icon is returned.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALDEVICECLASS, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegeticona
     */
    static lineGetIconA(dwDeviceID, lpszDeviceClass, lphIcon) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineGetIconA", "uint", dwDeviceID, "ptr", lpszDeviceClass, "ptr", lphIcon, "int")
        return result
    }

    /**
     * The lineGetIcon function allows an application to retrieve a service line device-specific (or provider-specific) icon for display to the user.
     * @param {Integer} dwDeviceID Identifier of the line device whose icon is requested.
     * @param {Pointer<Char>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific sub-icon applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest-level icon associated with the line device rather than a specified media stream device would be selected.
     * @param {Pointer<Void>} lphIcon Pointer to a memory location in which the handle to the icon is returned.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALDEVICECLASS, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegeticonw
     */
    static lineGetIconW(dwDeviceID, lpszDeviceClass, lphIcon) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineGetIconW", "uint", dwDeviceID, "ptr", lpszDeviceClass, "ptr", lphIcon, "int")
        return result
    }

    /**
     * The lineGetID function returns a device identifier for the specified device class associated with the selected line, address, or call.
     * @param {Integer} hLine Handle to an open line device.
     * @param {Integer} dwAddressID Address on the given open line device. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} hCall Handle to a call.
     * @param {Integer} dwSelect Specifies whether the requested device identifier is associated with the line, address or a single call. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallselect--constants">LINECALLSELECT_ Constants</a>.
     * @param {Pointer<VARSTRING>} lpDeviceID Pointer to a memory location of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a>, where the device identifier is returned. Upon successful completion of the request, this location is filled with the device identifier. The format of the returned information depends on the method used by the device class API for naming devices. Prior to calling 
     * <b>lineGetID</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose identifier is requested. Valid device class strings are those used in the SYSTEM.INI section to identify device classes.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_NOMEM, LINEERR_INVALADDRESSID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLSELECT, LINEERR_INVALDEVICECLASS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NODEVICE, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetid
     */
    static lineGetID(hLine, dwAddressID, hCall, dwSelect, lpDeviceID, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineGetID", "uint", hLine, "uint", dwAddressID, "uint", hCall, "uint", dwSelect, "ptr", lpDeviceID, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineGetID function returns a device identifier for the specified device class associated with the selected line, address, or call.
     * @param {Integer} hLine Handle to an open line device.
     * @param {Integer} dwAddressID Address on the given open line device. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} hCall Handle to a call.
     * @param {Integer} dwSelect Specifies whether the requested device identifier is associated with the line, address or a single call. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallselect--constants">LINECALLSELECT_ Constants</a>.
     * @param {Pointer<VARSTRING>} lpDeviceID Pointer to a memory location of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a>, where the device identifier is returned. Upon successful completion of the request, this location is filled with the device identifier. The format of the returned information depends on the method used by the device class API for naming devices. Prior to calling 
     * <b>lineGetID</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose identifier is requested. Valid device class strings are those used in the SYSTEM.INI section to identify device classes.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_NOMEM, LINEERR_INVALADDRESSID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLSELECT, LINEERR_INVALDEVICECLASS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NODEVICE, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetida
     */
    static lineGetIDA(hLine, dwAddressID, hCall, dwSelect, lpDeviceID, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineGetIDA", "uint", hLine, "uint", dwAddressID, "uint", hCall, "uint", dwSelect, "ptr", lpDeviceID, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineGetID function returns a device identifier for the specified device class associated with the selected line, address, or call.
     * @param {Integer} hLine Handle to an open line device.
     * @param {Integer} dwAddressID Address on the given open line device. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} hCall Handle to a call.
     * @param {Integer} dwSelect Specifies whether the requested device identifier is associated with the line, address or a single call. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallselect--constants">LINECALLSELECT_ Constants</a>.
     * @param {Pointer<VARSTRING>} lpDeviceID Pointer to a memory location of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a>, where the device identifier is returned. Upon successful completion of the request, this location is filled with the device identifier. The format of the returned information depends on the method used by the device class API for naming devices. Prior to calling 
     * <b>lineGetID</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @param {Pointer<Char>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose identifier is requested. Valid device class strings are those used in the SYSTEM.INI section to identify device classes.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_NOMEM, LINEERR_INVALADDRESSID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLSELECT, LINEERR_INVALDEVICECLASS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NODEVICE, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetidw
     */
    static lineGetIDW(hLine, dwAddressID, hCall, dwSelect, lpDeviceID, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineGetIDW", "uint", hLine, "uint", dwAddressID, "uint", hCall, "uint", dwSelect, "ptr", lpDeviceID, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineGetLineDevStatus function enables an application to query the specified open line device for its current status.
     * @param {Integer} hLine Handle to the open line device to be queried.
     * @param {Pointer<LINEDEVSTATUS>} lpLineDevStatus Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS</a>. Upon successful completion of the request, this structure is filled with the line's device status. Prior to calling 
     * <b>lineGetLineDevStatus</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetlinedevstatus
     */
    static lineGetLineDevStatus(hLine, lpLineDevStatus) {
        result := DllCall("TAPI32.dll\lineGetLineDevStatus", "uint", hLine, "ptr", lpLineDevStatus, "int")
        return result
    }

    /**
     * The lineGetLineDevStatus function enables an application to query the specified open line device for its current status.
     * @param {Integer} hLine Handle to the open line device to be queried.
     * @param {Pointer<LINEDEVSTATUS>} lpLineDevStatus Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS</a>. Upon successful completion of the request, this structure is filled with the line's device status. Prior to calling 
     * <b>lineGetLineDevStatus</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetlinedevstatusa
     */
    static lineGetLineDevStatusA(hLine, lpLineDevStatus) {
        result := DllCall("TAPI32.dll\lineGetLineDevStatusA", "uint", hLine, "ptr", lpLineDevStatus, "int")
        return result
    }

    /**
     * The lineGetLineDevStatus function enables an application to query the specified open line device for its current status.
     * @param {Integer} hLine Handle to the open line device to be queried.
     * @param {Pointer<LINEDEVSTATUS>} lpLineDevStatus Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevstatus">LINEDEVSTATUS</a>. Upon successful completion of the request, this structure is filled with the line's device status. Prior to calling 
     * <b>lineGetLineDevStatus</b>, the application should set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetlinedevstatusw
     */
    static lineGetLineDevStatusW(hLine, lpLineDevStatus) {
        result := DllCall("TAPI32.dll\lineGetLineDevStatusW", "uint", hLine, "ptr", lpLineDevStatus, "int")
        return result
    }

    /**
     * The lineGetMessage function returns the next TAPI message that is queued for delivery to an application that is using the Event Handle notification mechanism (see lineInitializeEx for further details).
     * @param {Integer} hLineApp Handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. The application must have set the LINEINITIALIZEEXOPTION_USEEVENT option in the <b>dwOptions</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineinitializeexparams">LINEINITIALIZEEXPARAMS</a> structure.
     * @param {Pointer<LINEMESSAGE>} lpMessage Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linemessage">LINEMESSAGE</a> structure. Upon successful return from this function, the structure contains the next message that had been queued for delivery to the application.
     * @param {Integer} dwTimeout Time-out interval, in milliseconds. The function returns if the interval elapses, even if no message can be returned. If <i>dwTimeout</i> is zero, the function checks for a queued message and returns immediately. If <i>dwTimeout</i> is INFINITE, the function's time-out interval never elapses.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALAPPHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetmessage
     */
    static lineGetMessage(hLineApp, lpMessage, dwTimeout) {
        result := DllCall("TAPI32.dll\lineGetMessage", "uint", hLineApp, "ptr", lpMessage, "uint", dwTimeout, "int")
        return result
    }

    /**
     * The lineGetNewCalls function returns call handles to calls on a specified line or address for which the application currently does not have handles. The application is granted monitor privilege to these calls.
     * @param {Integer} hLine Handle to an open line device.
     * @param {Integer} dwAddressID Address on the given open line device. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwSelect Selection of calls that are requested. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallselect--constants">LINECALLSELECT_ Constants</a>.
     * @param {Pointer<LINECALLLIST>} lpCallList Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecalllist">LINECALLLIST</a>. Upon successful completion of the request, call handles to all selected calls are returned in this structure. Prior to calling 
     * <b>lineGetNewCalls</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLSELECT, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINEHANDLE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetnewcalls
     */
    static lineGetNewCalls(hLine, dwAddressID, dwSelect, lpCallList) {
        result := DllCall("TAPI32.dll\lineGetNewCalls", "uint", hLine, "uint", dwAddressID, "uint", dwSelect, "ptr", lpCallList, "int")
        return result
    }

    /**
     * The lineGetNumRings function determines the number of rings an incoming call on the given address should ring prior to answering the call.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the line device. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<UInt32>} lpdwNumRings Number of rings that is the minimum of all current 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetnumrings">lineSetNumRings</a> requests.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_OPERATIONFAILED, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetnumrings
     */
    static lineGetNumRings(hLine, dwAddressID, lpdwNumRings) {
        result := DllCall("TAPI32.dll\lineGetNumRings", "uint", hLine, "uint", dwAddressID, "uint*", lpdwNumRings, "int")
        return result
    }

    /**
     * The lineGetProviderList function returns a list of service providers currently installed in the telephony system.
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<LINEPROVIDERLIST>} lpProviderList Pointer to a memory location where TAPI can return a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineproviderlist">LINEPROVIDERLIST</a> structure. Prior to calling 
     * <b>lineGetProviderList</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INIFILECORRUPT, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetproviderlist
     */
    static lineGetProviderList(dwAPIVersion, lpProviderList) {
        result := DllCall("TAPI32.dll\lineGetProviderList", "uint", dwAPIVersion, "ptr", lpProviderList, "int")
        return result
    }

    /**
     * The lineGetProviderList function returns a list of service providers currently installed in the telephony system.
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<LINEPROVIDERLIST>} lpProviderList Pointer to a memory location where TAPI can return a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineproviderlist">LINEPROVIDERLIST</a> structure. Prior to calling 
     * <b>lineGetProviderList</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INIFILECORRUPT, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetproviderlista
     */
    static lineGetProviderListA(dwAPIVersion, lpProviderList) {
        result := DllCall("TAPI32.dll\lineGetProviderListA", "uint", dwAPIVersion, "ptr", lpProviderList, "int")
        return result
    }

    /**
     * The lineGetProviderList function returns a list of service providers currently installed in the telephony system.
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<LINEPROVIDERLIST>} lpProviderList Pointer to a memory location where TAPI can return a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineproviderlist">LINEPROVIDERLIST</a> structure. Prior to calling 
     * <b>lineGetProviderList</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INIFILECORRUPT, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetproviderlistw
     */
    static lineGetProviderListW(dwAPIVersion, lpProviderList) {
        result := DllCall("TAPI32.dll\lineGetProviderListW", "uint", dwAPIVersion, "ptr", lpProviderList, "int")
        return result
    }

    /**
     * The lineGetProxyStatus function returns a list of proxy request types that are currently being serviced for the specified device.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Line device to be queried.
     * @param {Integer} dwAppAPIVersion Version number of TAPI to be used.
     * @param {Pointer<LINEPROXYREQUESTLIST>} lpLineProxyReqestList Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineproxyrequestlist">LINEPROXYREQUESTLIST</a>. Upon successful completion of the request, this structure is filled with a list of the currently supported proxy requests. Prior to calling 
     * <b>lineGetProxyStatus</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds; otherwise, the function returns one of the following negative error values:
     * 
     * LINEERR_BADDEVICEID, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetproxystatus
     */
    static lineGetProxyStatus(hLineApp, dwDeviceID, dwAppAPIVersion, lpLineProxyReqestList) {
        result := DllCall("TAPI32.dll\lineGetProxyStatus", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAppAPIVersion, "ptr", lpLineProxyReqestList, "int")
        return result
    }

    /**
     * The lineGetQueueInfo function returns a structure holding the ACD information associated with a particular queue.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} dwQueueID Identifier of the queue whose information is to be retrieved.
     * @param {Pointer<LINEQUEUEINFO>} lpLineQueueInfo Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linequeueinfo">LINEQUEUEINFO</a>. Upon successful completion of the request, this structure is filled with the queue statistics. Prior to calling 
     * <b>lineGetQueueInfo</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetqueueinfo
     */
    static lineGetQueueInfo(hLine, dwQueueID, lpLineQueueInfo) {
        result := DllCall("TAPI32.dll\lineGetQueueInfo", "uint", hLine, "uint", dwQueueID, "ptr", lpLineQueueInfo, "int")
        return result
    }

    /**
     * The lineGetQueueList function returns a list of queues associated with a particular ACD Group.
     * @param {Integer} hLine Handle to the line device.
     * @param {Pointer<Guid>} lpGroupID Pointer to GUID that identifies the group for which the list of queues is requested.
     * @param {Pointer<LINEQUEUELIST>} lpQueueList Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linequeuelist">LINEQUEUELIST</a>. Upon successful completion of the request, this structure is filled with a list of queues. Prior to calling 
     * <b>lineGetQueueList</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetqueuelista
     */
    static lineGetQueueListA(hLine, lpGroupID, lpQueueList) {
        result := DllCall("TAPI32.dll\lineGetQueueListA", "uint", hLine, "ptr", lpGroupID, "ptr", lpQueueList, "int")
        return result
    }

    /**
     * The lineGetQueueList function returns a list of queues associated with a particular ACD Group.
     * @param {Integer} hLine Handle to the line device.
     * @param {Pointer<Guid>} lpGroupID Pointer to GUID that identifies the group for which the list of queues is requested.
     * @param {Pointer<LINEQUEUELIST>} lpQueueList Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linequeuelist">LINEQUEUELIST</a>. Upon successful completion of the request, this structure is filled with a list of queues. Prior to calling 
     * <b>lineGetQueueList</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetqueuelistw
     */
    static lineGetQueueListW(hLine, lpGroupID, lpQueueList) {
        result := DllCall("TAPI32.dll\lineGetQueueListW", "uint", hLine, "ptr", lpGroupID, "ptr", lpQueueList, "int")
        return result
    }

    /**
     * Retrieves the next by-proxy request for the specified request mode.
     * @param {Integer} hLineApp The application usage handle for the line portion of TAPI.
     * @param {Integer} dwRequestMode A type of request to be obtained. Be aware that <i>dwRequestMode</i> can only have one bit set. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linerequestmode--constants">LINEREQUESTMODE_ Constants</a>.
     * @param {Pointer<Void>} lpRequestBuffer A pointer to a memory buffer where the parameters of the request are to be placed. The size of the buffer and the interpretation of the data placed in the buffer depends on the request mode. The application-allocated buffer is assumed to be of sufficient size to hold the request.
     * 
     * If <i>dwRequestMode</i> is LINEREQUESTMODE_MAKECALL, interpret the content of the request buffer using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linereqmakecall">LINEREQMAKECALL</a> structure.
     * 
     * LINEREQUESTMODE_MEDIACALL is obsolete.  For more information, see tapiRequestMediaCall.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * <b>LINEERR_INVALAPPHANDLE</b>, <b>LINEERR_NOTREGISTERED</b>, <b>LINEERR_INVALPOINTER</b>, <b>LINEERR_OPERATIONFAILED</b>, <b>LINEERR_INVALREQUESTMODE</b>, <b>LINEERR_RESOURCEUNAVAIL</b>, <b>LINEERR_NOMEM</b>, <b>LINEERR_UNINITIALIZED</b>, <b>LINEERR_NOREQUEST</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetrequest
     */
    static lineGetRequest(hLineApp, dwRequestMode, lpRequestBuffer) {
        result := DllCall("TAPI32.dll\lineGetRequest", "uint", hLineApp, "uint", dwRequestMode, "ptr", lpRequestBuffer, "int")
        return result
    }

    /**
     * Retrieves the next by-proxy request for the specified request mode.
     * @param {Integer} hLineApp The application usage handle for the line portion of TAPI.
     * @param {Integer} dwRequestMode A type of request to be obtained. Be aware that <i>dwRequestMode</i> can only have one bit set. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linerequestmode--constants">LINEREQUESTMODE_ Constants</a>.
     * @param {Pointer<Void>} lpRequestBuffer A pointer to a memory buffer where the parameters of the request are to be placed. The size of the buffer and the interpretation of the data placed in the buffer depends on the request mode. The application-allocated buffer is assumed to be of sufficient size to hold the request.
     * 
     * If <i>dwRequestMode</i> is LINEREQUESTMODE_MAKECALL, interpret the content of the request buffer using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linereqmakecall">LINEREQMAKECALL</a> structure.
     * 
     * LINEREQUESTMODE_MEDIACALL is obsolete.  For more information, see tapiRequestMediaCall.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * <b>LINEERR_INVALAPPHANDLE</b>, <b>LINEERR_NOTREGISTERED</b>, <b>LINEERR_INVALPOINTER</b>, <b>LINEERR_OPERATIONFAILED</b>, <b>LINEERR_INVALREQUESTMODE</b>, <b>LINEERR_RESOURCEUNAVAIL</b>, <b>LINEERR_NOMEM</b>, <b>LINEERR_UNINITIALIZED</b>, <b>LINEERR_NOREQUEST</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetrequesta
     */
    static lineGetRequestA(hLineApp, dwRequestMode, lpRequestBuffer) {
        result := DllCall("TAPI32.dll\lineGetRequestA", "uint", hLineApp, "uint", dwRequestMode, "ptr", lpRequestBuffer, "int")
        return result
    }

    /**
     * Retrieves the next by-proxy request for the specified request mode.
     * @param {Integer} hLineApp The application usage handle for the line portion of TAPI.
     * @param {Integer} dwRequestMode A type of request to be obtained. Be aware that <i>dwRequestMode</i> can only have one bit set. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linerequestmode--constants">LINEREQUESTMODE_ Constants</a>.
     * @param {Pointer<Void>} lpRequestBuffer A pointer to a memory buffer where the parameters of the request are to be placed. The size of the buffer and the interpretation of the data placed in the buffer depends on the request mode. The application-allocated buffer is assumed to be of sufficient size to hold the request.
     * 
     * If <i>dwRequestMode</i> is LINEREQUESTMODE_MAKECALL, interpret the content of the request buffer using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linereqmakecall">LINEREQMAKECALL</a> structure.
     * 
     * LINEREQUESTMODE_MEDIACALL is obsolete.  For more information, see tapiRequestMediaCall.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * <b>LINEERR_INVALAPPHANDLE</b>, <b>LINEERR_NOTREGISTERED</b>, <b>LINEERR_INVALPOINTER</b>, <b>LINEERR_OPERATIONFAILED</b>, <b>LINEERR_INVALREQUESTMODE</b>, <b>LINEERR_RESOURCEUNAVAIL</b>, <b>LINEERR_NOMEM</b>, <b>LINEERR_UNINITIALIZED</b>, <b>LINEERR_NOREQUEST</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetrequestw
     */
    static lineGetRequestW(hLineApp, dwRequestMode, lpRequestBuffer) {
        result := DllCall("TAPI32.dll\lineGetRequestW", "uint", hLineApp, "uint", dwRequestMode, "ptr", lpRequestBuffer, "int")
        return result
    }

    /**
     * The lineGetStatusMessages function enables an application to query which notification messages the application is set up to receive for events related to status changes for the specified line or any of its addresses.
     * @param {Integer} hLine Handle to the line device.
     * @param {Pointer<UInt32>} lpdwLineStates Bit array that identifies for which line device status changes a message is to be sent to the application. If a flag is <b>TRUE</b>, that message is enabled; if <b>FALSE</b>, it is disabled. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedevstate--constants">LINEDEVSTATE_ Constants</a>.
     * @param {Pointer<UInt32>} lpdwAddressStates Bit array that identifies for which address status changes a message is to be sent to the application. If a flag is <b>TRUE</b>, that message is enabled; if <b>FALSE</b>, disabled. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddressstate--constants">LINEADDRESSSTATE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegetstatusmessages
     */
    static lineGetStatusMessages(hLine, lpdwLineStates, lpdwAddressStates) {
        result := DllCall("TAPI32.dll\lineGetStatusMessages", "uint", hLine, "uint*", lpdwLineStates, "uint*", lpdwAddressStates, "int")
        return result
    }

    /**
     * The lineGetTranslateCaps function returns address translation capabilities.
     * @param {Integer} hLineApp Handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a> function. If an application has not yet called the 
     * <b>lineInitializeEx</b> function, this parameter can be zero.
     * 
     * <div class="alert"><b>Note</b>   TAPI 1.4 applications must set this parameter to a valid hLineApp handle, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitialize">lineInitialize</a> function.
     * 
     * </div>
     * <div> </div>
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<LINETRANSLATECAPS>} lpTranslateCaps Pointer to a location to which a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure is loaded. Prior to calling 
     * <b>lineGetTranslateCaps</b>, the application must  set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INIFILECORRUPT, LINEERR_OPERATIONFAILED, LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NODRIVER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegettranslatecaps
     */
    static lineGetTranslateCaps(hLineApp, dwAPIVersion, lpTranslateCaps) {
        result := DllCall("TAPI32.dll\lineGetTranslateCaps", "uint", hLineApp, "uint", dwAPIVersion, "ptr", lpTranslateCaps, "int")
        return result
    }

    /**
     * The lineGetTranslateCaps function returns address translation capabilities.
     * @param {Integer} hLineApp Handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a> function. If an application has not yet called the 
     * <b>lineInitializeEx</b> function, this parameter can be zero.
     * 
     * <div class="alert"><b>Note</b>   TAPI 1.4 applications must set this parameter to a valid hLineApp handle, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitialize">lineInitialize</a> function.
     * 
     * </div>
     * <div> </div>
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<LINETRANSLATECAPS>} lpTranslateCaps Pointer to a location to which a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure is loaded. Prior to calling 
     * <b>lineGetTranslateCaps</b>, the application must  set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INIFILECORRUPT, LINEERR_OPERATIONFAILED, LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NODRIVER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegettranslatecapsa
     */
    static lineGetTranslateCapsA(hLineApp, dwAPIVersion, lpTranslateCaps) {
        result := DllCall("TAPI32.dll\lineGetTranslateCapsA", "uint", hLineApp, "uint", dwAPIVersion, "ptr", lpTranslateCaps, "int")
        return result
    }

    /**
     * The lineGetTranslateCaps function returns address translation capabilities.
     * @param {Integer} hLineApp Handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a> function. If an application has not yet called the 
     * <b>lineInitializeEx</b> function, this parameter can be zero.
     * 
     * <div class="alert"><b>Note</b>   TAPI 1.4 applications must set this parameter to a valid hLineApp handle, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitialize">lineInitialize</a> function.
     * 
     * </div>
     * <div> </div>
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<LINETRANSLATECAPS>} lpTranslateCaps Pointer to a location to which a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">LINETRANSLATECAPS</a> structure is loaded. Prior to calling 
     * <b>lineGetTranslateCaps</b>, the application must  set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic.</div>
     * <div> </div>
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INIFILECORRUPT, LINEERR_OPERATIONFAILED, LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NODRIVER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linegettranslatecapsw
     */
    static lineGetTranslateCapsW(hLineApp, dwAPIVersion, lpTranslateCaps) {
        result := DllCall("TAPI32.dll\lineGetTranslateCapsW", "uint", hLineApp, "uint", dwAPIVersion, "ptr", lpTranslateCaps, "int")
        return result
    }

    /**
     * The lineHandoff function gives ownership of the specified call to another application. The application can be either specified directly by its file name or indirectly as the highest priority application that handles calls of the specified media mode.
     * @param {Integer} hCall Handle to the call to be handed off. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @param {Pointer<Byte>} lpszFileName Pointer to a <b>null</b>-terminated string. If this pointer parameter is non-<b>NULL</b>, it contains the file name of the application that is the target of the handoff. If <b>NULL</b>, the handoff target is the highest priority application that has opened the line for owner privilege for the specified media mode. A valid file name does not include the path of the file.
     * @param {Integer} dwMediaMode Media mode used to identify the target for the indirect handoff. The <i>dwMediaMode</i> parameter indirectly identifies the target application that is to receive ownership of the call. This parameter is ignored if <i>lpszFileName</i> is not <b>NULL</b>. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALMEDIAMODE, LINEERR_TARGETNOTFOUND, LINEERR_INVALPOINTER, LINEERR_TARGETSELF, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_NOTOWNER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linehandoff
     */
    static lineHandoff(hCall, lpszFileName, dwMediaMode) {
        lpszFileName := lpszFileName is String? StrPtr(lpszFileName) : lpszFileName

        result := DllCall("TAPI32.dll\lineHandoff", "uint", hCall, "ptr", lpszFileName, "uint", dwMediaMode, "int")
        return result
    }

    /**
     * The lineHandoff function gives ownership of the specified call to another application. The application can be either specified directly by its file name or indirectly as the highest priority application that handles calls of the specified media mode.
     * @param {Integer} hCall Handle to the call to be handed off. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @param {Pointer<Byte>} lpszFileName Pointer to a <b>null</b>-terminated string. If this pointer parameter is non-<b>NULL</b>, it contains the file name of the application that is the target of the handoff. If <b>NULL</b>, the handoff target is the highest priority application that has opened the line for owner privilege for the specified media mode. A valid file name does not include the path of the file.
     * @param {Integer} dwMediaMode Media mode used to identify the target for the indirect handoff. The <i>dwMediaMode</i> parameter indirectly identifies the target application that is to receive ownership of the call. This parameter is ignored if <i>lpszFileName</i> is not <b>NULL</b>. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALMEDIAMODE, LINEERR_TARGETNOTFOUND, LINEERR_INVALPOINTER, LINEERR_TARGETSELF, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_NOTOWNER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linehandoffa
     */
    static lineHandoffA(hCall, lpszFileName, dwMediaMode) {
        lpszFileName := lpszFileName is String? StrPtr(lpszFileName) : lpszFileName

        result := DllCall("TAPI32.dll\lineHandoffA", "uint", hCall, "ptr", lpszFileName, "uint", dwMediaMode, "int")
        return result
    }

    /**
     * The lineHandoff function gives ownership of the specified call to another application. The application can be either specified directly by its file name or indirectly as the highest priority application that handles calls of the specified media mode.
     * @param {Integer} hCall Handle to the call to be handed off. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @param {Pointer<Char>} lpszFileName Pointer to a <b>null</b>-terminated string. If this pointer parameter is non-<b>NULL</b>, it contains the file name of the application that is the target of the handoff. If <b>NULL</b>, the handoff target is the highest priority application that has opened the line for owner privilege for the specified media mode. A valid file name does not include the path of the file.
     * @param {Integer} dwMediaMode Media mode used to identify the target for the indirect handoff. The <i>dwMediaMode</i> parameter indirectly identifies the target application that is to receive ownership of the call. This parameter is ignored if <i>lpszFileName</i> is not <b>NULL</b>. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALMEDIAMODE, LINEERR_TARGETNOTFOUND, LINEERR_INVALPOINTER, LINEERR_TARGETSELF, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_NOTOWNER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linehandoffw
     */
    static lineHandoffW(hCall, lpszFileName, dwMediaMode) {
        lpszFileName := lpszFileName is String? StrPtr(lpszFileName) : lpszFileName

        result := DllCall("TAPI32.dll\lineHandoffW", "uint", hCall, "ptr", lpszFileName, "uint", dwMediaMode, "int")
        return result
    }

    /**
     * The lineHold function places the specified call on hold.
     * @param {Integer} hCall Handle to the call to be placed on hold. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>connected</i>.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_NOMEM, LINEERR_RESOURCEUNAVAIL, LINEERR_NOTOWNER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linehold
     */
    static lineHold(hCall) {
        result := DllCall("TAPI32.dll\lineHold", "uint", hCall, "int")
        return result
    }

    /**
     * The lineInitialize function is obsolete. It continues to be exported by Tapi.dll and Tapi32.dll for backward compatibility with applications using API versions 1.3 and 1.4.
     * @param {Pointer<UInt32>} lphLineApp Pointer to a location that is filled with the application's usage handle for TAPI.
     * @param {Pointer<Void>} hInstance Instance handle of the client application or DLL.
     * @param {Pointer<LINECALLBACK>} lpfnCallback Address of a callback function that is invoked to determine status and events on the line device, addresses, or calls. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nc-tapi-linecallback">lineCallbackFunc</a>.
     * @param {Pointer<Byte>} lpszAppName Pointer to a <b>null</b>-terminated text string that contains only displayable characters. If this parameter is not <b>NULL</b>, it contains an application-supplied name for the application. This name is provided in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a> structure to indicate, in a user-friendly way, which application originated, or originally accepted or answered the call. This information can be useful for call logging purposes. If <i>lpszAppName</i> is <b>NULL</b>, the application's file name is used instead.
     * @param {Pointer<UInt32>} lpdwNumDevs Pointer to a <b>DWORD</b>-sized location. Upon successful completion of this request, this location is filled with the number of line devices available to the application.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALAPPNAME, LINEERR_OPERATIONFAILED, LINEERR_INIFILECORRUPT, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_REINIT, LINEERR_NODRIVER, LINEERR_NODEVICE, LINEERR_NOMEM, LINEERR_NOMULTIPLEINSTANCE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineinitialize
     */
    static lineInitialize(lphLineApp, hInstance, lpfnCallback, lpszAppName, lpdwNumDevs) {
        lpszAppName := lpszAppName is String? StrPtr(lpszAppName) : lpszAppName

        result := DllCall("TAPI32.dll\lineInitialize", "uint*", lphLineApp, "ptr", hInstance, "ptr", lpfnCallback, "ptr", lpszAppName, "uint*", lpdwNumDevs, "int")
        return result
    }

    /**
     * The lineInitializeEx function initializes the application's use of TAPI for subsequent use of the line abstraction.
     * @param {Pointer<UInt32>} lphLineApp Pointer to a location that is filled with the application's usage handle for TAPI.
     * @param {Pointer<Void>} hInstance Instance handle of the client application or DLL. The application or DLL can pass <b>NULL</b> for this parameter, in which case TAPI uses the module handle of the root executable of the process (for purposes of identifying call handoff targets and media mode priorities).
     * @param {Pointer<LINECALLBACK>} lpfnCallback Address of a callback function that is invoked to determine status and events on the line device, addresses, or calls, when the application is using the "hidden window" method of event notification (for more information see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nc-tapi-linecallback">lineCallbackFunc</a>). This parameter is ignored and should be set to <b>NULL</b> when the application chooses to use the "event handle" or "completion port" event notification mechanisms.
     * @param {Pointer<Byte>} lpszFriendlyAppName Pointer to a <b>null</b>-terminated text string that contains only displayable characters. If this parameter is not <b>NULL</b>, it contains an application-supplied name for the application. This name is provided in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a> structure to indicate, in a user-friendly way, which application originated, or originally accepted or answered the call. This information can be useful for call-logging purposes. If <i>lpszFriendlyAppName</i> is <b>NULL</b>, the application's module file name is used instead (as returned by the function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamea">GetModuleFileName</a>).
     * @param {Pointer<UInt32>} lpdwNumDevs Pointer to a <b>DWORD</b>-sized location. Upon successful completion of this request, this location is filled with the number of line devices available to the application.
     * @param {Pointer<UInt32>} lpdwAPIVersion Pointer to a <b>DWORD</b>-sized location. The application must initialize this <b>DWORD</b>, before calling this function, to the highest API version it is designed to support (for example, the same value it would pass into <i>dwAPIHighVersion</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>). Artificially high values must not be used; the value must be accurately set. TAPI translates any newer messages or structures into values or formats supported by the application's version. Upon successful completion of this request, this location is filled with the highest API version supported by TAPI, thereby allowing the application to detect and adapt to having been installed on a system with a different version of TAPI.
     * @param {Pointer<LINEINITIALIZEEXPARAMS>} lpLineInitializeExParams Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineinitializeexparams">LINEINITIALIZEEXPARAMS</a> containing additional parameters used to establish the association between the application and TAPI (specifically, the application's selected event notification mechanism and associated parameters).
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALAPPNAME, LINEERR_OPERATIONFAILED, LINEERR_INIFILECORRUPT, LINEERR_INVALPOINTER, LINEERR_REINIT, LINEERR_NOMEM, LINEERR_INVALPARAM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineinitializeexa
     */
    static lineInitializeExA(lphLineApp, hInstance, lpfnCallback, lpszFriendlyAppName, lpdwNumDevs, lpdwAPIVersion, lpLineInitializeExParams) {
        lpszFriendlyAppName := lpszFriendlyAppName is String? StrPtr(lpszFriendlyAppName) : lpszFriendlyAppName

        result := DllCall("TAPI32.dll\lineInitializeExA", "uint*", lphLineApp, "ptr", hInstance, "ptr", lpfnCallback, "ptr", lpszFriendlyAppName, "uint*", lpdwNumDevs, "uint*", lpdwAPIVersion, "ptr", lpLineInitializeExParams, "int")
        return result
    }

    /**
     * The lineInitializeEx function initializes the application's use of TAPI for subsequent use of the line abstraction.
     * @param {Pointer<UInt32>} lphLineApp Pointer to a location that is filled with the application's usage handle for TAPI.
     * @param {Pointer<Void>} hInstance Instance handle of the client application or DLL. The application or DLL can pass <b>NULL</b> for this parameter, in which case TAPI uses the module handle of the root executable of the process (for purposes of identifying call handoff targets and media mode priorities).
     * @param {Pointer<LINECALLBACK>} lpfnCallback Address of a callback function that is invoked to determine status and events on the line device, addresses, or calls, when the application is using the "hidden window" method of event notification (for more information see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nc-tapi-linecallback">lineCallbackFunc</a>). This parameter is ignored and should be set to <b>NULL</b> when the application chooses to use the "event handle" or "completion port" event notification mechanisms.
     * @param {Pointer<Char>} lpszFriendlyAppName Pointer to a <b>null</b>-terminated text string that contains only displayable characters. If this parameter is not <b>NULL</b>, it contains an application-supplied name for the application. This name is provided in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a> structure to indicate, in a user-friendly way, which application originated, or originally accepted or answered the call. This information can be useful for call-logging purposes. If <i>lpszFriendlyAppName</i> is <b>NULL</b>, the application's module file name is used instead (as returned by the function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamea">GetModuleFileName</a>).
     * @param {Pointer<UInt32>} lpdwNumDevs Pointer to a <b>DWORD</b>-sized location. Upon successful completion of this request, this location is filled with the number of line devices available to the application.
     * @param {Pointer<UInt32>} lpdwAPIVersion Pointer to a <b>DWORD</b>-sized location. The application must initialize this <b>DWORD</b>, before calling this function, to the highest API version it is designed to support (for example, the same value it would pass into <i>dwAPIHighVersion</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>). Artificially high values must not be used; the value must be accurately set. TAPI translates any newer messages or structures into values or formats supported by the application's version. Upon successful completion of this request, this location is filled with the highest API version supported by TAPI, thereby allowing the application to detect and adapt to having been installed on a system with a different version of TAPI.
     * @param {Pointer<LINEINITIALIZEEXPARAMS>} lpLineInitializeExParams Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineinitializeexparams">LINEINITIALIZEEXPARAMS</a> containing additional parameters used to establish the association between the application and TAPI (specifically, the application's selected event notification mechanism and associated parameters).
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALAPPNAME, LINEERR_OPERATIONFAILED, LINEERR_INIFILECORRUPT, LINEERR_INVALPOINTER, LINEERR_REINIT, LINEERR_NOMEM, LINEERR_INVALPARAM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineinitializeexw
     */
    static lineInitializeExW(lphLineApp, hInstance, lpfnCallback, lpszFriendlyAppName, lpdwNumDevs, lpdwAPIVersion, lpLineInitializeExParams) {
        lpszFriendlyAppName := lpszFriendlyAppName is String? StrPtr(lpszFriendlyAppName) : lpszFriendlyAppName

        result := DllCall("TAPI32.dll\lineInitializeExW", "uint*", lphLineApp, "ptr", hInstance, "ptr", lpfnCallback, "ptr", lpszFriendlyAppName, "uint*", lpdwNumDevs, "uint*", lpdwAPIVersion, "ptr", lpLineInitializeExParams, "int")
        return result
    }

    /**
     * The lineMakeCall function places a call on the specified line to the specified destination address. Optionally, call parameters can be specified if anything but default call setup parameters are requested.
     * @param {Integer} hLine Handle to the open line device on which a call is to be originated.
     * @param {Pointer<UInt32>} lphCall Pointer to an HCALL handle. The handle is only valid after the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is received by the application indicating that the 
     * <b>lineMakeCall</b> function successfully completed. Use this handle to identify the call when invoking other telephony operations on the call. The application is initially the sole owner of this call. This handle is void if the function returns an error (synchronously or asynchronously by the reply message).
     * @param {Pointer<Byte>} lpszDestAddress Pointer to the destination address. This follows the standard dialable number format. This pointer can be <b>NULL</b> for non-dialed addresses (as with a hot phone) or when all dialing is performed using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linedial">lineDial</a>. In the latter case, 
     * <b>lineMakeCall</b> allocates an available call appearance that would typically remain in the <b>dialtone</b> state until dialing begins. Service providers that have inverse multiplexing capabilities can allow an application to specify multiple addresses at once.
     * @param {Integer} dwCountryCode Country or region code of the called party. If a value of 0 is specified, a default is used by the implementation.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure. This structure allows the application to specify how it wants the call to be set up. If <b>NULL</b> is specified, a default 3.1 kHz voice call is established and an arbitrary origination address on the line is selected. This structure allows the application to select elements such as the call's bearer mode, data rate, expected media mode, origination address, blocking of caller ID information, and dialing parameters.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_ADDRESSBLOCKED, LINEERR_INVALLINEHANDLE, LINEERR_BEARERMODEUNAVAIL, LINEERR_INVALLINESTATE, LINEERR_CALLUNAVAIL, LINEERR_INVALMEDIAMODE, LINEERR_DIALBILLING, LINEERR_INVALPARAM, LINEERR_DIALDIALTONE, LINEERR_INVALPOINTER, LINEERR_DIALPROMPT, LINEERR_INVALRATE, LINEERR_DIALQUIET, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_OPERATIONFAILED, LINEERR_INVALADDRESS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESSID, LINEERR_RATEUNAVAIL, LINEERR_INVALADDRESSMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALBEARERMODE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALCALLPARAMS, LINEERR_UNINITIALIZED, LINEERR_INVALCOUNTRYCODE, LINEERR_USERUSERINFOTOOBIG.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linemakecall
     */
    static lineMakeCall(hLine, lphCall, lpszDestAddress, dwCountryCode, lpCallParams) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineMakeCall", "uint", hLine, "uint*", lphCall, "ptr", lpszDestAddress, "uint", dwCountryCode, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineMakeCall function places a call on the specified line to the specified destination address. Optionally, call parameters can be specified if anything but default call setup parameters are requested.
     * @param {Integer} hLine Handle to the open line device on which a call is to be originated.
     * @param {Pointer<UInt32>} lphCall Pointer to an HCALL handle. The handle is only valid after the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is received by the application indicating that the 
     * <b>lineMakeCall</b> function successfully completed. Use this handle to identify the call when invoking other telephony operations on the call. The application is initially the sole owner of this call. This handle is void if the function returns an error (synchronously or asynchronously by the reply message).
     * @param {Pointer<Byte>} lpszDestAddress Pointer to the destination address. This follows the standard dialable number format. This pointer can be <b>NULL</b> for non-dialed addresses (as with a hot phone) or when all dialing is performed using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linedial">lineDial</a>. In the latter case, 
     * <b>lineMakeCall</b> allocates an available call appearance that would typically remain in the <b>dialtone</b> state until dialing begins. Service providers that have inverse multiplexing capabilities can allow an application to specify multiple addresses at once.
     * @param {Integer} dwCountryCode Country or region code of the called party. If a value of 0 is specified, a default is used by the implementation.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure. This structure allows the application to specify how it wants the call to be set up. If <b>NULL</b> is specified, a default 3.1 kHz voice call is established and an arbitrary origination address on the line is selected. This structure allows the application to select elements such as the call's bearer mode, data rate, expected media mode, origination address, blocking of caller ID information, and dialing parameters.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_ADDRESSBLOCKED, LINEERR_INVALLINEHANDLE, LINEERR_BEARERMODEUNAVAIL, LINEERR_INVALLINESTATE, LINEERR_CALLUNAVAIL, LINEERR_INVALMEDIAMODE, LINEERR_DIALBILLING, LINEERR_INVALPARAM, LINEERR_DIALDIALTONE, LINEERR_INVALPOINTER, LINEERR_DIALPROMPT, LINEERR_INVALRATE, LINEERR_DIALQUIET, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_OPERATIONFAILED, LINEERR_INVALADDRESS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESSID, LINEERR_RATEUNAVAIL, LINEERR_INVALADDRESSMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALBEARERMODE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALCALLPARAMS, LINEERR_UNINITIALIZED, LINEERR_INVALCOUNTRYCODE, LINEERR_USERUSERINFOTOOBIG.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linemakecalla
     */
    static lineMakeCallA(hLine, lphCall, lpszDestAddress, dwCountryCode, lpCallParams) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineMakeCallA", "uint", hLine, "uint*", lphCall, "ptr", lpszDestAddress, "uint", dwCountryCode, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineMakeCall function places a call on the specified line to the specified destination address. Optionally, call parameters can be specified if anything but default call setup parameters are requested.
     * @param {Integer} hLine Handle to the open line device on which a call is to be originated.
     * @param {Pointer<UInt32>} lphCall Pointer to an HCALL handle. The handle is only valid after the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is received by the application indicating that the 
     * <b>lineMakeCall</b> function successfully completed. Use this handle to identify the call when invoking other telephony operations on the call. The application is initially the sole owner of this call. This handle is void if the function returns an error (synchronously or asynchronously by the reply message).
     * @param {Pointer<Char>} lpszDestAddress Pointer to the destination address. This follows the standard dialable number format. This pointer can be <b>NULL</b> for non-dialed addresses (as with a hot phone) or when all dialing is performed using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linedial">lineDial</a>. In the latter case, 
     * <b>lineMakeCall</b> allocates an available call appearance that would typically remain in the <b>dialtone</b> state until dialing begins. Service providers that have inverse multiplexing capabilities can allow an application to specify multiple addresses at once.
     * @param {Integer} dwCountryCode Country or region code of the called party. If a value of 0 is specified, a default is used by the implementation.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure. This structure allows the application to specify how it wants the call to be set up. If <b>NULL</b> is specified, a default 3.1 kHz voice call is established and an arbitrary origination address on the line is selected. This structure allows the application to select elements such as the call's bearer mode, data rate, expected media mode, origination address, blocking of caller ID information, and dialing parameters.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_ADDRESSBLOCKED, LINEERR_INVALLINEHANDLE, LINEERR_BEARERMODEUNAVAIL, LINEERR_INVALLINESTATE, LINEERR_CALLUNAVAIL, LINEERR_INVALMEDIAMODE, LINEERR_DIALBILLING, LINEERR_INVALPARAM, LINEERR_DIALDIALTONE, LINEERR_INVALPOINTER, LINEERR_DIALPROMPT, LINEERR_INVALRATE, LINEERR_DIALQUIET, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_OPERATIONFAILED, LINEERR_INVALADDRESS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESSID, LINEERR_RATEUNAVAIL, LINEERR_INVALADDRESSMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALBEARERMODE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALCALLPARAMS, LINEERR_UNINITIALIZED, LINEERR_INVALCOUNTRYCODE, LINEERR_USERUSERINFOTOOBIG.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linemakecallw
     */
    static lineMakeCallW(hLine, lphCall, lpszDestAddress, dwCountryCode, lpCallParams) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineMakeCallW", "uint", hLine, "uint*", lphCall, "ptr", lpszDestAddress, "uint", dwCountryCode, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineMonitorDigits function enables and disables the unbuffered detection of digits received on the call. Each time a digit of the specified digit mode is detected, a message is sent to the application indicating which digit has been detected.
     * @param {Integer} hCall Handle to the call on which digits are to be detected. The call state of <i>hCall</i> can be any state except <i>idle</i> or <i>disconnected</i>.
     * @param {Integer} dwDigitModes Digit mode or modes that are to be monitored. If <i>dwDigitModes</i> is zero, digit monitoring is canceled. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALDIGITMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linemonitordigits
     */
    static lineMonitorDigits(hCall, dwDigitModes) {
        result := DllCall("TAPI32.dll\lineMonitorDigits", "uint", hCall, "uint", dwDigitModes, "int")
        return result
    }

    /**
     * The lineMonitorMedia function enables and disables the detection of media types (modes) on the specified call. When a media type is detected, a message is sent to the application. For more information, see ITLegacyCallMediaControl::MonitorMedia.
     * @param {Integer} hCall Handle to the call. The call state of <i>hCall</i> can be any state except idle.
     * @param {Integer} dwMediaModes Media types to be monitored. If this parameter is zero, it cancels all media type detection. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALMEDIAMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linemonitormedia
     */
    static lineMonitorMedia(hCall, dwMediaModes) {
        result := DllCall("TAPI32.dll\lineMonitorMedia", "uint", hCall, "uint", dwMediaModes, "int")
        return result
    }

    /**
     * The lineMonitorTones function enables and disables the detection of inband tones on the call. Each time a specified tone is detected, a message is sent to the application.
     * @param {Integer} hCall Handle to the call on whose voice channel tones are to be monitored. The call state of <i>hCall</i> can be any state except <i>idle</i>.
     * @param {Pointer<LINEMONITORTONE>} lpToneList List of tones to be monitored. This parameter is of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linemonitortone">LINEMONITORTONE</a>. Each tone in this list has an application-defined tag field that is used to identify individual tones in the list to report a tone detection. Tone monitoring in progress is canceled or changed by calling this operation with either <b>NULL</b> for <i>lpToneList</i> or with another tone list.
     * @param {Integer} dwNumEntries Number of entries in <i>lpToneList</i>. This parameter is ignored if <i>lpToneList</i> is <b>NULL</b>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_INVALCALLSTATE, LINEERR_INVALPOINTER, LINEERR_INVALTONE, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linemonitortones
     */
    static lineMonitorTones(hCall, lpToneList, dwNumEntries) {
        result := DllCall("TAPI32.dll\lineMonitorTones", "uint", hCall, "ptr", lpToneList, "uint", dwNumEntries, "int")
        return result
    }

    /**
     * The lineNegotiateAPIVersion function allows an application to negotiate an API version to use.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifier of the line device to be queried.
     * @param {Integer} dwAPILowVersion Earliest TAPI version with which the application is compliant. The high-order word is the major version number; the low-order word is the minor version number.
     * @param {Integer} dwAPIHighVersion Latest TAPI version with which the application is compliant. The high-order word is the major version number; the low-order word is the minor version number.
     * @param {Pointer<UInt32>} lpdwAPIVersion Pointer to a variable that contains the TAPI version number that was negotiated. If negotiation succeeds, this number is in the range between <i>dwAPILowVersion</i> and <i>dwAPIHighVersion</i>.
     * @param {Pointer<LINEEXTENSIONID>} lpExtensionID Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineextensionid">LINEEXTENSIONID</a>. If the service provider for the specified <i>dwDeviceID</i> supports provider-specific extensions, then, upon a successful negotiation, this structure is filled with the extension identifier of these extensions. This structure contains all zeros if the line provides no extensions. An application can ignore the returned parameter if it does not use extensions.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_OPERATIONFAILED, LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_OPERATIONUNAVAIL, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linenegotiateapiversion
     */
    static lineNegotiateAPIVersion(hLineApp, dwDeviceID, dwAPILowVersion, dwAPIHighVersion, lpdwAPIVersion, lpExtensionID) {
        result := DllCall("TAPI32.dll\lineNegotiateAPIVersion", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAPILowVersion, "uint", dwAPIHighVersion, "uint*", lpdwAPIVersion, "ptr", lpExtensionID, "int")
        return result
    }

    /**
     * The lineNegotiateExtVersion function allows an application to negotiate an extension version to use with the specified line device. This operation need not be called if the application does not support extensions.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifier of the line device to be queried.
     * @param {Integer} dwAPIVersion TAPI version number that was negotiated for the specified line device using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>.
     * @param {Integer} dwExtLowVersion Earliest extension version of the extension identifier returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> with which the application is compliant. The high-order word is the major version number; the low-order word is the minor version number.
     * @param {Integer} dwExtHighVersion Latest extension version of the extension identifier returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> with which the application is compliant. The high-order word is the major version number; the low-order word is the minor version number.
     * @param {Pointer<UInt32>} lpdwExtVersion Pointer to a variable that contains the extension version number that was negotiated. If negotiation succeeds, this number is in the range between <i>dwExtLowVersion</i> and <i>dwExtHighVersion</i>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NOMEM, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NODRIVER, LINEERR_INCOMPATIBLEEXTVERSION, LINEERR_OPERATIONFAILED, LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NODEVICE, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linenegotiateextversion
     */
    static lineNegotiateExtVersion(hLineApp, dwDeviceID, dwAPIVersion, dwExtLowVersion, dwExtHighVersion, lpdwExtVersion) {
        result := DllCall("TAPI32.dll\lineNegotiateExtVersion", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAPIVersion, "uint", dwExtLowVersion, "uint", dwExtHighVersion, "uint*", lpdwExtVersion, "int")
        return result
    }

    /**
     * The lineOpen function opens the line device specified by its device identifier and returns a line handle for the corresponding opened line device. This line handle is used in subsequent operations on the line device.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifies the line device to be opened. It can either be a valid device identifier or the value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LINEMAPPER"></a><a id="linemapper"></a><dl>
     * <dt><b>LINEMAPPER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is used to open a line device in the system that supports the properties specified in <i>lpCallParams</i>. The application can use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a> to determine the identifier of the line device that was opened.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} lphLine Pointer to an HLINE handle that is then loaded with the handle representing the opened line device. Use this handle to identify the device when invoking other functions on the open line device.
     * @param {Integer} dwAPIVersion API version number under which the application and Telephony API have agreed to operate. This number is obtained with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Extension version number under which the application and the service provider agree to operate. This number is zero if the application does not use any extensions. This number is obtained with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateextversion">lineNegotiateExtVersion</a>.
     * @param {Pointer} dwCallbackInstance User-instance data passed back to the application with each message associated with this line or with addresses or calls on this line. This parameter is not interpreted by the Telephony API.
     * @param {Integer} dwPrivileges Privilege the application wants when notified of a call This parameter contains one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallprivilege--constants">LINECALLPRIVILEGE_ Constants</a>. For applications using TAPI version 2.0 or later, values for this parameter can also be combined with one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineopenoption--constants">LINEOPENOPTION_ Constants</a>. 
     * 
     * 
     * 
     * 
     * If the LINEOPENOPTION_SINGLEADDRESS option is specified, then the application is interested only in new calls that appear on the address specified by the <b>dwAddressID</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure pointed to by the <i>lpCallParams</i> parameter (which must be specified).
     * 
     * If LINEOPENOPTION_SINGLEADDRESS is specified but either <i>lpCallParams</i> is invalid or the included <b>dwAddressID</b> does not exist on the line, the open fails with LINERR_INVALADDRESSID.
     * 
     * In addition to setting the <b>dwAddressID</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure to the desired address, the application must also set <b>dwAddressMode</b> in 
     * <b>LINECALLPARAMS</b> to LINEADDRESSMODE_ADDRESSID.
     * 
     * The LINEOPENOPTION_SINGLEADDRESS option affects only TAPI's assignment of initial call ownership of calls created by the service provider using a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-newcall">LINE_NEWCALL</a> message. An application that opens the line with LINECALLPRIVILEGE_MONITOR continues to receive monitoring handles to all calls created on the line. Furthermore, the application is not restricted in any way from making calls or performing other operations that affect other addresses on the opened line.
     * 
     * When the LINEOPENOPTION_PROXY option is specified (TAPI 2.0 or higher only), the application must also indicate which specific proxy requests it is prepared to handle. It does so by passing, in the <i>lpCallParams</i> parameter, a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure in which the <b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b> members have been set to delimit an array of <b>DWORD</b>s. Each element of this array shall contain one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineproxyrequest--constants">LINEPROXYREQUEST_ Constants</a>. For example, a proxy handler application that supports all five of the Agent-related functions would pass in an array of five <b>DWORD</b>s (<b>dwDevSpecificSize</b> would be 20 decimal) containing the five defined LINEPROXYREQUEST_ values.
     * 
     * The proxy request handler application can run on any machine that has authorization to control the line device. However, requests are always routed through the server on which the service provider is executing that actually controls the line device. Thus, it is most efficient if the application handling proxy requests (such as ACD agent control) executes directly on the server along with the service provider.
     * 
     * Subsequent attempts, by the same application or other applications, to open the line device and register to handle the same proxy requests as an application that is already registered fail with LINEERR_NOTREGISTERED.
     * 
     * To stop handling requests on the line, the application simply calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineclose">lineClose</a>.
     * 
     * Other flag combinations return the LINEERR_INVALPRIVSELECT error.
     * @param {Integer} dwMediaModes The media type or modes of interest to the application. This parameter is used to register the application as a potential target for incoming call and call handoff for the specified media type. This parameter is meaningful only if the bit LINECALLPRIVILEGE_OWNER in <i>dwPrivileges</i> is set (and ignored otherwise). This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a>. This pointer is only used if LINEMAPPER or LINEOPENOPTION_PROXY is used; otherwise <i>lpCallParams</i> is ignored. It describes the call parameter that the line device should be able to provide.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_ALLOCATED, LINEERR_LINEMAPPERFAILED, LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INCOMPATIBLEEXTVERSION, LINEERR_OPERATIONFAILED, LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALMEDIAMODE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_INVALPRIVSELECT, LINEERR_REINIT, LINEERR_NODEVICE, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineopen
     */
    static lineOpen(hLineApp, dwDeviceID, lphLine, dwAPIVersion, dwExtVersion, dwCallbackInstance, dwPrivileges, dwMediaModes, lpCallParams) {
        result := DllCall("TAPI32.dll\lineOpen", "uint", hLineApp, "uint", dwDeviceID, "uint*", lphLine, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", dwCallbackInstance, "uint", dwPrivileges, "uint", dwMediaModes, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineOpen function opens the line device specified by its device identifier and returns a line handle for the corresponding opened line device. This line handle is used in subsequent operations on the line device.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifies the line device to be opened. It can either be a valid device identifier or the value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LINEMAPPER"></a><a id="linemapper"></a><dl>
     * <dt><b>LINEMAPPER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is used to open a line device in the system that supports the properties specified in <i>lpCallParams</i>. The application can use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a> to determine the identifier of the line device that was opened.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} lphLine Pointer to an HLINE handle that is then loaded with the handle representing the opened line device. Use this handle to identify the device when invoking other functions on the open line device.
     * @param {Integer} dwAPIVersion API version number under which the application and Telephony API have agreed to operate. This number is obtained with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Extension version number under which the application and the service provider agree to operate. This number is zero if the application does not use any extensions. This number is obtained with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateextversion">lineNegotiateExtVersion</a>.
     * @param {Pointer} dwCallbackInstance User-instance data passed back to the application with each message associated with this line or with addresses or calls on this line. This parameter is not interpreted by the Telephony API.
     * @param {Integer} dwPrivileges Privilege the application wants when notified of a call This parameter contains one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallprivilege--constants">LINECALLPRIVILEGE_ Constants</a>. For applications using TAPI version 2.0 or later, values for this parameter can also be combined with one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineopenoption--constants">LINEOPENOPTION_ Constants</a>. 
     * 
     * 
     * 
     * 
     * If the LINEOPENOPTION_SINGLEADDRESS option is specified, then the application is interested only in new calls that appear on the address specified by the <b>dwAddressID</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure pointed to by the <i>lpCallParams</i> parameter (which must be specified).
     * 
     * If LINEOPENOPTION_SINGLEADDRESS is specified but either <i>lpCallParams</i> is invalid or the included <b>dwAddressID</b> does not exist on the line, the open fails with LINERR_INVALADDRESSID.
     * 
     * In addition to setting the <b>dwAddressID</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure to the desired address, the application must also set <b>dwAddressMode</b> in 
     * <b>LINECALLPARAMS</b> to LINEADDRESSMODE_ADDRESSID.
     * 
     * The LINEOPENOPTION_SINGLEADDRESS option affects only TAPI's assignment of initial call ownership of calls created by the service provider using a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-newcall">LINE_NEWCALL</a> message. An application that opens the line with LINECALLPRIVILEGE_MONITOR continues to receive monitoring handles to all calls created on the line. Furthermore, the application is not restricted in any way from making calls or performing other operations that affect other addresses on the opened line.
     * 
     * When the LINEOPENOPTION_PROXY option is specified (TAPI 2.0 or higher only), the application must also indicate which specific proxy requests it is prepared to handle. It does so by passing, in the <i>lpCallParams</i> parameter, a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure in which the <b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b> members have been set to delimit an array of <b>DWORD</b>s. Each element of this array shall contain one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineproxyrequest--constants">LINEPROXYREQUEST_ Constants</a>. For example, a proxy handler application that supports all five of the Agent-related functions would pass in an array of five <b>DWORD</b>s (<b>dwDevSpecificSize</b> would be 20 decimal) containing the five defined LINEPROXYREQUEST_ values.
     * 
     * The proxy request handler application can run on any machine that has authorization to control the line device. However, requests are always routed through the server on which the service provider is executing that actually controls the line device. Thus, it is most efficient if the application handling proxy requests (such as ACD agent control) executes directly on the server along with the service provider.
     * 
     * Subsequent attempts, by the same application or other applications, to open the line device and register to handle the same proxy requests as an application that is already registered fail with LINEERR_NOTREGISTERED.
     * 
     * To stop handling requests on the line, the application simply calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineclose">lineClose</a>.
     * 
     * Other flag combinations return the LINEERR_INVALPRIVSELECT error.
     * @param {Integer} dwMediaModes The media type or modes of interest to the application. This parameter is used to register the application as a potential target for incoming call and call handoff for the specified media type. This parameter is meaningful only if the bit LINECALLPRIVILEGE_OWNER in <i>dwPrivileges</i> is set (and ignored otherwise). This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a>. This pointer is only used if LINEMAPPER or LINEOPENOPTION_PROXY is used; otherwise <i>lpCallParams</i> is ignored. It describes the call parameter that the line device should be able to provide.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_ALLOCATED, LINEERR_LINEMAPPERFAILED, LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INCOMPATIBLEEXTVERSION, LINEERR_OPERATIONFAILED, LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALMEDIAMODE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_INVALPRIVSELECT, LINEERR_REINIT, LINEERR_NODEVICE, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineopena
     */
    static lineOpenA(hLineApp, dwDeviceID, lphLine, dwAPIVersion, dwExtVersion, dwCallbackInstance, dwPrivileges, dwMediaModes, lpCallParams) {
        result := DllCall("TAPI32.dll\lineOpenA", "uint", hLineApp, "uint", dwDeviceID, "uint*", lphLine, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", dwCallbackInstance, "uint", dwPrivileges, "uint", dwMediaModes, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineOpen function opens the line device specified by its device identifier and returns a line handle for the corresponding opened line device. This line handle is used in subsequent operations on the line device.
     * @param {Integer} hLineApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifies the line device to be opened. It can either be a valid device identifier or the value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LINEMAPPER"></a><a id="linemapper"></a><dl>
     * <dt><b>LINEMAPPER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is used to open a line device in the system that supports the properties specified in <i>lpCallParams</i>. The application can use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a> to determine the identifier of the line device that was opened.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} lphLine Pointer to an HLINE handle that is then loaded with the handle representing the opened line device. Use this handle to identify the device when invoking other functions on the open line device.
     * @param {Integer} dwAPIVersion API version number under which the application and Telephony API have agreed to operate. This number is obtained with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Extension version number under which the application and the service provider agree to operate. This number is zero if the application does not use any extensions. This number is obtained with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateextversion">lineNegotiateExtVersion</a>.
     * @param {Pointer} dwCallbackInstance User-instance data passed back to the application with each message associated with this line or with addresses or calls on this line. This parameter is not interpreted by the Telephony API.
     * @param {Integer} dwPrivileges Privilege the application wants when notified of a call This parameter contains one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallprivilege--constants">LINECALLPRIVILEGE_ Constants</a>. For applications using TAPI version 2.0 or later, values for this parameter can also be combined with one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineopenoption--constants">LINEOPENOPTION_ Constants</a>. 
     * 
     * 
     * 
     * 
     * If the LINEOPENOPTION_SINGLEADDRESS option is specified, then the application is interested only in new calls that appear on the address specified by the <b>dwAddressID</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure pointed to by the <i>lpCallParams</i> parameter (which must be specified).
     * 
     * If LINEOPENOPTION_SINGLEADDRESS is specified but either <i>lpCallParams</i> is invalid or the included <b>dwAddressID</b> does not exist on the line, the open fails with LINERR_INVALADDRESSID.
     * 
     * In addition to setting the <b>dwAddressID</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure to the desired address, the application must also set <b>dwAddressMode</b> in 
     * <b>LINECALLPARAMS</b> to LINEADDRESSMODE_ADDRESSID.
     * 
     * The LINEOPENOPTION_SINGLEADDRESS option affects only TAPI's assignment of initial call ownership of calls created by the service provider using a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-newcall">LINE_NEWCALL</a> message. An application that opens the line with LINECALLPRIVILEGE_MONITOR continues to receive monitoring handles to all calls created on the line. Furthermore, the application is not restricted in any way from making calls or performing other operations that affect other addresses on the opened line.
     * 
     * When the LINEOPENOPTION_PROXY option is specified (TAPI 2.0 or higher only), the application must also indicate which specific proxy requests it is prepared to handle. It does so by passing, in the <i>lpCallParams</i> parameter, a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure in which the <b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b> members have been set to delimit an array of <b>DWORD</b>s. Each element of this array shall contain one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineproxyrequest--constants">LINEPROXYREQUEST_ Constants</a>. For example, a proxy handler application that supports all five of the Agent-related functions would pass in an array of five <b>DWORD</b>s (<b>dwDevSpecificSize</b> would be 20 decimal) containing the five defined LINEPROXYREQUEST_ values.
     * 
     * The proxy request handler application can run on any machine that has authorization to control the line device. However, requests are always routed through the server on which the service provider is executing that actually controls the line device. Thus, it is most efficient if the application handling proxy requests (such as ACD agent control) executes directly on the server along with the service provider.
     * 
     * Subsequent attempts, by the same application or other applications, to open the line device and register to handle the same proxy requests as an application that is already registered fail with LINEERR_NOTREGISTERED.
     * 
     * To stop handling requests on the line, the application simply calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineclose">lineClose</a>.
     * 
     * Other flag combinations return the LINEERR_INVALPRIVSELECT error.
     * @param {Integer} dwMediaModes The media type or modes of interest to the application. This parameter is used to register the application as a potential target for incoming call and call handoff for the specified media type. This parameter is meaningful only if the bit LINECALLPRIVILEGE_OWNER in <i>dwPrivileges</i> is set (and ignored otherwise). This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a>. This pointer is only used if LINEMAPPER or LINEOPENOPTION_PROXY is used; otherwise <i>lpCallParams</i> is ignored. It describes the call parameter that the line device should be able to provide.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_ALLOCATED, LINEERR_LINEMAPPERFAILED, LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NOMEM, LINEERR_INCOMPATIBLEEXTVERSION, LINEERR_OPERATIONFAILED, LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALMEDIAMODE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_INVALPRIVSELECT, LINEERR_REINIT, LINEERR_NODEVICE, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineopenw
     */
    static lineOpenW(hLineApp, dwDeviceID, lphLine, dwAPIVersion, dwExtVersion, dwCallbackInstance, dwPrivileges, dwMediaModes, lpCallParams) {
        result := DllCall("TAPI32.dll\lineOpenW", "uint", hLineApp, "uint", dwDeviceID, "uint*", lphLine, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", dwCallbackInstance, "uint", dwPrivileges, "uint", dwMediaModes, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The linePark function parks the specified call according to the specified park mode.
     * @param {Integer} hCall Handle to the call to be parked. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Integer} dwParkMode Park mode with which the call is to be parked. This parameter can have only a single flag set, and uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineparkmode--constants">LINEPARKMODE_ Constants</a>.
     * @param {Pointer<Byte>} lpszDirAddress Pointer to a <b>null</b>-terminated string that indicates the address where the call is to be parked when using directed park. The address is in dialable number format. This parameter is ignored for nondirected park.
     * @param {Pointer<VARSTRING>} lpNonDirAddress Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a>. For nondirected park, the address where the call is parked is returned in this structure. This parameter is ignored for directed park. Within the 
     * <b>VARSTRING</b> structure, <b>dwStringFormat</b> must be set to STRINGFORMAT_ASCII (an ASCII string buffer containing a <b>null</b>-terminated string), and the terminating <b>NULL</b> must be accounted for in the <b>dwStringSize</b>. Prior to calling 
     * <b>linePark</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_NOTOWNER, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALPARKMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linepark
     */
    static linePark(hCall, dwParkMode, lpszDirAddress, lpNonDirAddress) {
        lpszDirAddress := lpszDirAddress is String? StrPtr(lpszDirAddress) : lpszDirAddress

        result := DllCall("TAPI32.dll\linePark", "uint", hCall, "uint", dwParkMode, "ptr", lpszDirAddress, "ptr", lpNonDirAddress, "int")
        return result
    }

    /**
     * The linePark function parks the specified call according to the specified park mode.
     * @param {Integer} hCall Handle to the call to be parked. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Integer} dwParkMode Park mode with which the call is to be parked. This parameter can have only a single flag set, and uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineparkmode--constants">LINEPARKMODE_ Constants</a>.
     * @param {Pointer<Byte>} lpszDirAddress Pointer to a <b>null</b>-terminated string that indicates the address where the call is to be parked when using directed park. The address is in dialable number format. This parameter is ignored for nondirected park.
     * @param {Pointer<VARSTRING>} lpNonDirAddress Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a>. For nondirected park, the address where the call is parked is returned in this structure. This parameter is ignored for directed park. Within the 
     * <b>VARSTRING</b> structure, <b>dwStringFormat</b> must be set to STRINGFORMAT_ASCII (an ASCII string buffer containing a <b>null</b>-terminated string), and the terminating <b>NULL</b> must be accounted for in the <b>dwStringSize</b>. Prior to calling 
     * <b>linePark</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_NOTOWNER, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALPARKMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineparka
     */
    static lineParkA(hCall, dwParkMode, lpszDirAddress, lpNonDirAddress) {
        lpszDirAddress := lpszDirAddress is String? StrPtr(lpszDirAddress) : lpszDirAddress

        result := DllCall("TAPI32.dll\lineParkA", "uint", hCall, "uint", dwParkMode, "ptr", lpszDirAddress, "ptr", lpNonDirAddress, "int")
        return result
    }

    /**
     * The linePark function parks the specified call according to the specified park mode.
     * @param {Integer} hCall Handle to the call to be parked. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Integer} dwParkMode Park mode with which the call is to be parked. This parameter can have only a single flag set, and uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineparkmode--constants">LINEPARKMODE_ Constants</a>.
     * @param {Pointer<Char>} lpszDirAddress Pointer to a <b>null</b>-terminated string that indicates the address where the call is to be parked when using directed park. The address is in dialable number format. This parameter is ignored for nondirected park.
     * @param {Pointer<VARSTRING>} lpNonDirAddress Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a>. For nondirected park, the address where the call is parked is returned in this structure. This parameter is ignored for directed park. Within the 
     * <b>VARSTRING</b> structure, <b>dwStringFormat</b> must be set to STRINGFORMAT_ASCII (an ASCII string buffer containing a <b>null</b>-terminated string), and the terminating <b>NULL</b> must be accounted for in the <b>dwStringSize</b>. Prior to calling 
     * <b>linePark</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_NOTOWNER, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALPARKMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_STRUCTURETOOSMALL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineparkw
     */
    static lineParkW(hCall, dwParkMode, lpszDirAddress, lpNonDirAddress) {
        lpszDirAddress := lpszDirAddress is String? StrPtr(lpszDirAddress) : lpszDirAddress

        result := DllCall("TAPI32.dll\lineParkW", "uint", hCall, "uint", dwParkMode, "ptr", lpszDirAddress, "ptr", lpNonDirAddress, "int")
        return result
    }

    /**
     * The linePickup function picks up a call alerting at the specified destination address and returns a call handle for the picked-up call.
     * @param {Integer} hLine Handle to the open line device on which a call is to be picked up.
     * @param {Integer} dwAddressID Address on <i>hLine</i> at which the pickup is to be originated. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<UInt32>} lphCall Pointer to a memory location where the handle to the picked up call is returned. The application is the initial sole owner of the call.
     * @param {Pointer<Byte>} lpszDestAddress Pointer to a <b>null</b>-terminated character buffer that contains the address whose call is to be picked up. The address is in standard dialable address format.
     * @param {Pointer<Byte>} lpszGroupID Pointer to a <b>null</b>-terminated character buffer containing the group identifier to which the alerting station belongs. This parameter is required on some switches to pick up calls outside of the current pickup group. 
     * 
     * 
     * 
     * 
     * The <i>lpszGroupID</i> parameter can be specified by itself with a <b>NULL</b> pointer for <i>lpszDestAddress</i>. Alternatively, <i>lpszGroupID</i> can be specified in addition to <i>lpszDestAddress</i>, if required by the device.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_NOMEM, LINEERR_INVALADDRESSID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALGROUPID, LINEERR_OPERATIONFAILED, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linepickup
     */
    static linePickup(hLine, dwAddressID, lphCall, lpszDestAddress, lpszGroupID) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress
        lpszGroupID := lpszGroupID is String? StrPtr(lpszGroupID) : lpszGroupID

        result := DllCall("TAPI32.dll\linePickup", "uint", hLine, "uint", dwAddressID, "uint*", lphCall, "ptr", lpszDestAddress, "ptr", lpszGroupID, "int")
        return result
    }

    /**
     * The linePickup function picks up a call alerting at the specified destination address and returns a call handle for the picked-up call.
     * @param {Integer} hLine Handle to the open line device on which a call is to be picked up.
     * @param {Integer} dwAddressID Address on <i>hLine</i> at which the pickup is to be originated. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<UInt32>} lphCall Pointer to a memory location where the handle to the picked up call is returned. The application is the initial sole owner of the call.
     * @param {Pointer<Byte>} lpszDestAddress Pointer to a <b>null</b>-terminated character buffer that contains the address whose call is to be picked up. The address is in standard dialable address format.
     * @param {Pointer<Byte>} lpszGroupID Pointer to a <b>null</b>-terminated character buffer containing the group identifier to which the alerting station belongs. This parameter is required on some switches to pick up calls outside of the current pickup group. 
     * 
     * 
     * 
     * 
     * The <i>lpszGroupID</i> parameter can be specified by itself with a <b>NULL</b> pointer for <i>lpszDestAddress</i>. Alternatively, <i>lpszGroupID</i> can be specified in addition to <i>lpszDestAddress</i>, if required by the device.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_NOMEM, LINEERR_INVALADDRESSID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALGROUPID, LINEERR_OPERATIONFAILED, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linepickupa
     */
    static linePickupA(hLine, dwAddressID, lphCall, lpszDestAddress, lpszGroupID) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress
        lpszGroupID := lpszGroupID is String? StrPtr(lpszGroupID) : lpszGroupID

        result := DllCall("TAPI32.dll\linePickupA", "uint", hLine, "uint", dwAddressID, "uint*", lphCall, "ptr", lpszDestAddress, "ptr", lpszGroupID, "int")
        return result
    }

    /**
     * The linePickup function picks up a call alerting at the specified destination address and returns a call handle for the picked-up call.
     * @param {Integer} hLine Handle to the open line device on which a call is to be picked up.
     * @param {Integer} dwAddressID Address on <i>hLine</i> at which the pickup is to be originated. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<UInt32>} lphCall Pointer to a memory location where the handle to the picked up call is returned. The application is the initial sole owner of the call.
     * @param {Pointer<Char>} lpszDestAddress Pointer to a <b>null</b>-terminated character buffer that contains the address whose call is to be picked up. The address is in standard dialable address format.
     * @param {Pointer<Char>} lpszGroupID Pointer to a <b>null</b>-terminated character buffer containing the group identifier to which the alerting station belongs. This parameter is required on some switches to pick up calls outside of the current pickup group. 
     * 
     * 
     * 
     * 
     * The <i>lpszGroupID</i> parameter can be specified by itself with a <b>NULL</b> pointer for <i>lpszDestAddress</i>. Alternatively, <i>lpszGroupID</i> can be specified in addition to <i>lpszDestAddress</i>, if required by the device.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_NOMEM, LINEERR_INVALADDRESSID, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALGROUPID, LINEERR_OPERATIONFAILED, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linepickupw
     */
    static linePickupW(hLine, dwAddressID, lphCall, lpszDestAddress, lpszGroupID) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress
        lpszGroupID := lpszGroupID is String? StrPtr(lpszGroupID) : lpszGroupID

        result := DllCall("TAPI32.dll\linePickupW", "uint", hLine, "uint", dwAddressID, "uint*", lphCall, "ptr", lpszDestAddress, "ptr", lpszGroupID, "int")
        return result
    }

    /**
     * The linePrepareAddToConference function prepares an existing conference call for the addition of another party.
     * @param {Integer} hConfCall Handle to a conference call. The application must be an owner of this call. The call state of <i>hConfCall</i> must be <i>connected</i>.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an HCALL handle. This location is then loaded with a handle identifying the consultation call to be added. Initially, the application is the sole owner of this call.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure containing call parameters to use when establishing the consultation call. This parameter can be set to <b>NULL</b> if no special call setup parameters are desired.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BEARERMODEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_CALLUNAVAIL, LINEERR_INVALRATE, LINEERR_CONFERENCEFULL, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_NOTOWNER, LINEERR_INVALADDRESSMODE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALBEARERMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLPARAMS, LINEERR_RATEUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCONFCALLHANDLE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALLINESTATE, LINEERR_USERUSERINFOTOOBIG, LINEERR_INVALMEDIAMODE, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineprepareaddtoconference
     */
    static linePrepareAddToConference(hConfCall, lphConsultCall, lpCallParams) {
        result := DllCall("TAPI32.dll\linePrepareAddToConference", "uint", hConfCall, "uint*", lphConsultCall, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The linePrepareAddToConference function prepares an existing conference call for the addition of another party.
     * @param {Integer} hConfCall Handle to a conference call. The application must be an owner of this call. The call state of <i>hConfCall</i> must be <i>connected</i>.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an HCALL handle. This location is then loaded with a handle identifying the consultation call to be added. Initially, the application is the sole owner of this call.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure containing call parameters to use when establishing the consultation call. This parameter can be set to <b>NULL</b> if no special call setup parameters are desired.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BEARERMODEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_CALLUNAVAIL, LINEERR_INVALRATE, LINEERR_CONFERENCEFULL, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_NOTOWNER, LINEERR_INVALADDRESSMODE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALBEARERMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLPARAMS, LINEERR_RATEUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCONFCALLHANDLE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALLINESTATE, LINEERR_USERUSERINFOTOOBIG, LINEERR_INVALMEDIAMODE, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineprepareaddtoconferencea
     */
    static linePrepareAddToConferenceA(hConfCall, lphConsultCall, lpCallParams) {
        result := DllCall("TAPI32.dll\linePrepareAddToConferenceA", "uint", hConfCall, "uint*", lphConsultCall, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The linePrepareAddToConference function prepares an existing conference call for the addition of another party.
     * @param {Integer} hConfCall Handle to a conference call. The application must be an owner of this call. The call state of <i>hConfCall</i> must be <i>connected</i>.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an HCALL handle. This location is then loaded with a handle identifying the consultation call to be added. Initially, the application is the sole owner of this call.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure containing call parameters to use when establishing the consultation call. This parameter can be set to <b>NULL</b> if no special call setup parameters are desired.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BEARERMODEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_CALLUNAVAIL, LINEERR_INVALRATE, LINEERR_CONFERENCEFULL, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_NOTOWNER, LINEERR_INVALADDRESSMODE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALBEARERMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLPARAMS, LINEERR_RATEUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCONFCALLHANDLE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALLINESTATE, LINEERR_USERUSERINFOTOOBIG, LINEERR_INVALMEDIAMODE, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineprepareaddtoconferencew
     */
    static linePrepareAddToConferenceW(hConfCall, lphConsultCall, lpCallParams) {
        result := DllCall("TAPI32.dll\linePrepareAddToConferenceW", "uint", hConfCall, "uint*", lphConsultCall, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineProxyMessage function is used by a registered proxy request handler to generate TAPI messages related to its role.
     * @param {Integer} hLine Handle to the open line device. This is converted by TAPI into the correct <i>hLine</i> for each application that receives the message.
     * @param {Integer} hCall If the message is related to a specific call (which it is not, in the case of LINE_AGENTSTATUS), specifies the proxy handler's handle to that call; shall be set to <b>NULL</b> for messages not related to a specific call. This is converted by TAPI into the correct <i>hCall</i> for each application that receives the message.
     * @param {Integer} dwMsg The TAPI message to generate. This must be a message that is permitted to be generated by proxy handlers.
     * @param {Integer} dwParam1 Parameter associated with the message to be sent.
     * @param {Integer} dwParam2 Parameter associated with the message to be sent.
     * @param {Integer} dwParam3 Parameter associated with the message to be sent.
     * @returns {Integer} Returns zero if the function succeeds or one of these negative error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALCALLHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_NOTREGISTERED, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineproxymessage
     */
    static lineProxyMessage(hLine, hCall, dwMsg, dwParam1, dwParam2, dwParam3) {
        result := DllCall("TAPI32.dll\lineProxyMessage", "uint", hLine, "uint", hCall, "uint", dwMsg, "uint", dwParam1, "uint", dwParam2, "uint", dwParam3, "int")
        return result
    }

    /**
     * Indicates completion of a proxy request by a registered proxy handler, such as an ACD agent handler on a server.
     * @param {Integer} hLine A handle to the open line device.
     * @param {Pointer<LINEPROXYREQUEST>} lpProxyRequest A pointer to the proxy request buffer given to the application by TAPI in a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-proxyrequest">LINE_PROXYREQUEST</a> message. In the case of proxy requests that return data to the client application, the proxy handler should have filled in the necessary structure in this buffer before calling this function. The <b>dwNeededSize</b> and <b>dwUsedSize</b> members of the structure to be returned must have been set appropriately. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are incorrect, it is possible that data could be overwritten. For more information about setting structure sizes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a>.</div>
     * <div> </div>
     * @param {Integer} dwResult A function result returned to the calling application in a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message (generated automatically by TAPI). Must be zero or one of the negative error values defined for the called function.
     * @returns {Integer} Returns zero if the function succeeds or one of these negative error values:
     * 
     * <b>LINEERR_INVALLINEHANDLE</b>, <b>LINEERR_INVALPARAM</b>, <b>LINEERR_INVALPOINTER</b>, <b>LINEERR_NOMEM</b>, <b>LINEERR_NOTREGISTERED</b>, <b>LINEERR_OPERATIONFAILED</b>, <b>LINE ERR_OPERATIONUNAVAIL</b>, <b>LINEERR_RESOURCEUNAVAIL</b>, <b>LINEERR_UNINITIALIZED</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineproxyresponse
     */
    static lineProxyResponse(hLine, lpProxyRequest, dwResult) {
        result := DllCall("TAPI32.dll\lineProxyResponse", "uint", hLine, "ptr", lpProxyRequest, "uint", dwResult, "int")
        return result
    }

    /**
     * The lineRedirect function redirects the specified offering call to the specified destination address.
     * @param {Integer} hCall Handle to the call to be redirected. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>offering</i>.
     * @param {Pointer<Byte>} lpszDestAddress Pointer to the destination address. This follows the standard dialable number format.
     * @param {Integer} dwCountryCode Country/region code of the party the call is redirected to. If a value of 0 is specified, a default is used by the implementation.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_NOTOWNER, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALCOUNTRYCODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineredirect
     */
    static lineRedirect(hCall, lpszDestAddress, dwCountryCode) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineRedirect", "uint", hCall, "ptr", lpszDestAddress, "uint", dwCountryCode, "int")
        return result
    }

    /**
     * The lineRedirect function redirects the specified offering call to the specified destination address.
     * @param {Integer} hCall Handle to the call to be redirected. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>offering</i>.
     * @param {Pointer<Byte>} lpszDestAddress Pointer to the destination address. This follows the standard dialable number format.
     * @param {Integer} dwCountryCode Country/region code of the party the call is redirected to. If a value of 0 is specified, a default is used by the implementation.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_NOTOWNER, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALCOUNTRYCODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineredirecta
     */
    static lineRedirectA(hCall, lpszDestAddress, dwCountryCode) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineRedirectA", "uint", hCall, "ptr", lpszDestAddress, "uint", dwCountryCode, "int")
        return result
    }

    /**
     * The lineRedirect function redirects the specified offering call to the specified destination address.
     * @param {Integer} hCall Handle to the call to be redirected. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>offering</i>.
     * @param {Pointer<Char>} lpszDestAddress Pointer to the destination address. This follows the standard dialable number format.
     * @param {Integer} dwCountryCode Country/region code of the party the call is redirected to. If a value of 0 is specified, a default is used by the implementation.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_NOTOWNER, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALCOUNTRYCODE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineredirectw
     */
    static lineRedirectW(hCall, lpszDestAddress, dwCountryCode) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineRedirectW", "uint", hCall, "ptr", lpszDestAddress, "uint", dwCountryCode, "int")
        return result
    }

    /**
     * The lineRegisterRequestRecipient function registers the invoking application as a recipient of requests for the specified request mode.
     * @param {Integer} hLineApp Application's usage handle for the line portion of TAPI.
     * @param {Integer} dwRegistrationInstance Application-specific <b>DWORD</b> that is passed back as a parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-request">LINE_REQUEST</a> message. This message notifies the application that a request is pending. This parameter is ignored if <i>bEnable</i> is set to zero. This parameter is examined by TAPI only for registration, not for deregistration. The <i>dwRegistrationInstance</i> value used while deregistering need not match the <i>dwRegistrationInstance</i> used while registering for a request mode.
     * @param {Integer} dwRequestMode Type of request for which the application registers. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linerequestmode--constants">LINEREQUESTMODE_ Constants</a>.
     * @param {Integer} bEnable If <b>TRUE</b>, the application registers the specified request modes; if <b>FALSE</b>, the application deregisters for the specified request modes.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALAPPHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALREQUESTMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineregisterrequestrecipient
     */
    static lineRegisterRequestRecipient(hLineApp, dwRegistrationInstance, dwRequestMode, bEnable) {
        result := DllCall("TAPI32.dll\lineRegisterRequestRecipient", "uint", hLineApp, "uint", dwRegistrationInstance, "uint", dwRequestMode, "uint", bEnable, "int")
        return result
    }

    /**
     * The lineReleaseUserUserInfo function informs the service provider that the application has processed the user-user information contained in the LINECALLINFO structure.
     * @param {Integer} hCall Handle to the call. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_NOMEM, LINEERR_RESOURCEUNAVAIL, LINEERR_NOTOWNER, LINEERR_UNINITIALIZED, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linereleaseuseruserinfo
     */
    static lineReleaseUserUserInfo(hCall) {
        result := DllCall("TAPI32.dll\lineReleaseUserUserInfo", "uint", hCall, "int")
        return result
    }

    /**
     * The lineRemoveFromConference function removes the specified call from the conference call to which it currently belongs. The remaining calls in the conference call are unaffected.
     * @param {Integer} hCall Handle to the call to be removed from the conference. The application must be an owner of this call. The call state of <i>hCall</i> must be <i>conferenced</i>.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_NOMEM, LINEERR_RESOURCEUNAVAIL, LINEERR_NOTOWNER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineremovefromconference
     */
    static lineRemoveFromConference(hCall) {
        result := DllCall("TAPI32.dll\lineRemoveFromConference", "uint", hCall, "int")
        return result
    }

    /**
     * The lineRemoveProvider function removes an existing telephony service provider from the telephony system.
     * @param {Integer} dwPermanentProviderID Permanent provider identifier of the service provider to be removed.
     * @param {Pointer<Void>} hwndOwner Handle to a window to which any dialog boxes that need to be displayed as part of the removal process (for example, a confirmation dialog box by the service provider's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_providerremove">TSPI_providerRemove</a> function) would be attached. Can be a <b>NULL</b> value to indicate that any window created during the function should have no owner window.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INIFILECORRUPT, LINEERR_NOMEM, LINEERR_INVALPARAM, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineremoveprovider
     */
    static lineRemoveProvider(dwPermanentProviderID, hwndOwner) {
        result := DllCall("TAPI32.dll\lineRemoveProvider", "uint", dwPermanentProviderID, "ptr", hwndOwner, "int")
        return result
    }

    /**
     * The lineSecureCall function secures the call from any interruptions or interference that can affect the call's media stream.
     * @param {Integer} hCall Handle to the call to be secured. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_NOMEM, LINEERR_RESOURCEUNAVAIL, LINEERR_NOTOWNER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesecurecall
     */
    static lineSecureCall(hCall) {
        result := DllCall("TAPI32.dll\lineSecureCall", "uint", hCall, "int")
        return result
    }

    /**
     * The lineSendUserUserInfo function sends user-user information to the remote party on the specified call.
     * @param {Integer} hCall Handle to the call on which to send user-user information. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>connected</i>, <i>offering</i>, <i>accepted</i>, or <i>ringback</i>.
     * @param {Pointer<Byte>} lpsUserUserInfo Pointer to a string containing user-user information to be sent to the remote party. User-user information is only sent if supported by the underlying network (see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a>). The protocol discriminator field for the user-user information, if required, should appear as the first byte of the buffer pointed to by <i>lpsUserUserInfo</i>, and must be accounted for in <i>dwSize</i>.
     * @param {Integer} dwSize Size of the user-user information in <i>lpsUserUserInfo</i>, in bytes.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_USERUSERINFOTOOBIG, LINEERR_NOTOWNER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesenduseruserinfo
     */
    static lineSendUserUserInfo(hCall, lpsUserUserInfo, dwSize) {
        lpsUserUserInfo := lpsUserUserInfo is String? StrPtr(lpsUserUserInfo) : lpsUserUserInfo

        result := DllCall("TAPI32.dll\lineSendUserUserInfo", "uint", hCall, "ptr", lpsUserUserInfo, "uint", dwSize, "int")
        return result
    }

    /**
     * The lineSetAgentActivity function sets the agent activity code associated with a particular address.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} dwAddressID Identifier of the address for which the agent activity code is to be changed. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwActivityID New agent activity. The meaning of all values of this parameter are specific to the application and call center server.
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, the function returns one of these negative error values:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_INVALADDRESSSTATE, LINEERR_INVALAGENTACTIVITY, LINEERR_INVALLINEHANDLE, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetagentactivity
     */
    static lineSetAgentActivity(hLine, dwAddressID, dwActivityID) {
        result := DllCall("TAPI32.dll\lineSetAgentActivity", "uint", hLine, "uint", dwAddressID, "uint", dwActivityID, "int")
        return result
    }

    /**
     * The lineSetAgentGroup function sets the agent groups into which the agent is logged into on a particular address.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} dwAddressID Identifier of the address for which the agent information is to be changed. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<LINEAGENTGROUPLIST>} lpAgentGroupList Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgrouplist">LINEAGENTGROUPLIST</a> structure identifying the groups into which the current agent is to be logged in on the address. If the pointer is <b>NULL</b> or the number of groups in the indicated structure is zero, then the agent is logged out of any ACD groups into which it is currently logged in. 
     * 
     * The "Name" fields in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgroupentry">LINEAGENTGROUPENTRY</a> items in the list are ignored for purposes of this function; the control of the logged-in groups is based on the group identifier values only.
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, the function returns one of these negative error values:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_INVALADDRESSSTATE, LINEERR_INVALAGENTGROUP, LINEERR_INVALAGENTID, LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_INVALPASSWORD, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetagentgroup
     */
    static lineSetAgentGroup(hLine, dwAddressID, lpAgentGroupList) {
        result := DllCall("TAPI32.dll\lineSetAgentGroup", "uint", hLine, "uint", dwAddressID, "ptr", lpAgentGroupList, "int")
        return result
    }

    /**
     * The lineSetAgentMeasurementPeriod function sets the measurement period associated with a particular agent.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} hAgent Identifier of the agent whose information is to be changed.
     * @param {Integer} dwMeasurementPeriod New measurement period (seconds). Must be greater than zero.
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetagentmeasurementperiod
     */
    static lineSetAgentMeasurementPeriod(hLine, hAgent, dwMeasurementPeriod) {
        result := DllCall("TAPI32.dll\lineSetAgentMeasurementPeriod", "uint", hLine, "uint", hAgent, "uint", dwMeasurementPeriod, "int")
        return result
    }

    /**
     * The lineSetAgentSessionState function sets the agent session state associated with a particular agent session handle.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} hAgentSession Identifier of the agent session whose information is to be changed.
     * @param {Integer} dwAgentSessionState New agent session state. Must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentsessionstate--constants">LINEAGENTSESSIONSTATE_ constants</a> or zero to leave the agent session state unchanged and modify only the next state.
     * @param {Integer} dwNextAgentSessionState Next agent session state. Must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentsessionstate--constants">LINEAGENTSESSIONSTATE_ constants</a> or zero.
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALAGENTSTATE, LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetagentsessionstate
     */
    static lineSetAgentSessionState(hLine, hAgentSession, dwAgentSessionState, dwNextAgentSessionState) {
        result := DllCall("TAPI32.dll\lineSetAgentSessionState", "uint", hLine, "uint", hAgentSession, "uint", dwAgentSessionState, "uint", dwNextAgentSessionState, "int")
        return result
    }

    /**
     * The lineSetAgentStateEx function sets the agent state associated with a particular agent handle.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} hAgent Identifier of the agent whose information is to be changed.
     * @param {Integer} dwAgentState New agent state. Must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstateex--constants">LINEAGENTSTATEEX_ constants</a>, or zero to leave the agent state unchanged and modify only the next state.
     * @param {Integer} dwNextAgentState Next agent state. Must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstateex--constants">LINEAGENTSTATEEX_ constants</a> or zero.
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALAGENTSTATE, LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetagentstateex
     */
    static lineSetAgentStateEx(hLine, hAgent, dwAgentState, dwNextAgentState) {
        result := DllCall("TAPI32.dll\lineSetAgentStateEx", "uint", hLine, "uint", hAgent, "uint", dwAgentState, "uint", dwNextAgentState, "int")
        return result
    }

    /**
     * The lineSetAgentState function sets the agent state associated with a particular address.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} dwAddressID Identifier of the address for which the agent information is to be changed. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwAgentState New agent state. Must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ Constants</a>, or zero to leave the agent state unchanged and modify only the next state.
     * @param {Integer} dwNextAgentState The agent state that should be automatically set when the current call on the address becomes <i>idle</i>. For example, if it is known that after-call work must be performed, this field can be set to LINEAGENTSTATE_WORKAFTERCALL so that a new call is not assigned to the agent after the current call. Must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ Constants</a>, or zero to use the default next state configured for the agent.
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, the function returns one of these negative error values:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_INVALADDRESSSTATE, LINEERR_INVALAGENTSTATE, LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetagentstate
     */
    static lineSetAgentState(hLine, dwAddressID, dwAgentState, dwNextAgentState) {
        result := DllCall("TAPI32.dll\lineSetAgentState", "uint", hLine, "uint", dwAddressID, "uint", dwAgentState, "uint", dwNextAgentState, "int")
        return result
    }

    /**
     * Enables an application to set its priority in the handoff priority list for a particular media type or Assisted Telephony request mode, or to remove itself from the priority list.
     * @param {Pointer<Byte>} lpszAppFilename A pointer to a string that contains the application executable module filename, without the directory data. In TAPI version 2.0 or later, the parameter can specify a filename in either long or 8.3 filename format.
     * @param {Integer} dwMediaMode A media type for which the priority of the application is to be set. The value can be one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE</a> constants. The value zero should be used to set the application priority for Assisted Telephony requests.
     * @param {Pointer<LINEEXTENSIONID>} lpExtensionID A pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineextensionid">LINEEXTENSIONID</a>. This parameter is ignored.
     * @param {Integer} dwRequestMode The conditions for this parameter are, if the <i>dwMediaMode</i> parameter is zero, this parameter specifies the Assisted Telephony request mode for which priority is to be set. It must be LINEREQUESTMODE_MAKECALL. This parameter is ignored if <i>dwMediaMode</i> is nonzero.
     * @param {Pointer<Byte>} lpszExtensionName This parameter is ignored.
     * @param {Integer} dwPriority A parameter that indicates a new priority for the application. If the value 0 is passed, the application is removed from the priority list for the specified media or request mode; if it was not already present, no error is generated. If the value 1 is passed, the application is inserted as the highest-priority application for the media or request mode; it is removed from a lower-priority position, if already in the list. Any other value generates an error.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * <b>LINEERR_INIFILECORRUPT</b>, <b>LINEERR_INVALREQUESTMODE</b>, <b>LINEERR_INVALAPPNAME</b>, <b>LINEERR_NOMEM</b>, <b>LINEERR_INVALMEDIAMODE</b>, <b>LINEERR_OPERATIONFAILED</b>, <b>LINEERR_INVALPARAM</b>, <b>LINEERR_RESOURCEUNAVAIL</b>, <b>LINEERR_INVALPOINTER</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetapppriority
     */
    static lineSetAppPriority(lpszAppFilename, dwMediaMode, lpExtensionID, dwRequestMode, lpszExtensionName, dwPriority) {
        lpszAppFilename := lpszAppFilename is String? StrPtr(lpszAppFilename) : lpszAppFilename
        lpszExtensionName := lpszExtensionName is String? StrPtr(lpszExtensionName) : lpszExtensionName

        result := DllCall("TAPI32.dll\lineSetAppPriority", "ptr", lpszAppFilename, "uint", dwMediaMode, "ptr", lpExtensionID, "uint", dwRequestMode, "ptr", lpszExtensionName, "uint", dwPriority, "int")
        return result
    }

    /**
     * Enables an application to set its priority in the handoff priority list for a particular media type or Assisted Telephony request mode, or to remove itself from the priority list.
     * @param {Pointer<Byte>} lpszAppFilename A pointer to a string that contains the application executable module filename, without the directory data. In TAPI version 2.0 or later, the parameter can specify a filename in either long or 8.3 filename format.
     * @param {Integer} dwMediaMode A media type for which the priority of the application is to be set. The value can be one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE</a> constants. The value zero should be used to set the application priority for Assisted Telephony requests.
     * @param {Pointer<LINEEXTENSIONID>} lpExtensionID A pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineextensionid">LINEEXTENSIONID</a>. This parameter is ignored.
     * @param {Integer} dwRequestMode The conditions for this parameter are, if the <i>dwMediaMode</i> parameter is zero, this parameter specifies the Assisted Telephony request mode for which priority is to be set. It must be LINEREQUESTMODE_MAKECALL. This parameter is ignored if <i>dwMediaMode</i> is nonzero.
     * @param {Pointer<Byte>} lpszExtensionName This parameter is ignored.
     * @param {Integer} dwPriority A parameter that indicates a new priority for the application. If the value 0 is passed, the application is removed from the priority list for the specified media or request mode; if it was not already present, no error is generated. If the value 1 is passed, the application is inserted as the highest-priority application for the media or request mode; it is removed from a lower-priority position, if already in the list. Any other value generates an error.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * <b>LINEERR_INIFILECORRUPT</b>, <b>LINEERR_INVALREQUESTMODE</b>, <b>LINEERR_INVALAPPNAME</b>, <b>LINEERR_NOMEM</b>, <b>LINEERR_INVALMEDIAMODE</b>, <b>LINEERR_OPERATIONFAILED</b>, <b>LINEERR_INVALPARAM</b>, <b>LINEERR_RESOURCEUNAVAIL</b>, <b>LINEERR_INVALPOINTER</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetappprioritya
     */
    static lineSetAppPriorityA(lpszAppFilename, dwMediaMode, lpExtensionID, dwRequestMode, lpszExtensionName, dwPriority) {
        lpszAppFilename := lpszAppFilename is String? StrPtr(lpszAppFilename) : lpszAppFilename
        lpszExtensionName := lpszExtensionName is String? StrPtr(lpszExtensionName) : lpszExtensionName

        result := DllCall("TAPI32.dll\lineSetAppPriorityA", "ptr", lpszAppFilename, "uint", dwMediaMode, "ptr", lpExtensionID, "uint", dwRequestMode, "ptr", lpszExtensionName, "uint", dwPriority, "int")
        return result
    }

    /**
     * Enables an application to set its priority in the handoff priority list for a particular media type or Assisted Telephony request mode, or to remove itself from the priority list.
     * @param {Pointer<Char>} lpszAppFilename A pointer to a string that contains the application executable module filename, without the directory data. In TAPI version 2.0 or later, the parameter can specify a filename in either long or 8.3 filename format.
     * @param {Integer} dwMediaMode A media type for which the priority of the application is to be set. The value can be one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE</a> constants. The value zero should be used to set the application priority for Assisted Telephony requests.
     * @param {Pointer<LINEEXTENSIONID>} lpExtensionID A pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineextensionid">LINEEXTENSIONID</a>. This parameter is ignored.
     * @param {Integer} dwRequestMode The conditions for this parameter are, if the <i>dwMediaMode</i> parameter is zero, this parameter specifies the Assisted Telephony request mode for which priority is to be set. It must be LINEREQUESTMODE_MAKECALL. This parameter is ignored if <i>dwMediaMode</i> is nonzero.
     * @param {Pointer<Char>} lpszExtensionName This parameter is ignored.
     * @param {Integer} dwPriority A parameter that indicates a new priority for the application. If the value 0 is passed, the application is removed from the priority list for the specified media or request mode; if it was not already present, no error is generated. If the value 1 is passed, the application is inserted as the highest-priority application for the media or request mode; it is removed from a lower-priority position, if already in the list. Any other value generates an error.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * <b>LINEERR_INIFILECORRUPT</b>, <b>LINEERR_INVALREQUESTMODE</b>, <b>LINEERR_INVALAPPNAME</b>, <b>LINEERR_NOMEM</b>, <b>LINEERR_INVALMEDIAMODE</b>, <b>LINEERR_OPERATIONFAILED</b>, <b>LINEERR_INVALPARAM</b>, <b>LINEERR_RESOURCEUNAVAIL</b>, <b>LINEERR_INVALPOINTER</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetapppriorityw
     */
    static lineSetAppPriorityW(lpszAppFilename, dwMediaMode, lpExtensionID, dwRequestMode, lpszExtensionName, dwPriority) {
        lpszAppFilename := lpszAppFilename is String? StrPtr(lpszAppFilename) : lpszAppFilename
        lpszExtensionName := lpszExtensionName is String? StrPtr(lpszExtensionName) : lpszExtensionName

        result := DllCall("TAPI32.dll\lineSetAppPriorityW", "ptr", lpszAppFilename, "uint", dwMediaMode, "ptr", lpExtensionID, "uint", dwRequestMode, "ptr", lpszExtensionName, "uint", dwPriority, "int")
        return result
    }

    /**
     * The lineSetAppSpecific function enables an application to set the application-specific field of the specified call's call-information record.
     * @param {Integer} hCall Handle to the call whose application-specific field needs to be set. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @param {Integer} dwAppSpecific New content of the <b>dwAppSpecific</b> member for the call's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a> structure. This value is not interpreted by the Telephony API.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_NOTOWNER, LINEERR_OPERATIONUNAVAIL, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetappspecific
     */
    static lineSetAppSpecific(hCall, dwAppSpecific) {
        result := DllCall("TAPI32.dll\lineSetAppSpecific", "uint", hCall, "uint", dwAppSpecific, "int")
        return result
    }

    /**
     * The lineSetCallData function sets the CallData member in LINECALLINFO.
     * @param {Integer} hCall Handle to the call. The application must have OWNER privilege.
     * @param {Pointer<Void>} lpCallData Address of the data to be copied to the <b>CallData</b> member in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a>, replacing any existing data. For more information, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/call-data-ovr">call data</a> topic.
     * @param {Integer} dwSize Number of bytes of data to be copied. A value of 0 causes any existing data to be removed. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If <i>lpCallData</i> is a pointer to a string, the size must include the null terminator.</div>
     * <div> </div>
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, the function returns one of these negative error values:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_INVALCALLSTATE, LINEERR_INVALPARAM, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_NOTOWNER, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetcalldata
     */
    static lineSetCallData(hCall, lpCallData, dwSize) {
        result := DllCall("TAPI32.dll\lineSetCallData", "uint", hCall, "ptr", lpCallData, "uint", dwSize, "int")
        return result
    }

    /**
     * The lineSetCallParams function allows an application to change bearer mode and/or the rate parameters of an existing call.
     * @param {Integer} hCall Handle to the call whose parameters are to be changed. The application must be an owner of the call. The call state of <i>hCall</i> can be any state except <i>idle</i> or <i>disconnected</i>.
     * @param {Integer} dwBearerMode New bearer mode for the call. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linebearermode--constants">LINEBEARERMODE_ Constants</a>.
     * @param {Integer} dwMinRate Lower bound for the call's new data rate. The application can accept a new rate as low as this one.
     * @param {Integer} dwMaxRate Upper bound for the call's new data rate. This is the maximum data rate the application can accept. If an exact data rate is required, <i>dwMinRate</i> and <i>dwMaxRate</i> should be equal.
     * @param {Pointer<LINEDIALPARAMS>} lpDialParams Pointer to the new dial parameters for the call, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedialparams">LINEDIALPARAMS</a>. This parameter can be left <b>NULL</b> if the call's current dialing parameters are to be used.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BEARERMODEUNAVAIL, LINEERR_NOTOWNER, LINEERR_INVALBEARERMODE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLSTATE, LINEERR_RATEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALRATE, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetcallparams
     */
    static lineSetCallParams(hCall, dwBearerMode, dwMinRate, dwMaxRate, lpDialParams) {
        result := DllCall("TAPI32.dll\lineSetCallParams", "uint", hCall, "uint", dwBearerMode, "uint", dwMinRate, "uint", dwMaxRate, "ptr", lpDialParams, "int")
        return result
    }

    /**
     * The lineSetCallPrivilege function sets the application's privilege to the specified privilege.
     * @param {Integer} hCall Handle to the call whose privilege is to be set. The call state of <i>hCall</i> can be any state.
     * @param {Integer} dwCallPrivilege Required privilege for the specified call. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallprivilege--constants">LINECALLPRIVILEGE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLSTATE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCALLPRIVILEGE, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetcallprivilege
     */
    static lineSetCallPrivilege(hCall, dwCallPrivilege) {
        result := DllCall("TAPI32.dll\lineSetCallPrivilege", "uint", hCall, "uint", dwCallPrivilege, "int")
        return result
    }

    /**
     * The lineSetCallQualityOfService function allows the application to attempt to change the quality of service parameters (reserved capacity and performance guarantees) for an existing call.
     * @param {Integer} hCall Handle to the call. The application must have OWNER privilege.
     * @param {Pointer<Void>} lpSendingFlowspec Pointer to memory containing a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure followed by provider-specific data. The provider-specific portion following the <b>FLOWSPEC</b> structure must not contain pointers to other blocks of memory in the application process, because TAPI will not know how to marshal the data pointed to by the private pointer(s) and convey it through interprocess communication to the service provider.
     * @param {Integer} dwSendingFlowspecSize Total size of the <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure and accompanying provider-specific data, in bytes. This is equivalent to what would have been stored in <b>SendingFlowspec</b> in a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-qos">QOS</a> structure.
     * @param {Pointer<Void>} lpReceivingFlowspec Pointer to memory containing a <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure followed by provider-specific data. The provider-specific portion following the <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure must not contain pointers to other blocks of memory in the application process, because TAPI will not know how to marshal the data pointed to by the private pointer(s) and convey it through interprocess communication to the service provider.
     * @param {Integer} dwReceivingFlowspecSize Total size of the <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> and accompanying provider-specific data, in bytes. This is equivalent to what would have been stored in <b>ReceivingFlowspec</b> in a <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-qos">QOS</a> structure.
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, the function returns one of these negative error values:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_INVALCALLSTATE, LINEERR_INVALPARAM, LINEERR_INVALPOINTER, LINEERR_INVALRATE, LINEERR_NOMEM, LINEERR_NOTOWNER, LINEERR_OPERATIONUNAVAIL, LINEERR_OPERATIONFAILED, LINEERR_RATEUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetcallqualityofservice
     */
    static lineSetCallQualityOfService(hCall, lpSendingFlowspec, dwSendingFlowspecSize, lpReceivingFlowspec, dwReceivingFlowspecSize) {
        result := DllCall("TAPI32.dll\lineSetCallQualityOfService", "uint", hCall, "ptr", lpSendingFlowspec, "uint", dwSendingFlowspecSize, "ptr", lpReceivingFlowspec, "uint", dwReceivingFlowspecSize, "int")
        return result
    }

    /**
     * The lineSetCallTreatment function sets the sounds a party on a call that is unanswered or on hold hears. Except for basic parameter validation, it is a straight pass-through by TAPI to the service provider.
     * @param {Integer} hCall Handle to the call. The application must have OWNER privilege.
     * @param {Integer} dwTreatment One of the call treatments supported on the address on which the call appears, as indicated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddresscaps">LINEADDRESSCAPS</a>. LINEERR_INVALPARAM is returned if the specified treatment is not supported.
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, the function returns one of these negative error values:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_INVALCALLSTATE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_NOTOWNER, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetcalltreatment
     */
    static lineSetCallTreatment(hCall, dwTreatment) {
        result := DllCall("TAPI32.dll\lineSetCallTreatment", "uint", hCall, "uint", dwTreatment, "int")
        return result
    }

    /**
     * The lineSetCurrentLocation function sets the location used as the context for address translation.
     * @param {Integer} hLineApp Application handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If an application has not yet called the 
     * <b>lineInitializeEx</b> function, it can set the <i>hLineApp</i> parameter to zero.
     * @param {Integer} dwLocation New value for the CurrentLocation entry in the [Locations] section in the registry. It must contain a valid permanent identifier of a Location entry in the [Locations] section, as obtained from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegettranslatecaps">lineGetTranslateCaps</a>. If it is valid, the CurrentLocation entry is updated.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INIFILECORRUPT, LINEERR_NOMEM, LINEERR_INVALAPPHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALLOCATION, LINEERR_RESOURCEUNAVAIL, LINEERR_NODRIVER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetcurrentlocation
     */
    static lineSetCurrentLocation(hLineApp, dwLocation) {
        result := DllCall("TAPI32.dll\lineSetCurrentLocation", "uint", hLineApp, "uint", dwLocation, "int")
        return result
    }

    /**
     * The lineSetDevConfig function allows the application to restore the configuration of a media stream device on a line device to a setup previously obtained using lineGetDevConfig.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<Void>} lpDeviceConfig Pointer to the opaque configuration data structure that was returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> in the variable portion of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure.
     * @param {Integer} dwSize Number of bytes in the structure pointed to by <i>lpDeviceConfig</i>. This value is returned in the <b>dwStringSize</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a>.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose configuration is to be set. Valid device class strings are the same as those specified for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a> function.
     * @returns {Integer} Returns zero if the function succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INVALDEVICECLASS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALPOINTER, LINEERR_OPERATIONFAILED, LINEERR_INVALPARAM, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINESTATE, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetdevconfig
     */
    static lineSetDevConfig(dwDeviceID, lpDeviceConfig, dwSize, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineSetDevConfig", "uint", dwDeviceID, "ptr", lpDeviceConfig, "uint", dwSize, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineSetDevConfig function allows the application to restore the configuration of a media stream device on a line device to a setup previously obtained using lineGetDevConfig.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<Void>} lpDeviceConfig Pointer to the opaque configuration data structure that was returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> in the variable portion of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure.
     * @param {Integer} dwSize Number of bytes in the structure pointed to by <i>lpDeviceConfig</i>. This value is returned in the <b>dwStringSize</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a>.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose configuration is to be set. Valid device class strings are the same as those specified for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a> function.
     * @returns {Integer} Returns zero if the function succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INVALDEVICECLASS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALPOINTER, LINEERR_OPERATIONFAILED, LINEERR_INVALPARAM, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINESTATE, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetdevconfiga
     */
    static lineSetDevConfigA(dwDeviceID, lpDeviceConfig, dwSize, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineSetDevConfigA", "uint", dwDeviceID, "ptr", lpDeviceConfig, "uint", dwSize, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineSetDevConfig function allows the application to restore the configuration of a media stream device on a line device to a setup previously obtained using lineGetDevConfig.
     * @param {Integer} dwDeviceID Identifier of the line device to be configured.
     * @param {Pointer<Void>} lpDeviceConfig Pointer to the opaque configuration data structure that was returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a> in the variable portion of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure.
     * @param {Integer} dwSize Number of bytes in the structure pointed to by <i>lpDeviceConfig</i>. This value is returned in the <b>dwStringSize</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> structure returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a>.
     * @param {Pointer<Char>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose configuration is to be set. Valid device class strings are the same as those specified for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a> function.
     * @returns {Integer} Returns zero if the function succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INVALDEVICECLASS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALPOINTER, LINEERR_OPERATIONFAILED, LINEERR_INVALPARAM, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINESTATE, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetdevconfigw
     */
    static lineSetDevConfigW(dwDeviceID, lpDeviceConfig, dwSize, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\lineSetDevConfigW", "uint", dwDeviceID, "ptr", lpDeviceConfig, "uint", dwSize, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The lineSetLineDevStatus function sets the line device status.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} dwStatusToChange One or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedevstatusflags--constants">LINEDEVSTATUSFLAGS_ Constants</a>.
     * @param {Integer} fStatus <b>TRUE</b> (–1) to turn on the indicated status bit(s), <b>FALSE</b> (0) to turn off.
     * @returns {Integer} Returns a positive request identifier if the asynchronous operation starts; otherwise, the function returns one of these negative error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALLINESTATE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONUNAVAIL, LINEERR_OPERATIONFAILED, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetlinedevstatus
     */
    static lineSetLineDevStatus(hLine, dwStatusToChange, fStatus) {
        result := DllCall("TAPI32.dll\lineSetLineDevStatus", "uint", hLine, "uint", dwStatusToChange, "uint", fStatus, "int")
        return result
    }

    /**
     * The lineSetMediaControl function enables and disables control actions on the media stream associated with the specified line, address, or call.
     * @param {Integer} hLine Handle to an open line device.
     * @param {Integer} dwAddressID Address identifier on the given open line device. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} hCall Handle to a call. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @param {Integer} dwSelect Whether the media control requested is associated with a single call, is the default for all calls on an address, or is the default for all calls on a line. This parameter one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallselect--constants">LINECALLSELECT_ Constants</a>.
     * @param {Pointer<LINEMEDIACONTROLDIGIT>} lpDigitList Pointer to the array that contains the digits that are to trigger media control actions, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linemediacontroldigit">LINEMEDIACONTROLDIGIT</a>. Each time a digit in the digit list is detected, the specified media control action is carried out on the call's media stream. 
     * 
     * 
     * 
     * 
     * Valid digits for pulse mode are '0' through '9'. Valid digits for DTMF mode are '0' through '9', 'A', 'B', 'C', 'D', '*', '#'.
     * @param {Integer} dwDigitNumEntries Number of entries in the <i>lpDigitList</i>.
     * @param {Pointer<LINEMEDIACONTROLMEDIA>} lpMediaList Pointer to an array with entries of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linemediacontrolmedia">LINEMEDIACONTROLMEDIA</a>. The array has <i>dwMediaNumEntries</i> entries. Each entry contains a media type to be monitored, media-type specific information (such as duration), and a media control field. If a media type in the list is detected, the corresponding media control action is performed on the call's media stream.
     * @param {Integer} dwMediaNumEntries Number of entries in <i>lpMediaList</i>.
     * @param {Pointer<LINEMEDIACONTROLTONE>} lpToneList Pointer to an array with entries of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linemediacontroltone">LINEMEDIACONTROLTONE</a>. The array has <i>dwToneNumEntries</i> entries. Each entry contains a description of a tone to be monitored, duration of the tone, and a media-control field. If a tone in the list is detected, the corresponding media control action is performed on the call's media stream.
     * @param {Integer} dwToneNumEntries Number of entries in <i>lpToneList</i>.
     * @param {Pointer<LINEMEDIACONTROLCALLSTATE>} lpCallStateList Pointer to an array with entries of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linemediacontrolcallstate">LINEMEDIACONTROLCALLSTATE</a>. The array has <i>dwCallStateNumEntries</i> entries. Each entry contains a call state and a media control action. Whenever the given call transitions into one of the call states in the list, the corresponding media control action is invoked.
     * @param {Integer} dwCallStateNumEntries Number of entries in <i>lpCallStateList</i>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_NOMEM, LINEERR_INVALCALLHANDLE, LINEERR_NOTOWNER, LINEERR_INVALCALLSELECT, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATELIST, LINEERR_OPERATIONFAILED, LINEERR_INVALDIGITLIST, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINEHANDLE, LINEERR_UNINITIALIZED, LINEERR_INVALMEDIALIST, LINEERR_INVALPOINTER, LINEERR_INVALTONELIST.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetmediacontrol
     */
    static lineSetMediaControl(hLine, dwAddressID, hCall, dwSelect, lpDigitList, dwDigitNumEntries, lpMediaList, dwMediaNumEntries, lpToneList, dwToneNumEntries, lpCallStateList, dwCallStateNumEntries) {
        result := DllCall("TAPI32.dll\lineSetMediaControl", "uint", hLine, "uint", dwAddressID, "uint", hCall, "uint", dwSelect, "ptr", lpDigitList, "uint", dwDigitNumEntries, "ptr", lpMediaList, "uint", dwMediaNumEntries, "ptr", lpToneList, "uint", dwToneNumEntries, "ptr", lpCallStateList, "uint", dwCallStateNumEntries, "int")
        return result
    }

    /**
     * The lineSetMediaMode function sets the media type(s) of the specified call in its LINECALLINFO structure. For more information, see ITLegacyCallMediaControl::SetMediaType.
     * @param {Integer} hCall Handle to the call whose media type is to be changed. The application must be an owner of the call. The call state of <i>hCall</i> can be any state.
     * @param {Integer} dwMediaModes New media type(s) for the call. This parameter uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>. As long as the UNKNOWN media type flag is set, other media type flags may be set as well. This is used to identify a call's media type as not fully determined, but narrowed down to one of a small set of specified media types. If the UNKNOWN flag is not set, only a single media type can be specified.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALMEDIAMODE, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetmediamode
     */
    static lineSetMediaMode(hCall, dwMediaModes) {
        result := DllCall("TAPI32.dll\lineSetMediaMode", "uint", hCall, "uint", dwMediaModes, "int")
        return result
    }

    /**
     * The lineSetQueueMeasurementPeriod function sets the measurement period associated with a particular queue.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} dwQueueID Identifier of the queue whose information is to be changed.
     * @param {Integer} dwMeasurementPeriod New measurement period (seconds). Must be greater than zero.
     * @returns {Integer} Returns a request identifier if the asynchronous operation starts; otherwise, the function returns one of the following error values:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_INVALPARAM, LINEERR_NOMEM, LINEERR_OPERATIONFAILED, LINEERR_OPERATIONUNAVAIL, LINEERR_RESOURCEUNAVAIL, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetqueuemeasurementperiod
     */
    static lineSetQueueMeasurementPeriod(hLine, dwQueueID, dwMeasurementPeriod) {
        result := DllCall("TAPI32.dll\lineSetQueueMeasurementPeriod", "uint", hLine, "uint", dwQueueID, "uint", dwMeasurementPeriod, "int")
        return result
    }

    /**
     * The lineSetNumRings function sets the number of rings that must occur before an incoming call is answered.
     * @param {Integer} hLine Handle to the open line device.
     * @param {Integer} dwAddressID Address on the line device. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} dwNumRings Number of rings before a call should be answered in order to honor the toll-saver requests from all applications.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALADDRESSID, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetnumrings
     */
    static lineSetNumRings(hLine, dwAddressID, dwNumRings) {
        result := DllCall("TAPI32.dll\lineSetNumRings", "uint", hLine, "uint", dwAddressID, "uint", dwNumRings, "int")
        return result
    }

    /**
     * The lineSetStatusMessages function enables an application to specify which notification messages to receive for events related to status changes for the specified line or any of its addresses.
     * @param {Integer} hLine Handle to the line device.
     * @param {Integer} dwLineStates Bit array that identifies for which line-device status changes a message is to be sent to the application. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedevstate--constants">LINEDEVSTATE_ Constants</a>.
     * @param {Integer} dwAddressStates Bit array that identifies for which address status changes a message is to be sent to the application. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddressstate--constants">LINEADDRESSSTATE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESSSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINESTATE, LINEERR_UNINITIALIZED, LINEERR_NOMEM, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetstatusmessages
     */
    static lineSetStatusMessages(hLine, dwLineStates, dwAddressStates) {
        result := DllCall("TAPI32.dll\lineSetStatusMessages", "uint", hLine, "uint", dwLineStates, "uint", dwAddressStates, "int")
        return result
    }

    /**
     * The lineSetTerminal function enables an application to specify which terminal information related to the specified line, address, or call is to be routed.
     * @param {Integer} hLine Handle to an open line device.
     * @param {Integer} dwAddressID Address on the given open line device. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Integer} hCall Handle to a call. The call state of <i>hCall</i> can be any state, if <i>dwSelect</i> is CALL.
     * @param {Integer} dwSelect Whether the terminal setting is requested for the line, the address, or just the specified call. If line or address is specified, events either apply to the line or address itself or serve as a default initial setting for all new calls on the line or address. This parameter uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallselect--constants">LINECALLSELECT_ Constants</a>.
     * @param {Integer} dwTerminalModes Class of low-level events to be routed to the given terminal. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermmode--constants">LINETERMMODE_ Constants</a>.
     * @param {Integer} dwTerminalID Device identifier of the terminal device where the given events are to be routed. Terminal identifiers are small integers in the range of zero to one less than <b>dwNumTerminals</b>, where <b>dwNumTerminals</b>, and the terminal modes each terminal is capable of handling, are returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevcaps">lineGetDevCaps</a>. 
     * 
     * 
     * 
     * 
     * These terminal identifiers have no relation to other device identifiers and are defined by the service provider using device capabilities.
     * @param {Integer} bEnable If <b>TRUE</b>, <i>dwTerminalID</i> is valid and the specified event classes are routed to or from that terminal. If <b>FALSE</b>, these events are not routed to or from the terminal device with identifier equal to <i>dwTerminalID</i>.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESSID, LINEERR_NOMEM, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSELECT, LINEERR_OPERATIONFAILED, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALTERMINALID, LINEERR_UNINITIALIZED, LINEERR_INVALTERMINALMODE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetterminal
     */
    static lineSetTerminal(hLine, dwAddressID, hCall, dwSelect, dwTerminalModes, dwTerminalID, bEnable) {
        result := DllCall("TAPI32.dll\lineSetTerminal", "uint", hLine, "uint", dwAddressID, "uint", hCall, "uint", dwSelect, "uint", dwTerminalModes, "uint", dwTerminalID, "uint", bEnable, "int")
        return result
    }

    /**
     * The lineSetTollList function manipulates the toll list.
     * @param {Integer} hLineApp Application handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If an application has not yet called the 
     * <b>lineInitializeEx</b> function, it can set the <i>hLineApp</i> parameter to zero.
     * @param {Integer} dwDeviceID Device identifier for the line device upon which the call is intended to be dialed, so that variations in dialing procedures on different lines can be applied to the translation process.
     * @param {Pointer<Byte>} lpszAddressIn TBD
     * @param {Integer} dwTollListOption Toll list operation to be performed. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetolllistoption--constants">LINETOLLLISTOPTION_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INVALAPPHANDLE, LINEERR_NOMEM, LINEERR_INVALADDRESS, LINEERR_OPERATIONFAILED, LINEERR_INVALPARAM, LINEERR_RESOURCEUNAVAIL, LINEERR_INIFILECORRUPT, LINEERR_UNINITIALIZED, LINEERR_INVALLOCATION.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesettolllist
     */
    static lineSetTollList(hLineApp, dwDeviceID, lpszAddressIn, dwTollListOption) {
        lpszAddressIn := lpszAddressIn is String? StrPtr(lpszAddressIn) : lpszAddressIn

        result := DllCall("TAPI32.dll\lineSetTollList", "uint", hLineApp, "uint", dwDeviceID, "ptr", lpszAddressIn, "uint", dwTollListOption, "int")
        return result
    }

    /**
     * The lineSetTollList function manipulates the toll list.
     * @param {Integer} hLineApp Application handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If an application has not yet called the 
     * <b>lineInitializeEx</b> function, it can set the <i>hLineApp</i> parameter to zero.
     * @param {Integer} dwDeviceID Device identifier for the line device upon which the call is intended to be dialed, so that variations in dialing procedures on different lines can be applied to the translation process.
     * @param {Pointer<Byte>} lpszAddressIn TBD
     * @param {Integer} dwTollListOption Toll list operation to be performed. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetolllistoption--constants">LINETOLLLISTOPTION_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INVALAPPHANDLE, LINEERR_NOMEM, LINEERR_INVALADDRESS, LINEERR_OPERATIONFAILED, LINEERR_INVALPARAM, LINEERR_RESOURCEUNAVAIL, LINEERR_INIFILECORRUPT, LINEERR_UNINITIALIZED, LINEERR_INVALLOCATION.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesettolllista
     */
    static lineSetTollListA(hLineApp, dwDeviceID, lpszAddressIn, dwTollListOption) {
        lpszAddressIn := lpszAddressIn is String? StrPtr(lpszAddressIn) : lpszAddressIn

        result := DllCall("TAPI32.dll\lineSetTollListA", "uint", hLineApp, "uint", dwDeviceID, "ptr", lpszAddressIn, "uint", dwTollListOption, "int")
        return result
    }

    /**
     * The lineSetTollList function manipulates the toll list.
     * @param {Integer} hLineApp Application handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If an application has not yet called the 
     * <b>lineInitializeEx</b> function, it can set the <i>hLineApp</i> parameter to zero.
     * @param {Integer} dwDeviceID Device identifier for the line device upon which the call is intended to be dialed, so that variations in dialing procedures on different lines can be applied to the translation process.
     * @param {Pointer<Char>} lpszAddressInW Pointer to a <b>null</b>-terminated string containing the address from which the prefix information is to be extracted for processing. This parameter must not be <b>NULL</b>, and it must be in the canonical address format.
     * @param {Integer} dwTollListOption Toll list operation to be performed. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetolllistoption--constants">LINETOLLLISTOPTION_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_NODRIVER, LINEERR_INVALAPPHANDLE, LINEERR_NOMEM, LINEERR_INVALADDRESS, LINEERR_OPERATIONFAILED, LINEERR_INVALPARAM, LINEERR_RESOURCEUNAVAIL, LINEERR_INIFILECORRUPT, LINEERR_UNINITIALIZED, LINEERR_INVALLOCATION.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesettolllistw
     */
    static lineSetTollListW(hLineApp, dwDeviceID, lpszAddressInW, dwTollListOption) {
        lpszAddressInW := lpszAddressInW is String? StrPtr(lpszAddressInW) : lpszAddressInW

        result := DllCall("TAPI32.dll\lineSetTollListW", "uint", hLineApp, "uint", dwDeviceID, "ptr", lpszAddressInW, "uint", dwTollListOption, "int")
        return result
    }

    /**
     * The lineSetupConference function sets up a conference call for the addition of the third party.
     * @param {Integer} hCall Handle to the Initial call that identifies the first party of a conference call. In some environments (as described in device capabilities), a call must exist to start a conference call, and the application must be an owner of this call. In other telephony environments, no call initially exists, <i>hCall</i> must be left <b>NULL</b>, and <i>hLine</i> must be specified to identify the line on which the conference call is to be initiated. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Integer} hLine Handle to the line. This handle is used to identify the line device on which to originate the conference call if <i>hCall</i> is <b>NULL</b>. The <i>hLine</i> parameter is ignored if <i>hCall</i> is non-<b>NULL</b>.
     * @param {Pointer<UInt32>} lphConfCall Pointer to an HCALL handle. This location is then loaded with a handle identifying the newly created conference call. The application is the initial sole owner of this call. The call state of <i>hConfCall</i> is not applicable.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an HCALL handle. When setting up a call for the addition of a new party, a new temporary call (consultation call) is automatically allocated. Initially, the application is the sole owner for this call.
     * @param {Integer} dwNumParties Expected number of parties in the conference call. This number is passed to the service provider. The service provider is free to do as it pleases with this number: ignore it, use it as a hint to allocate the right size conference bridge inside the switch, and so on.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure containing call parameters to use when establishing the consultation call. This parameter can be set to <b>NULL</b> if no special call setup parameters are desired.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding LINE_REPLY message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BEARERMODEUNAVAIL, LINEERR_UNINITIALIZED, LINEERR_CALLUNAVAIL, LINEERR_INVALMEDIAMODE, LINEERR_CONFERENCEFULL, LINEERR_INVALPOINTER, LINEERR_INUSE, LINEERR_INVALRATE, LINEERR_INVALADDRESSMODE, LINEERR_NOMEM, LINEERR_INVALBEARERMODE, LINEERR_NOTOWNER, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLPARAMS, LINEERR_RATEUNAVAIL, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINESTATE, LINEERR_STRUCTURETOOSMALL, LINEERR_USERUSERINFOTOOBIG.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetupconference
     */
    static lineSetupConference(hCall, hLine, lphConfCall, lphConsultCall, dwNumParties, lpCallParams) {
        result := DllCall("TAPI32.dll\lineSetupConference", "uint", hCall, "uint", hLine, "uint*", lphConfCall, "uint*", lphConsultCall, "uint", dwNumParties, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineSetupConference function sets up a conference call for the addition of the third party.
     * @param {Integer} hCall Handle to the Initial call that identifies the first party of a conference call. In some environments (as described in device capabilities), a call must exist to start a conference call, and the application must be an owner of this call. In other telephony environments, no call initially exists, <i>hCall</i> must be left <b>NULL</b>, and <i>hLine</i> must be specified to identify the line on which the conference call is to be initiated. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Integer} hLine Handle to the line. This handle is used to identify the line device on which to originate the conference call if <i>hCall</i> is <b>NULL</b>. The <i>hLine</i> parameter is ignored if <i>hCall</i> is non-<b>NULL</b>.
     * @param {Pointer<UInt32>} lphConfCall Pointer to an HCALL handle. This location is then loaded with a handle identifying the newly created conference call. The application is the initial sole owner of this call. The call state of <i>hConfCall</i> is not applicable.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an HCALL handle. When setting up a call for the addition of a new party, a new temporary call (consultation call) is automatically allocated. Initially, the application is the sole owner for this call.
     * @param {Integer} dwNumParties Expected number of parties in the conference call. This number is passed to the service provider. The service provider is free to do as it pleases with this number: ignore it, use it as a hint to allocate the right size conference bridge inside the switch, and so on.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure containing call parameters to use when establishing the consultation call. This parameter can be set to <b>NULL</b> if no special call setup parameters are desired.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding LINE_REPLY message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BEARERMODEUNAVAIL, LINEERR_UNINITIALIZED, LINEERR_CALLUNAVAIL, LINEERR_INVALMEDIAMODE, LINEERR_CONFERENCEFULL, LINEERR_INVALPOINTER, LINEERR_INUSE, LINEERR_INVALRATE, LINEERR_INVALADDRESSMODE, LINEERR_NOMEM, LINEERR_INVALBEARERMODE, LINEERR_NOTOWNER, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLPARAMS, LINEERR_RATEUNAVAIL, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINESTATE, LINEERR_STRUCTURETOOSMALL, LINEERR_USERUSERINFOTOOBIG.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetupconferencea
     */
    static lineSetupConferenceA(hCall, hLine, lphConfCall, lphConsultCall, dwNumParties, lpCallParams) {
        result := DllCall("TAPI32.dll\lineSetupConferenceA", "uint", hCall, "uint", hLine, "uint*", lphConfCall, "uint*", lphConsultCall, "uint", dwNumParties, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineSetupConference function sets up a conference call for the addition of the third party.
     * @param {Integer} hCall Handle to the Initial call that identifies the first party of a conference call. In some environments (as described in device capabilities), a call must exist to start a conference call, and the application must be an owner of this call. In other telephony environments, no call initially exists, <i>hCall</i> must be left <b>NULL</b>, and <i>hLine</i> must be specified to identify the line on which the conference call is to be initiated. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Integer} hLine Handle to the line. This handle is used to identify the line device on which to originate the conference call if <i>hCall</i> is <b>NULL</b>. The <i>hLine</i> parameter is ignored if <i>hCall</i> is non-<b>NULL</b>.
     * @param {Pointer<UInt32>} lphConfCall Pointer to an HCALL handle. This location is then loaded with a handle identifying the newly created conference call. The application is the initial sole owner of this call. The call state of <i>hConfCall</i> is not applicable.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an HCALL handle. When setting up a call for the addition of a new party, a new temporary call (consultation call) is automatically allocated. Initially, the application is the sole owner for this call.
     * @param {Integer} dwNumParties Expected number of parties in the conference call. This number is passed to the service provider. The service provider is free to do as it pleases with this number: ignore it, use it as a hint to allocate the right size conference bridge inside the switch, and so on.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure containing call parameters to use when establishing the consultation call. This parameter can be set to <b>NULL</b> if no special call setup parameters are desired.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding LINE_REPLY message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BEARERMODEUNAVAIL, LINEERR_UNINITIALIZED, LINEERR_CALLUNAVAIL, LINEERR_INVALMEDIAMODE, LINEERR_CONFERENCEFULL, LINEERR_INVALPOINTER, LINEERR_INUSE, LINEERR_INVALRATE, LINEERR_INVALADDRESSMODE, LINEERR_NOMEM, LINEERR_INVALBEARERMODE, LINEERR_NOTOWNER, LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_INVALCALLPARAMS, LINEERR_RATEUNAVAIL, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALLINESTATE, LINEERR_STRUCTURETOOSMALL, LINEERR_USERUSERINFOTOOBIG.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetupconferencew
     */
    static lineSetupConferenceW(hCall, hLine, lphConfCall, lphConsultCall, dwNumParties, lpCallParams) {
        result := DllCall("TAPI32.dll\lineSetupConferenceW", "uint", hCall, "uint", hLine, "uint*", lphConfCall, "uint*", lphConsultCall, "uint", dwNumParties, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineSetupTransfer function initiates a transfer of the call specified by the hCall parameter.
     * @param {Integer} hCall Handle to the call to be transferred. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an <i>hCall</i> handle. This location is then loaded with a handle identifying the temporary consultation call. When setting up a call for transfer, a consultation call is automatically allocated that enables 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linedial">lineDial</a> to dial the address associated with the new transfer destination of the call. The originating party can carry on a conversation over this consultation call prior to completing the transfer. The call state of <i>hConsultCall</i> is not applicable. 
     * 
     * 
     * 
     * 
     * This transfer procedure may not be valid for some line devices. The application may need to ignore the new consultation call and unhold an existing held call (using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineunhold">lineUnhold</a>) to identify the destination of the transfer. On switches that support cross-address call transfer, the consultation call can exist on a different address than the call to be transferred. It may also be necessary that the consultation call be set up as an entirely new call, by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a>, to the destination of the transfer. Which forms of transfer are available are specified in the call's address capabilities.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure containing the call parameters to use when establishing the consultation call. This parameter can be set to <b>NULL</b> if no special call setup parameters are desired.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BEARERMODEUNAVAIL, LINEERR_INVALRATE, LINEERR_CALLUNAVAIL, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_NOTOWNER, LINEERR_INVALADDRESSMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALBEARERMODE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_RATEUNAVAIL, LINEERR_INVALCALLPARAMS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALLINESTATE, LINEERR_UNINITIALIZED, LINEERR_INVALMEDIAMODE, LINEERR_USERUSERINFOTOOBIG, LINEERR_INVALPOINTER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetuptransfer
     */
    static lineSetupTransfer(hCall, lphConsultCall, lpCallParams) {
        result := DllCall("TAPI32.dll\lineSetupTransfer", "uint", hCall, "uint*", lphConsultCall, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineSetupTransfer function initiates a transfer of the call specified by the hCall parameter.
     * @param {Integer} hCall Handle to the call to be transferred. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an <i>hCall</i> handle. This location is then loaded with a handle identifying the temporary consultation call. When setting up a call for transfer, a consultation call is automatically allocated that enables 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linedial">lineDial</a> to dial the address associated with the new transfer destination of the call. The originating party can carry on a conversation over this consultation call prior to completing the transfer. The call state of <i>hConsultCall</i> is not applicable. 
     * 
     * 
     * 
     * 
     * This transfer procedure may not be valid for some line devices. The application may need to ignore the new consultation call and unhold an existing held call (using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineunhold">lineUnhold</a>) to identify the destination of the transfer. On switches that support cross-address call transfer, the consultation call can exist on a different address than the call to be transferred. It may also be necessary that the consultation call be set up as an entirely new call, by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a>, to the destination of the transfer. Which forms of transfer are available are specified in the call's address capabilities.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure containing the call parameters to use when establishing the consultation call. This parameter can be set to <b>NULL</b> if no special call setup parameters are desired.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BEARERMODEUNAVAIL, LINEERR_INVALRATE, LINEERR_CALLUNAVAIL, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_NOTOWNER, LINEERR_INVALADDRESSMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALBEARERMODE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_RATEUNAVAIL, LINEERR_INVALCALLPARAMS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALLINESTATE, LINEERR_UNINITIALIZED, LINEERR_INVALMEDIAMODE, LINEERR_USERUSERINFOTOOBIG, LINEERR_INVALPOINTER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetuptransfera
     */
    static lineSetupTransferA(hCall, lphConsultCall, lpCallParams) {
        result := DllCall("TAPI32.dll\lineSetupTransferA", "uint", hCall, "uint*", lphConsultCall, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineSetupTransfer function initiates a transfer of the call specified by the hCall parameter.
     * @param {Integer} hCall Handle to the call to be transferred. The application must be an owner of the call. The call state of <i>hCall</i> must be <i>connected</i>.
     * @param {Pointer<UInt32>} lphConsultCall Pointer to an <i>hCall</i> handle. This location is then loaded with a handle identifying the temporary consultation call. When setting up a call for transfer, a consultation call is automatically allocated that enables 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linedial">lineDial</a> to dial the address associated with the new transfer destination of the call. The originating party can carry on a conversation over this consultation call prior to completing the transfer. The call state of <i>hConsultCall</i> is not applicable. 
     * 
     * 
     * 
     * 
     * This transfer procedure may not be valid for some line devices. The application may need to ignore the new consultation call and unhold an existing held call (using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineunhold">lineUnhold</a>) to identify the destination of the transfer. On switches that support cross-address call transfer, the consultation call can exist on a different address than the call to be transferred. It may also be necessary that the consultation call be set up as an entirely new call, by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a>, to the destination of the transfer. Which forms of transfer are available are specified in the call's address capabilities.
     * @param {Pointer<LINECALLPARAMS>} lpCallParams Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure containing the call parameters to use when establishing the consultation call. This parameter can be set to <b>NULL</b> if no special call setup parameters are desired.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BEARERMODEUNAVAIL, LINEERR_INVALRATE, LINEERR_CALLUNAVAIL, LINEERR_NOMEM, LINEERR_INUSE, LINEERR_NOTOWNER, LINEERR_INVALADDRESSMODE, LINEERR_OPERATIONFAILED, LINEERR_INVALBEARERMODE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLHANDLE, LINEERR_RATEUNAVAIL, LINEERR_INVALCALLPARAMS, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALLINESTATE, LINEERR_UNINITIALIZED, LINEERR_INVALMEDIAMODE, LINEERR_USERUSERINFOTOOBIG, LINEERR_INVALPOINTER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linesetuptransferw
     */
    static lineSetupTransferW(hCall, lphConsultCall, lpCallParams) {
        result := DllCall("TAPI32.dll\lineSetupTransferW", "uint", hCall, "uint*", lphConsultCall, "ptr", lpCallParams, "int")
        return result
    }

    /**
     * The lineShutdown function shuts down the application's usage of the line abstraction of the API.
     * @param {Integer} hLineApp Application's usage handle for the line API.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineshutdown
     */
    static lineShutdown(hLineApp) {
        result := DllCall("TAPI32.dll\lineShutdown", "uint", hLineApp, "int")
        return result
    }

    /**
     * The lineSwapHold function swaps the specified active call with the specified call on consultation hold.
     * @param {Integer} hActiveCall Handle to the active call. The application must be an owner of the call. The call state of <i>hActiveCall</i> must be <i>connected</i>.
     * @param {Integer} hHeldCall Handle to the consultation call. The application must be an owner of the call. The call state of <i>hHeldCall</i> can be <i>onHoldPendingTransfer</i>, <i>onHoldPendingConference</i>, or <i>onHold</i>.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_NOMEM, LINEERR_RESOURCEUNAVAIL, LINEERR_NOTOWNER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineswaphold
     */
    static lineSwapHold(hActiveCall, hHeldCall) {
        result := DllCall("TAPI32.dll\lineSwapHold", "uint", hActiveCall, "uint", hHeldCall, "int")
        return result
    }

    /**
     * The lineTranslateAddress function translates the specified address into another format.
     * @param {Integer} hLineApp Handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If a TAPI 2.x application has not yet called the 
     * <b>lineInitializeEx</b> function, it can set this parameter to <b>NULL</b>. TAPI 1.4 applications must still call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitialize">lineInitialize</a> first.
     * @param {Integer} dwDeviceID Device identifier of the line device upon which the call is to be dialed, so that variations in dialing procedures on different lines can be applied to the translation process.
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<Byte>} lpszAddressIn Pointer to a <b>null</b>-terminated string that contains the address of the information that is to be extracted for translation. Must be in either the canonical address format, or an arbitrary string of dialable digits (non-canonical). This parameter must not be <b>NULL</b>. If the <i>AddressIn</i> contains a subaddress or name field, or additional addresses separated from the first address by CR and LF characters, only the first address is translated.
     * @param {Integer} dwCard Credit card to be used for dialing. This parameter is only valid if the CARDOVERRIDE bit is set in <i>dwTranslateOptions</i>. This parameter specifies the permanent identifier of a Card entry in the [Cards] section in the registry (as obtained from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">lineTranslateCaps</a>) that should be used instead of the <b>PreferredCardID</b> specified in the definition of the <b>CurrentLocation</b>. It does not cause the <i>PreferredCardID</i> parameter of the current Location entry in the registry to be modified; the override applies only to the current translation operation. This parameter is ignored if the CARDOVERRIDE bit is not set in <i>dwTranslateOptions</i>.
     * @param {Integer} dwTranslateOptions Associated operations to be performed prior to the translation of the address into a dialable string. This parameter uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetranslateoption--constants">LINETRANSLATEOPTION_ Constants</a>. 
     * 
     * 
     * 
     * 
     * If you have set the LINETRANSLATEOPTION_CANCELCALLWAITING bit, it is also advisable to set the LINECALLPARAMFLAGS_SECURE bit in the <b>dwCallParamFlags</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure (passed in to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> through the <i>lpCallParams</i> parameter). This prevents the line device from using dialable digits to suppress call interrupts.
     * @param {Pointer<LINETRANSLATEOUTPUT>} lpTranslateOutput Pointer to an application-allocated memory area to contain the output of the translation operation, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslateoutput">LINETRANSLATEOUTPUT</a>. Prior to calling 
     * <b>lineTranslateAddress</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_INVALPOINTER, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NODRIVER, LINEERR_INIFILECORRUPT, LINEERR_NOMEM, LINEERR_INVALADDRESS, LINEERR_OPERATIONFAILED, LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCARD, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPARAM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linetranslateaddress
     */
    static lineTranslateAddress(hLineApp, dwDeviceID, dwAPIVersion, lpszAddressIn, dwCard, dwTranslateOptions, lpTranslateOutput) {
        lpszAddressIn := lpszAddressIn is String? StrPtr(lpszAddressIn) : lpszAddressIn

        result := DllCall("TAPI32.dll\lineTranslateAddress", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAPIVersion, "ptr", lpszAddressIn, "uint", dwCard, "uint", dwTranslateOptions, "ptr", lpTranslateOutput, "int")
        return result
    }

    /**
     * The lineTranslateAddress function translates the specified address into another format.
     * @param {Integer} hLineApp Handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If a TAPI 2.x application has not yet called the 
     * <b>lineInitializeEx</b> function, it can set this parameter to <b>NULL</b>. TAPI 1.4 applications must still call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitialize">lineInitialize</a> first.
     * @param {Integer} dwDeviceID Device identifier of the line device upon which the call is to be dialed, so that variations in dialing procedures on different lines can be applied to the translation process.
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<Byte>} lpszAddressIn Pointer to a <b>null</b>-terminated string that contains the address of the information that is to be extracted for translation. Must be in either the canonical address format, or an arbitrary string of dialable digits (non-canonical). This parameter must not be <b>NULL</b>. If the <i>AddressIn</i> contains a subaddress or name field, or additional addresses separated from the first address by CR and LF characters, only the first address is translated.
     * @param {Integer} dwCard Credit card to be used for dialing. This parameter is only valid if the CARDOVERRIDE bit is set in <i>dwTranslateOptions</i>. This parameter specifies the permanent identifier of a Card entry in the [Cards] section in the registry (as obtained from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">lineTranslateCaps</a>) that should be used instead of the <b>PreferredCardID</b> specified in the definition of the <b>CurrentLocation</b>. It does not cause the <i>PreferredCardID</i> parameter of the current Location entry in the registry to be modified; the override applies only to the current translation operation. This parameter is ignored if the CARDOVERRIDE bit is not set in <i>dwTranslateOptions</i>.
     * @param {Integer} dwTranslateOptions Associated operations to be performed prior to the translation of the address into a dialable string. This parameter uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetranslateoption--constants">LINETRANSLATEOPTION_ Constants</a>. 
     * 
     * 
     * 
     * 
     * If you have set the LINETRANSLATEOPTION_CANCELCALLWAITING bit, it is also advisable to set the LINECALLPARAMFLAGS_SECURE bit in the <b>dwCallParamFlags</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure (passed in to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> through the <i>lpCallParams</i> parameter). This prevents the line device from using dialable digits to suppress call interrupts.
     * @param {Pointer<LINETRANSLATEOUTPUT>} lpTranslateOutput Pointer to an application-allocated memory area to contain the output of the translation operation, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslateoutput">LINETRANSLATEOUTPUT</a>. Prior to calling 
     * <b>lineTranslateAddress</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_INVALPOINTER, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NODRIVER, LINEERR_INIFILECORRUPT, LINEERR_NOMEM, LINEERR_INVALADDRESS, LINEERR_OPERATIONFAILED, LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCARD, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPARAM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linetranslateaddressa
     */
    static lineTranslateAddressA(hLineApp, dwDeviceID, dwAPIVersion, lpszAddressIn, dwCard, dwTranslateOptions, lpTranslateOutput) {
        lpszAddressIn := lpszAddressIn is String? StrPtr(lpszAddressIn) : lpszAddressIn

        result := DllCall("TAPI32.dll\lineTranslateAddressA", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAPIVersion, "ptr", lpszAddressIn, "uint", dwCard, "uint", dwTranslateOptions, "ptr", lpTranslateOutput, "int")
        return result
    }

    /**
     * The lineTranslateAddress function translates the specified address into another format.
     * @param {Integer} hLineApp Handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If a TAPI 2.x application has not yet called the 
     * <b>lineInitializeEx</b> function, it can set this parameter to <b>NULL</b>. TAPI 1.4 applications must still call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitialize">lineInitialize</a> first.
     * @param {Integer} dwDeviceID Device identifier of the line device upon which the call is to be dialed, so that variations in dialing procedures on different lines can be applied to the translation process.
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on some particular line device).
     * @param {Pointer<Char>} lpszAddressIn Pointer to a <b>null</b>-terminated string that contains the address of the information that is to be extracted for translation. Must be in either the canonical address format, or an arbitrary string of dialable digits (non-canonical). This parameter must not be <b>NULL</b>. If the <i>AddressIn</i> contains a subaddress or name field, or additional addresses separated from the first address by CR and LF characters, only the first address is translated.
     * @param {Integer} dwCard Credit card to be used for dialing. This parameter is only valid if the CARDOVERRIDE bit is set in <i>dwTranslateOptions</i>. This parameter specifies the permanent identifier of a Card entry in the [Cards] section in the registry (as obtained from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslatecaps">lineTranslateCaps</a>) that should be used instead of the <b>PreferredCardID</b> specified in the definition of the <b>CurrentLocation</b>. It does not cause the <i>PreferredCardID</i> parameter of the current Location entry in the registry to be modified; the override applies only to the current translation operation. This parameter is ignored if the CARDOVERRIDE bit is not set in <i>dwTranslateOptions</i>.
     * @param {Integer} dwTranslateOptions Associated operations to be performed prior to the translation of the address into a dialable string. This parameter uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetranslateoption--constants">LINETRANSLATEOPTION_ Constants</a>. 
     * 
     * 
     * 
     * 
     * If you have set the LINETRANSLATEOPTION_CANCELCALLWAITING bit, it is also advisable to set the LINECALLPARAMFLAGS_SECURE bit in the <b>dwCallParamFlags</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallparams">LINECALLPARAMS</a> structure (passed in to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> through the <i>lpCallParams</i> parameter). This prevents the line device from using dialable digits to suppress call interrupts.
     * @param {Pointer<LINETRANSLATEOUTPUT>} lpTranslateOutput Pointer to an application-allocated memory area to contain the output of the translation operation, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linetranslateoutput">LINETRANSLATEOUTPUT</a>. Prior to calling 
     * <b>lineTranslateAddress</b>, the application must set the <b>dwTotalSize</b> member of this structure to indicate the amount of memory available to TAPI for returning information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_INVALPOINTER, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_NODRIVER, LINEERR_INIFILECORRUPT, LINEERR_NOMEM, LINEERR_INVALADDRESS, LINEERR_OPERATIONFAILED, LINEERR_INVALAPPHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALCARD, LINEERR_STRUCTURETOOSMALL, LINEERR_INVALPARAM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linetranslateaddressw
     */
    static lineTranslateAddressW(hLineApp, dwDeviceID, dwAPIVersion, lpszAddressIn, dwCard, dwTranslateOptions, lpTranslateOutput) {
        lpszAddressIn := lpszAddressIn is String? StrPtr(lpszAddressIn) : lpszAddressIn

        result := DllCall("TAPI32.dll\lineTranslateAddressW", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAPIVersion, "ptr", lpszAddressIn, "uint", dwCard, "uint", dwTranslateOptions, "ptr", lpTranslateOutput, "int")
        return result
    }

    /**
     * The lineTranslateDialog function displays an application-modal dialog box that allows the user to change the current location of a phone number about to be dialed, adjust location and calling card parameters, and see the effect.
     * @param {Integer} hLineApp Application handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If an application has not yet called the 
     * <b>lineInitializeEx</b> function, it can set the <i>hLineApp</i> parameter to zero.
     * @param {Integer} dwDeviceID Device identifier for the line device upon which the call is intended to be dialed, so that variations in dialing procedures on different lines can be applied to the translation process.
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on the line device indicated by <i>dwDeviceID</i>).
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be a <b>NULL</b> value to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Byte>} lpszAddressIn Pointer to a <b>null</b>-terminated string containing a phone number that is used, in the lower portion of the dialog box, to show the effect of the user's changes on the location parameters. The number must be in canonical format; if noncanonical, the phone number portion of the dialog box is not displayed. This pointer can be left <b>NULL</b>, in which case the phone number portion of the dialog box is not displayed. If the <i>lpszAddressIn</i> parameter contains a subaddress or name field, or additional addresses separated from the first address by CR and LF characters, only the first address is used in the dialog box.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_INVALPARAM, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_INVALPOINTER, LINEERR_INIFILECORRUPT, LINEERR_NODRIVER, LINEERR_INUSE, LINEERR_NOMEM, LINEERR_INVALADDRESS, LINEERR_INVALAPPHANDLE, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linetranslatedialog
     */
    static lineTranslateDialog(hLineApp, dwDeviceID, dwAPIVersion, hwndOwner, lpszAddressIn) {
        lpszAddressIn := lpszAddressIn is String? StrPtr(lpszAddressIn) : lpszAddressIn

        result := DllCall("TAPI32.dll\lineTranslateDialog", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAPIVersion, "ptr", hwndOwner, "ptr", lpszAddressIn, "int")
        return result
    }

    /**
     * The lineTranslateDialog function displays an application-modal dialog box that allows the user to change the current location of a phone number about to be dialed, adjust location and calling card parameters, and see the effect.
     * @param {Integer} hLineApp Application handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If an application has not yet called the 
     * <b>lineInitializeEx</b> function, it can set the <i>hLineApp</i> parameter to zero.
     * @param {Integer} dwDeviceID Device identifier for the line device upon which the call is intended to be dialed, so that variations in dialing procedures on different lines can be applied to the translation process.
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on the line device indicated by <i>dwDeviceID</i>).
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be a <b>NULL</b> value to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Byte>} lpszAddressIn Pointer to a <b>null</b>-terminated string containing a phone number that is used, in the lower portion of the dialog box, to show the effect of the user's changes on the location parameters. The number must be in canonical format; if noncanonical, the phone number portion of the dialog box is not displayed. This pointer can be left <b>NULL</b>, in which case the phone number portion of the dialog box is not displayed. If the <i>lpszAddressIn</i> parameter contains a subaddress or name field, or additional addresses separated from the first address by CR and LF characters, only the first address is used in the dialog box.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_INVALPARAM, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_INVALPOINTER, LINEERR_INIFILECORRUPT, LINEERR_NODRIVER, LINEERR_INUSE, LINEERR_NOMEM, LINEERR_INVALADDRESS, LINEERR_INVALAPPHANDLE, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linetranslatedialoga
     */
    static lineTranslateDialogA(hLineApp, dwDeviceID, dwAPIVersion, hwndOwner, lpszAddressIn) {
        lpszAddressIn := lpszAddressIn is String? StrPtr(lpszAddressIn) : lpszAddressIn

        result := DllCall("TAPI32.dll\lineTranslateDialogA", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAPIVersion, "ptr", hwndOwner, "ptr", lpszAddressIn, "int")
        return result
    }

    /**
     * The lineTranslateDialog function displays an application-modal dialog box that allows the user to change the current location of a phone number about to be dialed, adjust location and calling card parameters, and see the effect.
     * @param {Integer} hLineApp Application handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. If an application has not yet called the 
     * <b>lineInitializeEx</b> function, it can set the <i>hLineApp</i> parameter to zero.
     * @param {Integer} dwDeviceID Device identifier for the line device upon which the call is intended to be dialed, so that variations in dialing procedures on different lines can be applied to the translation process.
     * @param {Integer} dwAPIVersion Highest version of TAPI supported by the application (not necessarily the value negotiated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linenegotiateapiversion">lineNegotiateAPIVersion</a> on the line device indicated by <i>dwDeviceID</i>).
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be a <b>NULL</b> value to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Char>} lpszAddressIn Pointer to a <b>null</b>-terminated string containing a phone number that is used, in the lower portion of the dialog box, to show the effect of the user's changes on the location parameters. The number must be in canonical format; if noncanonical, the phone number portion of the dialog box is not displayed. This pointer can be left <b>NULL</b>, in which case the phone number portion of the dialog box is not displayed. If the <i>lpszAddressIn</i> parameter contains a subaddress or name field, or additional addresses separated from the first address by CR and LF characters, only the first address is used in the dialog box.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_BADDEVICEID, LINEERR_INVALPARAM, LINEERR_INCOMPATIBLEAPIVERSION, LINEERR_INVALPOINTER, LINEERR_INIFILECORRUPT, LINEERR_NODRIVER, LINEERR_INUSE, LINEERR_NOMEM, LINEERR_INVALADDRESS, LINEERR_INVALAPPHANDLE, LINEERR_OPERATIONFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-linetranslatedialogw
     */
    static lineTranslateDialogW(hLineApp, dwDeviceID, dwAPIVersion, hwndOwner, lpszAddressIn) {
        lpszAddressIn := lpszAddressIn is String? StrPtr(lpszAddressIn) : lpszAddressIn

        result := DllCall("TAPI32.dll\lineTranslateDialogW", "uint", hLineApp, "uint", dwDeviceID, "uint", dwAPIVersion, "ptr", hwndOwner, "ptr", lpszAddressIn, "int")
        return result
    }

    /**
     * The lineUncompleteCall function cancels the specified call completion request on the specified line.
     * @param {Integer} hLine Handle to the line device on which a call completion is to be canceled.
     * @param {Integer} dwCompletionID Completion identifier for the request that is to be canceled.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALLINEHANDLE, LINEERR_OPERATIONFAILED, LINEERR_INVALCOMPLETIONID, LINEERR_RESOURCEUNAVAIL, LINEERR_NOMEM, LINEERR_UNINITIALIZED, LINEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineuncompletecall
     */
    static lineUncompleteCall(hLine, dwCompletionID) {
        result := DllCall("TAPI32.dll\lineUncompleteCall", "uint", hLine, "uint", dwCompletionID, "int")
        return result
    }

    /**
     * The lineUnhold function retrieves the specified held call.
     * @param {Integer} hCall Handle to the call to be retrieved. The application must be an owner of this call. The call state of <i>hCall</i> must be <i>onHold</i>, <i>onHoldPendingTransfer</i>, or <i>onHoldPendingConference</i>.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALCALLHANDLE, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALCALLSTATE, LINEERR_OPERATIONFAILED, LINEERR_NOMEM, LINEERR_RESOURCEUNAVAIL, LINEERR_NOTOWNER, LINEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineunhold
     */
    static lineUnhold(hCall) {
        result := DllCall("TAPI32.dll\lineUnhold", "uint", hCall, "int")
        return result
    }

    /**
     * The lineUnpark function retrieves the call parked at the specified address and returns a call handle for it.
     * @param {Integer} hLine Handle to the open line device on which a call is to be unparked.
     * @param {Integer} dwAddressID Address on <i>hLine</i> at which the unpark is to be originated. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<UInt32>} lphCall Pointer to the location of type HCALL where the handle to the unparked call is returned. This handle is unrelated to any other handle that might have been previously associated with the retrieved call, such as the handle that might have been associated with the call when it was originally parked. The application is the initial sole owner of this call.
     * @param {Pointer<Byte>} lpszDestAddress Pointer to a null-terminated character buffer that contains the address where the call is parked. The address is in standard dialable address format.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESSID, LINEERR_OPERATIONFAILED, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineunpark
     */
    static lineUnpark(hLine, dwAddressID, lphCall, lpszDestAddress) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineUnpark", "uint", hLine, "uint", dwAddressID, "uint*", lphCall, "ptr", lpszDestAddress, "int")
        return result
    }

    /**
     * The lineUnpark function retrieves the call parked at the specified address and returns a call handle for it.
     * @param {Integer} hLine Handle to the open line device on which a call is to be unparked.
     * @param {Integer} dwAddressID Address on <i>hLine</i> at which the unpark is to be originated. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<UInt32>} lphCall Pointer to the location of type HCALL where the handle to the unparked call is returned. This handle is unrelated to any other handle that might have been previously associated with the retrieved call, such as the handle that might have been associated with the call when it was originally parked. The application is the initial sole owner of this call.
     * @param {Pointer<Byte>} lpszDestAddress Pointer to a null-terminated character buffer that contains the address where the call is parked. The address is in standard dialable address format.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESSID, LINEERR_OPERATIONFAILED, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineunparka
     */
    static lineUnparkA(hLine, dwAddressID, lphCall, lpszDestAddress) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineUnparkA", "uint", hLine, "uint", dwAddressID, "uint*", lphCall, "ptr", lpszDestAddress, "int")
        return result
    }

    /**
     * The lineUnpark function retrieves the call parked at the specified address and returns a call handle for it.
     * @param {Integer} hLine Handle to the open line device on which a call is to be unparked.
     * @param {Integer} dwAddressID Address on <i>hLine</i> at which the unpark is to be originated. An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
     * @param {Pointer<UInt32>} lphCall Pointer to the location of type HCALL where the handle to the unparked call is returned. This handle is unrelated to any other handle that might have been previously associated with the retrieved call, such as the handle that might have been associated with the call when it was originally parked. The application is the initial sole owner of this call.
     * @param {Pointer<Char>} lpszDestAddress Pointer to a null-terminated character buffer that contains the address where the call is parked. The address is in standard dialable address format.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously, or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/line-reply">LINE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * LINEERR_INVALADDRESS, LINEERR_OPERATIONUNAVAIL, LINEERR_INVALADDRESSID, LINEERR_OPERATIONFAILED, LINEERR_INVALLINEHANDLE, LINEERR_RESOURCEUNAVAIL, LINEERR_INVALPOINTER, LINEERR_UNINITIALIZED, LINEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-lineunparkw
     */
    static lineUnparkW(hLine, dwAddressID, lphCall, lpszDestAddress) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress

        result := DllCall("TAPI32.dll\lineUnparkW", "uint", hLine, "uint", dwAddressID, "uint*", lphCall, "ptr", lpszDestAddress, "int")
        return result
    }

    /**
     * The phoneClose function closes the specified open phone device.
     * @param {Integer} hPhone Handle to the open phone device to be closed. If the function succeeds, the handle is no longer valid.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_OPERATIONFAILED, PHONEERR_RESOURCEUNAVAIL, PHONEERR_OPERATIONUNAVAIL, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phoneclose
     */
    static phoneClose(hPhone) {
        result := DllCall("TAPI32.dll\phoneClose", "uint", hPhone, "int")
        return result
    }

    /**
     * The phoneConfigDialog function causes the provider of the specified phone device to display a modal dialog box that allows the user to configure parameters related to the phone device.
     * @param {Integer} dwDeviceID Identifier of the phone device to be configured.
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be a <b>NULL</b> value to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest level configuration is selected.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_BADDEVICEID, PHONEERR_NOMEM, PHONEERR_INUSE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPARAM, PHONEERR_OPERATIONUNAVAIL, PHONEERR_INVALDEVICECLASS, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_UNINITIALIZED, PHONEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phoneconfigdialog
     */
    static phoneConfigDialog(dwDeviceID, hwndOwner, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\phoneConfigDialog", "uint", dwDeviceID, "ptr", hwndOwner, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The phoneConfigDialog function causes the provider of the specified phone device to display a modal dialog box that allows the user to configure parameters related to the phone device.
     * @param {Integer} dwDeviceID Identifier of the phone device to be configured.
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be a <b>NULL</b> value to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest level configuration is selected.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_BADDEVICEID, PHONEERR_NOMEM, PHONEERR_INUSE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPARAM, PHONEERR_OPERATIONUNAVAIL, PHONEERR_INVALDEVICECLASS, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_UNINITIALIZED, PHONEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phoneconfigdialoga
     */
    static phoneConfigDialogA(dwDeviceID, hwndOwner, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\phoneConfigDialogA", "uint", dwDeviceID, "ptr", hwndOwner, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The phoneConfigDialog function causes the provider of the specified phone device to display a modal dialog box that allows the user to configure parameters related to the phone device.
     * @param {Integer} dwDeviceID Identifier of the phone device to be configured.
     * @param {Pointer<Void>} hwndOwner Handle to a window to which the dialog box is to be attached. Can be a <b>NULL</b> value to indicate that any window created during the function should have no owner window.
     * @param {Pointer<Char>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest level configuration is selected.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_BADDEVICEID, PHONEERR_NOMEM, PHONEERR_INUSE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPARAM, PHONEERR_OPERATIONUNAVAIL, PHONEERR_INVALDEVICECLASS, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_UNINITIALIZED, PHONEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phoneconfigdialogw
     */
    static phoneConfigDialogW(dwDeviceID, hwndOwner, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\phoneConfigDialogW", "uint", dwDeviceID, "ptr", hwndOwner, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The phoneDevSpecific function is used as a general extension mechanism to enable a Telephony API implementation to provide features not described in the other TAPI functions. The meanings of these extensions are device specific.
     * @param {Integer} hPhone Handle to a phone device.
     * @param {Pointer<Void>} lpParams Pointer to a memory area used to hold a parameter block. Its interpretation is device specific. The contents of the parameter block are passed unchanged to or from the service provider by TAPI.
     * @param {Integer} dwSize Size of the parameter block area, in bytes.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/phone-reply">PHONE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_OPERATIONUNAVAIL, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONFAILED.
     * 
     * Additional return values are device specific.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonedevspecific
     */
    static phoneDevSpecific(hPhone, lpParams, dwSize) {
        result := DllCall("TAPI32.dll\phoneDevSpecific", "uint", hPhone, "ptr", lpParams, "uint", dwSize, "int")
        return result
    }

    /**
     * The phoneGetButtonInfo function returns information about the specified button.
     * @param {Integer} hPhone Handle to the open phone device.
     * @param {Integer} dwButtonLampID Button on the phone device.
     * @param {Pointer<PHONEBUTTONINFO>} lpButtonInfo Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonebuttoninfo">PHONEBUTTONINFO</a>. This data structure describes the mode and the function, and provides additional descriptive text corresponding to the button.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALBUTTONLAMPID, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPHONESTATE, PHONEERR_STRUCTURETOOSMALL, PHONEERR_OPERATIONUNAVAIL, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetbuttoninfo
     */
    static phoneGetButtonInfo(hPhone, dwButtonLampID, lpButtonInfo) {
        result := DllCall("TAPI32.dll\phoneGetButtonInfo", "uint", hPhone, "uint", dwButtonLampID, "ptr", lpButtonInfo, "int")
        return result
    }

    /**
     * The phoneGetButtonInfo function returns information about the specified button.
     * @param {Integer} hPhone Handle to the open phone device.
     * @param {Integer} dwButtonLampID Button on the phone device.
     * @param {Pointer<PHONEBUTTONINFO>} lpButtonInfo Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonebuttoninfo">PHONEBUTTONINFO</a>. This data structure describes the mode and the function, and provides additional descriptive text corresponding to the button.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALBUTTONLAMPID, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPHONESTATE, PHONEERR_STRUCTURETOOSMALL, PHONEERR_OPERATIONUNAVAIL, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetbuttoninfoa
     */
    static phoneGetButtonInfoA(hPhone, dwButtonLampID, lpButtonInfo) {
        result := DllCall("TAPI32.dll\phoneGetButtonInfoA", "uint", hPhone, "uint", dwButtonLampID, "ptr", lpButtonInfo, "int")
        return result
    }

    /**
     * The phoneGetButtonInfo function returns information about the specified button.
     * @param {Integer} hPhone Handle to the open phone device.
     * @param {Integer} dwButtonLampID Button on the phone device.
     * @param {Pointer<PHONEBUTTONINFO>} lpButtonInfo Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonebuttoninfo">PHONEBUTTONINFO</a>. This data structure describes the mode and the function, and provides additional descriptive text corresponding to the button.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALBUTTONLAMPID, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPHONESTATE, PHONEERR_STRUCTURETOOSMALL, PHONEERR_OPERATIONUNAVAIL, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetbuttoninfow
     */
    static phoneGetButtonInfoW(hPhone, dwButtonLampID, lpButtonInfo) {
        result := DllCall("TAPI32.dll\phoneGetButtonInfoW", "uint", hPhone, "uint", dwButtonLampID, "ptr", lpButtonInfo, "int")
        return result
    }

    /**
     * The phoneGetData function uploads the information from the specified location in the open phone device to the specified buffer.
     * @param {Integer} hPhone Handle to the open phone device.
     * @param {Integer} dwDataID Where in the phone device the buffer is to be uploaded from.
     * @param {Pointer<Void>} lpData Pointer to the memory buffer where the data is to be uploaded.
     * @param {Integer} dwSize Size of the data buffer, in bytes.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPHONESTATE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALDATAID, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetdata
     */
    static phoneGetData(hPhone, dwDataID, lpData, dwSize) {
        result := DllCall("TAPI32.dll\phoneGetData", "uint", hPhone, "uint", dwDataID, "ptr", lpData, "uint", dwSize, "int")
        return result
    }

    /**
     * The phoneGetDevCaps function queries a specified phone device to determine its telephony capabilities.
     * @param {Integer} hPhoneApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifier of the phone device to be queried.
     * @param {Integer} dwAPIVersion Version number of the Telephony API to be used. The high-order word contains the major version number; the low-order word contains the minor version number. This number is obtained with the function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateapiversion">phoneNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Version number of the service provider-specific extensions to be used. This number is obtained with the function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateextversion">phoneNegotiateExtVersion</a>. It can be left zero if no device-specific extensions are to be used. Otherwise, the high-order word contains the major version number; the low-order word contains the minor version number.
     * @param {Pointer<PHONECAPS>} lpPhoneCaps Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonecaps">PHONECAPS</a>. Upon successful completion of the request, this structure is filled with phone device capabilities information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALAPPHANDLE, PHONEERR_INVALPOINTER, PHONEERR_BADDEVICEID, PHONEERR_OPERATIONFAILED, PHONEERR_INCOMPATIBLEAPIVERSION, PHONEERR_OPERATIONUNAVAIL, PHONEERR_INCOMPATIBLEEXTVERSION, PHONEERR_NOMEM, PHONEERR_STRUCTURETOOSMALL, PHONEERR_RESOURCEUNAVAIL, PHONEERR_NODRIVER, PHONEERR_UNINITIALIZED, PHONEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetdevcaps
     */
    static phoneGetDevCaps(hPhoneApp, dwDeviceID, dwAPIVersion, dwExtVersion, lpPhoneCaps) {
        result := DllCall("TAPI32.dll\phoneGetDevCaps", "uint", hPhoneApp, "uint", dwDeviceID, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", lpPhoneCaps, "int")
        return result
    }

    /**
     * The phoneGetDevCaps function queries a specified phone device to determine its telephony capabilities.
     * @param {Integer} hPhoneApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifier of the phone device to be queried.
     * @param {Integer} dwAPIVersion Version number of the Telephony API to be used. The high-order word contains the major version number; the low-order word contains the minor version number. This number is obtained with the function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateapiversion">phoneNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Version number of the service provider-specific extensions to be used. This number is obtained with the function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateextversion">phoneNegotiateExtVersion</a>. It can be left zero if no device-specific extensions are to be used. Otherwise, the high-order word contains the major version number; the low-order word contains the minor version number.
     * @param {Pointer<PHONECAPS>} lpPhoneCaps Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonecaps">PHONECAPS</a>. Upon successful completion of the request, this structure is filled with phone device capabilities information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALAPPHANDLE, PHONEERR_INVALPOINTER, PHONEERR_BADDEVICEID, PHONEERR_OPERATIONFAILED, PHONEERR_INCOMPATIBLEAPIVERSION, PHONEERR_OPERATIONUNAVAIL, PHONEERR_INCOMPATIBLEEXTVERSION, PHONEERR_NOMEM, PHONEERR_STRUCTURETOOSMALL, PHONEERR_RESOURCEUNAVAIL, PHONEERR_NODRIVER, PHONEERR_UNINITIALIZED, PHONEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetdevcapsa
     */
    static phoneGetDevCapsA(hPhoneApp, dwDeviceID, dwAPIVersion, dwExtVersion, lpPhoneCaps) {
        result := DllCall("TAPI32.dll\phoneGetDevCapsA", "uint", hPhoneApp, "uint", dwDeviceID, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", lpPhoneCaps, "int")
        return result
    }

    /**
     * The phoneGetDevCaps function queries a specified phone device to determine its telephony capabilities.
     * @param {Integer} hPhoneApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifier of the phone device to be queried.
     * @param {Integer} dwAPIVersion Version number of the Telephony API to be used. The high-order word contains the major version number; the low-order word contains the minor version number. This number is obtained with the function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateapiversion">phoneNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Version number of the service provider-specific extensions to be used. This number is obtained with the function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateextversion">phoneNegotiateExtVersion</a>. It can be left zero if no device-specific extensions are to be used. Otherwise, the high-order word contains the major version number; the low-order word contains the minor version number.
     * @param {Pointer<PHONECAPS>} lpPhoneCaps Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonecaps">PHONECAPS</a>. Upon successful completion of the request, this structure is filled with phone device capabilities information.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALAPPHANDLE, PHONEERR_INVALPOINTER, PHONEERR_BADDEVICEID, PHONEERR_OPERATIONFAILED, PHONEERR_INCOMPATIBLEAPIVERSION, PHONEERR_OPERATIONUNAVAIL, PHONEERR_INCOMPATIBLEEXTVERSION, PHONEERR_NOMEM, PHONEERR_STRUCTURETOOSMALL, PHONEERR_RESOURCEUNAVAIL, PHONEERR_NODRIVER, PHONEERR_UNINITIALIZED, PHONEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetdevcapsw
     */
    static phoneGetDevCapsW(hPhoneApp, dwDeviceID, dwAPIVersion, dwExtVersion, lpPhoneCaps) {
        result := DllCall("TAPI32.dll\phoneGetDevCapsW", "uint", hPhoneApp, "uint", dwDeviceID, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", lpPhoneCaps, "int")
        return result
    }

    /**
     * The phoneGetDisplay function returns the current contents of the specified phone display.
     * @param {Integer} hPhone Handle to the open phone device.
     * @param {Pointer<VARSTRING>} lpDisplay Pointer to the memory location where the display content is to be stored, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPHONESTATE, PHONEERR_STRUCTURETOOSMALL, PHONEERR_OPERATIONUNAVAIL, PHONEERR_UNINITIALIZED, PHONEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetdisplay
     */
    static phoneGetDisplay(hPhone, lpDisplay) {
        result := DllCall("TAPI32.dll\phoneGetDisplay", "uint", hPhone, "ptr", lpDisplay, "int")
        return result
    }

    /**
     * The phoneGetGain function returns the gain setting of the microphone of the specified phone's hookswitch device.
     * @param {Integer} hPhone Handle to the open phone device.
     * @param {Integer} dwHookSwitchDev Hookswitch device whose gain level is queried. The <i>dwHookSwitchDev</i> parameter can have only one bit set. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchdev--constants">PHONEHOOKSWITCHDEV_ Constants</a>.
     * @param {Pointer<UInt32>} lpdwGain Pointer to a <b>DWORD</b> containing the current gain setting of the hookswitch microphone component. The <i>dwGain</i> parameter specifies the volume level of the hookswitch device. This is a number in the range 0x00000000 (silence) to 0x0000FFFF (maximum volume). The actual granularity and quantization of gain settings in this range are service provider-specific.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPHONESTATE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALHOOKSWITCHDEV, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetgain
     */
    static phoneGetGain(hPhone, dwHookSwitchDev, lpdwGain) {
        result := DllCall("TAPI32.dll\phoneGetGain", "uint", hPhone, "uint", dwHookSwitchDev, "uint*", lpdwGain, "int")
        return result
    }

    /**
     * The phoneGetHookSwitch function returns the current hookswitch mode of the specified open phone device.
     * @param {Integer} hPhone Handle to the open phone device.
     * @param {Pointer<UInt32>} lpdwHookSwitchDevs Pointer to a <b>DWORD</b> to be filled with the mode of the phone's hookswitch devices. If a bit position is <b>FALSE</b>, the corresponding hookswitch device is onhook; if <b>TRUE</b>, the microphone and/or speaker part of the corresponding hookswitch device is offhook. To find out whether the microphone and/or speaker are enabled, the application can use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetstatus">phoneGetStatus</a>. This parameter uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchdev--constants">PHONEHOOKSWITCHDEV_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPHONESTATE, PHONEERR_OPERATIONFAILED, PHONEERR_OPERATIONUNAVAIL, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegethookswitch
     */
    static phoneGetHookSwitch(hPhone, lpdwHookSwitchDevs) {
        result := DllCall("TAPI32.dll\phoneGetHookSwitch", "uint", hPhone, "uint*", lpdwHookSwitchDevs, "int")
        return result
    }

    /**
     * The phoneGetIcon function allows an application to retrieve a service phone device-specific (or provider-specific) icon that can be displayed to the user.
     * @param {Integer} dwDeviceID Identifier of the phone device whose icon is requested.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific sub-icon applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest-level icon associated with the phone device rather than a specified media stream device would be selected.
     * @param {Pointer<Void>} lphIcon Pointer to a memory location in which the handle to the icon is returned.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_BADDEVICEID, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_OPERATIONFAILED, PHONEERR_INVALDEVICECLASS, PHONEERR_UNINITIALIZED, PHONEERR_NOMEM, PHONEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegeticon
     */
    static phoneGetIcon(dwDeviceID, lpszDeviceClass, lphIcon) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\phoneGetIcon", "uint", dwDeviceID, "ptr", lpszDeviceClass, "ptr", lphIcon, "int")
        return result
    }

    /**
     * The phoneGetIcon function allows an application to retrieve a service phone device-specific (or provider-specific) icon that can be displayed to the user.
     * @param {Integer} dwDeviceID Identifier of the phone device whose icon is requested.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific sub-icon applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest-level icon associated with the phone device rather than a specified media stream device would be selected.
     * @param {Pointer<Void>} lphIcon Pointer to a memory location in which the handle to the icon is returned.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_BADDEVICEID, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_OPERATIONFAILED, PHONEERR_INVALDEVICECLASS, PHONEERR_UNINITIALIZED, PHONEERR_NOMEM, PHONEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegeticona
     */
    static phoneGetIconA(dwDeviceID, lpszDeviceClass, lphIcon) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\phoneGetIconA", "uint", dwDeviceID, "ptr", lpszDeviceClass, "ptr", lphIcon, "int")
        return result
    }

    /**
     * The phoneGetIcon function allows an application to retrieve a service phone device-specific (or provider-specific) icon that can be displayed to the user.
     * @param {Integer} dwDeviceID Identifier of the phone device whose icon is requested.
     * @param {Pointer<Char>} lpszDeviceClass Pointer to a <b>null</b>-terminated string that identifies a device class name. This device class allows the application to select a specific sub-icon applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest-level icon associated with the phone device rather than a specified media stream device would be selected.
     * @param {Pointer<Void>} lphIcon Pointer to a memory location in which the handle to the icon is returned.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_BADDEVICEID, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_OPERATIONFAILED, PHONEERR_INVALDEVICECLASS, PHONEERR_UNINITIALIZED, PHONEERR_NOMEM, PHONEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegeticonw
     */
    static phoneGetIconW(dwDeviceID, lpszDeviceClass, lphIcon) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\phoneGetIconW", "uint", dwDeviceID, "ptr", lpszDeviceClass, "ptr", lphIcon, "int")
        return result
    }

    /**
     * The phoneGetID function returns a device identifier for the given device class associated with the specified phone device.
     * @param {Integer} hPhone Handle to an open phone device.
     * @param {Pointer<VARSTRING>} lpDeviceID Pointer to a data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> where the device identifier is returned. Upon successful completion of the request, this location is filled with the device identifier. The format of the returned information depends on the method used by the device class (API) for naming devices.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose identifier is requested. Valid device class strings are those used in the System.ini section to identify device classes.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALDEVICECLASS, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONFAILED, PHONEERR_STRUCTURETOOSMALL, PHONEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetid
     */
    static phoneGetID(hPhone, lpDeviceID, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\phoneGetID", "uint", hPhone, "ptr", lpDeviceID, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The phoneGetID function returns a device identifier for the given device class associated with the specified phone device.
     * @param {Integer} hPhone Handle to an open phone device.
     * @param {Pointer<VARSTRING>} lpDeviceID Pointer to a data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> where the device identifier is returned. Upon successful completion of the request, this location is filled with the device identifier. The format of the returned information depends on the method used by the device class (API) for naming devices.
     * @param {Pointer<Byte>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose identifier is requested. Valid device class strings are those used in the System.ini section to identify device classes.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALDEVICECLASS, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONFAILED, PHONEERR_STRUCTURETOOSMALL, PHONEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetida
     */
    static phoneGetIDA(hPhone, lpDeviceID, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\phoneGetIDA", "uint", hPhone, "ptr", lpDeviceID, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The phoneGetID function returns a device identifier for the given device class associated with the specified phone device.
     * @param {Integer} hPhone Handle to an open phone device.
     * @param {Pointer<VARSTRING>} lpDeviceID Pointer to a data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-varstring">VARSTRING</a> where the device identifier is returned. Upon successful completion of the request, this location is filled with the device identifier. The format of the returned information depends on the method used by the device class (API) for naming devices.
     * @param {Pointer<Char>} lpszDeviceClass Pointer to a null-terminated string that specifies the device class of the device whose identifier is requested. Valid device class strings are those used in the System.ini section to identify device classes.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALDEVICECLASS, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONFAILED, PHONEERR_STRUCTURETOOSMALL, PHONEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetidw
     */
    static phoneGetIDW(hPhone, lpDeviceID, lpszDeviceClass) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass

        result := DllCall("TAPI32.dll\phoneGetIDW", "uint", hPhone, "ptr", lpDeviceID, "ptr", lpszDeviceClass, "int")
        return result
    }

    /**
     * The phoneGetLamp function returns the current lamp mode of the specified lamp.
     * @param {Integer} hPhone Handle to the open phone device.
     * @param {Integer} dwButtonLampID Identifier of the lamp to be queried.
     * @param {Pointer<UInt32>} lpdwLampMode Pointer to a memory location that holds the lamp mode status of the given lamp. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonelampmode--constants">PHONELAMPMODE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALBUTTONLAMPID, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPHONESTATE, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetlamp
     */
    static phoneGetLamp(hPhone, dwButtonLampID, lpdwLampMode) {
        result := DllCall("TAPI32.dll\phoneGetLamp", "uint", hPhone, "uint", dwButtonLampID, "uint*", lpdwLampMode, "int")
        return result
    }

    /**
     * The phoneGetMessage function returns the next TAPI message that is queued for delivery to an application that is using the Event Handle notification mechanism (see phoneInitializeEx for further details).
     * @param {Integer} hPhoneApp Handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phoneinitializeexa">phoneInitializeEx</a>. The application must have set the PHONEINITIALIZEEXOPTION_USEEVENT option in the <b>dwOptions</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phoneinitializeexparams">PHONEINITIALIZEEXPARAMS</a> structure.
     * @param {Pointer<PHONEMESSAGE>} lpMessage Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonemessage">PHONEMESSAGE</a> structure. Upon successful return from this function, the structure contains the next message that had been queued for delivery to the application.
     * @param {Integer} dwTimeout Time-out interval, in milliseconds. The function returns if the interval elapses, even if no message can be returned. If <i>dwTimeout</i> is zero, the function checks for a queued message and returns immediately. If <i>dwTimeout</i> is INFINITE, the function's time-out interval never elapses.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALAPPHANDLE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPOINTER, PHONEERR_NOMEM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetmessage
     */
    static phoneGetMessage(hPhoneApp, lpMessage, dwTimeout) {
        result := DllCall("TAPI32.dll\phoneGetMessage", "uint", hPhoneApp, "ptr", lpMessage, "uint", dwTimeout, "int")
        return result
    }

    /**
     * The phoneGetRing function enables an application to query the specified open phone device as to its current ring mode.
     * @param {Integer} hPhone Handle to the open phone device.
     * @param {Pointer<UInt32>} lpdwRingMode Ringing pattern with which the phone is ringing. Zero indicates that the phone is not ringing.
     * @param {Pointer<UInt32>} lpdwVolume Volume level with which the phone is ringing. This is a number in the range 0x00000000 (silence) to 0x0000FFFF (maximum volume). The actual granularity and quantization of volume settings in this range are service provider-specific.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPHONESTATE, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_OPERATIONFAILED, PHONEERR_OPERATIONUNAVAIL, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetring
     */
    static phoneGetRing(hPhone, lpdwRingMode, lpdwVolume) {
        result := DllCall("TAPI32.dll\phoneGetRing", "uint", hPhone, "uint*", lpdwRingMode, "uint*", lpdwVolume, "int")
        return result
    }

    /**
     * The phoneGetStatus function enables an application to query the specified open phone device for its overall status.
     * @param {Integer} hPhone Handle to the open phone device to be queried.
     * @param {Pointer<PHONESTATUS>} lpPhoneStatus Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonestatus">PHONESTATUS</a>, which is loaded with the returned information about the phone's status.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_OPERATIONFAILED, PHONEERR_STRUCTURETOOSMALL, PHONEERR_OPERATIONUNAVAIL, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetstatus
     */
    static phoneGetStatus(hPhone, lpPhoneStatus) {
        result := DllCall("TAPI32.dll\phoneGetStatus", "uint", hPhone, "ptr", lpPhoneStatus, "int")
        return result
    }

    /**
     * The phoneGetStatus function enables an application to query the specified open phone device for its overall status.
     * @param {Integer} hPhone Handle to the open phone device to be queried.
     * @param {Pointer<PHONESTATUS>} lpPhoneStatus Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonestatus">PHONESTATUS</a>, which is loaded with the returned information about the phone's status.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_OPERATIONFAILED, PHONEERR_STRUCTURETOOSMALL, PHONEERR_OPERATIONUNAVAIL, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetstatusa
     */
    static phoneGetStatusA(hPhone, lpPhoneStatus) {
        result := DllCall("TAPI32.dll\phoneGetStatusA", "uint", hPhone, "ptr", lpPhoneStatus, "int")
        return result
    }

    /**
     * The phoneGetStatus function enables an application to query the specified open phone device for its overall status.
     * @param {Integer} hPhone Handle to the open phone device to be queried.
     * @param {Pointer<PHONESTATUS>} lpPhoneStatus Pointer to a variably sized data structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonestatus">PHONESTATUS</a>, which is loaded with the returned information about the phone's status.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_OPERATIONFAILED, PHONEERR_STRUCTURETOOSMALL, PHONEERR_OPERATIONUNAVAIL, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetstatusw
     */
    static phoneGetStatusW(hPhone, lpPhoneStatus) {
        result := DllCall("TAPI32.dll\phoneGetStatusW", "uint", hPhone, "ptr", lpPhoneStatus, "int")
        return result
    }

    /**
     * The phoneGetStatusMessages function returns which phone-state changes on the specified phone device generate a callback to the application.
     * @param {Integer} hPhone Handle to the open phone device to be monitored.
     * @param {Pointer<UInt32>} lpdwPhoneStates Pointer to a <b>DWORD</b> holding zero, one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonestate--constants">PHONESTATE_ Constants</a>. These flags specify the set of phone status changes and events for which the application can receive notification messages. Monitoring can be individually enabled and disabled.
     * @param {Pointer<UInt32>} lpdwButtonModes Pointer to a <b>DWORD</b> containing flags that specify the set of phone-button modes for which the application can receive notification messages. This parameter uses zero, one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonebuttonmode--constants">PHONEBUTTONMODE_ Constants</a>.
     * @param {Pointer<UInt32>} lpdwButtonStates Pointer to a <b>DWORD</b> that contains flags specifying the set of phone button state changes for which the application can receive notification messages. This parameter uses zero, one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonebuttonstate--constants">PHONEBUTTONSTATE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_OPERATIONFAILED, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetstatusmessages
     */
    static phoneGetStatusMessages(hPhone, lpdwPhoneStates, lpdwButtonModes, lpdwButtonStates) {
        result := DllCall("TAPI32.dll\phoneGetStatusMessages", "uint", hPhone, "uint*", lpdwPhoneStates, "uint*", lpdwButtonModes, "uint*", lpdwButtonStates, "int")
        return result
    }

    /**
     * The phoneGetVolume function returns the volume setting of the specified phone's hookswitch device.
     * @param {Integer} hPhone Handle to the open phone device.
     * @param {Integer} dwHookSwitchDev A single hookswitch device whose volume level is queried. This parameter uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchdev--constants">PHONEHOOKSWITCHDEV_ Constants</a>.
     * @param {Pointer<UInt32>} lpdwVolume Pointer to a <b>DWORD</b>. The function returns the current volume setting of the hookswitch device in this location. This is a number in the range 0x00000000 (silence) to 0x0000FFFF (maximum volume). The actual granularity and quantization of volume settings in this range are service provider-specific.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPHONESTATE, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_OPERATIONFAILED, PHONEERR_INVALHOOKSWITCHDEV, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonegetvolume
     */
    static phoneGetVolume(hPhone, dwHookSwitchDev, lpdwVolume) {
        result := DllCall("TAPI32.dll\phoneGetVolume", "uint", hPhone, "uint", dwHookSwitchDev, "uint*", lpdwVolume, "int")
        return result
    }

    /**
     * The phoneInitialize function is obsolete. It continues to be exported by Tapi.dll and Tapi32.dll for backward compatibility with applications using TAPI versions 1.3 and 1.4.
     * @param {Pointer<UInt32>} lphPhoneApp Pointer to a location that is filled with the application's usage handle for TAPI.
     * @param {Pointer<Void>} hInstance Instance handle of the client application or DLL.
     * @param {Pointer<PHONECALLBACK>} lpfnCallback Address of a callback function that is invoked to determine status and events on the phone device.
     * @param {Pointer<Byte>} lpszAppName Pointer to a <b>null</b>-terminated string that contains displayable characters. If this parameter is non-<b>NULL</b>, it contains an application-supplied name of the application. This name is provided in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonestatus">PHONESTATUS</a> structure to indicate, in a user-friendly way, which application is the current owner of the phone device. This information can be useful for logging and status reporting purposes. If <i>lpszAppName</i> is <b>NULL</b>, the application's filename is used instead.
     * @param {Pointer<UInt32>} lpdwNumDevs Pointer to <b>DWORD</b>. This location is loaded with the number of phone devices available to the application.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALAPPNAME, PHONEERR_INIFILECORRUPT, PHONEERR_INVALPOINTER, PHONEERR_NOMEM, PHONEERR_OPERATIONFAILED, PHONEERR_REINIT, PHONEERR_RESOURCEUNAVAIL, PHONEERR_NODEVICE, PHONEERR_NODRIVER, PHONEERR_INVALPARAM
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phoneinitialize
     */
    static phoneInitialize(lphPhoneApp, hInstance, lpfnCallback, lpszAppName, lpdwNumDevs) {
        lpszAppName := lpszAppName is String? StrPtr(lpszAppName) : lpszAppName

        result := DllCall("TAPI32.dll\phoneInitialize", "uint*", lphPhoneApp, "ptr", hInstance, "ptr", lpfnCallback, "ptr", lpszAppName, "uint*", lpdwNumDevs, "int")
        return result
    }

    /**
     * The phoneInitializeEx function initializes the application's use of TAPI for subsequent use of the phone abstraction.
     * @param {Pointer<UInt32>} lphPhoneApp Pointer to a location that is filled with the application's usage handle for TAPI.
     * @param {Pointer<Void>} hInstance Instance handle of the client application or DLL. The application or DLL can pass <b>NULL</b> for this parameter, in which case TAPI uses the module handle of the root executable of the process.
     * @param {Pointer<PHONECALLBACK>} lpfnCallback Address of a callback function that is invoked to determine status and events on the line device, addresses, or calls, when the application is using the "hidden window" method of event notification (for more information see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nc-tapi-phonecallback">phoneCallbackFunc</a>). This parameter is ignored and should be set to <b>NULL</b> when the application chooses to use the "event handle" or "completion port" event notification mechanisms.
     * @param {Pointer<Byte>} lpszFriendlyAppName Pointer to a <b>null</b>-terminated string that contains only displayable characters. If this parameter is not <b>NULL</b>, it contains an application-supplied name for the application. This name is provided in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonestatus">PHONESTATUS</a> structure to indicate, in a user-friendly way, which application has ownership of the phone device. If <i>lpszFriendlyAppName</i> is <b>NULL</b>, the application's module filename is used instead (as returned by the function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamea">GetModuleFileName</a>).
     * @param {Pointer<UInt32>} lpdwNumDevs Pointer to a <b>DWORD</b>. Upon successful completion of this request, this location is filled with the number of phone devices available to the application.
     * @param {Pointer<UInt32>} lpdwAPIVersion Pointer to a <b>DWORD</b>. The application must initialize this <b>DWORD</b>, before calling this function, to the highest API version it is designed to support (for example, the same value it would pass into <i>dwAPIHighVersion</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateapiversion">phoneNegotiateAPIVersion</a>). Artificially high values must not be used; the value must be accurately set. TAPI translates any newer messages or structures into values or formats supported by the application's version. Upon successful completion of this request, this location is filled with the highest API version supported by TAPI, thereby allowing the application to detect and adapt to having been installed on a system with an older version of TAPI.
     * @param {Pointer<PHONEINITIALIZEEXPARAMS>} lpPhoneInitializeExParams Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phoneinitializeexparams">PHONEINITIALIZEEXPARAMS</a> containing additional parameters used to establish the association between the application and TAPI (specifically, the application's selected event notification mechanism and associated parameters).
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALAPPNAME, PHONEERR_OPERATIONFAILED, PHONEERR_INIFILECORRUPT, PHONEERR_INVALPOINTER, PHONEERR_REINIT, PHONEERR_NOMEM, PHONEERR_INVALPARAM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phoneinitializeexa
     */
    static phoneInitializeExA(lphPhoneApp, hInstance, lpfnCallback, lpszFriendlyAppName, lpdwNumDevs, lpdwAPIVersion, lpPhoneInitializeExParams) {
        lpszFriendlyAppName := lpszFriendlyAppName is String? StrPtr(lpszFriendlyAppName) : lpszFriendlyAppName

        result := DllCall("TAPI32.dll\phoneInitializeExA", "uint*", lphPhoneApp, "ptr", hInstance, "ptr", lpfnCallback, "ptr", lpszFriendlyAppName, "uint*", lpdwNumDevs, "uint*", lpdwAPIVersion, "ptr", lpPhoneInitializeExParams, "int")
        return result
    }

    /**
     * The phoneInitializeEx function initializes the application's use of TAPI for subsequent use of the phone abstraction.
     * @param {Pointer<UInt32>} lphPhoneApp Pointer to a location that is filled with the application's usage handle for TAPI.
     * @param {Pointer<Void>} hInstance Instance handle of the client application or DLL. The application or DLL can pass <b>NULL</b> for this parameter, in which case TAPI uses the module handle of the root executable of the process.
     * @param {Pointer<PHONECALLBACK>} lpfnCallback Address of a callback function that is invoked to determine status and events on the line device, addresses, or calls, when the application is using the "hidden window" method of event notification (for more information see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nc-tapi-phonecallback">phoneCallbackFunc</a>). This parameter is ignored and should be set to <b>NULL</b> when the application chooses to use the "event handle" or "completion port" event notification mechanisms.
     * @param {Pointer<Char>} lpszFriendlyAppName Pointer to a <b>null</b>-terminated string that contains only displayable characters. If this parameter is not <b>NULL</b>, it contains an application-supplied name for the application. This name is provided in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonestatus">PHONESTATUS</a> structure to indicate, in a user-friendly way, which application has ownership of the phone device. If <i>lpszFriendlyAppName</i> is <b>NULL</b>, the application's module filename is used instead (as returned by the function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulefilenamea">GetModuleFileName</a>).
     * @param {Pointer<UInt32>} lpdwNumDevs Pointer to a <b>DWORD</b>. Upon successful completion of this request, this location is filled with the number of phone devices available to the application.
     * @param {Pointer<UInt32>} lpdwAPIVersion Pointer to a <b>DWORD</b>. The application must initialize this <b>DWORD</b>, before calling this function, to the highest API version it is designed to support (for example, the same value it would pass into <i>dwAPIHighVersion</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateapiversion">phoneNegotiateAPIVersion</a>). Artificially high values must not be used; the value must be accurately set. TAPI translates any newer messages or structures into values or formats supported by the application's version. Upon successful completion of this request, this location is filled with the highest API version supported by TAPI, thereby allowing the application to detect and adapt to having been installed on a system with an older version of TAPI.
     * @param {Pointer<PHONEINITIALIZEEXPARAMS>} lpPhoneInitializeExParams Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phoneinitializeexparams">PHONEINITIALIZEEXPARAMS</a> containing additional parameters used to establish the association between the application and TAPI (specifically, the application's selected event notification mechanism and associated parameters).
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALAPPNAME, PHONEERR_OPERATIONFAILED, PHONEERR_INIFILECORRUPT, PHONEERR_INVALPOINTER, PHONEERR_REINIT, PHONEERR_NOMEM, PHONEERR_INVALPARAM.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phoneinitializeexw
     */
    static phoneInitializeExW(lphPhoneApp, hInstance, lpfnCallback, lpszFriendlyAppName, lpdwNumDevs, lpdwAPIVersion, lpPhoneInitializeExParams) {
        lpszFriendlyAppName := lpszFriendlyAppName is String? StrPtr(lpszFriendlyAppName) : lpszFriendlyAppName

        result := DllCall("TAPI32.dll\phoneInitializeExW", "uint*", lphPhoneApp, "ptr", hInstance, "ptr", lpfnCallback, "ptr", lpszFriendlyAppName, "uint*", lpdwNumDevs, "uint*", lpdwAPIVersion, "ptr", lpPhoneInitializeExParams, "int")
        return result
    }

    /**
     * The phoneNegotiateAPIVersion allows an application to negotiate an API version to use for the specified phone device.
     * @param {Integer} hPhoneApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifier of the phone device to be queried.
     * @param {Integer} dwAPILowVersion Least recent API version the application is compliant with. The high-order word is the major version number, the low-order word is the minor version number.
     * @param {Integer} dwAPIHighVersion Most recent API version the application is compliant with. The high-order word is the major version number, the low-order word is the minor version number.
     * @param {Pointer<UInt32>} lpdwAPIVersion Pointer to a <b>DWORD</b> in which the API version number that was negotiated will be returned. If negotiation succeeds, this number is in the range <i>dwAPILowVersion</i> to <i>dwAPIHighVersion</i>.
     * @param {Pointer<PHONEEXTENSIONID>} lpExtensionID Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phoneextensionid">PHONEEXTENSIONID</a>. If the service provider for the specified <i>dwDeviceID</i> parameter supports provider-specific extensions, this structure is filled with the extension identifier of these extensions when negotiation succeeds. This structure contains all zeros if the line provides no extensions. An application can ignore the returned parameter if it does not use extensions.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALAPPHANDLE, PHONEERR_OPERATIONFAILED, PHONEERR_BADDEVICEID, PHONEERR_OPERATIONUNAVAIL, PHONEERR_NODRIVER, PHONEERR_NOMEM, PHONEERR_INVALPOINTER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INCOMPATIBLEAPIVERSION, PHONEERR_UNINITIALIZED, PHONEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonenegotiateapiversion
     */
    static phoneNegotiateAPIVersion(hPhoneApp, dwDeviceID, dwAPILowVersion, dwAPIHighVersion, lpdwAPIVersion, lpExtensionID) {
        result := DllCall("TAPI32.dll\phoneNegotiateAPIVersion", "uint", hPhoneApp, "uint", dwDeviceID, "uint", dwAPILowVersion, "uint", dwAPIHighVersion, "uint*", lpdwAPIVersion, "ptr", lpExtensionID, "int")
        return result
    }

    /**
     * The phoneNegotiateExtVersion function allows an application to negotiate an extension version to use with the specified phone device. This operation need not be called if the application does not support extensions.
     * @param {Integer} hPhoneApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifier of the phone device to be queried.
     * @param {Integer} dwAPIVersion API version number that was negotiated for the specified phone device using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateapiversion">phoneNegotiateAPIVersion</a>.
     * @param {Integer} dwExtLowVersion Least recent extension version of the extension identifier returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateapiversion">phoneNegotiateAPIVersion</a> that the application is compliant with. The high-order word is the major version number; the low-order word is the minor version number.
     * @param {Integer} dwExtHighVersion Most recent extension version of the extension identifier returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateapiversion">phoneNegotiateAPIVersion</a> that the application is compliant with. The high-order word is the major version number; the low-order word is the minor version number.
     * @param {Pointer<UInt32>} lpdwExtVersion Pointer to a <b>DWORD</b> in which the extension version number that was negotiated is returned. If negotiation succeeds, this number is in the range <i>dwExtLowVersion</i> to <i>dwExtHighVersion</i>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALAPPHANDLE, PHONEERR_OPERATIONFAILED, PHONEERR_BADDEVICEID, PHONEERR_OPERATIONUNAVAIL, PHONEERR_NODRIVER, PHONEERR_NOMEM, PHONEERR_INCOMPATIBLEAPIVERSION, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INCOMPATIBLEEXTVERSION, PHONEERR_UNINITIALIZED, PHONEERR_INVALPOINTER, PHONEERR_NODEVICE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonenegotiateextversion
     */
    static phoneNegotiateExtVersion(hPhoneApp, dwDeviceID, dwAPIVersion, dwExtLowVersion, dwExtHighVersion, lpdwExtVersion) {
        result := DllCall("TAPI32.dll\phoneNegotiateExtVersion", "uint", hPhoneApp, "uint", dwDeviceID, "uint", dwAPIVersion, "uint", dwExtLowVersion, "uint", dwExtHighVersion, "uint*", lpdwExtVersion, "int")
        return result
    }

    /**
     * The phoneOpen function opens the specified phone device.
     * @param {Integer} hPhoneApp Handle to the application's registration with TAPI.
     * @param {Integer} dwDeviceID Identifier of the phone device to be opened.
     * @param {Pointer<UInt32>} lphPhone Pointer to an HPHONE handle that identifies the open phone device. Use this handle to identify the device when invoking other phone control functions.
     * @param {Integer} dwAPIVersion API version number under which the application and Telephony API have agreed to operate. This number is obtained from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateapiversion">phoneNegotiateAPIVersion</a>.
     * @param {Integer} dwExtVersion Extension version number under which the application and the service provider agree to operate. This number is zero if the application does not use any extensions. This number is obtained from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonenegotiateextversion">phoneNegotiateExtVersion</a>.
     * @param {Pointer} dwCallbackInstance User instance data passed back to the application with each message. This parameter is not interpreted by the Telephony API.
     * @param {Integer} dwPrivilege Privilege requested. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phoneprivilege--constants">PHONEPRIVILEGE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_ALLOCATED, PHONEERR_NODRIVER, PHONEERR_BADDEVICEID, PHONEERR_NOMEM, PHONEERR_INCOMPATIBLEAPIVERSION, PHONEERR_OPERATIONFAILED, PHONEERR_INCOMPATIBLEEXTVERSION, PHONEERR_OPERATIONUNAVAIL, PHONEERR_INVALAPPHANDLE, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPOINTER, PHONEERR_UNINITIALIZED, PHONEERR_INVALPRIVILEGE, PHONEERR_REINIT, PHONEERR_INUSE, PHONEERR_NODEVICE, PHONEERR_INIFILECORRUPT.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phoneopen
     */
    static phoneOpen(hPhoneApp, dwDeviceID, lphPhone, dwAPIVersion, dwExtVersion, dwCallbackInstance, dwPrivilege) {
        result := DllCall("TAPI32.dll\phoneOpen", "uint", hPhoneApp, "uint", dwDeviceID, "uint*", lphPhone, "uint", dwAPIVersion, "uint", dwExtVersion, "ptr", dwCallbackInstance, "uint", dwPrivilege, "int")
        return result
    }

    /**
     * The phoneSetButtonInfo function sets information about the specified button on the specified phone.
     * @param {Integer} hPhone Handle to the open phone device. The application must be the owner of the phone device.
     * @param {Integer} dwButtonLampID Button on the phone device.
     * @param {Pointer<PHONEBUTTONINFO>} lpButtonInfo Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonebuttoninfo">PHONEBUTTONINFO</a>. This data structure describes the mode, the function, and provides additional descriptive text about the button.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/phone-reply">PHONE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALBUTTONLAMPID, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPHONEHANDLE, PHONEERR_STRUCTURETOOSMALL, PHONEERR_INVALPOINTER, PHONEERR_UNINITIALIZED, PHONEERR_NOTOWNER, PHONEERR_NOMEM, PHONEERR_OPERATIONUNAVAIL, PHONEERR_RESOURCEUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonesetbuttoninfo
     */
    static phoneSetButtonInfo(hPhone, dwButtonLampID, lpButtonInfo) {
        result := DllCall("TAPI32.dll\phoneSetButtonInfo", "uint", hPhone, "uint", dwButtonLampID, "ptr", lpButtonInfo, "int")
        return result
    }

    /**
     * The phoneSetButtonInfo function sets information about the specified button on the specified phone.
     * @param {Integer} hPhone Handle to the open phone device. The application must be the owner of the phone device.
     * @param {Integer} dwButtonLampID Button on the phone device.
     * @param {Pointer<PHONEBUTTONINFO>} lpButtonInfo Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonebuttoninfo">PHONEBUTTONINFO</a>. This data structure describes the mode, the function, and provides additional descriptive text about the button.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/phone-reply">PHONE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALBUTTONLAMPID, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPHONEHANDLE, PHONEERR_STRUCTURETOOSMALL, PHONEERR_INVALPOINTER, PHONEERR_UNINITIALIZED, PHONEERR_NOTOWNER, PHONEERR_NOMEM, PHONEERR_OPERATIONUNAVAIL, PHONEERR_RESOURCEUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonesetbuttoninfoa
     */
    static phoneSetButtonInfoA(hPhone, dwButtonLampID, lpButtonInfo) {
        result := DllCall("TAPI32.dll\phoneSetButtonInfoA", "uint", hPhone, "uint", dwButtonLampID, "ptr", lpButtonInfo, "int")
        return result
    }

    /**
     * The phoneSetButtonInfo function sets information about the specified button on the specified phone.
     * @param {Integer} hPhone Handle to the open phone device. The application must be the owner of the phone device.
     * @param {Integer} dwButtonLampID Button on the phone device.
     * @param {Pointer<PHONEBUTTONINFO>} lpButtonInfo Pointer to a variably sized structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonebuttoninfo">PHONEBUTTONINFO</a>. This data structure describes the mode, the function, and provides additional descriptive text about the button.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/phone-reply">PHONE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALBUTTONLAMPID, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPHONEHANDLE, PHONEERR_STRUCTURETOOSMALL, PHONEERR_INVALPOINTER, PHONEERR_UNINITIALIZED, PHONEERR_NOTOWNER, PHONEERR_NOMEM, PHONEERR_OPERATIONUNAVAIL, PHONEERR_RESOURCEUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonesetbuttoninfow
     */
    static phoneSetButtonInfoW(hPhone, dwButtonLampID, lpButtonInfo) {
        result := DllCall("TAPI32.dll\phoneSetButtonInfoW", "uint", hPhone, "uint", dwButtonLampID, "ptr", lpButtonInfo, "int")
        return result
    }

    /**
     * The phoneSetData function downloads the information in the specified buffer to the opened phone device at the selected data identifier.
     * @param {Integer} hPhone Handle to the open phone device. The application must be the owner of the phone.
     * @param {Integer} dwDataID Where in the phone device the buffer is to be downloaded.
     * @param {Pointer<Void>} lpData Pointer to the memory location where the data is to be downloaded from.
     * @param {Integer} dwSize Size of the buffer, in bytes.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/phone-reply">PHONE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_OPERATIONUNAVAIL, PHONEERR_NOTOWNER, PHONEERR_NOMEM, PHONEERR_INVALDATAID, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPHONESTATE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPOINTER, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonesetdata
     */
    static phoneSetData(hPhone, dwDataID, lpData, dwSize) {
        result := DllCall("TAPI32.dll\phoneSetData", "uint", hPhone, "uint", dwDataID, "ptr", lpData, "uint", dwSize, "int")
        return result
    }

    /**
     * The phoneSetDisplay function causes the specified string to be displayed on the specified open phone device.
     * @param {Integer} hPhone Handle to the open phone device. The application must be the owner of the phone.
     * @param {Integer} dwRow Row position on the display where the new text is to be displayed.
     * @param {Integer} dwColumn Column position on the display where the new text is to be displayed.
     * @param {Pointer<Byte>} lpsDisplay Pointer to the memory location where the display content is stored. The display information must have the format specified in the <b>dwStringFormat</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonecaps">PHONECAPS</a> structure, which describes the phone's device capabilities.
     * @param {Integer} dwSize Size of the information pointed to by <i>lpsDisplay</i>, in bytes. If the <i>lpsDisplay</i> parameter is a pointer to a string, the size must include the null terminator.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/phone-reply">PHONE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_OPERATIONUNAVAIL, PHONEERR_NOTOWNER, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPHONESTATE, PHONEERR_UNINITIALIZED, PHONEERR_INVALPOINTER, PHONEERR_NOMEM, PHONEERR_INVALPARAM, PHONEERR_RESOURCEUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonesetdisplay
     */
    static phoneSetDisplay(hPhone, dwRow, dwColumn, lpsDisplay, dwSize) {
        lpsDisplay := lpsDisplay is String? StrPtr(lpsDisplay) : lpsDisplay

        result := DllCall("TAPI32.dll\phoneSetDisplay", "uint", hPhone, "uint", dwRow, "uint", dwColumn, "ptr", lpsDisplay, "uint", dwSize, "int")
        return result
    }

    /**
     * The phoneSetGain function sets the gain of the microphone of the specified hookswitch device to the specified gain level.
     * @param {Integer} hPhone Handle to the open phone device. The application must be the owner of the phone.
     * @param {Integer} dwHookSwitchDev Hookswitch device whose microphone's gain is to be set. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchdev--constants">PHONEHOOKSWITCHDEV_ Constants</a>.
     * @param {Integer} dwGain Pointer to a <b>DWORD</b> containing the new gain setting of the device. The <i>dwGain</i> parameter specifies the gain level of the hookswitch device. This is a number in the range 0x00000000 (silence) to 0x0000FFFF (maximum volume). The actual granularity and quantization of gain settings in this range are service provider-specific. A value for <i>dwGain</i> that is out of range is set to the nearest value in the range.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding <a href="/windows/desktop/Tapi/phone-reply">PHONE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_NOTOWNER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPHONESTATE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALHOOKSWITCHDEV, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonesetgain
     */
    static phoneSetGain(hPhone, dwHookSwitchDev, dwGain) {
        result := DllCall("TAPI32.dll\phoneSetGain", "uint", hPhone, "uint", dwHookSwitchDev, "uint", dwGain, "int")
        return result
    }

    /**
     * The phoneSetHookSwitch function sets the hook state of the specified open phone's hookswitch devices to the specified mode. Only the hookswitch state of the hookswitch devices listed is affected.
     * @param {Integer} hPhone Handle to the open phone device. The application must be the owner of the phone.
     * @param {Integer} dwHookSwitchDevs Device whose hookswitch mode is to be set. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchdev--constants">PHONEHOOKSWITCHDEV_ Constants</a>.
     * @param {Integer} dwHookSwitchMode Hookswitch mode to set. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchmode--constants">PHONEHOOKSWITCHMODE_ Constants</a>.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/phone-reply">PHONE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_OPERATIONUNAVAIL, PHONEERR_NOTOWNER, PHONEERR_NOMEM, PHONEERR_INVALHOOKSWITCHDEV, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALHOOKSWITCHMODE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALPHONESTATE, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonesethookswitch
     */
    static phoneSetHookSwitch(hPhone, dwHookSwitchDevs, dwHookSwitchMode) {
        result := DllCall("TAPI32.dll\phoneSetHookSwitch", "uint", hPhone, "uint", dwHookSwitchDevs, "uint", dwHookSwitchMode, "int")
        return result
    }

    /**
     * The phoneSetLamp function causes the specified lamp to be lit on the specified open phone device in the specified lamp mode.
     * @param {Integer} hPhone Handle to the open phone device. The application must be the owner of the phone.
     * @param {Integer} dwButtonLampID Button whose lamp is to be lit.
     * @param {Integer} dwLampMode How the lamp is to be lit. This parameter uses one and only one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonelampmode--constants">PHONELAMPMODE_ Constants</a>.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding <a href="/windows/desktop/Tapi/phone-reply">PHONE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_OPERATIONUNAVAIL, PHONEERR_NOTOWNER, PHONEERR_NOMEM, PHONEERR_INVALBUTTONLAMPID, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPHONESTATE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALLAMPMODE, PHONEERR_UNINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonesetlamp
     */
    static phoneSetLamp(hPhone, dwButtonLampID, dwLampMode) {
        result := DllCall("TAPI32.dll\phoneSetLamp", "uint", hPhone, "uint", dwButtonLampID, "uint", dwLampMode, "int")
        return result
    }

    /**
     * The phoneSetRing function rings the specified open phone device using the specified ring mode and volume.
     * @param {Integer} hPhone Handle to the open phone device. The application must be the owner of the phone device.
     * @param {Integer} dwRingMode Ringing pattern with which to ring the phone. This parameter must be within the range of zero to the value of the <b>dwNumRingModes</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonecaps">PHONECAPS</a> structure. If <b>dwNumRingModes</b> is zero, the ring mode of the phone cannot be controlled; if <b>dwNumRingModes</b> is 1, a value of 0 for <i>dwRingMode</i> indicates that the phone should not be rung (silence), and other values from 1 to <b>dwNumRingModes</b> are valid ring modes for the phone device.
     * @param {Integer} dwVolume Volume level with which the phone is ringing. This is a number in the range 0x00000000 (silence) to 0x0000FFFF (maximum volume). The actual granularity and quantization of volume settings in this range are service provider-specific. A value for <i>dwVolume</i> that is out of range is set to the nearest value in the range.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/phone-reply">PHONE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_NOTOWNER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPHONESTATE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALRINGMODE, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonesetring
     */
    static phoneSetRing(hPhone, dwRingMode, dwVolume) {
        result := DllCall("TAPI32.dll\phoneSetRing", "uint", hPhone, "uint", dwRingMode, "uint", dwVolume, "int")
        return result
    }

    /**
     * The phoneSetStatusMessages function enables an application to monitor the specified phone device for selected status events.
     * @param {Integer} hPhone Handle to the open phone device to be monitored.
     * @param {Integer} dwPhoneStates Set of phone status changes and events for which the application can receive notification messages. This parameter can have zero, one, or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonestate--constants">PHONESTATE_ Constants</a>.
     * @param {Integer} dwButtonModes Set of phone-button modes for which the application can receive notification messages. This parameter can have zero, one, or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonebuttonmode--constants">PHONEBUTTONMODE_ Constants</a>.
     * @param {Integer} dwButtonStates Set of phone-button state changes for which the application can receive notification messages. If the <i>dwButtonModes</i> parameter is zero, <i>dwButtonStates</i> is ignored. If <i>dwButtonModes</i> has one or more bits set, this parameter must also have at least one bit set. This parameter uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonebuttonstate--constants">PHONEBUTTONSTATE_ Constants</a>.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_INVALPHONESTATE, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALBUTTONMODE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALBUTTONSTATE, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonesetstatusmessages
     */
    static phoneSetStatusMessages(hPhone, dwPhoneStates, dwButtonModes, dwButtonStates) {
        result := DllCall("TAPI32.dll\phoneSetStatusMessages", "uint", hPhone, "uint", dwPhoneStates, "uint", dwButtonModes, "uint", dwButtonStates, "int")
        return result
    }

    /**
     * The phoneSetVolume function sets the volume of the speaker component of the specified hookswitch device to the specified level.
     * @param {Integer} hPhone Handle to the open phone device. The application must be the owner of the phone.
     * @param {Integer} dwHookSwitchDev Hookswitch device whose speaker's volume is to be set, one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchdev--constants">PHONEHOOKSWITCHDEV_ Constants</a>.
     * @param {Integer} dwVolume New volume setting of the device. The <i>dwVolume</i> parameter specifies the volume level of the hookswitch device. This is a number in the range 0x00000000 (silence) to 0x0000FFFF (maximum volume). The actual granularity and quantization of volume settings in this range are service provider-specific. A value for <i>dwVolume</i> that is out of range is set to the nearest value in the range.
     * @returns {Integer} Returns a positive request identifier if the function is completed asynchronously or a negative error number if an error occurs. The <i>dwParam2</i> parameter of the corresponding 
     * <a href="/windows/desktop/Tapi/phone-reply">PHONE_REPLY</a> message is zero if the function succeeds or it is a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALPHONEHANDLE, PHONEERR_NOMEM, PHONEERR_NOTOWNER, PHONEERR_RESOURCEUNAVAIL, PHONEERR_INVALPHONESTATE, PHONEERR_OPERATIONFAILED, PHONEERR_INVALHOOKSWITCHDEV, PHONEERR_UNINITIALIZED, PHONEERR_OPERATIONUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phonesetvolume
     */
    static phoneSetVolume(hPhone, dwHookSwitchDev, dwVolume) {
        result := DllCall("TAPI32.dll\phoneSetVolume", "uint", hPhone, "uint", dwHookSwitchDev, "uint", dwVolume, "int")
        return result
    }

    /**
     * The phoneShutdown function shuts down the application's usage of TAPI's phone abstraction.
     * @param {Integer} hPhoneApp Application's usage handle for TAPI.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are:
     * 
     * PHONEERR_INVALAPPHANDLE, PHONEERR_NOMEM, PHONEERR_UNINITIALIZED, PHONEERR_RESOURCEUNAVAIL.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-phoneshutdown
     */
    static phoneShutdown(hPhoneApp) {
        result := DllCall("TAPI32.dll\phoneShutdown", "uint", hPhoneApp, "int")
        return result
    }

    /**
     * The tapiGetLocationInfo function returns the country or region code and city (area) code that the user has set in the current location parameters in the Telephony Control Panel.
     * @param {Pointer<Byte>} lpszCountryCode TBD
     * @param {Pointer<Byte>} lpszCityCode TBD
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are TAPIERR_REQUESTFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-tapigetlocationinfo
     */
    static tapiGetLocationInfo(lpszCountryCode, lpszCityCode) {
        lpszCountryCode := lpszCountryCode is String? StrPtr(lpszCountryCode) : lpszCountryCode
        lpszCityCode := lpszCityCode is String? StrPtr(lpszCityCode) : lpszCityCode

        result := DllCall("TAPI32.dll\tapiGetLocationInfo", "ptr", lpszCountryCode, "ptr", lpszCityCode, "int")
        return result
    }

    /**
     * The tapiGetLocationInfo function returns the country or region code and city (area) code that the user has set in the current location parameters in the Telephony Control Panel.
     * @param {Pointer<Byte>} lpszCountryCode TBD
     * @param {Pointer<Byte>} lpszCityCode TBD
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are TAPIERR_REQUESTFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-tapigetlocationinfoa
     */
    static tapiGetLocationInfoA(lpszCountryCode, lpszCityCode) {
        lpszCountryCode := lpszCountryCode is String? StrPtr(lpszCountryCode) : lpszCountryCode
        lpszCityCode := lpszCityCode is String? StrPtr(lpszCityCode) : lpszCityCode

        result := DllCall("TAPI32.dll\tapiGetLocationInfoA", "ptr", lpszCountryCode, "ptr", lpszCityCode, "int")
        return result
    }

    /**
     * The tapiGetLocationInfo function returns the country or region code and city (area) code that the user has set in the current location parameters in the Telephony Control Panel.
     * @param {Pointer<Char>} lpszCountryCodeW Pointer to a memory location where a <b>null</b>-terminated string specifying the country or region code for the current location is to be returned. The application should allocate at least 8 bytes of storage at this location to hold the string (TAPI does not return more than 8 bytes, including the terminating <b>NULL</b>). An empty string (\0) is returned if the country or region code has not been set for the current location.
     * @param {Pointer<Char>} lpszCityCodeW Pointer to a memory location where a <b>null</b>-terminated string specifying the city (area) code for the current location is to be returned. The application should allocate at least 8 bytes of storage at this location to hold the string (TAPI does not return more than 8 bytes, including the terminating <b>NULL</b>). An empty string (\0) is returned if the city code has not been set for the current location.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible return values are TAPIERR_REQUESTFAILED.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-tapigetlocationinfow
     */
    static tapiGetLocationInfoW(lpszCountryCodeW, lpszCityCodeW) {
        lpszCountryCodeW := lpszCountryCodeW is String? StrPtr(lpszCountryCodeW) : lpszCountryCodeW
        lpszCityCodeW := lpszCityCodeW is String? StrPtr(lpszCityCodeW) : lpszCityCodeW

        result := DllCall("TAPI32.dll\tapiGetLocationInfoW", "ptr", lpszCountryCodeW, "ptr", lpszCityCodeW, "int")
        return result
    }

    /**
     * Closes a call request made by a previous call to tapiRequestMediaCall.
     * @param {Pointer<Void>} hwnd Handle to the Windows process that issued this request.
     * @param {Pointer} wRequestID Pointer to a 32-bit integer value that contains the ID of the call request.
     * @returns {Integer} The function is obsolete and will always return an error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-tapirequestdrop
     */
    static tapiRequestDrop(hwnd, wRequestID) {
        result := DllCall("TAPI32.dll\tapiRequestDrop", "ptr", hwnd, "ptr", wRequestID, "int")
        return result
    }

    /**
     * The tapiRequestMakeCall function requests the establishment of a voice call. A call-manager application is responsible for establishing the call on behalf of the requesting application, which is then controlled by the user's call-manager application.
     * @param {Pointer<Byte>} lpszDestAddress Pointer to a memory location where the <b>null</b>-terminated destination address of the call request is located. The address can use the 
     * [canonical address](/windows/win32/tapi/address-ovr#canonical-addresses) format. Validity of the specified address is not checked by this operation. The maximum length of the address is TAPIMAXDESTADDRESSSIZE characters, which includes the <b>NULL</b> terminator.
     * @param {Pointer<Byte>} lpszAppName Pointer to a memory location where the <b>null</b>-terminated user-friendly application name of the call request is located. This pointer can be left <b>NULL</b> if the application does not supply an application name. The maximum length of the address is TAPIMAXAPPNAMESIZE characters, which includes the <b>NULL</b> terminator. Longer strings are truncated.
     * @param {Pointer<Byte>} lpszCalledParty Pointer to a memory location where the <b>null</b>-terminated called party name for the called party of the call is located. This pointer can be left <b>NULL</b> if the application does not wish to supply this information. The maximum length of the string is TAPIMAXCALLEDPARTYSIZE characters, which includes the <b>NULL</b> terminator. Longer strings are truncated.
     * @param {Pointer<Byte>} lpszComment Pointer to a memory location where the <b>null</b>-terminated comment about the call is located. This pointer can be left <b>NULL</b> if the application does not supply a comment. The maximum length of the address is TAPIMAXCOMMENTSIZE characters, which includes the <b>NULL</b> terminator. Longer strings are truncated.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible error return value are:
     * 
     * TAPIERR_NOREQUESTRECIPIENT, TAPIERR_INVALDESTADDRESS, TAPIERR_REQUESTQUEUEFULL, TAPIERR_INVALPOINTER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-tapirequestmakecall
     */
    static tapiRequestMakeCall(lpszDestAddress, lpszAppName, lpszCalledParty, lpszComment) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress
        lpszAppName := lpszAppName is String? StrPtr(lpszAppName) : lpszAppName
        lpszCalledParty := lpszCalledParty is String? StrPtr(lpszCalledParty) : lpszCalledParty
        lpszComment := lpszComment is String? StrPtr(lpszComment) : lpszComment

        result := DllCall("TAPI32.dll\tapiRequestMakeCall", "ptr", lpszDestAddress, "ptr", lpszAppName, "ptr", lpszCalledParty, "ptr", lpszComment, "int")
        return result
    }

    /**
     * The tapiRequestMakeCall function requests the establishment of a voice call. A call-manager application is responsible for establishing the call on behalf of the requesting application, which is then controlled by the user's call-manager application.
     * @param {Pointer<Byte>} lpszDestAddress Pointer to a memory location where the <b>null</b>-terminated destination address of the call request is located. The address can use the [canonical address](/windows/win32/tapi/address-ovr#canonical-addresses) format. Validity of the specified address is not checked by this operation. The maximum length of the address is TAPIMAXDESTADDRESSSIZE characters, which includes the <b>NULL</b> terminator.
     * @param {Pointer<Byte>} lpszAppName Pointer to a memory location where the <b>null</b>-terminated user-friendly application name of the call request is located. This pointer can be left <b>NULL</b> if the application does not supply an application name. The maximum length of the address is TAPIMAXAPPNAMESIZE characters, which includes the <b>NULL</b> terminator. Longer strings are truncated.
     * @param {Pointer<Byte>} lpszCalledParty Pointer to a memory location where the <b>null</b>-terminated called party name for the called party of the call is located. This pointer can be left <b>NULL</b> if the application does not wish to supply this information. The maximum length of the string is TAPIMAXCALLEDPARTYSIZE characters, which includes the <b>NULL</b> terminator. Longer strings are truncated.
     * @param {Pointer<Byte>} lpszComment Pointer to a memory location where the <b>null</b>-terminated comment about the call is located. This pointer can be left <b>NULL</b> if the application does not supply a comment. The maximum length of the address is TAPIMAXCOMMENTSIZE characters, which includes the <b>NULL</b> terminator. Longer strings are truncated.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible error return value are:
     * 
     * TAPIERR_NOREQUESTRECIPIENT, TAPIERR_INVALDESTADDRESS, TAPIERR_REQUESTQUEUEFULL, TAPIERR_INVALPOINTER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-tapirequestmakecalla
     */
    static tapiRequestMakeCallA(lpszDestAddress, lpszAppName, lpszCalledParty, lpszComment) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress
        lpszAppName := lpszAppName is String? StrPtr(lpszAppName) : lpszAppName
        lpszCalledParty := lpszCalledParty is String? StrPtr(lpszCalledParty) : lpszCalledParty
        lpszComment := lpszComment is String? StrPtr(lpszComment) : lpszComment

        result := DllCall("TAPI32.dll\tapiRequestMakeCallA", "ptr", lpszDestAddress, "ptr", lpszAppName, "ptr", lpszCalledParty, "ptr", lpszComment, "int")
        return result
    }

    /**
     * The tapiRequestMakeCall function requests the establishment of a voice call. A call-manager application is responsible for establishing the call on behalf of the requesting application, which is then controlled by the user's call-manager application.
     * @param {Pointer<Char>} lpszDestAddress Pointer to a memory location where the <b>null</b>-terminated destination address of the call request is located. The address can use the 
     * [canonical address](/windows/win32/tapi/address-ovr#canonical-addresses) format. Validity of the specified address is not checked by this operation. The maximum length of the address is TAPIMAXDESTADDRESSSIZE characters, which includes the <b>NULL</b> terminator.
     * @param {Pointer<Char>} lpszAppName Pointer to a memory location where the <b>null</b>-terminated user-friendly application name of the call request is located. This pointer can be left <b>NULL</b> if the application does not supply an application name. The maximum length of the address is TAPIMAXAPPNAMESIZE characters, which includes the <b>NULL</b> terminator. Longer strings are truncated.
     * @param {Pointer<Char>} lpszCalledParty Pointer to a memory location where the <b>null</b>-terminated called party name for the called party of the call is located. This pointer can be left <b>NULL</b> if the application does not wish to supply this information. The maximum length of the string is TAPIMAXCALLEDPARTYSIZE characters, which includes the <b>NULL</b> terminator. Longer strings are truncated.
     * @param {Pointer<Char>} lpszComment Pointer to a memory location where the <b>null</b>-terminated comment about the call is located. This pointer can be left <b>NULL</b> if the application does not supply a comment. The maximum length of the address is TAPIMAXCOMMENTSIZE characters, which includes the <b>NULL</b> terminator. Longer strings are truncated.
     * @returns {Integer} Returns zero if the request succeeds or a negative error number if an error occurs. Possible error return value are:
     * 
     * TAPIERR_NOREQUESTRECIPIENT, TAPIERR_INVALDESTADDRESS, TAPIERR_REQUESTQUEUEFULL, TAPIERR_INVALPOINTER.
     * @see https://docs.microsoft.com/windows/win32/api//tapi/nf-tapi-tapirequestmakecallw
     */
    static tapiRequestMakeCallW(lpszDestAddress, lpszAppName, lpszCalledParty, lpszComment) {
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress
        lpszAppName := lpszAppName is String? StrPtr(lpszAppName) : lpszAppName
        lpszCalledParty := lpszCalledParty is String? StrPtr(lpszCalledParty) : lpszCalledParty
        lpszComment := lpszComment is String? StrPtr(lpszComment) : lpszComment

        result := DllCall("TAPI32.dll\tapiRequestMakeCallW", "ptr", lpszDestAddress, "ptr", lpszAppName, "ptr", lpszCalledParty, "ptr", lpszComment, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hwnd 
     * @param {Pointer} wRequestID 
     * @param {Pointer<Byte>} lpszDeviceClass 
     * @param {Pointer<Byte>} lpDeviceID 
     * @param {Integer} dwSize 
     * @param {Integer} dwSecure 
     * @param {Pointer<Byte>} lpszDestAddress 
     * @param {Pointer<Byte>} lpszAppName 
     * @param {Pointer<Byte>} lpszCalledParty 
     * @param {Pointer<Byte>} lpszComment 
     * @returns {Integer} 
     */
    static tapiRequestMediaCall(hwnd, wRequestID, lpszDeviceClass, lpDeviceID, dwSize, dwSecure, lpszDestAddress, lpszAppName, lpszCalledParty, lpszComment) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass
        lpDeviceID := lpDeviceID is String? StrPtr(lpDeviceID) : lpDeviceID
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress
        lpszAppName := lpszAppName is String? StrPtr(lpszAppName) : lpszAppName
        lpszCalledParty := lpszCalledParty is String? StrPtr(lpszCalledParty) : lpszCalledParty
        lpszComment := lpszComment is String? StrPtr(lpszComment) : lpszComment

        result := DllCall("TAPI32.dll\tapiRequestMediaCall", "ptr", hwnd, "ptr", wRequestID, "ptr", lpszDeviceClass, "ptr", lpDeviceID, "uint", dwSize, "uint", dwSecure, "ptr", lpszDestAddress, "ptr", lpszAppName, "ptr", lpszCalledParty, "ptr", lpszComment, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hwnd 
     * @param {Pointer} wRequestID 
     * @param {Pointer<Byte>} lpszDeviceClass 
     * @param {Pointer<Byte>} lpDeviceID 
     * @param {Integer} dwSize 
     * @param {Integer} dwSecure 
     * @param {Pointer<Byte>} lpszDestAddress 
     * @param {Pointer<Byte>} lpszAppName 
     * @param {Pointer<Byte>} lpszCalledParty 
     * @param {Pointer<Byte>} lpszComment 
     * @returns {Integer} 
     */
    static tapiRequestMediaCallA(hwnd, wRequestID, lpszDeviceClass, lpDeviceID, dwSize, dwSecure, lpszDestAddress, lpszAppName, lpszCalledParty, lpszComment) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass
        lpDeviceID := lpDeviceID is String? StrPtr(lpDeviceID) : lpDeviceID
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress
        lpszAppName := lpszAppName is String? StrPtr(lpszAppName) : lpszAppName
        lpszCalledParty := lpszCalledParty is String? StrPtr(lpszCalledParty) : lpszCalledParty
        lpszComment := lpszComment is String? StrPtr(lpszComment) : lpszComment

        result := DllCall("TAPI32.dll\tapiRequestMediaCallA", "ptr", hwnd, "ptr", wRequestID, "ptr", lpszDeviceClass, "ptr", lpDeviceID, "uint", dwSize, "uint", dwSecure, "ptr", lpszDestAddress, "ptr", lpszAppName, "ptr", lpszCalledParty, "ptr", lpszComment, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hwnd 
     * @param {Pointer} wRequestID 
     * @param {Pointer<Char>} lpszDeviceClass 
     * @param {Pointer<Char>} lpDeviceID 
     * @param {Integer} dwSize 
     * @param {Integer} dwSecure 
     * @param {Pointer<Char>} lpszDestAddress 
     * @param {Pointer<Char>} lpszAppName 
     * @param {Pointer<Char>} lpszCalledParty 
     * @param {Pointer<Char>} lpszComment 
     * @returns {Integer} 
     */
    static tapiRequestMediaCallW(hwnd, wRequestID, lpszDeviceClass, lpDeviceID, dwSize, dwSecure, lpszDestAddress, lpszAppName, lpszCalledParty, lpszComment) {
        lpszDeviceClass := lpszDeviceClass is String? StrPtr(lpszDeviceClass) : lpszDeviceClass
        lpDeviceID := lpDeviceID is String? StrPtr(lpDeviceID) : lpDeviceID
        lpszDestAddress := lpszDestAddress is String? StrPtr(lpszDestAddress) : lpszDestAddress
        lpszAppName := lpszAppName is String? StrPtr(lpszAppName) : lpszAppName
        lpszCalledParty := lpszCalledParty is String? StrPtr(lpszCalledParty) : lpszCalledParty
        lpszComment := lpszComment is String? StrPtr(lpszComment) : lpszComment

        result := DllCall("TAPI32.dll\tapiRequestMediaCallW", "ptr", hwnd, "ptr", wRequestID, "ptr", lpszDeviceClass, "ptr", lpDeviceID, "uint", dwSize, "uint", dwSecure, "ptr", lpszDestAddress, "ptr", lpszAppName, "ptr", lpszCalledParty, "ptr", lpszComment, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvSupport 
     * @param {Pointer<IStream>} lpStream 
     * @param {Pointer<SByte>} lpszStreamName 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMessage>} lpMessage 
     * @param {Integer} wKeyVal 
     * @param {Pointer<ITnef>} lppTNEF 
     * @returns {HRESULT} 
     */
    static OpenTnefStream(lpvSupport, lpStream, lpszStreamName, ulFlags, lpMessage, wKeyVal, lppTNEF) {
        result := DllCall("MAPI32.dll\OpenTnefStream", "ptr", lpvSupport, "ptr", lpStream, "char*", lpszStreamName, "uint", ulFlags, "ptr", lpMessage, "ushort", wKeyVal, "ptr", lppTNEF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvSupport 
     * @param {Pointer<IStream>} lpStream 
     * @param {Pointer<SByte>} lpszStreamName 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMessage>} lpMessage 
     * @param {Integer} wKeyVal 
     * @param {Pointer<IAddrBook>} lpAdressBook 
     * @param {Pointer<ITnef>} lppTNEF 
     * @returns {HRESULT} 
     */
    static OpenTnefStreamEx(lpvSupport, lpStream, lpszStreamName, ulFlags, lpMessage, wKeyVal, lpAdressBook, lppTNEF) {
        result := DllCall("MAPI32.dll\OpenTnefStreamEx", "ptr", lpvSupport, "ptr", lpStream, "char*", lpszStreamName, "uint", ulFlags, "ptr", lpMessage, "ushort", wKeyVal, "ptr", lpAdressBook, "ptr", lppTNEF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} lpStream 
     * @param {Pointer<UInt32>} lpulCodepage 
     * @param {Pointer<UInt32>} lpulSubCodepage 
     * @returns {HRESULT} 
     */
    static GetTnefStreamCodepage(lpStream, lpulCodepage, lpulSubCodepage) {
        result := DllCall("MAPI32.dll\GetTnefStreamCodepage", "ptr", lpStream, "uint*", lpulCodepage, "uint*", lpulSubCodepage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
