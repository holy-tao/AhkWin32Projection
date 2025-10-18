#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RealTimeCommunications {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static RTCCS_FORCE_PROFILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTCCS_FAIL_ON_REDIRECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTCMT_AUDIO_SEND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTCMT_AUDIO_RECEIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTCMT_VIDEO_SEND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTCMT_VIDEO_RECEIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTCMT_T120_SENDRECV => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RTCSI_PC_TO_PC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTCSI_PC_TO_PHONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTCSI_PHONE_TO_PHONE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTCSI_IM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTCSI_MULTIPARTY_IM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RTCSI_APPLICATION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RTCTR_UDP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTCTR_TCP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTCTR_TLS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTCAU_BASIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTCAU_DIGEST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTCAU_NTLM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTCAU_KERBEROS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTCAU_USE_LOGON_CRED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RTCRF_REGISTER_INVITE_SESSIONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTCRF_REGISTER_MESSAGE_SESSIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTCRF_REGISTER_PRESENCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTCRF_REGISTER_NOTIFY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTCRF_REGISTER_ALL => 15

    /**
     * @type {Integer (UInt32)}
     */
    static RTCRMF_BUDDY_ROAMING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTCRMF_WATCHER_ROAMING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTCRMF_PRESENCE_ROAMING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTCRMF_PROFILE_ROAMING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTCRMF_ALL_ROAMING => 15

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_CLIENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_REGISTRATION_STATE_CHANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_SESSION_STATE_CHANGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_SESSION_OPERATION_COMPLETE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_PARTICIPANT_STATE_CHANGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_MEDIA => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_INTENSITY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_MESSAGING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_BUDDY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_WATCHER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_PROFILE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_USERSEARCH => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_INFO => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_GROUP => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_MEDIA_REQUEST => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_ROAMING => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_PRESENCE_PROPERTY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_BUDDY2 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_WATCHER2 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_SESSION_REFER_STATUS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_SESSION_REFERRED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_REINVITE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_PRESENCE_DATA => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_PRESENCE_STATUS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static RTCEF_ALL => 33554431

    /**
     * @type {Integer (UInt32)}
     */
    static RTCIF_DISABLE_MEDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTCIF_DISABLE_UPNP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTCIF_ENABLE_SERVER_CLASS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTCIF_DISABLE_STRICT_DNS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_RTC_INTERFACE => 238

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SIP_STATUS_CODE => 239

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_PINT_STATUS_CODE => 240

    /**
     * @type {Integer (UInt32)}
     */
    static STATUS_SEVERITY_RTC_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_CODECS_DO_NOT_MATCH => -2131886080

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_STREAM_PRESENT => -2131886079

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_STREAM_NOT_PRESENT => -2131886078

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_NO_STREAM => -2131886077

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_PARSE_FAILED => -2131886076

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_HEADER_NOT_PRESENT => -2131886075

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SDP_NOT_PRESENT => -2131886074

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SDP_PARSE_FAILED => -2131886073

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SDP_UPDATE_FAILED => -2131886072

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SDP_MULTICAST => -2131886071

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SDP_CONNECTION_ADDR => -2131886070

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SDP_NO_MEDIA => -2131886069

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_TIMEOUT => -2131886068

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SDP_FAILED_TO_BUILD => -2131886067

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_INVITE_TRANSACTION_PENDING => -2131886066

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_AUTH_HEADER_SENT => -2131886065

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_AUTH_TYPE_NOT_SUPPORTED => -2131886064

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_AUTH_FAILED => -2131886063

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_SIP_URL => -2131886062

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_DESTINATION_ADDRESS_LOCAL => -2131886061

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_ADDRESS_LOCAL => -2131886060

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_DESTINATION_ADDRESS_MULTICAST => -2131886059

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_PROXY_ADDRESS => -2131886058

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_TRANSPORT_NOT_SUPPORTED => -2131886057

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_NEED_MORE_DATA => -2131886056

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_CALL_DISCONNECTED => -2131886055

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_REQUEST_DESTINATION_ADDR_NOT_PRESENT => -2131886054

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_UDP_SIZE_EXCEEDED => -2131886053

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_SSL_TUNNEL_FAILED => -2131886052

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_SSL_NEGOTIATION_TIMEOUT => -2131886051

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_STACK_SHUTDOWN => -2131886050

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MEDIA_CONTROLLER_STATE => -2131886049

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MEDIA_NEED_TERMINAL => -2131886048

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MEDIA_AUDIO_DEVICE_NOT_AVAILABLE => -2131886047

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MEDIA_VIDEO_DEVICE_NOT_AVAILABLE => -2131886046

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_START_STREAM => -2131886045

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MEDIA_AEC => -2131886044

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_CLIENT_NOT_INITIALIZED => -2131886043

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_CLIENT_ALREADY_INITIALIZED => -2131886042

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_CLIENT_ALREADY_SHUT_DOWN => -2131886041

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PRESENCE_NOT_ENABLED => -2131886040

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_SESSION_TYPE => -2131886039

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_SESSION_STATE => -2131886038

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_NO_PROFILE => -2131886037

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_LOCAL_PHONE_NEEDED => -2131886036

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_NO_DEVICE => -2131886035

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_PROFILE => -2131886034

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_NO_PROVISION => -2131886033

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_NO_KEY => -2131886032

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_NO_NAME => -2131886031

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_NO_USER => -2131886030

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_NO_USER_URI => -2131886029

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_NO_SERVER => -2131886028

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_NO_SERVER_ADDRESS => -2131886027

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_NO_SERVER_PROTOCOL => -2131886026

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_INVALID_SERVER_PROTOCOL => -2131886025

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_INVALID_SERVER_AUTHMETHOD => -2131886024

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_INVALID_SERVER_ROLE => -2131886023

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_MULTIPLE_REGISTRARS => -2131886022

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_INVALID_SESSION => -2131886021

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_INVALID_SESSION_PARTY => -2131886020

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_INVALID_SESSION_TYPE => -2131886019

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_OPERATION_WITH_TOO_MANY_PARTICIPANTS => -2131886018

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_BASIC_AUTH_SET_TLS => -2131886017

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_HIGH_SECURITY_SET_TLS => -2131886016

    /**
     * @type {Integer (Int32)}
     */
    static RTC_S_ROAMING_NOT_SUPPORTED => 15597633

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PROFILE_SERVER_UNAUTHORIZED => -2131886014

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_DUPLICATE_REALM => -2131886013

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_POLICY_NOT_ALLOW => -2131886012

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PORT_MAPPING_UNAVAILABLE => -2131886011

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PORT_MAPPING_FAILED => -2131886010

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SECURITY_LEVEL_NOT_COMPATIBLE => -2131886009

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SECURITY_LEVEL_NOT_DEFINED => -2131886008

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SECURITY_LEVEL_NOT_SUPPORTED_BY_PARTICIPANT => -2131886007

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_DUPLICATE_BUDDY => -2131886006

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_DUPLICATE_WATCHER => -2131886005

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MALFORMED_XML => -2131886004

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_ROAMING_OPERATION_INTERRUPTED => -2131886003

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_ROAMING_FAILED => -2131886002

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_BUDDY_LIST => -2131886001

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_ACL_LIST => -2131886000

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_NO_GROUP => -2131885999

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_DUPLICATE_GROUP => -2131885998

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_TOO_MANY_GROUPS => -2131885997

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_NO_BUDDY => -2131885996

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_NO_WATCHER => -2131885995

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_NO_REALM => -2131885994

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_NO_TRANSPORT => -2131885993

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_NOT_EXIST => -2131885992

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_PREFERENCE_LIST => -2131885991

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MAX_PENDING_OPERATIONS => -2131885990

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_TOO_MANY_RETRIES => -2131885989

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_PORTRANGE => -2131885988

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_CALL_CONNECTION_NOT_ESTABLISHED => -2131885987

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_ADDITIONAL_PARTY_IN_TWO_PARTY_SESSION => -2131885986

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_PARTY_ALREADY_IN_SESSION => -2131885985

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_OTHER_PARTY_JOIN_IN_PROGRESS => -2131885984

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_OBJECT_STATE => -2131885983

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PRESENCE_ENABLED => -2131885982

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_ROAMING_ENABLED => -2131885981

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_TLS_INCOMPATIBLE_ENCRYPTION => -2131885980

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_INVALID_CERTIFICATE => -2131885979

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_DNS_FAIL => -2131885978

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_TCP_FAIL => -2131885977

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_TOO_SMALL_EXPIRES_VALUE => -2131885976

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_TLS_FAIL => -2131885975

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_NOT_PRESENCE_PROFILE => -2131885974

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_INVITEE_PARTY_TIMEOUT => -2131885973

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_AUTH_TIME_SKEW => -2131885972

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_REGISTRATION_STATE => -2131885971

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MEDIA_DISABLED => -2131885970

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MEDIA_ENABLED => -2131885969

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_REFER_NOT_ACCEPTED => -2131885968

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_REFER_NOT_ALLOWED => -2131885967

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_REFER_NOT_EXIST => -2131885966

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_HOLD_OPERATION_PENDING => -2131885965

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_UNHOLD_OPERATION_PENDING => -2131885964

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MEDIA_SESSION_NOT_EXIST => -2131885963

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MEDIA_SESSION_IN_HOLD => -2131885962

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_ANOTHER_MEDIA_SESSION_ACTIVE => -2131885961

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_MAX_REDIRECTS => -2131885960

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_REDIRECT_PROCESSING_FAILED => -2131885959

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_LISTENING_SOCKET_NOT_EXIST => -2131885958

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_INVALID_LISTEN_SOCKET => -2131885957

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PORT_MANAGER_ALREADY_SET => -2131885956

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SECURITY_LEVEL_ALREADY_SET => -2131885955

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_UDP_NOT_SUPPORTED => -2131885954

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_REFER_OPERATION_PENDING => -2131885953

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PLATFORM_NOT_SUPPORTED => -2131885952

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_SIP_PEER_PARTICIPANT_IN_MULTIPARTY_SESSION => -2131885951

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_NOT_ALLOWED => -2131885950

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_REGISTRATION_DEACTIVATED => -2131885949

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_REGISTRATION_REJECTED => -2131885948

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_REGISTRATION_UNREGISTERED => -2131885947

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_INFO_TRYING => 15663204

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_INFO_RINGING => 15663284

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_INFO_CALL_FORWARDING => 15663285

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_INFO_QUEUED => 15663286

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_SESSION_PROGRESS => 15663287

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_SUCCESS => 15663304

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_REDIRECT_MULTIPLE_CHOICES => -2131820244

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_REDIRECT_MOVED_PERMANENTLY => -2131820243

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_REDIRECT_MOVED_TEMPORARILY => -2131820242

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_REDIRECT_SEE_OTHER => -2131820241

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_REDIRECT_USE_PROXY => -2131820239

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_REDIRECT_ALTERNATIVE_SERVICE => -2131820164

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_BAD_REQUEST => -2131820144

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_UNAUTHORIZED => -2131820143

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_PAYMENT_REQUIRED => -2131820142

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_FORBIDDEN => -2131820141

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_NOT_FOUND => -2131820140

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_METHOD_NOT_ALLOWED => -2131820139

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_NOT_ACCEPTABLE => -2131820138

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_PROXY_AUTHENTICATION_REQUIRED => -2131820137

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_REQUEST_TIMEOUT => -2131820136

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_CONFLICT => -2131820135

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_GONE => -2131820134

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_LENGTH_REQUIRED => -2131820133

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_REQUEST_ENTITY_TOO_LARGE => -2131820131

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_REQUEST_URI_TOO_LARGE => -2131820130

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_UNSUPPORTED_MEDIA_TYPE => -2131820129

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_BAD_EXTENSION => -2131820124

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_TEMPORARILY_NOT_AVAILABLE => -2131820064

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_TRANSACTION_DOES_NOT_EXIST => -2131820063

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_LOOP_DETECTED => -2131820062

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_TOO_MANY_HOPS => -2131820061

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_ADDRESS_INCOMPLETE => -2131820060

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_AMBIGUOUS => -2131820059

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_CLIENT_BUSY_HERE => -2131820058

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_REQUEST_TERMINATED => -2131820057

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_NOT_ACCEPTABLE_HERE => -2131820056

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_SERVER_INTERNAL_ERROR => -2131820044

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_SERVER_NOT_IMPLEMENTED => -2131820043

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_SERVER_BAD_GATEWAY => -2131820042

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_SERVER_SERVICE_UNAVAILABLE => -2131820041

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_SERVER_SERVER_TIMEOUT => -2131820040

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_SERVER_VERSION_NOT_SUPPORTED => -2131820039

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_GLOBAL_BUSY_EVERYWHERE => -2131819944

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_GLOBAL_DECLINE => -2131819941

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_GLOBAL_DOES_NOT_EXIST_ANYWHERE => -2131819940

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_STATUS_GLOBAL_NOT_ACCEPTABLE => -2131819938

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PINT_STATUS_REJECTED_BUSY => -2131755003

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PINT_STATUS_REJECTED_NO_ANSWER => -2131755002

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PINT_STATUS_REJECTED_ALL_BUSY => -2131755001

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PINT_STATUS_REJECTED_PL_FAILED => -2131755000

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PINT_STATUS_REJECTED_SW_FAILED => -2131754999

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PINT_STATUS_REJECTED_CANCELLED => -2131754998

    /**
     * @type {Integer (Int32)}
     */
    static RTC_E_PINT_STATUS_REJECTED_BADNUMBER => -2131754997
;@endregion Constants

;@region Methods
;@endregion Methods
}
