#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class Rras {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static RASNAP_ProbationTime => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASTUNNELENDPOINT_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RASTUNNELENDPOINT_IPv4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASTUNNELENDPOINT_IPv6 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxDeviceType => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxPhoneNumber => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxIpAddress => 15

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxIpxAddress => 21

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxEntryName => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxDeviceName => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxCallbackNumber => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxAreaCode => 10

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxPadType => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxX25Address => 200

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxFacilities => 200

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxUserData => 200

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxReplyMessage => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxDnsSuffix => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RASCF_AllUsers => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASCF_GlobalCreds => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASCF_OwnerKnown => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASCF_OwnerMatch => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_MaxIDSize => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RASCS_PAUSED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static RASCS_DONE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static RASCSS_DONE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_UsePrefixSuffix => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_PausedStates => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_IgnoreModemSpeaker => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_SetModemSpeaker => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_IgnoreSoftwareCompression => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_SetSoftwareCompression => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_DisableConnectedUI => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_DisableReconnectUI => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_DisableReconnect => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_NoUser => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_PauseOnScript => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_Router => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_CustomDial => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_UseCustomScripting => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_InvokeAutoTriggerCredentialUI => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static RDEOPT_EapInfoCryptInCapable => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static REN_User => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REN_AllUsers => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASIPO_VJ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPO_PFC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPO_ACFC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPO_SSHF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPO_DES_56 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPO_3_DES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPO_AES_128 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPO_AES_256 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPO_AES_192 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPO_GCM_AES_128 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPO_GCM_AES_192 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPO_GCM_AES_256 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RASCCPCA_MPPC => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RASCCPCA_STAC => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RASCCPO_Compression => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASCCPO_HistoryLess => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASCCPO_Encryption56bit => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RASCCPO_Encryption40bit => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RASCCPO_Encryption128bit => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RASIKEv2_AUTH_MACHINECERTIFICATES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASIKEv2_AUTH_EAP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASIKEv2_AUTH_PSK => 3

    /**
     * @type {String}
     */
    static RASDIALEVENT => "RasDialEvent"

    /**
     * @type {Integer (UInt32)}
     */
    static WM_RASDIALEVENT => 52429

    /**
     * @type {Integer (UInt32)}
     */
    static ET_None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ET_Require => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ET_RequireMax => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ET_Optional => 3

    /**
     * @type {Integer (UInt32)}
     */
    static VS_Default => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VS_PptpOnly => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VS_PptpFirst => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VS_L2tpOnly => 3

    /**
     * @type {Integer (UInt32)}
     */
    static VS_L2tpFirst => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VS_SstpOnly => 5

    /**
     * @type {Integer (UInt32)}
     */
    static VS_SstpFirst => 6

    /**
     * @type {Integer (UInt32)}
     */
    static VS_Ikev2Only => 7

    /**
     * @type {Integer (UInt32)}
     */
    static VS_Ikev2First => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VS_GREOnly => 9

    /**
     * @type {Integer (UInt32)}
     */
    static VS_PptpSstp => 12

    /**
     * @type {Integer (UInt32)}
     */
    static VS_L2tpSstp => 13

    /**
     * @type {Integer (UInt32)}
     */
    static VS_Ikev2Sstp => 14

    /**
     * @type {Integer (UInt32)}
     */
    static VS_ProtocolList => 15

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_UseCountryAndAreaCodes => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_SpecificIpAddr => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_SpecificNameServers => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_IpHeaderCompression => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_RemoteDefaultGateway => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_DisableLcpExtensions => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_TerminalBeforeDial => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_TerminalAfterDial => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_ModemLights => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_SwCompression => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_RequireEncryptedPw => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_RequireMsEncryptedPw => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_RequireDataEncryption => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_NetworkLogon => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_UseLogonCredentials => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_PromoteAlternates => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_SecureLocalFiles => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_RequireEAP => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_RequirePAP => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_RequireSPAP => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_Custom => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_PreviewPhoneNumber => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_SharedPhoneNumbers => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_PreviewUserPw => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_PreviewDomain => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_ShowDialingProgress => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_RequireCHAP => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_RequireMsCHAP => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_RequireMsCHAP2 => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_RequireW95MSCHAP => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO_CustomScript => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_SecureFileAndPrint => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_SecureClientForMSNet => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_DontNegotiateMultilink => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_DontUseRasCredentials => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_UsePreSharedKey => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_Internet => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_DisableNbtOverIP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_UseGlobalDeviceSettings => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_ReconnectIfDropped => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_SharePhoneNumbers => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_SecureRoutingCompartment => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_UseTypicalSettings => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_IPv6SpecificNameServers => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_IPv6RemoteDefaultGateway => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_RegisterIpWithDNS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_UseDNSSuffixForRegistration => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_IPv4ExplicitMetric => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_IPv6ExplicitMetric => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_DisableIKENameEkuCheck => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_DisableClassBasedStaticRoute => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_SpecificIPv6Addr => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_DisableMobility => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_RequireMachineCertificates => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_UsePreSharedKeyForIkev2Initiator => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_UsePreSharedKeyForIkev2Responder => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_CacheCredentials => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_AutoTriggerCapable => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_IsThirdPartyProfile => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_AuthTypeIsOtp => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_IsAlwaysOn => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_IsPrivateNetwork => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static RASEO2_PlumbIKEv2TSAsRoutes => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static RASNP_NetBEUI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASNP_Ipx => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASNP_Ip => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASNP_Ipv6 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RASFP_Ppp => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASFP_Slip => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASFP_Ras => 4

    /**
     * @type {String}
     */
    static RASDT_Modem => "modem"

    /**
     * @type {String}
     */
    static RASDT_Isdn => "isdn"

    /**
     * @type {String}
     */
    static RASDT_X25 => "x25"

    /**
     * @type {String}
     */
    static RASDT_Vpn => "vpn"

    /**
     * @type {String}
     */
    static RASDT_Pad => "pad"

    /**
     * @type {String}
     */
    static RASDT_Generic => "GENERIC"

    /**
     * @type {String}
     */
    static RASDT_Serial => "SERIAL"

    /**
     * @type {String}
     */
    static RASDT_FrameRelay => "FRAMERELAY"

    /**
     * @type {String}
     */
    static RASDT_Atm => "ATM"

    /**
     * @type {String}
     */
    static RASDT_Sonet => "SONET"

    /**
     * @type {String}
     */
    static RASDT_SW56 => "SW56"

    /**
     * @type {String}
     */
    static RASDT_Irda => "IRDA"

    /**
     * @type {String}
     */
    static RASDT_Parallel => "PARALLEL"

    /**
     * @type {String}
     */
    static RASDT_PPPoE => "PPPoE"

    /**
     * @type {Integer (UInt32)}
     */
    static RASET_Phone => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASET_Vpn => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASET_Direct => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RASET_Internet => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASET_Broadband => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RASCN_Connection => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASCN_Disconnection => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASCN_BandwidthAdded => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASCN_BandwidthRemoved => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RASCN_Dormant => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RASCN_ReConnection => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RASCN_EPDGPacketArrival => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RASIDS_Disabled => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static RASIDS_UseGlobalValue => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RASADFLG_PositionDlg => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASCM_UserName => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASCM_Password => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASCM_Domain => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASCM_DefaultCreds => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RASCM_PreSharedKey => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RASCM_ServerPreSharedKey => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RASCM_DDMPreSharedKey => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RASADP_DisableConnectionQuery => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RASADP_LoginSessionDisable => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASADP_SavedAddressesLimit => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASADP_FailedConnectionTimeout => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RASADP_ConnectionQueryTimeout => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASEAPF_NonInteractive => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASEAPF_Logon => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASEAPF_Preview => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RCD_SingleUser => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RCD_AllUsers => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RCD_Eap => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RCD_Logon => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASPBDEVENT_AddEntry => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASPBDEVENT_EditEntry => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASPBDEVENT_RemoveEntry => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RASPBDEVENT_DialEntry => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASPBDEVENT_EditGlobals => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RASPBDEVENT_NoUser => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RASPBDEVENT_NoUserEdit => 7

    /**
     * @type {Integer (UInt32)}
     */
    static RASNOUSER_SmartCard => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASPBDFLAG_PositionDlg => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASPBDFLAG_ForceCloseOnDial => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASPBDFLAG_NoUser => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RASPBDFLAG_UpdateDefaults => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_PositionDlg => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_NewEntry => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_CloneEntry => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_NoRename => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_ShellOwned => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_NewPhoneEntry => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_NewTunnelEntry => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_NewDirectEntry => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_NewBroadbandEntry => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_InternetEntry => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_NAT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RASEDFLAG_IncomingConnection => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RASDDFLAG_PositionDlg => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASDDFLAG_NoPrompt => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASDDFLAG_AoacRedial => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASDDFLAG_LinkFailure => 2147483648

    /**
     * @type {String}
     */
    static RRAS_SERVICE_NAME => "RemoteAccess"

    /**
     * @type {Integer (UInt32)}
     */
    static PID_IPX => 43

    /**
     * @type {Integer (UInt32)}
     */
    static PID_IP => 33

    /**
     * @type {Integer (UInt32)}
     */
    static PID_IPV6 => 87

    /**
     * @type {Integer (UInt32)}
     */
    static PID_NBF => 63

    /**
     * @type {Integer (UInt32)}
     */
    static PID_ATALK => 41

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_INTERFACE_OUT_OF_RESOURCES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_INTERFACE_ADMIN_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_INTERFACE_CONNECTION_FAILURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_INTERFACE_SERVICE_PAUSED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_INTERFACE_DIALOUT_HOURS_RESTRICTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_INTERFACE_NO_MEDIA_SENSE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_INTERFACE_NO_DEVICE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxDeviceType => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxPhoneNumber => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxIpAddress => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxIpxAddress => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxEntryName => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxDeviceName => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxCallbackNumber => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxAreaCode => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxPadType => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxX25Address => 200

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxFacilities => 200

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_MaxUserData => 200

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_SpecificIpAddr => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_SpecificNameServers => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_IpHeaderCompression => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_RemoteDefaultGateway => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_DisableLcpExtensions => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_SwCompression => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_RequireEncryptedPw => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_RequireMsEncryptedPw => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_RequireDataEncryption => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_NetworkLogon => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_PromoteAlternates => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_SecureLocalFiles => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_RequireEAP => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_RequirePAP => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_RequireSPAP => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_SharedPhoneNumbers => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_RequireCHAP => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_RequireMsCHAP => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_RequireMsCHAP2 => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_IpSecPreSharedKey => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_RequireMachineCertificates => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_UsePreSharedKeyForIkev2Initiator => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIO_UsePreSharedKeyForIkev2Responder => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static MPRNP_Ipx => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPRNP_Ip => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MPRNP_Ipv6 => 8

    /**
     * @type {String}
     */
    static MPRDT_Modem => "modem"

    /**
     * @type {String}
     */
    static MPRDT_Isdn => "isdn"

    /**
     * @type {String}
     */
    static MPRDT_X25 => "x25"

    /**
     * @type {String}
     */
    static MPRDT_Vpn => "vpn"

    /**
     * @type {String}
     */
    static MPRDT_Pad => "pad"

    /**
     * @type {String}
     */
    static MPRDT_Generic => "GENERIC"

    /**
     * @type {String}
     */
    static MPRDT_Serial => "SERIAL"

    /**
     * @type {String}
     */
    static MPRDT_FrameRelay => "FRAMERELAY"

    /**
     * @type {String}
     */
    static MPRDT_Atm => "ATM"

    /**
     * @type {String}
     */
    static MPRDT_Sonet => "SONET"

    /**
     * @type {String}
     */
    static MPRDT_SW56 => "SW56"

    /**
     * @type {String}
     */
    static MPRDT_Irda => "IRDA"

    /**
     * @type {String}
     */
    static MPRDT_Parallel => "PARALLEL"

    /**
     * @type {Integer (UInt32)}
     */
    static MPRET_Phone => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRET_Vpn => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPRET_Direct => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIDS_Disabled => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MPRIDS_UseGlobalValue => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_VS_Ikev2Only => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_VS_Ikev2First => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_ENABLE_RAS_ON_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_ENABLE_ROUTING_ON_DEVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPADDRESSLEN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IPXADDRESSLEN => 22

    /**
     * @type {Integer (UInt32)}
     */
    static ATADDRESSLEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIPADRESSLEN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_IPCP_VJ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_CCP_COMPRESSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_CCP_ENCRYPTION40BITOLD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_CCP_ENCRYPTION40BIT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_CCP_ENCRYPTION128BIT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_CCP_ENCRYPTION56BIT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_CCP_HISTORYLESS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_MULTILINK_FRAMING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_PFC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_ACFC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_SSHF => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_DES_56 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_3_DES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_AES_128 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_AES_256 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_AES_192 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_GCM_AES_128 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_GCM_AES_192 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_GCM_AES_256 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_FLAGS_RAS_CONNECTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASPRIV_NoCallback => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASPRIV_AdminSetCallback => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASPRIV_CallerSetCallback => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RASPRIV_DialinPrivilege => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RASPRIV2_DialinPolicy => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_IKEV2_AUTH_USING_CERT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_IKEV2_AUTH_USING_EAP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_PPP_PROJECTION_INFO_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_IKEV2_PROJECTION_INFO_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_RAS_CONNECTION_OBJECT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_IF_CUSTOM_CONFIG_FOR_IKEV2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_IKEV2_SET_TUNNEL_CONFIG_PARAMS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_L2TP_SET_TUNNEL_CONFIG_PARAMS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SSTP_HASH_SIZE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_SERVER_OBJECT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_SERVER_OBJECT_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_SERVER_OBJECT_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_SERVER_OBJECT_REVISION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_SERVER_OBJECT_REVISION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_SET_CONFIG_PROTOCOL_FOR_PPTP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_SET_CONFIG_PROTOCOL_FOR_L2TP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_SET_CONFIG_PROTOCOL_FOR_SSTP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_SET_CONFIG_PROTOCOL_FOR_IKEV2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_SET_CONFIG_PROTOCOL_FOR_GRE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ALLOW_NO_AUTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DO_NOT_ALLOW_NO_AUTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_RAS_UPDATE_CONNECTION_OBJECT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_ADMIN_DLL_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPRAPI_ADMIN_DLL_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MGM_JOIN_STATE_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MGM_FORWARD_STATE_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MGM_MFE_STATS_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MGM_MFE_STATS_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_MAX_ADDRESS_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_MAX_VIEWS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_VIEW_ID_UCAST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_VIEW_ID_MCAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_VIEW_MASK_SIZE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_VIEW_MASK_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_VIEW_MASK_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_VIEW_MASK_UCAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_VIEW_MASK_MCAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_VIEW_MASK_ALL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static IPV6_ADDRESS_LEN_IN_BYTES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_DEST_FLAG_NATURAL_NET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_DEST_FLAG_FWD_ENGIN_ADD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_DEST_FLAG_DONT_FORWARD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_STATE_CREATED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_STATE_DELETING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_STATE_DELETED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_MARTIAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_BLACKHOLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_DISCARD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_INACTIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_LOCAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_REMOTE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_MYSELF => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_LOOPBACK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_MCAST => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_LOCAL_MCAST => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_LIMITED_BC => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_ZEROS_NETBC => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_ZEROS_SUBNETBC => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_ONES_NETBC => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_FLAGS_ONES_SUBNETBC => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_NEXTHOP_STATE_CREATED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_NEXTHOP_STATE_DELETED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_NEXTHOP_FLAGS_REMOTE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_NEXTHOP_FLAGS_DOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_TYPE_ALL_METHODS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_RIP2_NEIGHBOUR_ADDR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_RIP2_OUTBOUND_INTF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_RIP2_ROUTE_TAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_RIP2_ROUTE_TIMESTAMP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_BGP4_AS_PATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_BGP4_PEER_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_BGP4_PA_ORIGIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_BGP4_NEXTHOP_ATTR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_RESUME_METHODS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_BLOCK_METHODS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_CHANGE_FIRST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_CHANGE_NEW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ROUTE_CHANGE_BEST => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_NEXTHOP_CHANGE_NEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_MATCH_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_MATCH_OWNER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_MATCH_NEIGHBOUR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_MATCH_PREF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_MATCH_NEXTHOP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_MATCH_INTERFACE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_MATCH_FULL => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ENUM_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ENUM_NEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ENUM_RANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ENUM_ALL_DESTS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ENUM_OWN_DESTS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ENUM_ALL_ROUTES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_ENUM_OWN_ROUTES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_NUM_CHANGE_TYPES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_CHANGE_TYPE_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_CHANGE_TYPE_BEST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_CHANGE_TYPE_FORWARDING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTM_NOTIFY_ONLY_MARKED_DESTS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RASBASE => 600

    /**
     * @type {Integer (UInt32)}
     */
    static PENDING => 600

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PORT_HANDLE => 601

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_ALREADY_OPEN => 602

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BUFFER_TOO_SMALL => 603

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_INFO_SPECIFIED => 604

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_SET_PORT_INFO => 605

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_NOT_CONNECTED => 606

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVENT_INVALID => 607

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_DOES_NOT_EXIST => 608

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICETYPE_DOES_NOT_EXIST => 609

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BUFFER_INVALID => 610

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ROUTE_NOT_AVAILABLE => 611

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ROUTE_NOT_ALLOCATED => 612

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_COMPRESSION_SPECIFIED => 613

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OUT_OF_BUFFERS => 614

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_NOT_FOUND => 615

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ASYNC_REQUEST_PENDING => 616

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_DISCONNECTING => 617

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_NOT_OPEN => 618

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_DISCONNECTED => 619

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_ENDPOINTS => 620

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_OPEN_PHONEBOOK => 621

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_LOAD_PHONEBOOK => 622

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_FIND_PHONEBOOK_ENTRY => 623

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_WRITE_PHONEBOOK => 624

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CORRUPT_PHONEBOOK => 625

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_LOAD_STRING => 626

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_KEY_NOT_FOUND => 627

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISCONNECTION => 628

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_DISCONNECTION => 629

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HARDWARE_FAILURE => 630

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_USER_DISCONNECTION => 631

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SIZE => 632

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_NOT_AVAILABLE => 633

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_PROJECT_CLIENT => 634

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN => 635

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_DEVICE_ATTACHED => 636

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_STRING => 637

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REQUEST_TIMEOUT => 638

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_GET_LANA => 639

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NETBIOS_ERROR => 640

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_OUT_OF_RESOURCES => 641

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NAME_EXISTS_ON_NET => 642

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_GENERAL_NET_FAILURE => 643

    /**
     * @type {Integer (UInt32)}
     */
    static WARNING_MSG_ALIAS_NOT_ADDED => 644

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTH_INTERNAL => 645

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESTRICTED_LOGON_HOURS => 646

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCT_DISABLED => 647

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PASSWD_EXPIRED => 648

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_DIALIN_PERMISSION => 649

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_NOT_RESPONDING => 650

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FROM_DEVICE => 651

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNRECOGNIZED_RESPONSE => 652

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MACRO_NOT_FOUND => 653

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MACRO_NOT_DEFINED => 654

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MESSAGE_MACRO_NOT_FOUND => 655

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEFAULTOFF_MACRO_NOT_FOUND => 656

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_COULD_NOT_BE_OPENED => 657

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICENAME_TOO_LONG => 658

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICENAME_NOT_FOUND => 659

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_RESPONSES => 660

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_COMMAND_FOUND => 661

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_KEY_SPECIFIED => 662

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_DEVICE_TYPE => 663

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALLOCATING_MEMORY => 664

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_NOT_CONFIGURED => 665

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_NOT_READY => 666

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_READING_INI_FILE => 667

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_CONNECTION => 668

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_USAGE_IN_INI_FILE => 669

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_READING_SECTIONNAME => 670

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_READING_DEVICETYPE => 671

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_READING_DEVICENAME => 672

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_READING_USAGE => 673

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_READING_MAXCONNECTBPS => 674

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_READING_MAXCARRIERBPS => 675

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LINE_BUSY => 676

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOICE_ANSWER => 677

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_ANSWER => 678

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_CARRIER => 679

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_DIALTONE => 680

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IN_COMMAND => 681

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRITING_SECTIONNAME => 682

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRITING_DEVICETYPE => 683

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRITING_DEVICENAME => 684

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRITING_MAXCONNECTBPS => 685

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRITING_MAXCARRIERBPS => 686

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRITING_USAGE => 687

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRITING_DEFAULTOFF => 688

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_READING_DEFAULTOFF => 689

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EMPTY_INI_FILE => 690

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTHENTICATION_FAILURE => 691

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_OR_DEVICE => 692

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_BINARY_MACRO => 693

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DCB_NOT_FOUND => 694

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_MACHINES_NOT_STARTED => 695

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_MACHINES_ALREADY_STARTED => 696

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PARTIAL_RESPONSE_LOOPING => 697

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_RESPONSE_KEY => 698

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RECV_BUF_FULL => 699

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CMD_TOO_LONG => 700

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNSUPPORTED_BPS => 701

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNEXPECTED_RESPONSE => 702

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERACTIVE_MODE => 703

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_CALLBACK_NUMBER => 704

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_AUTH_STATE => 705

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRITING_INITBPS => 706

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_X25_DIAGNOSTIC => 707

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCT_EXPIRED => 708

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CHANGING_PASSWORD => 709

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OVERRUN => 710

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RASMAN_CANNOT_INITIALIZE => 711

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIPLEX_PORT_NOT_AVAILABLE => 712

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_ACTIVE_ISDN_LINES => 713

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_ISDN_CHANNELS_AVAILABLE => 714

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_LINE_ERRORS => 715

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IP_CONFIGURATION => 716

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_IP_ADDRESSES => 717

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_TIMEOUT => 718

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_REMOTE_TERMINATED => 719

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_NO_PROTOCOLS_CONFIGURED => 720

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_NO_RESPONSE => 721

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_INVALID_PACKET => 722

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PHONE_NUMBER_TOO_LONG => 723

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPXCP_NO_DIALOUT_CONFIGURED => 724

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPXCP_NO_DIALIN_CONFIGURED => 725

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPXCP_DIALOUT_ALREADY_ACTIVE => 726

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCESSING_TCPCFGDLL => 727

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_IP_RAS_ADAPTER => 728

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SLIP_REQUIRES_IP => 729

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROJECTION_NOT_COMPLETE => 730

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROTOCOL_NOT_CONFIGURED => 731

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_NOT_CONVERGING => 732

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_CP_REJECTED => 733

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_LCP_TERMINATED => 734

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_REQUIRED_ADDRESS_REJECTED => 735

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_NCP_TERMINATED => 736

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_LOOPBACK_DETECTED => 737

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_NO_ADDRESS_ASSIGNED => 738

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_USE_LOGON_CREDENTIALS => 739

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TAPI_CONFIGURATION => 740

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_LOCAL_ENCRYPTION => 741

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_REMOTE_ENCRYPTION => 742

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_REQUIRES_ENCRYPTION => 743

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPXCP_NET_NUMBER_CONFLICT => 744

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SMM => 745

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SMM_UNINITIALIZED => 746

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_MAC_FOR_PORT => 747

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SMM_TIMEOUT => 748

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_PHONE_NUMBER => 749

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_MODULE => 750

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_CALLBACK_NUMBER => 751

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SCRIPT_SYNTAX => 752

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HANGUP_FAILED => 753

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BUNDLE_NOT_FOUND => 754

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_DO_CUSTOMDIAL => 755

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIAL_ALREADY_IN_PROGRESS => 756

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RASAUTO_CANNOT_INITIALIZE => 757

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONNECTION_ALREADY_SHARED => 758

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARING_CHANGE_FAILED => 759

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARING_ROUTER_INSTALL => 760

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARE_CONNECTION_FAILED => 761

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARING_PRIVATE_INSTALL => 762

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_SHARE_CONNECTION => 763

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SMART_CARD_READER => 764

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARING_ADDRESS_EXISTS => 765

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_CERTIFICATE => 766

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARING_MULTIPLE_ADDRESSES => 767

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAILED_TO_ENCRYPT => 768

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_ADDRESS_SPECIFIED => 769

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONNECTION_REJECT => 770

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONGESTION => 771

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INCOMPATIBLE => 772

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NUMBERCHANGED => 773

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TEMPFAILURE => 774

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BLOCKED => 775

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DONOTDISTURB => 776

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OUTOFORDER => 777

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_AUTHENTICATE_SERVER => 778

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SMART_CARD_REQUIRED => 779

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FUNCTION_FOR_ENTRY => 780

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CERT_FOR_ENCRYPTION_NOT_FOUND => 781

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARING_RRAS_CONFLICT => 782

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARING_NO_PRIVATE_LAN => 783

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_DIFF_USER_AT_LOGON => 784

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_REG_CERT_AT_LOGON => 785

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OAKLEY_NO_CERT => 786

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OAKLEY_AUTH_FAIL => 787

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OAKLEY_ATTRIB_FAIL => 788

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OAKLEY_GENERAL_PROCESSING => 789

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OAKLEY_NO_PEER_CERT => 790

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OAKLEY_NO_POLICY => 791

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OAKLEY_TIMED_OUT => 792

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OAKLEY_ERROR => 793

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_FRAMED_PROTOCOL => 794

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_TUNNEL_TYPE => 795

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_SERVICE_TYPE => 796

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONNECTING_DEVICE_NOT_FOUND => 797

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_EAPTLS_CERTIFICATE => 798

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARING_HOST_ADDRESS_CONFLICT => 799

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTOMATIC_VPN_FAILED => 800

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VALIDATING_SERVER_CERT => 801

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_READING_SCARD => 802

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PEAP_COOKIE_CONFIG => 803

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PEAP_COOKIE_USER => 804

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MSCHAPV2_CONFIG => 805

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VPN_GRE_BLOCKED => 806

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VPN_DISCONNECT => 807

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VPN_REFUSED => 808

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VPN_TIMEOUT => 809

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VPN_BAD_CERT => 810

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VPN_BAD_PSK => 811

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_POLICY => 812

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BROADBAND_ACTIVE => 813

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BROADBAND_NO_NIC => 814

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BROADBAND_TIMEOUT => 815

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FEATURE_DEPRECATED => 816

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_DELETE => 817

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RASQEC_RESOURCE_CREATION_FAILED => 818

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RASQEC_NAPAGENT_NOT_ENABLED => 819

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RASQEC_NAPAGENT_NOT_CONNECTED => 820

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RASQEC_CONN_DOESNOTEXIST => 821

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RASQEC_TIMEOUT => 822

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PEAP_CRYPTOBINDING_INVALID => 823

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PEAP_CRYPTOBINDING_NOTRECEIVED => 824

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_VPNSTRATEGY => 825

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAPTLS_CACHE_CREDENTIALS_INVALID => 826

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_SERVICE_STOPPED => 827

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IDLE_TIMEOUT => 828

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LINK_FAILURE => 829

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_USER_LOGOFF => 830

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAST_USER_SWITCH => 831

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HIBERNATION => 832

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_SUSPENDED => 833

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RASMAN_SERVICE_STOPPED => 834

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SERVER_CERT => 835

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_NAP_CAPABLE => 836

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TUNNELID => 837

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UPDATECONNECTION_REQUEST_IN_PROCESS => 838

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROTOCOL_ENGINE_DISABLED => 839

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNAL_ADDRESS_FAILURE => 840

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAILED_CP_REQUIRED => 841

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TS_UNACCEPTABLE => 842

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MOBIKE_DISABLED => 843

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_INITIATE_MOBIKE_UPDATE => 844

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PEAP_SERVER_REJECTED_CLIENT_TLV => 845

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PREFERENCES => 846

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAPTLS_SCARD_CACHE_CREDENTIALS_INVALID => 847

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SSTP_COOKIE_SET_FAILURE => 848

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PEAP_COOKIE_ATTRIBUTES => 849

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_METHOD_NOT_INSTALLED => 850

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_METHOD_DOES_NOT_SUPPORT_SSO => 851

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_METHOD_OPERATION_NOT_SUPPORTED => 852

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_USER_CERT_INVALID => 853

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_USER_CERT_EXPIRED => 854

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_USER_CERT_REVOKED => 855

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_USER_CERT_OTHER_ERROR => 856

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_SERVER_CERT_INVALID => 857

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_SERVER_CERT_EXPIRED => 858

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_SERVER_CERT_REVOKED => 859

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_SERVER_CERT_OTHER_ERROR => 860

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_USER_ROOT_CERT_NOT_FOUND => 861

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_USER_ROOT_CERT_INVALID => 862

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_USER_ROOT_CERT_EXPIRED => 863

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_SERVER_ROOT_CERT_NOT_FOUND => 864

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_SERVER_ROOT_CERT_INVALID => 865

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAP_SERVER_ROOT_CERT_NAME_REQUIRED => 866

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PEAP_IDENTITY_MISMATCH => 867

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DNSNAME_NOT_RESOLVABLE => 868

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAPTLS_PASSWD_INVALID => 869

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IKEV2_PSK_INTERFACE_ALREADY_EXISTS => 870

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DESTINATION_IP => 871

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_INTERFACE_CONFIG => 872

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VPN_PLUGIN_GENERIC => 873

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SSO_CERT_MISSING => 874

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_COMPLIANCE => 875

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PLUGIN_NOT_INSTALLED => 876

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACTION_REQUIRED => 877

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_AUTO_PROXY_SERVICE => 878

    /**
     * @type {Integer (UInt32)}
     */
    static RASBASEEND => 878
;@endregion Constants

;@region Methods
    /**
     * The RasDial function establishes a RAS connection between a RAS client and a RAS server. The connection data includes callback and user-authentication information. (ANSI)
     * @remarks
     * Errors that occur after the immediate return can be detected by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a>. Data is available until an application calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> to hang up the connection.
     * 
     * An application must eventually call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> whenever a non-<b>NULL</b> connection handle is stored into *<i>lphRasConn</i>. This applies even if 
     * <b>RasDial</b> returns a nonzero (error) value.
     * 
     * An application can safely call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> from a 
     * <b>RasDial</b> notifier callback function. If this is done, however, the hang-up does not occur until the routine returns.
     * 
     * If the structure pointed to by <i>lpRasDialExtensions</i> enables <b>RDEOPT_PausedStates</b>, the 
     * <b>RasDial</b> function pauses whenever it enters a state in which the <b>RASCS_PAUSED</b> bit is set to one. To restart 
     * <b>RasDial</b> from such a paused state, call 
     * <b>RasDial</b> again, passing the connection handle returned from the original 
     * <b>RasDial</b> call in <i>*lphRasConn</i>. The same notifier used in the original 
     * <b>RasDial</b> call must be used when restarting from a paused state.
     * 
     * The <i>lpvNotifier</i> parameter is a handle to a window to receive progress notification messages. In a progress notification message, <i>wParam</i> is the equivalent of the <i>rasconnstate</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rasdialfunc">RasDialFunc</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rasdialfunc1">RasDialFunc1</a>, and <i>lParam</i> is the equivalent of the <i>dwError</i> parameter of 
     * <b>RasDialFunc</b> and 
     * <b>RasDialFunc1</b>. 
     * 
     * 
     * 
     * 
     * The progress notification message uses a system registered message code. You can obtain the value of this message code as follows:
     * 
     * 
     * ```cpp
     * UINT unMsg = RegisterWindowMessageA( RASDIALEVENT );
     * if (unMsg == 0)
     *     unMsg = WM_RASDIALEVENT;
     * 
     * ```
     * 
     * 
     * RAS supports referenced connections. If the entry being dialed is already connected, 
     * <b>RasDial</b>  returns <b>SUCCESS</b> and the connection is referenced. To disconnect the connection, each 
     * <b>RasDial</b> on the connection should be matched by a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a>.
     * 
     * Because some phone-book entries require Extensible Authentication Protocol (EAP) for authentication, the caller should call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuseridentitya">RasGetEapUserIdentity</a> before calling 
     * <b>RasDial</b>. If 
     * <b>RasGetEapUserIdentity</b> returns <b>ERROR_INVALID_FUNCTION_FOR_ENTRY</b>, the phone-book entry does not require EAP. However, if 
     * <b>RasGetEapUserIdentity</b> returns NO_ERROR, the caller should copy the EAP identity information from 
     * <b>RasGetEapUserIdentity</b> into the <b>RasEapInfo</b> member of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377029(v=vs.85)">RASDIALEXTENSIONS</a>, and the <b>szUserName</b> member of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a>. See 
     * <b>RasGetEapUserIdentity</b> for more information. If the phone-book entry requires EAP, the <b>dwfOptions</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure for the entry contains the <b>RASEO_RequireEAP</b> flag.
     * 
     * To specify that 
     * <b>RasDial</b> should enter a <b>RASCS_CallbackSetByCaller</b> state, set <i>lpRasDialParams</i>-&gt;<b>szCallbackNumber</b> to "*" on the initial call to 
     * <b>RasDial</b>. When the notification handler is called with this state, set the callback number to a number supplied by the user.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasDial as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<RASDIALEXTENSIONS>} param0 
     * @param {PSTR} param1 
     * @param {Pointer<RASDIALPARAMSA>} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @param {Pointer<HRASCONN>} param5 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and a handle to the RAS connection is returned in the variable pointed to by <i>lphRasConn</i>.
     * 
     * If the function fails, the return value is from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasdiala
     * @since windows5.0
     */
    static RasDialA(param0, param1, param2, param3, param4, param5) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        result := DllCall("RASAPI32.dll\RasDialA", "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, param4Marshal, param4, "ptr", param5, "uint")
        return result
    }

    /**
     * The RasDial function establishes a RAS connection between a RAS client and a RAS server. The connection data includes callback and user-authentication information. (Unicode)
     * @remarks
     * Errors that occur after the immediate return can be detected by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a>. Data is available until an application calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> to hang up the connection.
     * 
     * An application must eventually call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> whenever a non-<b>NULL</b> connection handle is stored into *<i>lphRasConn</i>. This applies even if 
     * <b>RasDial</b> returns a nonzero (error) value.
     * 
     * An application can safely call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> from a 
     * <b>RasDial</b> notifier callback function. If this is done, however, the hang-up does not occur until the routine returns.
     * 
     * If the structure pointed to by <i>lpRasDialExtensions</i> enables <b>RDEOPT_PausedStates</b>, the 
     * <b>RasDial</b> function pauses whenever it enters a state in which the <b>RASCS_PAUSED</b> bit is set to one. To restart 
     * <b>RasDial</b> from such a paused state, call 
     * <b>RasDial</b> again, passing the connection handle returned from the original 
     * <b>RasDial</b> call in <i>*lphRasConn</i>. The same notifier used in the original 
     * <b>RasDial</b> call must be used when restarting from a paused state.
     * 
     * The <i>lpvNotifier</i> parameter is a handle to a window to receive progress notification messages. In a progress notification message, <i>wParam</i> is the equivalent of the <i>rasconnstate</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rasdialfunc">RasDialFunc</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rasdialfunc1">RasDialFunc1</a>, and <i>lParam</i> is the equivalent of the <i>dwError</i> parameter of 
     * <b>RasDialFunc</b> and 
     * <b>RasDialFunc1</b>. 
     * 
     * 
     * 
     * 
     * The progress notification message uses a system registered message code. You can obtain the value of this message code as follows:
     * 
     * 
     * ```cpp
     * UINT unMsg = RegisterWindowMessageA( RASDIALEVENT );
     * if (unMsg == 0)
     *     unMsg = WM_RASDIALEVENT;
     * 
     * ```
     * 
     * 
     * RAS supports referenced connections. If the entry being dialed is already connected, 
     * <b>RasDial</b>  returns <b>SUCCESS</b> and the connection is referenced. To disconnect the connection, each 
     * <b>RasDial</b> on the connection should be matched by a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a>.
     * 
     * Because some phone-book entries require Extensible Authentication Protocol (EAP) for authentication, the caller should call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuseridentitya">RasGetEapUserIdentity</a> before calling 
     * <b>RasDial</b>. If 
     * <b>RasGetEapUserIdentity</b> returns <b>ERROR_INVALID_FUNCTION_FOR_ENTRY</b>, the phone-book entry does not require EAP. However, if 
     * <b>RasGetEapUserIdentity</b> returns NO_ERROR, the caller should copy the EAP identity information from 
     * <b>RasGetEapUserIdentity</b> into the <b>RasEapInfo</b> member of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377029(v=vs.85)">RASDIALEXTENSIONS</a>, and the <b>szUserName</b> member of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a>. See 
     * <b>RasGetEapUserIdentity</b> for more information. If the phone-book entry requires EAP, the <b>dwfOptions</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure for the entry contains the <b>RASEO_RequireEAP</b> flag.
     * 
     * To specify that 
     * <b>RasDial</b> should enter a <b>RASCS_CallbackSetByCaller</b> state, set <i>lpRasDialParams</i>-&gt;<b>szCallbackNumber</b> to "*" on the initial call to 
     * <b>RasDial</b>. When the notification handler is called with this state, set the callback number to a number supplied by the user.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasDial as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<RASDIALEXTENSIONS>} param0 
     * @param {PWSTR} param1 
     * @param {Pointer<RASDIALPARAMSW>} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @param {Pointer<HRASCONN>} param5 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b> and a handle to the RAS connection is returned in the variable pointed to by <i>lphRasConn</i>.
     * 
     * If the function fails, the return value is from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasdialw
     * @since windows5.0
     */
    static RasDialW(param0, param1, param2, param3, param4, param5) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        result := DllCall("RASAPI32.dll\RasDialW", "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, param4Marshal, param4, "ptr", param5, "uint")
        return result
    }

    /**
     * The RasEnumConnections function lists all active RAS connections. It returns each connection's handle and phone-book entry name. (ANSI)
     * @remarks
     * If a connection was made without specifying a phone-book entry name, the information returned for that connection gives the connection phone number preceded by ".".
     * 
     * The following code sample code uses <b>RasEnumConnections</b> to enumerates the active RAS connections.
     * 
     * 
     * ```cpp
     * @param {Pointer<RASCONNA>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lprasconn</i> buffer is not large enough. The <i>lpcb</i> parameter is less than the <b>dwSize</b> member in the <i>lprasconn</i> parameter which is should be set prior to calling the function. The function returns the required buffer size in the variable pointed to by <i>lpcb</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasenumconnectionsa
     * @since windows5.0
     */
    static RasEnumConnectionsA(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasEnumConnectionsA", "ptr", param0, param1Marshal, param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * The RasEnumConnections function lists all active RAS connections. It returns each connection's handle and phone-book entry name. (Unicode)
     * @remarks
     * If a connection was made without specifying a phone-book entry name, the information returned for that connection gives the connection phone number preceded by ".".
     * 
     * The following code sample code uses <b>RasEnumConnections</b> to enumerates the active RAS connections.
     * 
     * 
     * ```cpp
     * @param {Pointer<RASCONNW>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lprasconn</i> buffer is not large enough. The <i>lpcb</i> parameter is less than the <b>dwSize</b> member in the <i>lprasconn</i> parameter which is should be set prior to calling the function. The function returns the required buffer size in the variable pointed to by <i>lpcb</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasenumconnectionsw
     * @since windows5.0
     */
    static RasEnumConnectionsW(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasEnumConnectionsW", "ptr", param0, param1Marshal, param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * The RasEnumEntries function lists all entry names in a remote access phone book. (ANSI)
     * @remarks
     * The following sample code enumerates the RAS phone-book entries on Windows Vista and later versions of Windows. The code initially calls 
     * <b>RasEnumEntries</b> to obtain the size of the buffer to pass in. The code then calls 
     * <b>RasEnumEntries</b> again, to enumerate the entries. Note that for the second call, the code sets the <b>dwSize</b> member of the first 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377267(v=vs.85)">RASENTRYNAME</a> structure in the buffer to sizeof(<b>RASENTRYNAME</b>) to specify the structure version.
     * 
     * 
     * ```cpp
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @param {Pointer<RASENTRYNAMEA>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Integer>} param4 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lprasentryname</i> buffer is not large enough. The <i>lpcb</i> parameter is less than the <b>dwSize</b> member in the <i>lprasentryname</i> parameter which should be set prior to calling the function. The function returns the required buffer size in the variable pointed to by <i>lpcb</i>.
     * 
     * <b>Windows Vista or later:  </b>The <i>lprasentryname</i> buffer may be set to <b>NULL</b> and the variable pointed to by <i>lpcb</i> may be set to zero. The function will return the required buffer size in the variable pointed to by <i>lpcb</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <b>dwSize</b> in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377267(v=vs.85)">RASENTRYNAME</a> structure pointed to by <i>lprasentryname</i>, specifies a version of the structure that is not supported on the current platform. For example, on Windows 95, 
     * <b>RasEnumEntries</b> returns this error if <b>dwSize</b> indicates that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377267(v=vs.85)">RASENTRYNAME</a> includes the <b>dwFlags</b> and <b>szPhonebookPath</b> members, since these members are not supported on Windows 95 (they are supported only on Windows 2000 and later).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasenumentriesa
     * @since windows5.0
     */
    static RasEnumEntriesA(param0, param1, param2, param3, param4) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param3Marshal := param3 is VarRef ? "uint*" : "ptr"
        param4Marshal := param4 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasEnumEntriesA", "ptr", param0, "ptr", param1, "ptr", param2, param3Marshal, param3, param4Marshal, param4, "uint")
        return result
    }

    /**
     * The RasEnumEntries function lists all entry names in a remote access phone book. (Unicode)
     * @remarks
     * The following sample code enumerates the RAS phone-book entries on Windows Vista and later versions of Windows. The code initially calls 
     * <b>RasEnumEntries</b> to obtain the size of the buffer to pass in. The code then calls 
     * <b>RasEnumEntries</b> again, to enumerate the entries. Note that for the second call, the code sets the <b>dwSize</b> member of the first 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377267(v=vs.85)">RASENTRYNAME</a> structure in the buffer to sizeof(<b>RASENTRYNAME</b>) to specify the structure version.
     * 
     * 
     * ```cpp
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @param {Pointer<RASENTRYNAMEW>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Integer>} param4 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lprasentryname</i> buffer is not large enough. The <i>lpcb</i> parameter is less than the <b>dwSize</b> member in the <i>lprasentryname</i> parameter which should be set prior to calling the function. The function returns the required buffer size in the variable pointed to by <i>lpcb</i>.
     * 
     * <b>Windows Vista or later:  </b>The <i>lprasentryname</i> buffer may be set to <b>NULL</b> and the variable pointed to by <i>lpcb</i> may be set to zero. The function will return the required buffer size in the variable pointed to by <i>lpcb</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <b>dwSize</b> in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377267(v=vs.85)">RASENTRYNAME</a> structure pointed to by <i>lprasentryname</i>, specifies a version of the structure that is not supported on the current platform. For example, on Windows 95, 
     * <b>RasEnumEntries</b> returns this error if <b>dwSize</b> indicates that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377267(v=vs.85)">RASENTRYNAME</a> includes the <b>dwFlags</b> and <b>szPhonebookPath</b> members, since these members are not supported on Windows 95 (they are supported only on Windows 2000 and later).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasenumentriesw
     * @since windows5.0
     */
    static RasEnumEntriesW(param0, param1, param2, param3, param4) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param3Marshal := param3 is VarRef ? "uint*" : "ptr"
        param4Marshal := param4 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasEnumEntriesW", "ptr", param0, "ptr", param1, "ptr", param2, param3Marshal, param3, param4Marshal, param4, "uint")
        return result
    }

    /**
     * The RasGetConnectStatus function retrieves information on the current status of the specified remote access connection. An application can use this call to determine when an asynchronous RasDial call is complete. (ANSI)
     * @remarks
     * The return value for 
     * <b>RasGetConnectStatus</b> is not necessarily equal to the value of the <b>dwError</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376728(v=vs.85)">RASCONNSTATUS</a> structure returned by 
     * <b>RasGetConnectStatus</b>. The return value of 
     * <b>RasGetConnectStatus</b> indicates errors that occur during the 
     * <b>RasGetConnectStatus</b> function call, whereas the <b>dwError</b> member indicates errors that prevented the connection from being established.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetConnectStatus as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRASCONN} param0 
     * @param {Pointer<RASCONNSTATUSA>} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetconnectstatusa
     * @since windows5.0
     */
    static RasGetConnectStatusA(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := DllCall("RASAPI32.dll\RasGetConnectStatusA", "ptr", param0, "ptr", param1, "uint")
        return result
    }

    /**
     * The RasGetConnectStatus function retrieves information on the current status of the specified remote access connection. An application can use this call to determine when an asynchronous RasDial call is complete. (Unicode)
     * @remarks
     * The return value for 
     * <b>RasGetConnectStatus</b> is not necessarily equal to the value of the <b>dwError</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376728(v=vs.85)">RASCONNSTATUS</a> structure returned by 
     * <b>RasGetConnectStatus</b>. The return value of 
     * <b>RasGetConnectStatus</b> indicates errors that occur during the 
     * <b>RasGetConnectStatus</b> function call, whereas the <b>dwError</b> member indicates errors that prevented the connection from being established.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetConnectStatus as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRASCONN} param0 
     * @param {Pointer<RASCONNSTATUSW>} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetconnectstatusw
     * @since windows5.0
     */
    static RasGetConnectStatusW(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := DllCall("RASAPI32.dll\RasGetConnectStatusW", "ptr", param0, "ptr", param1, "uint")
        return result
    }

    /**
     * The RasGetErrorString function obtains an error message string for a specified RAS error value. (ANSI)
     * @remarks
     * There is no way to determine in advance the exact size in characters of an error message, and thus the size of buffer required. Error messages will generally be 80 characters or fewer in size; a buffer size of 512 characters will always be adequate. A buffer of insufficient size causes the 
     * <b>RasGetErrorString</b> function to fail, returning <b>ERROR_INSUFFICIENT_BUFFER</b>. Note that buffer sizes are specified in characters, not bytes; thus, the Unicode version of 
     * <b>RasGetErrorString</b> requires at least a  1024 byte buffer to guarantee that every error message  fits.
     * @param {Integer} ResourceId Specifies the error value of interest. These are values returned by one of the RAS functions: those listed in the RasError.h header file.
     * @param {PSTR} lpszString Pointer to a buffer that receives the error string. This parameter must not be <b>NULL</b>.
     * @param {Integer} InBufSize Specifies the size, in characters, of the buffer pointed to by <i>lpszErrorString</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h. There is no <a href="https://docs.microsoft.com/previous-versions/windows/desktop/wab/-wab-iabcontainer-getlasterror">GetLastError</a> information set by the 
     * <b>RasGetErrorString</b> function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid parameter was passed into the function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgeterrorstringa
     * @since windows5.0
     */
    static RasGetErrorStringA(ResourceId, lpszString, InBufSize) {
        lpszString := lpszString is String ? StrPtr(lpszString) : lpszString

        result := DllCall("RASAPI32.dll\RasGetErrorStringA", "uint", ResourceId, "ptr", lpszString, "uint", InBufSize, "uint")
        return result
    }

    /**
     * The RasGetErrorString function obtains an error message string for a specified RAS error value. (Unicode)
     * @remarks
     * There is no way to determine in advance the exact size in characters of an error message, and thus the size of buffer required. Error messages will generally be 80 characters or fewer in size; a buffer size of 512 characters will always be adequate. A buffer of insufficient size causes the 
     * <b>RasGetErrorString</b> function to fail, returning <b>ERROR_INSUFFICIENT_BUFFER</b>. Note that buffer sizes are specified in characters, not bytes; thus, the Unicode version of 
     * <b>RasGetErrorString</b> requires at least a  1024 byte buffer to guarantee that every error message  fits.
     * @param {Integer} ResourceId Specifies the error value of interest. These are values returned by one of the RAS functions: those listed in the RasError.h header file.
     * @param {PWSTR} lpszString Pointer to a buffer that receives the error string. This parameter must not be <b>NULL</b>.
     * @param {Integer} InBufSize Specifies the size, in characters, of the buffer pointed to by <i>lpszErrorString</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h. There is no <a href="https://docs.microsoft.com/previous-versions/windows/desktop/wab/-wab-iabcontainer-getlasterror">GetLastError</a> information set by the 
     * <b>RasGetErrorString</b> function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid parameter was passed into the function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgeterrorstringw
     * @since windows5.0
     */
    static RasGetErrorStringW(ResourceId, lpszString, InBufSize) {
        lpszString := lpszString is String ? StrPtr(lpszString) : lpszString

        result := DllCall("RASAPI32.dll\RasGetErrorStringW", "uint", ResourceId, "ptr", lpszString, "uint", InBufSize, "uint")
        return result
    }

    /**
     * The RasHangUp function terminates a remote access connection. The connection is specified with a RAS connection handle. The function releases all RASAPI32.DLL resources associated with the handle. (ANSI)
     * @remarks
     * The connection is terminated even if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> call has not yet been completed.
     * 
     * After this call, the <i>hrasconn</i> handle can no longer be used.
     * 
     * An application should not call 
     * <b>RasHangUp</b> and then immediately exit. The connection state machine needs time to properly terminate. If the system prematurely terminates the state machine, the state machine can fail to properly close a port, leaving the port in an inconsistent state. Also, an immediate attempt to use the same connection may fail leaving the connection unusable. A simple way to avoid these problems is to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-sleep">Sleep</a>(3000) after returning from 
     * <b>RasHangUp</b>; after that pause, the application can exit. A more responsive way to avoid these problems is, after returning from 
     * <b>RasHangUp</b>, to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a>(<i>hrasconn</i>) and <b>Sleep</b>(0) in a loop until 
     * <b>RasGetConnectStatus</b> returns <b>ERROR_INVALID_HANDLE</b>.
     * 
     * You can call 
     * <b>RasHangUp</b> on the handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetsubentryhandlea">RasGetSubEntryHandle</a> to terminate a single link in a multi-link connection. However, in this case, you cannot use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a> to determine if the link terminated; 
     * <b>RasGetConnectStatus</b> may not return <b>ERROR_INVALID_HANDLE</b> even though the link terminated successfully.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasHangUp as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRASCONN} param0 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle specified in <i>hrasconn</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rashangupa
     * @since windows5.0
     */
    static RasHangUpA(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := DllCall("RASAPI32.dll\RasHangUpA", "ptr", param0, "uint")
        return result
    }

    /**
     * The RasHangUp function terminates a remote access connection. The connection is specified with a RAS connection handle. The function releases all RASAPI32.DLL resources associated with the handle. (Unicode)
     * @remarks
     * The connection is terminated even if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> call has not yet been completed.
     * 
     * After this call, the <i>hrasconn</i> handle can no longer be used.
     * 
     * An application should not call 
     * <b>RasHangUp</b> and then immediately exit. The connection state machine needs time to properly terminate. If the system prematurely terminates the state machine, the state machine can fail to properly close a port, leaving the port in an inconsistent state. Also, an immediate attempt to use the same connection may fail leaving the connection unusable. A simple way to avoid these problems is to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-sleep">Sleep</a>(3000) after returning from 
     * <b>RasHangUp</b>; after that pause, the application can exit. A more responsive way to avoid these problems is, after returning from 
     * <b>RasHangUp</b>, to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a>(<i>hrasconn</i>) and <b>Sleep</b>(0) in a loop until 
     * <b>RasGetConnectStatus</b> returns <b>ERROR_INVALID_HANDLE</b>.
     * 
     * You can call 
     * <b>RasHangUp</b> on the handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetsubentryhandlea">RasGetSubEntryHandle</a> to terminate a single link in a multi-link connection. However, in this case, you cannot use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a> to determine if the link terminated; 
     * <b>RasGetConnectStatus</b> may not return <b>ERROR_INVALID_HANDLE</b> even though the link terminated successfully.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasHangUp as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRASCONN} param0 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle specified in <i>hrasconn</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rashangupw
     * @since windows5.0
     */
    static RasHangUpW(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := DllCall("RASAPI32.dll\RasHangUpW", "ptr", param0, "uint")
        return result
    }

    /**
     * The RasGetProjectionInfo function obtains information about a remote access projection operation for a specified remote access component protocol.
     * @remarks
     * Remote access projection is the process whereby a remote access server and a remote client negotiate network protocol-specific information. A remote access server uses this network protocol-specific information to represent a remote client on the network.
     * 
     * Remote access projection information is not available until the operating system has executed the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376727(v=vs.85)">RASCS_Projected</a> state on the remote access connection. If 
     * <b>RasGetProjectionInfo</b> is called prior to the <b>RASCS_Projected</b> state, it returns <b>ERROR_PROJECTION_NOT_COMPLETE</b>.
     * 
     * The NetBEUI protocol and authentication message blocks (AMB) are only supported on Windows 2000 and earlier versions of Windows.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetProjectionInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRASCONN} param0 
     * @param {Integer} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<Integer>} param3 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpprojection</i> is not large enough to contain the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hrasconn</i> parameter is not a valid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwSize</b> member of the structure pointed to by <i>lpprojection</i> specifies an invalid size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PROTOCOL_NOT_CONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control protocol for which information was requested neither succeeded nor failed, because the connection's phone-book entry did not require that an attempt to negotiate the protocol be made. This is a RAS error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetprojectioninfoa
     * @since windows5.0
     */
    static RasGetProjectionInfoA(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        param2Marshal := param2 is VarRef ? "ptr" : "ptr"
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetProjectionInfoA", "ptr", param0, "int", param1, param2Marshal, param2, param3Marshal, param3, "uint")
        return result
    }

    /**
     * The RasGetProjectionInfo function obtains information about a remote access projection operation for a specified remote access component protocol.
     * @remarks
     * Remote access projection is the process whereby a remote access server and a remote client negotiate network protocol-specific information. A remote access server uses this network protocol-specific information to represent a remote client on the network.
     * 
     * Remote access projection information is not available until the operating system has executed the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376727(v=vs.85)">RASCS_Projected</a> state on the remote access connection. If 
     * <b>RasGetProjectionInfo</b> is called prior to the <b>RASCS_Projected</b> state, it returns <b>ERROR_PROJECTION_NOT_COMPLETE</b>.
     * 
     * The NetBEUI protocol and authentication message blocks (AMB) are only supported on Windows 2000 and earlier versions of Windows.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetProjectionInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRASCONN} param0 
     * @param {Integer} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<Integer>} param3 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpprojection</i> is not large enough to contain the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hrasconn</i> parameter is not a valid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwSize</b> member of the structure pointed to by <i>lpprojection</i> specifies an invalid size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PROTOCOL_NOT_CONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control protocol for which information was requested neither succeeded nor failed, because the connection's phone-book entry did not require that an attempt to negotiate the protocol be made. This is a RAS error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetprojectioninfow
     * @since windows5.0
     */
    static RasGetProjectionInfoW(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        param2Marshal := param2 is VarRef ? "ptr" : "ptr"
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetProjectionInfoW", "ptr", param0, "int", param1, param2Marshal, param2, param3Marshal, param3, "uint")
        return result
    }

    /**
     * The RasCreatePhonebookEntry function creates a new phone-book entry. The function displays a dialog box in which the user types information for the phone-book entry. (ANSI)
     * @remarks
     * When calling <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasdialdlga">RasDialDlg</a>, set each member of the <b>RASDIALDLG</b> structure passed to <i>lpInfo</i> to zero except:
     * 
     * <ul>
     * <li><i>dwSize</i> = sizeof(<b>RASDIALDLG</b>)</li>
     * <li><i>hwndOwner</i>  = the <i>hwnd</i> parameter above</li>
     * <li><i>dwFlags</i> = <b>RASEDFLAG_NewEntry</b></li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasCreatePhonebookEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HWND} param0 
     * @param {PSTR} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rascreatephonebookentrya
     * @since windows5.0
     */
    static RasCreatePhonebookEntryA(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("RASAPI32.dll\RasCreatePhonebookEntryA", "ptr", param0, "ptr", param1, "uint")
        return result
    }

    /**
     * The RasCreatePhonebookEntry function creates a new phone-book entry. The function displays a dialog box in which the user types information for the phone-book entry. (Unicode)
     * @remarks
     * When calling <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasdialdlga">RasDialDlg</a>, set each member of the <b>RASDIALDLG</b> structure passed to <i>lpInfo</i> to zero except:
     * 
     * <ul>
     * <li><i>dwSize</i> = sizeof(<b>RASDIALDLG</b>)</li>
     * <li><i>hwndOwner</i>  = the <i>hwnd</i> parameter above</li>
     * <li><i>dwFlags</i> = <b>RASEDFLAG_NewEntry</b></li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasCreatePhonebookEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HWND} param0 
     * @param {PWSTR} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rascreatephonebookentryw
     * @since windows5.0
     */
    static RasCreatePhonebookEntryW(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("RASAPI32.dll\RasCreatePhonebookEntryW", "ptr", param0, "ptr", param1, "uint")
        return result
    }

    /**
     * The RasEditPhonebookEntry function edits an existing phone-book entry. The function displays a dialog box in which the user can modify the existing information. (ANSI)
     * @remarks
     * When calling <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasentrydlga">RasEntryDlg</a>, set each member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a> structure passed to <i>lpinfo</i> to zero except:
     * 
     * <ul>
     * <li><i>dwSize</i> = sizeof(<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a>)</li>
     * <li><i>hwndOwner</i>  = the <i>hwnd</i> parameter above</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasEditPhonebookEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HWND} param0 
     * @param {PSTR} param1 
     * @param {PSTR} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry buffer is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-raseditphonebookentrya
     * @since windows5.0
     */
    static RasEditPhonebookEntryA(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2

        result := DllCall("RASAPI32.dll\RasEditPhonebookEntryA", "ptr", param0, "ptr", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The RasEditPhonebookEntry function edits an existing phone-book entry. The function displays a dialog box in which the user can modify the existing information. (Unicode)
     * @remarks
     * When calling <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasentrydlga">RasEntryDlg</a>, set each member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a> structure passed to <i>lpinfo</i> to zero except:
     * 
     * <ul>
     * <li><i>dwSize</i> = sizeof(<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a>)</li>
     * <li><i>hwndOwner</i>  = the <i>hwnd</i> parameter above</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasEditPhonebookEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HWND} param0 
     * @param {PWSTR} param1 
     * @param {PWSTR} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry buffer is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-raseditphonebookentryw
     * @since windows5.0
     */
    static RasEditPhonebookEntryW(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2

        result := DllCall("RASAPI32.dll\RasEditPhonebookEntryW", "ptr", param0, "ptr", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The RasSetEntryDialParams function changes the connection information saved by the last successful call to the RasDial or RasSetEntryDialParams function for a specified phone-book entry. (ANSI)
     * @remarks
     * To create a new phone-book entry, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrypropertiesa">RasSetEntryProperties</a> function.
     * 
     * <b>Windows XP or later:  </b>Do not use the 
     * <b>RasSetEntryDialParams</b> function. To set the credentials for a phone-book entry, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetcredentialsa">RasSetCredentials</a> function. Set the non-credential members of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> (for example <b>szCallbackNumber</b>, <b>dwSubEntry</b>, or <b>dwCallbackId</b>) directly in the 
     * <b>RASDIALPARAMS</b> structure passed as a parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasSetEntryDialParams as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} param0 
     * @param {Pointer<RASDIALPARAMSA>} param1 
     * @param {BOOL} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lprasdialparams</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetentrydialparamsa
     * @since windows5.0
     */
    static RasSetEntryDialParamsA(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall("RASAPI32.dll\RasSetEntryDialParamsA", "ptr", param0, "ptr", param1, "int", param2, "uint")
        return result
    }

    /**
     * The RasSetEntryDialParams function changes the connection information saved by the last successful call to the RasDial or RasSetEntryDialParams function for a specified phone-book entry. (Unicode)
     * @remarks
     * To create a new phone-book entry, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrypropertiesa">RasSetEntryProperties</a> function.
     * 
     * <b>Windows XP or later:  </b>Do not use the 
     * <b>RasSetEntryDialParams</b> function. To set the credentials for a phone-book entry, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetcredentialsa">RasSetCredentials</a> function. Set the non-credential members of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> (for example <b>szCallbackNumber</b>, <b>dwSubEntry</b>, or <b>dwCallbackId</b>) directly in the 
     * <b>RASDIALPARAMS</b> structure passed as a parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasSetEntryDialParams as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} param0 
     * @param {Pointer<RASDIALPARAMSW>} param1 
     * @param {BOOL} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lprasdialparams</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetentrydialparamsw
     * @since windows5.0
     */
    static RasSetEntryDialParamsW(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall("RASAPI32.dll\RasSetEntryDialParamsW", "ptr", param0, "ptr", param1, "int", param2, "uint")
        return result
    }

    /**
     * The RasGetEntryDialParams function retrieves the connection information saved by the last successful call to the RasDial or RasSetEntryDialParams function for a specified phone-book entry. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetEntryDialParams as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} param0 
     * @param {Pointer<RASDIALPARAMSA>} param1 
     * @param {Pointer<BOOL>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lprasdialparams</i> or <i>lpfPassword</i> pointer is invalid, or the <i>lprasdialparams</i> buffer is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetentrydialparamsa
     * @since windows5.0
     */
    static RasGetEntryDialParamsA(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        param2Marshal := param2 is VarRef ? "int*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetEntryDialParamsA", "ptr", param0, "ptr", param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * The RasGetEntryDialParams function retrieves the connection information saved by the last successful call to the RasDial or RasSetEntryDialParams function for a specified phone-book entry. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetEntryDialParams as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} param0 
     * @param {Pointer<RASDIALPARAMSW>} param1 
     * @param {Pointer<BOOL>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lprasdialparams</i> or <i>lpfPassword</i> pointer is invalid, or the <i>lprasdialparams</i> buffer is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetentrydialparamsw
     * @since windows5.0
     */
    static RasGetEntryDialParamsW(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        param2Marshal := param2 is VarRef ? "int*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetEntryDialParamsW", "ptr", param0, "ptr", param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * The RasEnumDevices function returns the name and type of all available RAS-capable devices. (ANSI)
     * @remarks
     * The following sample code enumerates the devices on the current machine. The code initially calls 
     * <b>RasEnumDevices</b> with a <i>lpRasDevInfo</i> parameter of <b>NULL</b>, to obtain the size of the buffer that should be passed in. The code also sets the <b>dwSize</b> member of the first 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377001(v=vs.85)">RASDEVINFO</a> structure to sizeof(<b>RASDEVINFO</b>) to specify the version of the structure.
     * 
     * 
     * ```cpp
     * @param {Pointer<RASDEVINFOA>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpRasDevInfo</i> buffer is not large enough. The <i>lpcb</i> parameter is less than the <b>dwSize</b> member in the <i>lpRasDevInfo</i> parameter which should be set prior to calling the function. The function returns the required buffer size in the variable pointed to by <i>lpcb</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates insufficient memory. The <i>lpRasDevInfo</i> parameter is non-<b>NULL</b>, the <i>lpcb</i> parameter is non-<b>NULL</b> and an internal memory allocation failed. This is possibly due to a low-memory condition.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an invalid parameter value. The <i>lpcb</i> parameter is <b>NULL</b> or the <i>lpcDevices</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasDevInfo</i> is invalid. The <b>dwSize</b> member of the 
     * 								<i>lpRasDevInfo</i>  parameter does not equal sizeof(<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377001(v=vs.85)">RASDEVINFO</a>).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasenumdevicesa
     * @since windows5.0
     */
    static RasEnumDevicesA(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasEnumDevicesA", "ptr", param0, param1Marshal, param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * The RasEnumDevices function returns the name and type of all available RAS-capable devices. (Unicode)
     * @remarks
     * The following sample code enumerates the devices on the current machine. The code initially calls 
     * <b>RasEnumDevices</b> with a <i>lpRasDevInfo</i> parameter of <b>NULL</b>, to obtain the size of the buffer that should be passed in. The code also sets the <b>dwSize</b> member of the first 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377001(v=vs.85)">RASDEVINFO</a> structure to sizeof(<b>RASDEVINFO</b>) to specify the version of the structure.
     * 
     * 
     * ```cpp
     * @param {Pointer<RASDEVINFOW>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpRasDevInfo</i> buffer is not large enough. The <i>lpcb</i> parameter is less than the <b>dwSize</b> member in the <i>lpRasDevInfo</i> parameter which should be set prior to calling the function. The function returns the required buffer size in the variable pointed to by <i>lpcb</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates insufficient memory. The <i>lpRasDevInfo</i> parameter is non-<b>NULL</b>, the <i>lpcb</i> parameter is non-<b>NULL</b> and an internal memory allocation failed. This is possibly due to a low-memory condition.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an invalid parameter value. The <i>lpcb</i> parameter is <b>NULL</b> or the <i>lpcDevices</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasDevInfo</i> is invalid. The <b>dwSize</b> member of the 
     * 								<i>lpRasDevInfo</i>  parameter does not equal sizeof(<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377001(v=vs.85)">RASDEVINFO</a>).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasenumdevicesw
     * @since windows5.0
     */
    static RasEnumDevicesW(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasEnumDevicesW", "ptr", param0, param1Marshal, param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * The RasGetCountryInfo function retrieves country/region-specific dialing information from the Windows Telephony list of countries/regions. (ANSI)
     * @remarks
     * To enumerate information for all countries/regions in the Windows Telephony list, set the <b>dwCountryId</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376731(v=vs.85)">RASCTRYINFO</a> structure to 1 in the initial 
     * <b>RasGetCountryInfo</b> call. This causes the function to return information for the first country/region in the list. The value returned in the <b>dwNextCountryID</b> member is the country/region identifier of the next country/region in the list. Use this value in repeated calls to 
     * <b>RasGetCountryInfo</b> until <b>dwNextCountryID</b> returns zero, indicating the last country/region in the list.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetCountryInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<RASCTRYINFO>} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasCtryInfo</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwCountryId</b> member of the structure pointed to by <i>lpRasCtryInfo</i> was not a valid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>lpRasCtryInfo</i> buffer specified by the <i>lpdwSize</i> parameter was not large enough to store the information for the country/region identified by the <b>dwCountryId</b> member. The function returns the required buffer size in the variable pointed to by <i>lpdwSize</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TAPI_CONFIGURATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TAPI subsystem information was corrupted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetcountryinfoa
     * @since windows5.0
     */
    static RasGetCountryInfoA(param0, param1) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetCountryInfoA", "ptr", param0, param1Marshal, param1, "uint")
        return result
    }

    /**
     * The RasGetCountryInfo function retrieves country/region-specific dialing information from the Windows Telephony list of countries/regions. (Unicode)
     * @remarks
     * To enumerate information for all countries/regions in the Windows Telephony list, set the <b>dwCountryId</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376731(v=vs.85)">RASCTRYINFO</a> structure to 1 in the initial 
     * <b>RasGetCountryInfo</b> call. This causes the function to return information for the first country/region in the list. The value returned in the <b>dwNextCountryID</b> member is the country/region identifier of the next country/region in the list. Use this value in repeated calls to 
     * <b>RasGetCountryInfo</b> until <b>dwNextCountryID</b> returns zero, indicating the last country/region in the list.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetCountryInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<RASCTRYINFO>} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_USER_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasCtryInfo</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwCountryId</b> member of the structure pointed to by <i>lpRasCtryInfo</i> was not a valid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>lpRasCtryInfo</i> buffer specified by the <i>lpdwSize</i> parameter was not large enough to store the information for the country/region identified by the <b>dwCountryId</b> member. The function returns the required buffer size in the variable pointed to by <i>lpdwSize</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TAPI_CONFIGURATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TAPI subsystem information was corrupted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetcountryinfow
     * @since windows5.0
     */
    static RasGetCountryInfoW(param0, param1) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetCountryInfoW", "ptr", param0, param1Marshal, param1, "uint")
        return result
    }

    /**
     * The RasGetEntryProperties function retrieves the properties of a phone-book entry. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetEntryProperties as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @param {Pointer<RASENTRYA>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Pointer<Integer>} param5 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was called with an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the dwSize member of the <i>lpRasEntry</i> is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasEntry</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size indicated in <i>lpdwEntryInfoSize</i> is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist, or the phone-book file is corrupted and/or has missing components.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetentrypropertiesa
     * @since windows5.0
     */
    static RasGetEntryPropertiesA(param0, param1, param2, param3, param4, param5) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param3Marshal := param3 is VarRef ? "uint*" : "ptr"
        param4Marshal := param4 is VarRef ? "char*" : "ptr"
        param5Marshal := param5 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetEntryPropertiesA", "ptr", param0, "ptr", param1, "ptr", param2, param3Marshal, param3, param4Marshal, param4, param5Marshal, param5, "uint")
        return result
    }

    /**
     * The RasGetEntryProperties function retrieves the properties of a phone-book entry. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetEntryProperties as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @param {Pointer<RASENTRYW>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Pointer<Integer>} param5 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was called with an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the dwSize member of the <i>lpRasEntry</i> is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasEntry</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size indicated in <i>lpdwEntryInfoSize</i> is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist, or the phone-book file is corrupted and/or has missing components.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetentrypropertiesw
     * @since windows5.0
     */
    static RasGetEntryPropertiesW(param0, param1, param2, param3, param4, param5) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param3Marshal := param3 is VarRef ? "uint*" : "ptr"
        param4Marshal := param4 is VarRef ? "char*" : "ptr"
        param5Marshal := param5 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetEntryPropertiesW", "ptr", param0, "ptr", param1, "ptr", param2, param3Marshal, param3, param4Marshal, param4, param5Marshal, param5, "uint")
        return result
    }

    /**
     * The RasSetEntryProperties function changes the connection information for an entry in the phone book or creates a new phone-book entry. (ANSI)
     * @remarks
     * When setting properties for an all-users connection, if the calling application specifies a 
     *     non-<b>NULL</b> value for the phone-book parameter, <i>lpszPhonebook</i>, 
     *     the phone-book file must be located in the phone-book directory beneath the all-users application data path. To 
     *     obtain the correct location for the phone-book file, first call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetfolderpatha">SHGetFolderPath</a> with a 
     *     <a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL</a> value of <b>CSIDL_COMMON_APPDATA</b>. 
     *     <b>SHGetFolderPath</b> returns the all-users 
     *     application data path. Append the following string to this path:
     * 
     * Microsoft\Network\Connections\Pbk
     * 
     * The combined path is the correct location for the phone-book file.
     * 
     * <div class="alert"><b>Note</b>  Specifying a non-<b>NULL</b> value for the <i>lpszPhonebook</i> 
     *     parameter may not be supported in versions of Windows later than Windows XP.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasSetEntryProperties as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @param {Pointer<RASENTRYA>} param2 
     * @param {Integer} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Integer} param5 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from 
     *        <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> 
     *        or WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have the correct privileges.  Only an administrator can complete this task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasEntry</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure pointed to by the 
     *         <i>lpRasEntry</i> parameter does not contain adequate information, or the specified entry 
     *         does not exist in the phone book. See the description for <i>lpRasEntry</i> to see what 
     *         information is required.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetentrypropertiesa
     * @since windows5.0
     */
    static RasSetEntryPropertiesA(param0, param1, param2, param3, param4, param5) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param4Marshal := param4 is VarRef ? "char*" : "ptr"

        result := DllCall("RASAPI32.dll\RasSetEntryPropertiesA", "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, param4Marshal, param4, "uint", param5, "uint")
        return result
    }

    /**
     * The RasSetEntryProperties function changes the connection information for an entry in the phone book or creates a new phone-book entry. (Unicode)
     * @remarks
     * When setting properties for an all-users connection, if the calling application specifies a 
     *     non-<b>NULL</b> value for the phone-book parameter, <i>lpszPhonebook</i>, 
     *     the phone-book file must be located in the phone-book directory beneath the all-users application data path. To 
     *     obtain the correct location for the phone-book file, first call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetfolderpatha">SHGetFolderPath</a> with a 
     *     <a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL</a> value of <b>CSIDL_COMMON_APPDATA</b>. 
     *     <b>SHGetFolderPath</b> returns the all-users 
     *     application data path. Append the following string to this path:
     * 
     * Microsoft\Network\Connections\Pbk
     * 
     * The combined path is the correct location for the phone-book file.
     * 
     * <div class="alert"><b>Note</b>  Specifying a non-<b>NULL</b> value for the <i>lpszPhonebook</i> 
     *     parameter may not be supported in versions of Windows later than Windows XP.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasSetEntryProperties as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @param {Pointer<RASENTRYW>} param2 
     * @param {Integer} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Integer} param5 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from 
     *        <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> 
     *        or WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have the correct privileges.  Only an administrator can complete this task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasEntry</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure pointed to by the 
     *         <i>lpRasEntry</i> parameter does not contain adequate information, or the specified entry 
     *         does not exist in the phone book. See the description for <i>lpRasEntry</i> to see what 
     *         information is required.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetentrypropertiesw
     * @since windows5.0
     */
    static RasSetEntryPropertiesW(param0, param1, param2, param3, param4, param5) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param4Marshal := param4 is VarRef ? "char*" : "ptr"

        result := DllCall("RASAPI32.dll\RasSetEntryPropertiesW", "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, param4Marshal, param4, "uint", param5, "uint")
        return result
    }

    /**
     * The RasRenameEntry function changes the name of an entry in a phone book. (ANSI)
     * @remarks
     * The 
     * <b>RasRenameEntry</b> function allows entry names that would not be accepted by the dial-up networking user interface. The entry names specified in 
     * <b>RasRenameEntry</b> can consist of any string that adheres to the following conditions:
     * 
     * <ol>
     * <li>The string cannot have a length greater than RAS_MaxEntryName (as defined in Ras.h).</li>
     * <li>The string cannot consist entirely of space or tab characters.</li>
     * <li>The first character in the string cannot be a period character (".").</li>
     * </ol>
     * The following code sample renames the phone-book entry with the name specified by <i>pszOldName</i> to the new name specified by <i>pszNewName</i>.
     * 
     * 
     * ```cpp
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @param {PSTR} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszNewEntry</i> name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An entry with the <i>lpszNewEntry</i> name already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasrenameentrya
     * @since windows5.0
     */
    static RasRenameEntryA(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2

        result := DllCall("RASAPI32.dll\RasRenameEntryA", "ptr", param0, "ptr", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The RasRenameEntry function changes the name of an entry in a phone book. (Unicode)
     * @remarks
     * The 
     * <b>RasRenameEntry</b> function allows entry names that would not be accepted by the dial-up networking user interface. The entry names specified in 
     * <b>RasRenameEntry</b> can consist of any string that adheres to the following conditions:
     * 
     * <ol>
     * <li>The string cannot have a length greater than RAS_MaxEntryName (as defined in Ras.h).</li>
     * <li>The string cannot consist entirely of space or tab characters.</li>
     * <li>The first character in the string cannot be a period character (".").</li>
     * </ol>
     * The following code sample renames the phone-book entry with the name specified by <i>pszOldName</i> to the new name specified by <i>pszNewName</i>.
     * 
     * 
     * ```cpp
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @param {PWSTR} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszNewEntry</i> name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An entry with the <i>lpszNewEntry</i> name already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasrenameentryw
     * @since windows5.0
     */
    static RasRenameEntryW(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2

        result := DllCall("RASAPI32.dll\RasRenameEntryW", "ptr", param0, "ptr", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The RasDeleteEntry function deletes an entry from a phone book. (ANSI)
     * @remarks
     * The following sample code deletes the phone-book entry specified by the variable <i>lpszEntry</i>.
     * 
     * 
     * ```cpp
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have correct privileges. Only an administrator can complete this task.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entry name specified in <i>lpszEntry</i> does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasdeleteentrya
     * @since windows5.0
     */
    static RasDeleteEntryA(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("RASAPI32.dll\RasDeleteEntryA", "ptr", param0, "ptr", param1, "uint")
        return result
    }

    /**
     * The RasDeleteEntry function deletes an entry from a phone book. (Unicode)
     * @remarks
     * The following sample code deletes the phone-book entry specified by the variable <i>lpszEntry</i>.
     * 
     * 
     * ```cpp
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have correct privileges. Only an administrator can complete this task.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entry name specified in <i>lpszEntry</i> does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasdeleteentryw
     * @since windows5.0
     */
    static RasDeleteEntryW(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("RASAPI32.dll\RasDeleteEntryW", "ptr", param0, "ptr", param1, "uint")
        return result
    }

    /**
     * The RasValidateEntryName function validates the format of a connection entry name. The name must contain at least one non-white-space alphanumeric character. (ANSI)
     * @remarks
     * The following sample code validates the phone-book entry specified by the variable <i>lpszEntry</i>.
     * 
     * 
     * ```cpp
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entry name already exists in the specified phonebook.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified phonebook doesn't exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format of the specified entry name is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasvalidateentrynamea
     * @since windows5.0
     */
    static RasValidateEntryNameA(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("RASAPI32.dll\RasValidateEntryNameA", "ptr", param0, "ptr", param1, "uint")
        return result
    }

    /**
     * The RasValidateEntryName function validates the format of a connection entry name. The name must contain at least one non-white-space alphanumeric character. (Unicode)
     * @remarks
     * The following sample code validates the phone-book entry specified by the variable <i>lpszEntry</i>.
     * 
     * 
     * ```cpp
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entry name already exists in the specified phonebook.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified phonebook doesn't exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format of the specified entry name is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasvalidateentrynamew
     * @since windows5.0
     */
    static RasValidateEntryNameW(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("RASAPI32.dll\RasValidateEntryNameW", "ptr", param0, "ptr", param1, "uint")
        return result
    }

    /**
     * The RasConnectionNotification function specifies an event object that the system sets to the signaled state when a RAS connection is created or terminated. (ANSI)
     * @remarks
     * To determine when the event object is signaled, use any of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a>.
     * 
     * When the event is signaled, use other RAS functions, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a>, to get more information about the RAS connection that was created or terminated.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasConnectionNotification as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRASCONN} param0 
     * @param {HANDLE} param1 
     * @param {Integer} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is a non-zero error code from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasconnectionnotificationa
     * @since windows5.0
     */
    static RasConnectionNotificationA(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        result := DllCall("RASAPI32.dll\RasConnectionNotificationA", "ptr", param0, "ptr", param1, "uint", param2, "uint")
        return result
    }

    /**
     * The RasConnectionNotification function specifies an event object that the system sets to the signaled state when a RAS connection is created or terminated. (Unicode)
     * @remarks
     * To determine when the event object is signaled, use any of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a>.
     * 
     * When the event is signaled, use other RAS functions, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a>, to get more information about the RAS connection that was created or terminated.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasConnectionNotification as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRASCONN} param0 
     * @param {HANDLE} param1 
     * @param {Integer} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is a non-zero error code from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasconnectionnotificationw
     * @since windows5.0
     */
    static RasConnectionNotificationW(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        result := DllCall("RASAPI32.dll\RasConnectionNotificationW", "ptr", param0, "ptr", param1, "uint", param2, "uint")
        return result
    }

    /**
     * The RasGetSubEntryHandle function retrieves a connection handle for a specified subentry of a multilink connection. (ANSI)
     * @remarks
     * The connection handle specified in the <i>hRasConn</i> parameter refers to the entire multilink connection, but the connection handle returned in the <i>*lphRasConn</i> parameter refers only to the subentry connection. Use the subentry connection handle in any function that accepts an <i>hRasConn</i> parameter, including the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a>, and 
     * <a href="https://docs.microsoft.com/windows/win32/api/ras/nf-ras-rasgetprojectioninfoex">RasGetProjectionInfoEx</a> functions. The projection information returned by 
     * <b>RasGetProjectionInfo</b> for a multilink entry is the same for the each of the subentry connection handles as it is for the main connection handle.
     * 
     * You can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> on the handle returned by 
     * <b>RasGetSubEntryHandle</b> to terminate a single link in a multi-link connection. However, you cannot use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a> to determine if the link terminated; 
     * <b>RasGetConnectStatus</b> may not return ERROR_INVALID_HANDLE even though the link terminated successfully.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetSubEntryHandle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRASCONN} param0 
     * @param {Integer} param1 
     * @param {Pointer<HRASCONN>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hRasConn</i> connection handle does not represent a connected phone-book entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PORT_NOT_OPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hRasConn</i> and <i>dwSubEntry</i> parameters are valid, but the specified subentry is not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by <i>dwSubEntry</i> exceeds the maximum number of subentries for the phone-book entry.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetsubentryhandlea
     * @since windows5.0
     */
    static RasGetSubEntryHandleA(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := DllCall("RASAPI32.dll\RasGetSubEntryHandleA", "ptr", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The RasGetSubEntryHandle function retrieves a connection handle for a specified subentry of a multilink connection. (Unicode)
     * @remarks
     * The connection handle specified in the <i>hRasConn</i> parameter refers to the entire multilink connection, but the connection handle returned in the <i>*lphRasConn</i> parameter refers only to the subentry connection. Use the subentry connection handle in any function that accepts an <i>hRasConn</i> parameter, including the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a>, and 
     * <a href="https://docs.microsoft.com/windows/win32/api/ras/nf-ras-rasgetprojectioninfoex">RasGetProjectionInfoEx</a> functions. The projection information returned by 
     * <b>RasGetProjectionInfo</b> for a multilink entry is the same for the each of the subentry connection handles as it is for the main connection handle.
     * 
     * You can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> on the handle returned by 
     * <b>RasGetSubEntryHandle</b> to terminate a single link in a multi-link connection. However, you cannot use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a> to determine if the link terminated; 
     * <b>RasGetConnectStatus</b> may not return ERROR_INVALID_HANDLE even though the link terminated successfully.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetSubEntryHandle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HRASCONN} param0 
     * @param {Integer} param1 
     * @param {Pointer<HRASCONN>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hRasConn</i> connection handle does not represent a connected phone-book entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PORT_NOT_OPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hRasConn</i> and <i>dwSubEntry</i> parameters are valid, but the specified subentry is not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by <i>dwSubEntry</i> exceeds the maximum number of subentries for the phone-book entry.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetsubentryhandlew
     * @since windows5.0
     */
    static RasGetSubEntryHandleW(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := DllCall("RASAPI32.dll\RasGetSubEntryHandleW", "ptr", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The RasGetCredentials function retrieves the user credentials associated with a specified RAS phone-book entry. (ANSI)
     * @remarks
     * The 
     * <b>RasGetCredentials</b> function retrieves the credentials of the last user in order to connect using the specified phone-book entry, or the credentials subsequently specified in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetcredentialsa">RasSetCredentials</a> function for the phone-book entry.
     * 
     *  This function is the preferred way of securely retrieving the credentials associated with a RAS phone-book entry. 
     * <b>RasGetCredentials</b> supersedes the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetentrydialparamsa">RasGetEntryDialParams</a> function, which may not be supported in future releases of Windows.
     * 
     * <b>RasGetCredentials</b> does not return the actual password. Instead, the <b>szPassword</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> structure contains a handle to the saved password. Substitute this handle for the saved password in subsequent calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetcredentialsa">RasSetCredentials</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>. When presented with this handle, 
     * <b>RasDial</b>  retrieves and uses the saved password. The value of this handle may change in future versions of the operating system; do not develop code that depends on the contents or format of this value.
     * 
     * The <b>dwMask</b> member of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> contains the RASCM_Password flag if the system has saved a password for the specified entry. If the system has no password saved for this entry, <b>dwMask</b> does not contain RASCM_Password.
     * 
     * <b>Windows 2000/NT:  </b>This feature is not supported.
     * 
     * If the <b>dwMask</b> of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> structure contains the RASCM_DefaultCreds flag, the credentials returned are the default credentials for an all-user connection.
     * 
     * To retrieve a pre-shared key, use the RASCM_PreSharedKey flag in the RASCREDENTIALS.dwMask field.
     * 
     * <b>Windows 2000/NT:  </b>This feature is not supported.
     * 
     * The following sample code creates the "RasEntryName" phone book entry, sets its credentials using <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetcredentialsa">RasSetCredentials</a>, and then retrieves those credentials using <b>RasGetCredentials</b>.
     * 
     * 
     * ```cpp
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @param {Pointer<RASCREDENTIALSA>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified phone book cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified entry does not exist in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpCredentials</i> parameter was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwSize</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> structure is an unrecognized value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetcredentialsa
     * @since windows5.0
     */
    static RasGetCredentialsA(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("RASAPI32.dll\RasGetCredentialsA", "ptr", param0, "ptr", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The RasGetCredentials function retrieves the user credentials associated with a specified RAS phone-book entry. (Unicode)
     * @remarks
     * The 
     * <b>RasGetCredentials</b> function retrieves the credentials of the last user in order to connect using the specified phone-book entry, or the credentials subsequently specified in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetcredentialsa">RasSetCredentials</a> function for the phone-book entry.
     * 
     *  This function is the preferred way of securely retrieving the credentials associated with a RAS phone-book entry. 
     * <b>RasGetCredentials</b> supersedes the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetentrydialparamsa">RasGetEntryDialParams</a> function, which may not be supported in future releases of Windows.
     * 
     * <b>RasGetCredentials</b> does not return the actual password. Instead, the <b>szPassword</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> structure contains a handle to the saved password. Substitute this handle for the saved password in subsequent calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetcredentialsa">RasSetCredentials</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>. When presented with this handle, 
     * <b>RasDial</b>  retrieves and uses the saved password. The value of this handle may change in future versions of the operating system; do not develop code that depends on the contents or format of this value.
     * 
     * The <b>dwMask</b> member of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> contains the RASCM_Password flag if the system has saved a password for the specified entry. If the system has no password saved for this entry, <b>dwMask</b> does not contain RASCM_Password.
     * 
     * <b>Windows 2000/NT:  </b>This feature is not supported.
     * 
     * If the <b>dwMask</b> of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> structure contains the RASCM_DefaultCreds flag, the credentials returned are the default credentials for an all-user connection.
     * 
     * To retrieve a pre-shared key, use the RASCM_PreSharedKey flag in the RASCREDENTIALS.dwMask field.
     * 
     * <b>Windows 2000/NT:  </b>This feature is not supported.
     * 
     * The following sample code creates the "RasEntryName" phone book entry, sets its credentials using <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetcredentialsa">RasSetCredentials</a>, and then retrieves those credentials using <b>RasGetCredentials</b>.
     * 
     * 
     * ```cpp
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @param {Pointer<RASCREDENTIALSW>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified phone book cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified entry does not exist in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpCredentials</i> parameter was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwSize</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> structure is an unrecognized value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetcredentialsw
     * @since windows5.0
     */
    static RasGetCredentialsW(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("RASAPI32.dll\RasGetCredentialsW", "ptr", param0, "ptr", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Sets the user credentials associated with a specified RAS phone-book entry. (ANSI)
     * @remarks
     * The <b>RasSetCredentials</b> function sets the user 
     *     credentials associated with a specified RAS phone-book entry. The credentials stored with a phone-book entry are 
     *     the credentials of the last user to successfully connect by using the specified phone-book entry, or the 
     *     credentials subsequently specified in a call to the 
     *     <b>RasSetCredentials</b> or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrydialparamsa">RasSetEntryDialParams</a> function for the 
     *     phone-book entry.
     * 
     * The <b>RasSetCredentials</b> function is the preferred 
     *     way of securely storing credentials with a phone-book entry. 
     *     <b>RasSetCredentials</b> supersedes the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrydialparamsa">RasSetEntryDialParams</a> function, which may not be 
     *     supported in future releases of the Windows operating system.
     * 
     * A password handle is "****************" (16 asterisks). If you call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetcredentialsa">RasGetCredentials</a> and receive 16 *s back in the 
     *     password field, you have a stored password and, for security reasons, it will not be given  back to you in plain 
     *     text.  If the <b>szPassword</b> member of the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> structure contains the password handle 
     *     (16 *s) returned by <b>RasGetCredentials</b> or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetentrydialparamsa">RasGetEntryDialParams</a>,  the next call to 
     *     <b>RasSetCredentials</b> will not change the saved 
     *     password.
     * 
     * To set the default credentials for an all-user connection, set the 
     *     <b>RASCM_DefaultCreds</b> flag in the <b>dwMask</b> member of the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> structure pointed to by 
     *     the <i>lpCredentials</i> parameter. If you attempt to set default credentials for a per-user 
     *     connection, <b>RasSetCredentials</b> returns 
     *     <b>ERROR_ACCESS_DENIED</b>. 
     * 
     * When setting credentials for an all-users connection, if 
     *     the calling application specifies a non-NULL value for the phone-book parameter, 
     *     <i>lpszPhonebook</i>, the phone-book file must be located in the phone-book directory beneath 
     *     the all-users application data path. To obtain the correct location for the phone-book file, first call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetfolderpatha">SHGetFolderPath</a> with a 
     *     <a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL</a> value of <b>CSIDL_COMMON_APPDATA</b>. 
     *     <b>SHGetFolderPath</b> returns the all-users 
     *     application data path. Append the following string to this path:
     * 
     * Microsoft\Network\Connections\Pbk
     * 
     * The combined path is the correct location for the phone-book file.
     * 
     * <div class="alert"><b>Note</b>  Specifying a non-NULL value for the <i>lpszPhonebook</i> parameter may not be supported in 
     *     later versions of the Windows operating system.</div>
     * <div> </div>
     * To set a pre-shared key, use the <b>RASCM_PreSharedKey</b> flag in the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a>.<b>dwMask</b> 
     *     field.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasSetCredentials as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @param {Pointer<RASCREDENTIALSA>} param2 
     * @param {BOOL} param3 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from 
     *        <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> 
     *        or WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified phone book cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpCredentials</i> parameter was <b>NULL</b>, or the 
     *         specified entry does not exist in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following conditions occurred:
     *         
     * 
     * <ul>
     * <li>The calling application attempted to set default credentials for a per-user connection. Default 
     *           credentials can be set only for an all-user connection.</li>
     * <li>The user does not have the correct privileges to set pre-shared keys or credentials for all users in 
     *           case of all-user connectoids.  Only administrators can complete these tasks.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetcredentialsa
     * @since windows5.0
     */
    static RasSetCredentialsA(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("RASAPI32.dll\RasSetCredentialsA", "ptr", param0, "ptr", param1, "ptr", param2, "int", param3, "uint")
        return result
    }

    /**
     * Sets the user credentials associated with a specified RAS phone-book entry. (Unicode)
     * @remarks
     * The <b>RasSetCredentials</b> function sets the user 
     *     credentials associated with a specified RAS phone-book entry. The credentials stored with a phone-book entry are 
     *     the credentials of the last user to successfully connect by using the specified phone-book entry, or the 
     *     credentials subsequently specified in a call to the 
     *     <b>RasSetCredentials</b> or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrydialparamsa">RasSetEntryDialParams</a> function for the 
     *     phone-book entry.
     * 
     * The <b>RasSetCredentials</b> function is the preferred 
     *     way of securely storing credentials with a phone-book entry. 
     *     <b>RasSetCredentials</b> supersedes the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrydialparamsa">RasSetEntryDialParams</a> function, which may not be 
     *     supported in future releases of the Windows operating system.
     * 
     * A password handle is "****************" (16 asterisks). If you call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetcredentialsa">RasGetCredentials</a> and receive 16 *s back in the 
     *     password field, you have a stored password and, for security reasons, it will not be given  back to you in plain 
     *     text.  If the <b>szPassword</b> member of the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> structure contains the password handle 
     *     (16 *s) returned by <b>RasGetCredentials</b> or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetentrydialparamsa">RasGetEntryDialParams</a>,  the next call to 
     *     <b>RasSetCredentials</b> will not change the saved 
     *     password.
     * 
     * To set the default credentials for an all-user connection, set the 
     *     <b>RASCM_DefaultCreds</b> flag in the <b>dwMask</b> member of the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a> structure pointed to by 
     *     the <i>lpCredentials</i> parameter. If you attempt to set default credentials for a per-user 
     *     connection, <b>RasSetCredentials</b> returns 
     *     <b>ERROR_ACCESS_DENIED</b>. 
     * 
     * When setting credentials for an all-users connection, if 
     *     the calling application specifies a non-NULL value for the phone-book parameter, 
     *     <i>lpszPhonebook</i>, the phone-book file must be located in the phone-book directory beneath 
     *     the all-users application data path. To obtain the correct location for the phone-book file, first call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetfolderpatha">SHGetFolderPath</a> with a 
     *     <a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL</a> value of <b>CSIDL_COMMON_APPDATA</b>. 
     *     <b>SHGetFolderPath</b> returns the all-users 
     *     application data path. Append the following string to this path:
     * 
     * Microsoft\Network\Connections\Pbk
     * 
     * The combined path is the correct location for the phone-book file.
     * 
     * <div class="alert"><b>Note</b>  Specifying a non-NULL value for the <i>lpszPhonebook</i> parameter may not be supported in 
     *     later versions of the Windows operating system.</div>
     * <div> </div>
     * To set a pre-shared key, use the <b>RASCM_PreSharedKey</b> flag in the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376730(v=vs.85)">RASCREDENTIALS</a>.<b>dwMask</b> 
     *     field.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasSetCredentials as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @param {Pointer<RASCREDENTIALSW>} param2 
     * @param {BOOL} param3 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from 
     *        <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> 
     *        or WinError.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified phone book cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpCredentials</i> parameter was <b>NULL</b>, or the 
     *         specified entry does not exist in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following conditions occurred:
     *         
     * 
     * <ul>
     * <li>The calling application attempted to set default credentials for a per-user connection. Default 
     *           credentials can be set only for an all-user connection.</li>
     * <li>The user does not have the correct privileges to set pre-shared keys or credentials for all users in 
     *           case of all-user connectoids.  Only administrators can complete these tasks.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetcredentialsw
     * @since windows5.0
     */
    static RasSetCredentialsW(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("RASAPI32.dll\RasSetCredentialsW", "ptr", param0, "ptr", param1, "ptr", param2, "int", param3, "uint")
        return result
    }

    /**
     * The RasGetSubEntryProperties function retrieves information about a subentry for a specified phone-book entry. (ANSI)
     * @remarks
     * A RAS phone-book entry can have zero or more subentries, each minimally consisting of a device and a phone number. A phone-book entry with multiple subentries can be configured to dial the first available or all subentries when the entry is dialed.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetentrypropertiesa">RasGetEntryProperties</a> function to retrieve a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure containing information about the subentries of a phone-book entry. The <b>dwSubEntries</b> member indicates the number of subentries and the <b>dwDialMode</b> member indicates the dialing configuration.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetSubEntryProperties as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @param {Pointer<RASSUBENTRYA>} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Pointer<Integer>} param5 
     * @param {Pointer<Integer>} param6 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was called with an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasSubEntry</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpRasSubEntry</i> buffer is too small. The <i>lpdwcb</i> variable receives the required buffer size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or is missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetsubentrypropertiesa
     * @since windows5.0
     */
    static RasGetSubEntryPropertiesA(param0, param1, param2, param3, param4, param5, param6) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param4Marshal := param4 is VarRef ? "uint*" : "ptr"
        param5Marshal := param5 is VarRef ? "char*" : "ptr"
        param6Marshal := param6 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetSubEntryPropertiesA", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, param4Marshal, param4, param5Marshal, param5, param6Marshal, param6, "uint")
        return result
    }

    /**
     * The RasGetSubEntryProperties function retrieves information about a subentry for a specified phone-book entry. (Unicode)
     * @remarks
     * A RAS phone-book entry can have zero or more subentries, each minimally consisting of a device and a phone number. A phone-book entry with multiple subentries can be configured to dial the first available or all subentries when the entry is dialed.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetentrypropertiesa">RasGetEntryProperties</a> function to retrieve a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure containing information about the subentries of a phone-book entry. The <b>dwSubEntries</b> member indicates the number of subentries and the <b>dwDialMode</b> member indicates the dialing configuration.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetSubEntryProperties as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @param {Integer} param2 
     * @param {Pointer<RASSUBENTRYW>} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Pointer<Integer>} param5 
     * @param {Pointer<Integer>} param6 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was called with an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasSubEntry</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpRasSubEntry</i> buffer is too small. The <i>lpdwcb</i> variable receives the required buffer size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or is missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetsubentrypropertiesw
     * @since windows5.0
     */
    static RasGetSubEntryPropertiesW(param0, param1, param2, param3, param4, param5, param6) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param4Marshal := param4 is VarRef ? "uint*" : "ptr"
        param5Marshal := param5 is VarRef ? "char*" : "ptr"
        param6Marshal := param6 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetSubEntryPropertiesW", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, param4Marshal, param4, param5Marshal, param5, param6Marshal, param6, "uint")
        return result
    }

    /**
     * The RasSetSubEntryProperties function creates a new subentry or modifies an existing subentry of a specified phone-book entry. (ANSI)
     * @remarks
     * A RAS phone-book entry can have zero or more subentries, each minimally consisting of a device and a phone number. A phone-book entry with multiple subentries can be configured to dial either the first available subentry or all subentries when the entry is dialed.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetentrypropertiesa">RasGetEntryProperties</a> function to retrieve the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure containing information about the subentries of a phone-book entry. The <b>dwSubEntries</b> member indicates the number of subentries and the <b>dwDialMode</b> member indicates the dialing configuration.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasSetSubEntryProperties as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @param {Pointer<RASSUBENTRYA>} param3 
     * @param {Integer} param4 
     * @param {Pointer<Integer>} param5 
     * @param {Integer} param6 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasEntry</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was called with an invalid parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetsubentrypropertiesa
     * @since windows5.0
     */
    static RasSetSubEntryPropertiesA(param0, param1, param2, param3, param4, param5, param6) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param5Marshal := param5 is VarRef ? "char*" : "ptr"

        result := DllCall("RASAPI32.dll\RasSetSubEntryPropertiesA", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "uint", param4, param5Marshal, param5, "uint", param6, "uint")
        return result
    }

    /**
     * The RasSetSubEntryProperties function creates a new subentry or modifies an existing subentry of a specified phone-book entry. (Unicode)
     * @remarks
     * A RAS phone-book entry can have zero or more subentries, each minimally consisting of a device and a phone number. A phone-book entry with multiple subentries can be configured to dial either the first available subentry or all subentries when the entry is dialed.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetentrypropertiesa">RasGetEntryProperties</a> function to retrieve the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure containing information about the subentries of a phone-book entry. The <b>dwSubEntries</b> member indicates the number of subentries and the <b>dwDialMode</b> member indicates the dialing configuration.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasSetSubEntryProperties as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @param {Integer} param2 
     * @param {Pointer<RASSUBENTRYW>} param3 
     * @param {Integer} param4 
     * @param {Pointer<Integer>} param5 
     * @param {Integer} param6 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address or buffer specified by <i>lpRasEntry</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone-book entry does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The phone book is corrupted or missing components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was called with an invalid parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetsubentrypropertiesw
     * @since windows5.0
     */
    static RasSetSubEntryPropertiesW(param0, param1, param2, param3, param4, param5, param6) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param5Marshal := param5 is VarRef ? "char*" : "ptr"

        result := DllCall("RASAPI32.dll\RasSetSubEntryPropertiesW", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "uint", param4, param5Marshal, param5, "uint", param6, "uint")
        return result
    }

    /**
     * The RasGetAutodialAddress function retrieves information about all the AutoDial entries associated with a network address in the AutoDial mapping database. (ANSI)
     * @remarks
     * The Remote Access Service (RAS) supports default Internet connections. RAS supports a default Internet connection that is global to the local computer, and in addition, supports a default Internet connection for each user.
     * 
     * The name of the global default Internet connection is stored in the registry below the following registry key:
     * 
     * 
     * <pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>Software</b>
     *       <b>Microsoft</b>
     *          <b>Ras Autodial</b>
     *             <b>Default</b></pre>
     * 
     * 
     * The value that stores the name of the connection is: 
     * 			
     * 
     * <b>DefaultInternet</b>
     * 
     * This value is of type <b>REG_SZ</b>.
     * 
     * The global default Internet connection must be configured as a <b>For all users</b> connection in the <b>Connections Folder</b> user interface.
     * 
     * The name of the per-user default Internet connection is stored in the registry below the following registry key: 
     * 			
     * 
     * 
     * <b>HKEY_CURRENT_USER</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Ras Autodial</b>&#92;<b>Default</b>
     * 
     * 
     * 
     * The value that stores the name of the connection is: 
     * 			
     * 
     * <b>DefaultInternet</b>
     * 
     * This value is of type <b>REG_SZ</b>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetAutodialAddress as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<RASAUTODIALENTRYA>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Integer>} param4 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwSize</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376721(v=vs.85)">RASAUTODIALENTRY</a> structure is an invalid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszAddress</i>, <i>lpdwcbAutoDialEntries</i>, or <i>lpdwcAutoDialEntries</i> parameter was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetautodialaddressa
     * @since windows5.0
     */
    static RasGetAutodialAddressA(param0, param1, param2, param3, param4) {
        param0 := param0 is String ? StrPtr(param0) : param0

        param1Marshal := param1 is VarRef ? "uint*" : "ptr"
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"
        param4Marshal := param4 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetAutodialAddressA", "ptr", param0, param1Marshal, param1, "ptr", param2, param3Marshal, param3, param4Marshal, param4, "uint")
        return result
    }

    /**
     * The RasGetAutodialAddress function retrieves information about all the AutoDial entries associated with a network address in the AutoDial mapping database. (Unicode)
     * @remarks
     * The Remote Access Service (RAS) supports default Internet connections. RAS supports a default Internet connection that is global to the local computer, and in addition, supports a default Internet connection for each user.
     * 
     * The name of the global default Internet connection is stored in the registry below the following registry key:
     * 
     * 
     * <pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>Software</b>
     *       <b>Microsoft</b>
     *          <b>Ras Autodial</b>
     *             <b>Default</b></pre>
     * 
     * 
     * The value that stores the name of the connection is: 
     * 			
     * 
     * <b>DefaultInternet</b>
     * 
     * This value is of type <b>REG_SZ</b>.
     * 
     * The global default Internet connection must be configured as a <b>For all users</b> connection in the <b>Connections Folder</b> user interface.
     * 
     * The name of the per-user default Internet connection is stored in the registry below the following registry key: 
     * 			
     * 
     * 
     * <b>HKEY_CURRENT_USER</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Ras Autodial</b>&#92;<b>Default</b>
     * 
     * 
     * 
     * The value that stores the name of the connection is: 
     * 			
     * 
     * <b>DefaultInternet</b>
     * 
     * This value is of type <b>REG_SZ</b>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetAutodialAddress as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<RASAUTODIALENTRYW>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Integer>} param4 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwSize</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376721(v=vs.85)">RASAUTODIALENTRY</a> structure is an invalid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszAddress</i>, <i>lpdwcbAutoDialEntries</i>, or <i>lpdwcAutoDialEntries</i> parameter was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetautodialaddressw
     * @since windows5.0
     */
    static RasGetAutodialAddressW(param0, param1, param2, param3, param4) {
        param0 := param0 is String ? StrPtr(param0) : param0

        param1Marshal := param1 is VarRef ? "uint*" : "ptr"
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"
        param4Marshal := param4 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetAutodialAddressW", "ptr", param0, param1Marshal, param1, "ptr", param2, param3Marshal, param3, param4Marshal, param4, "uint")
        return result
    }

    /**
     * The RasSetAutodialAddress function can add an address to the AutoDial mapping database. Alternatively, the function can delete or modify the data associated with an existing address in the database. (ANSI)
     * @remarks
     * An address in the AutoDial mapping database can have any number of associated 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376721(v=vs.85)">RASAUTODIALENTRY</a> entries. Each entry specifies AutoDial information for a particular TAPI dialing location.
     * 
     * If the address specified by the <i>lpszAddress</i> parameter is an existing address in the database and the <i>lpAutoDialEntries</i> parameter is not <b>NULL</b>, the 
     * <b>RasSetAutodialAddress</b> function modifies the set of AutoDial entries associated with the address. If an entry in the <i>lpAutoDialEntries</i> array specifies a dialing location for which the address already has an entry, the function replaces the existing entry with the new entry. Otherwise, the function simply adds the <i>lpAutoDialEntries</i> entries to the set of entries for the address.
     * 
     * If the <i>lpszAddress</i> address exists in the database, <i>lpAutoDialEntries</i> is <b>NULL</b>, and <i>lpAutoDialEntries</i> is zero, 
     * <b>RasSetAutodialAddress</b> deletes the address from the database.
     * 
     * If the <i>lpszAddress</i> address does not exist in the database, 
     * <b>RasSetAutodialAddress</b> adds the address to the database. The <i>lpAutoDialEntries</i> parameter specifies the AutoDial entries to associate with the new address.
     * 
     *  RAS supports a default Internet connection that is global to the local computer and  supports a default Internet connection for each user.
     * 
     * When the <i>lpszAddress</i> parameter is <b>NULL</b>, and the <i>lpAutoDialEntries</i> parameter specifies a connection name with one entry, <b>RasSetAutodialAddress</b> sets the connection as the default internet connection.  The connection name specified in  <i>lpAutoDialEntries</i> should already exist.  If it does not, <b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b> will be returned.
     * 
     * When the <i>lpszAddress</i> parameter is a zero-length string and the <i>lpAutoDialEntries</i> parameter specifies an empty connection name with one entry, <b>RasSetAutodialAddress</b> deletes the default internet connection.
     * 
     * On non-domain client machines, if a user wants to set a connection as the default internet connection and specifies a "for-all-users" connection in the <b>szEntry</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376721(v=vs.85)">RASAUTODIALENTRY</a> structure, then the default internet connection is set globally on the local computer.  In all other cases the default internet connection is set for each user of the machine individually.
     * 
     * It is possible to have two connections that have the same name if one is configured as a "for-all-users" connection and the other is configured as a "for-me-only" connection. If the <i>lpAutoDialEntries</i> parameter specifies a connection name that corresponds to both a global and a per-user connection, the per-user connection is set.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasSetAutodialAddress as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} param0 
     * @param {Integer} param1 
     * @param {Pointer<RASAUTODIALENTRYA>} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwSize</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376721(v=vs.85)">RASAUTODIALENTRY</a> structure is an invalid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszAddress</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection name specified in <i>lpAutoDialEntries</i> does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetautodialaddressa
     * @since windows5.0
     */
    static RasSetAutodialAddressA(param0, param1, param2, param3, param4) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall("RASAPI32.dll\RasSetAutodialAddressA", "ptr", param0, "uint", param1, "ptr", param2, "uint", param3, "uint", param4, "uint")
        return result
    }

    /**
     * The RasSetAutodialAddress function can add an address to the AutoDial mapping database. Alternatively, the function can delete or modify the data associated with an existing address in the database. (Unicode)
     * @remarks
     * An address in the AutoDial mapping database can have any number of associated 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376721(v=vs.85)">RASAUTODIALENTRY</a> entries. Each entry specifies AutoDial information for a particular TAPI dialing location.
     * 
     * If the address specified by the <i>lpszAddress</i> parameter is an existing address in the database and the <i>lpAutoDialEntries</i> parameter is not <b>NULL</b>, the 
     * <b>RasSetAutodialAddress</b> function modifies the set of AutoDial entries associated with the address. If an entry in the <i>lpAutoDialEntries</i> array specifies a dialing location for which the address already has an entry, the function replaces the existing entry with the new entry. Otherwise, the function simply adds the <i>lpAutoDialEntries</i> entries to the set of entries for the address.
     * 
     * If the <i>lpszAddress</i> address exists in the database, <i>lpAutoDialEntries</i> is <b>NULL</b>, and <i>lpAutoDialEntries</i> is zero, 
     * <b>RasSetAutodialAddress</b> deletes the address from the database.
     * 
     * If the <i>lpszAddress</i> address does not exist in the database, 
     * <b>RasSetAutodialAddress</b> adds the address to the database. The <i>lpAutoDialEntries</i> parameter specifies the AutoDial entries to associate with the new address.
     * 
     *  RAS supports a default Internet connection that is global to the local computer and  supports a default Internet connection for each user.
     * 
     * When the <i>lpszAddress</i> parameter is <b>NULL</b>, and the <i>lpAutoDialEntries</i> parameter specifies a connection name with one entry, <b>RasSetAutodialAddress</b> sets the connection as the default internet connection.  The connection name specified in  <i>lpAutoDialEntries</i> should already exist.  If it does not, <b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b> will be returned.
     * 
     * When the <i>lpszAddress</i> parameter is a zero-length string and the <i>lpAutoDialEntries</i> parameter specifies an empty connection name with one entry, <b>RasSetAutodialAddress</b> deletes the default internet connection.
     * 
     * On non-domain client machines, if a user wants to set a connection as the default internet connection and specifies a "for-all-users" connection in the <b>szEntry</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376721(v=vs.85)">RASAUTODIALENTRY</a> structure, then the default internet connection is set globally on the local computer.  In all other cases the default internet connection is set for each user of the machine individually.
     * 
     * It is possible to have two connections that have the same name if one is configured as a "for-all-users" connection and the other is configured as a "for-me-only" connection. If the <i>lpAutoDialEntries</i> parameter specifies a connection name that corresponds to both a global and a per-user connection, the per-user connection is set.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasSetAutodialAddress as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} param0 
     * @param {Integer} param1 
     * @param {Pointer<RASAUTODIALENTRYW>} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwSize</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376721(v=vs.85)">RASAUTODIALENTRY</a> structure is an invalid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszAddress</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection name specified in <i>lpAutoDialEntries</i> does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetautodialaddressw
     * @since windows5.0
     */
    static RasSetAutodialAddressW(param0, param1, param2, param3, param4) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall("RASAPI32.dll\RasSetAutodialAddressW", "ptr", param0, "uint", param1, "ptr", param2, "uint", param3, "uint", param4, "uint")
        return result
    }

    /**
     * The RasEnumAutodialAddresses function returns a list of all addresses in the AutoDial mapping database. (ANSI)
     * @remarks
     * The following code sample code uses <b>RasEnumAutodialAddresses</b> to enumerate the Autodial mapping database.
     * 
     * 
     * ```cpp
     * @param {Pointer} lppRasAutodialAddresses Pointer to an array of string pointers, with additional space for the storage of the strings themselves at the end of the buffer. 
     * 
     * 
     * 
     * 
     * On output, each string receives the name of an address in the AutoDial mapping database.
     * 
     * If <i>lppAddresses</i> is <b>NULL</b> on input, 
     * <b>RasEnumAutodialAddresses</b> sets the <i>lpdwcbAddresses</i> and <i>lpdwcAddresses</i> parameters to indicate the required size, in bytes, and the number of address entries in the database.
     * @param {Pointer<Integer>} lpdwcbRasAutodialAddresses Pointer to a variable that, on input, contains the size, in bytes, of the buffer specified by the <i>lpRasEnumAutodialAddressespAddresses</i> parameter. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  <p class="note">To determine the required buffer size, call 
     * <b>RasEnumAutodialAddresses</b> with <i>lppAddresses</i> set to <b>NULL</b>. The variable pointed to by <i>lpdwcbAddresses</i> should be set to zero. The function will return the required buffer size in <i>lpdwcbAddresses</i> and an error code of <b>ERROR_BUFFER_TOO_SMALL</b>.
     * 
     * </div>
     * <div> </div>
     * @param {Pointer<Integer>} lpdwcRasAutodialAddresses Pointer to a variable that receives the number of address strings returned in the <i>lppAddresses</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> was passed for the <i>lpdwcbAddresses</i> or <i>lpdwcAddresses</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lppAddresses</i> buffer was <b>NULL</b> and <i>lpdwcbAddresses</i> was zero. The function returns the required buffer size in the variable pointed to by <i>lpdwcbAddresses</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasenumautodialaddressesa
     * @since windows5.0
     */
    static RasEnumAutodialAddressesA(lppRasAutodialAddresses, lpdwcbRasAutodialAddresses, lpdwcRasAutodialAddresses) {
        lpdwcbRasAutodialAddressesMarshal := lpdwcbRasAutodialAddresses is VarRef ? "uint*" : "ptr"
        lpdwcRasAutodialAddressesMarshal := lpdwcRasAutodialAddresses is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasEnumAutodialAddressesA", "ptr", lppRasAutodialAddresses, lpdwcbRasAutodialAddressesMarshal, lpdwcbRasAutodialAddresses, lpdwcRasAutodialAddressesMarshal, lpdwcRasAutodialAddresses, "uint")
        return result
    }

    /**
     * The RasEnumAutodialAddresses function returns a list of all addresses in the AutoDial mapping database. (Unicode)
     * @remarks
     * The following code sample code uses <b>RasEnumAutodialAddresses</b> to enumerate the Autodial mapping database.
     * 
     * 
     * ```cpp
     * @param {Pointer} lppRasAutodialAddresses Pointer to an array of string pointers, with additional space for the storage of the strings themselves at the end of the buffer. 
     * 
     * 
     * 
     * 
     * On output, each string receives the name of an address in the AutoDial mapping database.
     * 
     * If <i>lppAddresses</i> is <b>NULL</b> on input, 
     * <b>RasEnumAutodialAddresses</b> sets the <i>lpdwcbAddresses</i> and <i>lpdwcAddresses</i> parameters to indicate the required size, in bytes, and the number of address entries in the database.
     * @param {Pointer<Integer>} lpdwcbRasAutodialAddresses Pointer to a variable that, on input, contains the size, in bytes, of the buffer specified by the <i>lpRasEnumAutodialAddressespAddresses</i> parameter. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  <p class="note">To determine the required buffer size, call 
     * <b>RasEnumAutodialAddresses</b> with <i>lppAddresses</i> set to <b>NULL</b>. The variable pointed to by <i>lpdwcbAddresses</i> should be set to zero. The function will return the required buffer size in <i>lpdwcbAddresses</i> and an error code of <b>ERROR_BUFFER_TOO_SMALL</b>.
     * 
     * </div>
     * <div> </div>
     * @param {Pointer<Integer>} lpdwcRasAutodialAddresses Pointer to a variable that receives the number of address strings returned in the <i>lppAddresses</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> was passed for the <i>lpdwcbAddresses</i> or <i>lpdwcAddresses</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lppAddresses</i> buffer was <b>NULL</b> and <i>lpdwcbAddresses</i> was zero. The function returns the required buffer size in the variable pointed to by <i>lpdwcbAddresses</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasenumautodialaddressesw
     * @since windows5.0
     */
    static RasEnumAutodialAddressesW(lppRasAutodialAddresses, lpdwcbRasAutodialAddresses, lpdwcRasAutodialAddresses) {
        lpdwcbRasAutodialAddressesMarshal := lpdwcbRasAutodialAddresses is VarRef ? "uint*" : "ptr"
        lpdwcRasAutodialAddressesMarshal := lpdwcRasAutodialAddresses is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasEnumAutodialAddressesW", "ptr", lppRasAutodialAddresses, lpdwcbRasAutodialAddressesMarshal, lpdwcbRasAutodialAddresses, lpdwcRasAutodialAddressesMarshal, lpdwcRasAutodialAddresses, "uint")
        return result
    }

    /**
     * The RasGetAutodialEnable function indicates whether the AutoDial feature is enabled for a specified TAPI dialing location. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetAutodialEnable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} param0 
     * @param {Pointer<BOOL>} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetautodialenablea
     * @since windows5.0
     */
    static RasGetAutodialEnableA(param0, param1) {
        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetAutodialEnableA", "uint", param0, param1Marshal, param1, "uint")
        return result
    }

    /**
     * The RasGetAutodialEnable function indicates whether the AutoDial feature is enabled for a specified TAPI dialing location. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetAutodialEnable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} param0 
     * @param {Pointer<BOOL>} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetautodialenablew
     * @since windows5.0
     */
    static RasGetAutodialEnableW(param0, param1) {
        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetAutodialEnableW", "uint", param0, param1Marshal, param1, "uint")
        return result
    }

    /**
     * The RasSetAutodialEnable function enables or disables the AutoDial feature for a specified TAPI dialing location. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasSetAutodialEnable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} param0 
     * @param {BOOL} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is a non-zero error code from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetautodialenablea
     * @since windows5.0
     */
    static RasSetAutodialEnableA(param0, param1) {
        result := DllCall("RASAPI32.dll\RasSetAutodialEnableA", "uint", param0, "int", param1, "uint")
        return result
    }

    /**
     * The RasSetAutodialEnable function enables or disables the AutoDial feature for a specified TAPI dialing location. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasSetAutodialEnable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} param0 
     * @param {BOOL} param1 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is a non-zero error code from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetautodialenablew
     * @since windows5.0
     */
    static RasSetAutodialEnableW(param0, param1) {
        result := DllCall("RASAPI32.dll\RasSetAutodialEnableW", "uint", param0, "int", param1, "uint")
        return result
    }

    /**
     * The RasGetAutodialParam function retrieves the value of an AutoDial parameter. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetAutodialParam as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} param0 
     * @param {Pointer<Void>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwKey</i> or <i>lpvValue</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size specified by the <i>lpdwcbValue</i> is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetautodialparama
     * @since windows5.0
     */
    static RasGetAutodialParamA(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetAutodialParamA", "uint", param0, param1Marshal, param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * The RasGetAutodialParam function retrieves the value of an AutoDial parameter. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetAutodialParam as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} param0 
     * @param {Pointer<Void>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwKey</i> or <i>lpvValue</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size specified by the <i>lpdwcbValue</i> is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetautodialparamw
     * @since windows5.0
     */
    static RasGetAutodialParamW(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetAutodialParamW", "uint", param0, param1Marshal, param1, param2Marshal, param2, "uint")
        return result
    }

    /**
     * The RasSetAutodialParam function sets the value of an AutoDial parameter. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasSetAutodialParam as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwKey</i> or <i>lpvValue</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size specified by the <i>dwcbValue</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetautodialparama
     * @since windows5.0
     */
    static RasSetAutodialParamA(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall("RASAPI32.dll\RasSetAutodialParamA", "uint", param0, param1Marshal, param1, "uint", param2, "uint")
        return result
    }

    /**
     * The RasSetAutodialParam function sets the value of an AutoDial parameter. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasSetAutodialParam as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwKey</i> or <i>lpvValue</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size specified by the <i>dwcbValue</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetautodialparamw
     * @since windows5.0
     */
    static RasSetAutodialParamW(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall("RASAPI32.dll\RasSetAutodialParamW", "uint", param0, param1Marshal, param1, "uint", param2, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszPCscf 
     * @returns {Integer} 
     */
    static RasGetPCscf(lpszPCscf) {
        lpszPCscf := lpszPCscf is String ? StrPtr(lpszPCscf) : lpszPCscf

        result := DllCall("RASAPI32.dll\RasGetPCscf", "ptr", lpszPCscf, "uint")
        return result
    }

    /**
     * The RasInvokeEapUI function displays a custom user interface to obtain Extensible Authentication Protocol (EAP) information from the user.
     * @param {HRASCONN} param0 
     * @param {Integer} param1 
     * @param {Pointer<RASDIALEXTENSIONS>} param2 
     * @param {HWND} param3 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hRasConn</i> parameter is zero, or the <i>lpExtensions</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <b>dwSize</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377029(v=vs.85)">RASDIALEXTENSIONS</a> structure specifies a version of the structure that isn't supported by the operating system in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasinvokeeapui
     * @since windows5.0
     */
    static RasInvokeEapUI(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param3 := param3 is Win32Handle ? NumGet(param3, "ptr") : param3

        result := DllCall("RASAPI32.dll\RasInvokeEapUI", "ptr", param0, "uint", param1, "ptr", param2, "ptr", param3, "uint")
        return result
    }

    /**
     * The RasGetLinkStatistics function retrieves accumulated statistics for the specified link in a RAS multilink connection.
     * @param {HRASCONN} hRasConn Handle to the connection. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a> to obtain this handle.
     * @param {Integer} dwSubEntry Specifies the subentry that corresponds to the link for which to retrieve statistics.
     * @param {Pointer<RAS_STATS>} lpStatistics Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/ns-ras-ras_stats">RAS_STATS</a> structure that, on output, receives the statistics. 
     * 
     * 
     * 
     * 
     * On input, the <b>dwSize</b> member of this structure specifies the size of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/ns-ras-ras_stats">RAS_STATS</a>. Use sizeof(<b>RAS_STATS</b>) to obtain this size.
     * 
     * This parameter cannot be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true: the <i>hRasConn</i> parameter is zero, the <i>dwSubEntry</i> parameter is zero, the <i>lpStatistics</i> parameter is <b>NULL</b>, or the value specified by the <b>dwSize</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/ns-ras-ras_stats">RAS_STATS</a> structure specifies a version of the structure that is not supported by the operating system in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetlinkstatistics
     * @since windows5.0
     */
    static RasGetLinkStatistics(hRasConn, dwSubEntry, lpStatistics) {
        hRasConn := hRasConn is Win32Handle ? NumGet(hRasConn, "ptr") : hRasConn

        result := DllCall("RASAPI32.dll\RasGetLinkStatistics", "ptr", hRasConn, "uint", dwSubEntry, "ptr", lpStatistics, "uint")
        return result
    }

    /**
     * The RasGetConnectionStatistics function retrieves accumulated connection statistics for the specified connection.
     * @param {HRASCONN} hRasConn Handle to the connection. Use <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a> to obtain this handle.
     * @param {Pointer<RAS_STATS>} lpStatistics Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/ns-ras-ras_stats">RAS_STATS</a> structure that, on output, receives the statistics. 
     * 
     * 
     * 
     * 
     * On input, set the <b>dwSize</b> member of this structure to sizeof(<a href="https://docs.microsoft.com/windows/desktop/api/ras/ns-ras-ras_stats">RAS_STATS</a>).
     * 
     * This parameter cannot be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true: the <i>hRasConn</i> parameter is zero, the <i>lpStatistics</i> parameter is <b>NULL</b>, or the value specified by the <b>dwSize</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/ns-ras-ras_stats">RAS_STATS</a> structure specifies a version of the structure that is not supported by the operating system in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetconnectionstatistics
     * @since windows5.0
     */
    static RasGetConnectionStatistics(hRasConn, lpStatistics) {
        hRasConn := hRasConn is Win32Handle ? NumGet(hRasConn, "ptr") : hRasConn

        result := DllCall("RASAPI32.dll\RasGetConnectionStatistics", "ptr", hRasConn, "ptr", lpStatistics, "uint")
        return result
    }

    /**
     * The RasClearLinkStatistics functions clears any accumulated statistics for the specified link in a RAS multilink connection.
     * @param {HRASCONN} hRasConn Handle to the connection. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a> to obtain this handle.
     * @param {Integer} dwSubEntry Specifies the subentry that corresponds to the link for which to clear statistics.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hRasConn</i> parameter does not specify a valid connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwSubEntry</i> parameter is zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RAS could not find a connected port that corresponds to the value in the <i>dwSubEntry</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasclearlinkstatistics
     * @since windows5.0
     */
    static RasClearLinkStatistics(hRasConn, dwSubEntry) {
        hRasConn := hRasConn is Win32Handle ? NumGet(hRasConn, "ptr") : hRasConn

        result := DllCall("RASAPI32.dll\RasClearLinkStatistics", "ptr", hRasConn, "uint", dwSubEntry, "uint")
        return result
    }

    /**
     * The RasClearConnectionStatistics functions clears any accumulated statistics for the specified RAS connection.
     * @param {HRASCONN} hRasConn Handle to the connection. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a> to obtain this handle.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hRasConn</i> parameter does not specify a valid connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasclearconnectionstatistics
     * @since windows5.0
     */
    static RasClearConnectionStatistics(hRasConn) {
        hRasConn := hRasConn is Win32Handle ? NumGet(hRasConn, "ptr") : hRasConn

        result := DllCall("RASAPI32.dll\RasClearConnectionStatistics", "ptr", hRasConn, "uint")
        return result
    }

    /**
     * Use the RasGetEapUserData function to retrieve user-specific Extensible Authentication Protocol (EAP) information for the specified phone-book entry. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetEapUserData as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HANDLE} hToken Handle to a primary or impersonation access token that represents the user for which to retrieve data. This parameter can be <b>NULL</b> if the function is called from a process already running in the user's context.
     * @param {PSTR} pszPhonebook Pointer to a null-terminated string that specifies the full path of the phone-book (PBK) file. If this parameter is <b>NULL</b>, the function  uses the system phone book.
     * @param {PSTR} pszEntry Pointer to a null-terminated string that specifies an existing entry name.
     * @param {Pointer<Integer>} pbEapData Pointer to a buffer that receives the retrieved EAP data for the user. The caller should allocate the memory for this buffer. If the buffer is not large enough, 
     * <b>RasGetEapUserData</b>  returns <b>ERROR_BUFFER_TOO_SMALL</b>, and the <i>pdwSizeofEapData</i> parameter  contains the required size.
     * @param {Pointer<Integer>} pdwSizeofEapData Pointer to a <b>DWORD</b> variable that, on input, specifies the size of the buffer pointed to by the <i>pbEapData</i> parameter. 
     * 
     * 
     * 
     * 
     * If the buffer specified by the <i>pbEapData</i> parameter is not large enough, <i>pdwSizeofEapData</i> receives, on output, the required size.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwSizeofEapData</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>pbEapData</i> is too small to receive the data. The <i>pdwSizeofEapData</i> contains the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuserdataa">RasGetEapUserData</a> was unable to open the specified phone-book file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuserdataa">RasGetEapUserData</a> was unable to find the specified entry in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgeteapuserdataa
     * @since windows5.0
     */
    static RasGetEapUserDataA(hToken, pszPhonebook, pszEntry, pbEapData, pdwSizeofEapData) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry

        pbEapDataMarshal := pbEapData is VarRef ? "char*" : "ptr"
        pdwSizeofEapDataMarshal := pdwSizeofEapData is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetEapUserDataA", "ptr", hToken, "ptr", pszPhonebook, "ptr", pszEntry, pbEapDataMarshal, pbEapData, pdwSizeofEapDataMarshal, pdwSizeofEapData, "uint")
        return result
    }

    /**
     * Use the RasGetEapUserData function to retrieve user-specific Extensible Authentication Protocol (EAP) information for the specified phone-book entry. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetEapUserData as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HANDLE} hToken Handle to a primary or impersonation access token that represents the user for which to retrieve data. This parameter can be <b>NULL</b> if the function is called from a process already running in the user's context.
     * @param {PWSTR} pszPhonebook Pointer to a null-terminated string that specifies the full path of the phone-book (PBK) file. If this parameter is <b>NULL</b>, the function  uses the system phone book.
     * @param {PWSTR} pszEntry Pointer to a null-terminated string that specifies an existing entry name.
     * @param {Pointer<Integer>} pbEapData Pointer to a buffer that receives the retrieved EAP data for the user. The caller should allocate the memory for this buffer. If the buffer is not large enough, 
     * <b>RasGetEapUserData</b>  returns <b>ERROR_BUFFER_TOO_SMALL</b>, and the <i>pdwSizeofEapData</i> parameter  contains the required size.
     * @param {Pointer<Integer>} pdwSizeofEapData Pointer to a <b>DWORD</b> variable that, on input, specifies the size of the buffer pointed to by the <i>pbEapData</i> parameter. 
     * 
     * 
     * 
     * 
     * If the buffer specified by the <i>pbEapData</i> parameter is not large enough, <i>pdwSizeofEapData</i> receives, on output, the required size.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwSizeofEapData</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>pbEapData</i> is too small to receive the data. The <i>pdwSizeofEapData</i> contains the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuserdataa">RasGetEapUserData</a> was unable to open the specified phone-book file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuserdataa">RasGetEapUserData</a> was unable to find the specified entry in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgeteapuserdataw
     * @since windows5.0
     */
    static RasGetEapUserDataW(hToken, pszPhonebook, pszEntry, pbEapData, pdwSizeofEapData) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry

        pbEapDataMarshal := pbEapData is VarRef ? "char*" : "ptr"
        pdwSizeofEapDataMarshal := pdwSizeofEapData is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetEapUserDataW", "ptr", hToken, "ptr", pszPhonebook, "ptr", pszEntry, pbEapDataMarshal, pbEapData, pdwSizeofEapDataMarshal, pdwSizeofEapData, "uint")
        return result
    }

    /**
     * Use the RasSetEapUserData function to store user-specific Extensible Authentication Protocol (EAP) information for the specified phone-book entry in the registry. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasSetEapUserData as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HANDLE} hToken Handle to a primary or impersonation access token that represents the user for which to store data. This parameter can be <b>NULL</b> if the function is called from a process already running in the user's context.
     * @param {PSTR} pszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path of the phone-book (PBK) file. If this parameter is <b>NULL</b>, the function  uses the system phone book.
     * @param {PSTR} pszEntry Pointer to a <b>null</b>-terminated string that specifies an existing entry name.
     * @param {Pointer<Integer>} pbEapData Pointer to the data to store for the user.
     * @param {Integer} dwSizeofEapData Specifies the size of the data pointed to by the <i>pbEapData</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwSizeofEapData</i> parameter is zero, or the <i>pbEapData</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>RasSetEapUserData</b> was unable to open the specified phone-book file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>RasSetEapUserData</b> was unable to find the specified entry in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasseteapuserdataa
     * @since windows5.0
     */
    static RasSetEapUserDataA(hToken, pszPhonebook, pszEntry, pbEapData, dwSizeofEapData) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry

        pbEapDataMarshal := pbEapData is VarRef ? "char*" : "ptr"

        result := DllCall("RASAPI32.dll\RasSetEapUserDataA", "ptr", hToken, "ptr", pszPhonebook, "ptr", pszEntry, pbEapDataMarshal, pbEapData, "uint", dwSizeofEapData, "uint")
        return result
    }

    /**
     * Use the RasSetEapUserData function to store user-specific Extensible Authentication Protocol (EAP) information for the specified phone-book entry in the registry. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasSetEapUserData as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HANDLE} hToken Handle to a primary or impersonation access token that represents the user for which to store data. This parameter can be <b>NULL</b> if the function is called from a process already running in the user's context.
     * @param {PWSTR} pszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path of the phone-book (PBK) file. If this parameter is <b>NULL</b>, the function  uses the system phone book.
     * @param {PWSTR} pszEntry Pointer to a <b>null</b>-terminated string that specifies an existing entry name.
     * @param {Pointer<Integer>} pbEapData Pointer to the data to store for the user.
     * @param {Integer} dwSizeofEapData Specifies the size of the data pointed to by the <i>pbEapData</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwSizeofEapData</i> parameter is zero, or the <i>pbEapData</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>RasSetEapUserData</b> was unable to open the specified phone-book file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>RasSetEapUserData</b> was unable to find the specified entry in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasseteapuserdataw
     * @since windows5.0
     */
    static RasSetEapUserDataW(hToken, pszPhonebook, pszEntry, pbEapData, dwSizeofEapData) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry

        pbEapDataMarshal := pbEapData is VarRef ? "char*" : "ptr"

        result := DllCall("RASAPI32.dll\RasSetEapUserDataW", "ptr", hToken, "ptr", pszPhonebook, "ptr", pszEntry, pbEapDataMarshal, pbEapData, "uint", dwSizeofEapData, "uint")
        return result
    }

    /**
     * Use the RasGetCustomAuthData function to retrieve connection-specific authentication information. This information is not specific to a particular user. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetCustomAuthData as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} pszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path of the phone-book (PBK) file. If this parameter is <b>NULL</b>, the function  uses the system phone book.
     * @param {PSTR} pszEntry Pointer to a <b>null</b>-terminated string that specifies an existing entry name.
     * @param {Pointer} pbCustomAuthData Pointer to a buffer that receives the authentication data. The caller should allocate the memory for this buffer. If the buffer is not large enough, 
     * <b>RasGetCustomAuthData</b>  returns ERROR_BUFFER_TOO_SMALL, and the <i>pdwSizeofEapData</i> parameter  contains the required size.
     * @param {Pointer<Integer>} pdwSizeofCustomAuthData Pointer to a <b>DWORD</b> variable that, on input, specifies the size of the buffer pointed to by the <i>pbCustomAuthData</i> parameter. 
     * 
     * 
     * 
     * 
     * If the buffer specified by the <i>pbCustomAuthData</i> parameter is not large enough, <i>pdwSizeofEapData</i> receives, on output, the required size.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwSizeofCustomAuthData</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>pbCustomAuthData</i> is too small to receive the data. The <i>pdwSizeofCustomAuthData</i> contains the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuserdataa">RasGetEapUserData</a> was unable to open the specified phone-book file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuserdataa">RasGetEapUserData</a> was unable to find the specified entry in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetcustomauthdataa
     * @since windows5.0
     */
    static RasGetCustomAuthDataA(pszPhonebook, pszEntry, pbCustomAuthData, pdwSizeofCustomAuthData) {
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry

        pdwSizeofCustomAuthDataMarshal := pdwSizeofCustomAuthData is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetCustomAuthDataA", "ptr", pszPhonebook, "ptr", pszEntry, "ptr", pbCustomAuthData, pdwSizeofCustomAuthDataMarshal, pdwSizeofCustomAuthData, "uint")
        return result
    }

    /**
     * Use the RasGetCustomAuthData function to retrieve connection-specific authentication information. This information is not specific to a particular user. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasGetCustomAuthData as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} pszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path of the phone-book (PBK) file. If this parameter is <b>NULL</b>, the function  uses the system phone book.
     * @param {PWSTR} pszEntry Pointer to a <b>null</b>-terminated string that specifies an existing entry name.
     * @param {Pointer} pbCustomAuthData Pointer to a buffer that receives the authentication data. The caller should allocate the memory for this buffer. If the buffer is not large enough, 
     * <b>RasGetCustomAuthData</b>  returns ERROR_BUFFER_TOO_SMALL, and the <i>pdwSizeofEapData</i> parameter  contains the required size.
     * @param {Pointer<Integer>} pdwSizeofCustomAuthData Pointer to a <b>DWORD</b> variable that, on input, specifies the size of the buffer pointed to by the <i>pbCustomAuthData</i> parameter. 
     * 
     * 
     * 
     * 
     * If the buffer specified by the <i>pbCustomAuthData</i> parameter is not large enough, <i>pdwSizeofEapData</i> receives, on output, the required size.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwSizeofCustomAuthData</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>pbCustomAuthData</i> is too small to receive the data. The <i>pdwSizeofCustomAuthData</i> contains the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuserdataa">RasGetEapUserData</a> was unable to open the specified phone-book file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuserdataa">RasGetEapUserData</a> was unable to find the specified entry in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetcustomauthdataw
     * @since windows5.0
     */
    static RasGetCustomAuthDataW(pszPhonebook, pszEntry, pbCustomAuthData, pdwSizeofCustomAuthData) {
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry

        pdwSizeofCustomAuthDataMarshal := pdwSizeofCustomAuthData is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetCustomAuthDataW", "ptr", pszPhonebook, "ptr", pszEntry, "ptr", pbCustomAuthData, pdwSizeofCustomAuthDataMarshal, pdwSizeofCustomAuthData, "uint")
        return result
    }

    /**
     * Use the RasSetCustomAuthData function to set connection-specific authentication information. This information should not be specific to a particular user. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasSetCustomAuthData as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} pszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path of the phone-book (PBK) file. If this parameter is <b>NULL</b>, the function  uses the system phone book.
     * @param {PSTR} pszEntry Pointer to a <b>null</b>-terminated string that specifies an existing entry name.
     * @param {Pointer} pbCustomAuthData Pointer to a buffer that specifies the new authentication data.
     * @param {Integer} dwSizeofCustomAuthData Specifies the size of the data pointed to by the <i>pbCustomAuthData</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwSizeofCustomAuthData</i> parameter is zero, or the <i>pbCustomAuthData</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasseteapuserdataa">RasSetEapUserData</a> was unable to open the specified phone-book file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasseteapuserdataa">RasSetEapUserData</a> was unable to find the specified entry in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetcustomauthdataa
     * @since windows5.0
     */
    static RasSetCustomAuthDataA(pszPhonebook, pszEntry, pbCustomAuthData, dwSizeofCustomAuthData) {
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry

        result := DllCall("RASAPI32.dll\RasSetCustomAuthDataA", "ptr", pszPhonebook, "ptr", pszEntry, "ptr", pbCustomAuthData, "uint", dwSizeofCustomAuthData, "uint")
        return result
    }

    /**
     * Use the RasSetCustomAuthData function to set connection-specific authentication information. This information should not be specific to a particular user. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasSetCustomAuthData as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} pszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path of the phone-book (PBK) file. If this parameter is <b>NULL</b>, the function  uses the system phone book.
     * @param {PWSTR} pszEntry Pointer to a <b>null</b>-terminated string that specifies an existing entry name.
     * @param {Pointer} pbCustomAuthData Pointer to a buffer that specifies the new authentication data.
     * @param {Integer} dwSizeofCustomAuthData Specifies the size of the data pointed to by the <i>pbCustomAuthData</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwSizeofCustomAuthData</i> parameter is zero, or the <i>pbCustomAuthData</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasseteapuserdataa">RasSetEapUserData</a> was unable to open the specified phone-book file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasseteapuserdataa">RasSetEapUserData</a> was unable to find the specified entry in the phone book.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rassetcustomauthdataw
     * @since windows5.0
     */
    static RasSetCustomAuthDataW(pszPhonebook, pszEntry, pbCustomAuthData, dwSizeofCustomAuthData) {
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry

        result := DllCall("RASAPI32.dll\RasSetCustomAuthDataW", "ptr", pszPhonebook, "ptr", pszEntry, "ptr", pbCustomAuthData, "uint", dwSizeofCustomAuthData, "uint")
        return result
    }

    /**
     * The RasGetEapUserIdentity function retrieves identity information for the current user. Use this information to call RasDial with a phone-book entry that requires Extensible Authentication Protocol (EAP). (Unicode)
     * @remarks
     * <b>RasGetEapUserIdentity</b> calls the RAS function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuserdataa">RasGetEapUserData</a> and the EAP function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/raseapif/nf-raseapif-raseapgetidentity">RasEapGetIdentity</a>. <b>RasEapGetIdentity</b> is implemented by the authentication protocol.
     * 
     * If the function succeeds, that is the return value is NO_ERROR, the caller should copy the EAP identity information from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377247(v=vs.85)">RASEAPUSERIDENTITY</a> structure pointed to by 
     * the <i>ppRasEapUserIdentity</i> parameter to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377029(v=vs.85)">RASDIALEXTENSIONS</a> structures used in the call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>.
     * 
     * If the remote access application being developed has a graphical user interface, the caller of 
     * <b>RasGetEapUserIdentity</b> should not specify the RASEAPF_NonInteractive flag. If the application has a command-line user interface, the caller may want to specify the RASEAPF_NonInteractive flag to prevent the authentication protocol from displaying a graphical user interface.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetEapUserIdentity as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} pszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path of the phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the system phone book.
     * @param {PWSTR} pszEntry Pointer to a <b>null</b>-terminated string that specifies an existing entry name.
     * @param {Integer} dwFlags Specifies zero or more of the following flags that qualify the authentication process.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASEAPF_NonInteractive"></a><a id="raseapf_noninteractive"></a><a id="RASEAPF_NONINTERACTIVE"></a><dl>
     * <dt><b>RASEAPF_NonInteractive</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the authentication protocol should not bring up a graphical user-interface. If this flag is not present, it is okay for the protocol to display a user interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASEAPF_Logon"></a><a id="raseapf_logon"></a><a id="RASEAPF_LOGON"></a><dl>
     * <dt><b>RASEAPF_Logon</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the user data is obtained from WinLogon.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASEAPF_Preview"></a><a id="raseapf_preview"></a><a id="RASEAPF_PREVIEW"></a><dl>
     * <dt><b>RASEAPF_Preview</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the user should be prompted for identity information before dialing.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {HWND} hwnd Handle to the parent window for the UI dialog. If the <i>fInvokeUI</i> parameter is <b>FALSE</b>, then <i>hwnd</i> should be <b>NULL</b>.
     * @param {Pointer<Pointer<RASEAPUSERIDENTITYW>>} ppRasEapUserIdentity Pointer to a pointer that, on successful return, receives the address of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377247(v=vs.85)">RASEAPUSERIDENTITY</a> structure that contains EAP user identity information. 
     * <b>RasGetEapUserIdentity</b> allocates the memory buffer for the 
     * <b>RASEAPUSERIDENTITY</b> structure. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasfreeeapuseridentitya">RasFreeEapUserIdentity</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pcbEapUserIdentity</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERACTIVE_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was called with the RASEAPF_NonInteractive flag. However, the authentication protocol must display a UI in order to obtain the required identity information from the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION_FOR_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either the authentication method for this phone-book entry is not EAP, or the authentication method is EAP but the protocol uses the standard Windows NT/Windows 2000 credentials dialog to obtain user identity information. In either case, the caller does not need to pass EAP identity information to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RASMAN_CANNOT_INITIALIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Remote Access Service failed to initialize properly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgeteapuseridentityw
     * @since windows5.0
     */
    static RasGetEapUserIdentityW(pszPhonebook, pszEntry, dwFlags, hwnd, ppRasEapUserIdentity) {
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        ppRasEapUserIdentityMarshal := ppRasEapUserIdentity is VarRef ? "ptr*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetEapUserIdentityW", "ptr", pszPhonebook, "ptr", pszEntry, "uint", dwFlags, "ptr", hwnd, ppRasEapUserIdentityMarshal, ppRasEapUserIdentity, "uint")
        return result
    }

    /**
     * The RasGetEapUserIdentity function retrieves identity information for the current user. Use this information to call RasDial with a phone-book entry that requires Extensible Authentication Protocol (EAP). (ANSI)
     * @remarks
     * <b>RasGetEapUserIdentity</b> calls the RAS function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuserdataa">RasGetEapUserData</a> and the EAP function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/raseapif/nf-raseapif-raseapgetidentity">RasEapGetIdentity</a>. <b>RasEapGetIdentity</b> is implemented by the authentication protocol.
     * 
     * If the function succeeds, that is the return value is NO_ERROR, the caller should copy the EAP identity information from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377247(v=vs.85)">RASEAPUSERIDENTITY</a> structure pointed to by 
     * the <i>ppRasEapUserIdentity</i> parameter to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377029(v=vs.85)">RASDIALEXTENSIONS</a> structures used in the call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>.
     * 
     * If the remote access application being developed has a graphical user interface, the caller of 
     * <b>RasGetEapUserIdentity</b> should not specify the RASEAPF_NonInteractive flag. If the application has a command-line user interface, the caller may want to specify the RASEAPF_NonInteractive flag to prevent the authentication protocol from displaying a graphical user interface.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasGetEapUserIdentity as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} pszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path of the phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the system phone book.
     * @param {PSTR} pszEntry Pointer to a <b>null</b>-terminated string that specifies an existing entry name.
     * @param {Integer} dwFlags Specifies zero or more of the following flags that qualify the authentication process.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASEAPF_NonInteractive"></a><a id="raseapf_noninteractive"></a><a id="RASEAPF_NONINTERACTIVE"></a><dl>
     * <dt><b>RASEAPF_NonInteractive</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the authentication protocol should not bring up a graphical user-interface. If this flag is not present, it is okay for the protocol to display a user interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASEAPF_Logon"></a><a id="raseapf_logon"></a><a id="RASEAPF_LOGON"></a><dl>
     * <dt><b>RASEAPF_Logon</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the user data is obtained from WinLogon.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASEAPF_Preview"></a><a id="raseapf_preview"></a><a id="RASEAPF_PREVIEW"></a><dl>
     * <dt><b>RASEAPF_Preview</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the user should be prompted for identity information before dialing.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {HWND} hwnd Handle to the parent window for the UI dialog. If the <i>fInvokeUI</i> parameter is <b>FALSE</b>, then <i>hwnd</i> should be <b>NULL</b>.
     * @param {Pointer<Pointer<RASEAPUSERIDENTITYA>>} ppRasEapUserIdentity Pointer to a pointer that, on successful return, receives the address of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377247(v=vs.85)">RASEAPUSERIDENTITY</a> structure that contains EAP user identity information. 
     * <b>RasGetEapUserIdentity</b> allocates the memory buffer for the 
     * <b>RASEAPUSERIDENTITY</b> structure. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasfreeeapuseridentitya">RasFreeEapUserIdentity</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pcbEapUserIdentity</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERACTIVE_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was called with the RASEAPF_NonInteractive flag. However, the authentication protocol must display a UI in order to obtain the required identity information from the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION_FOR_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either the authentication method for this phone-book entry is not EAP, or the authentication method is EAP but the protocol uses the standard Windows NT/Windows 2000 credentials dialog to obtain user identity information. In either case, the caller does not need to pass EAP identity information to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RASMAN_CANNOT_INITIALIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Remote Access Service failed to initialize properly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgeteapuseridentitya
     * @since windows5.0
     */
    static RasGetEapUserIdentityA(pszPhonebook, pszEntry, dwFlags, hwnd, ppRasEapUserIdentity) {
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        ppRasEapUserIdentityMarshal := ppRasEapUserIdentity is VarRef ? "ptr*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetEapUserIdentityA", "ptr", pszPhonebook, "ptr", pszEntry, "uint", dwFlags, "ptr", hwnd, ppRasEapUserIdentityMarshal, ppRasEapUserIdentity, "uint")
        return result
    }

    /**
     * Use the RasFreeEapUserIdentity function to free the memory buffer returned by RasGetEapUserIdentity. (Unicode)
     * @remarks
     * <b>RasFreeEapUserIdentity</b> can be called with the <i>pRasEapUserIdentity</i> parameter equal to <b>NULL</b>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasFreeEapUserIdentity as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<RASEAPUSERIDENTITYW>} pRasEapUserIdentity Pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377247(v=vs.85)">RASEAPUSERIDENTITY</a> structure returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuseridentitya">RasGetEapUserIdentity</a> function. 
     * <b>RasFreeEapUserIdentity</b> frees the memory occupied by this structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasfreeeapuseridentityw
     * @since windows5.0
     */
    static RasFreeEapUserIdentityW(pRasEapUserIdentity) {
        DllCall("RASAPI32.dll\RasFreeEapUserIdentityW", "ptr", pRasEapUserIdentity)
    }

    /**
     * Use the RasFreeEapUserIdentity function to free the memory buffer returned by RasGetEapUserIdentity. (ANSI)
     * @remarks
     * <b>RasFreeEapUserIdentity</b> can be called with the <i>pRasEapUserIdentity</i> parameter equal to <b>NULL</b>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ras.h header defines RasFreeEapUserIdentity as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<RASEAPUSERIDENTITYA>} pRasEapUserIdentity Pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377247(v=vs.85)">RASEAPUSERIDENTITY</a> structure returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeteapuseridentitya">RasGetEapUserIdentity</a> function. 
     * <b>RasFreeEapUserIdentity</b> frees the memory occupied by this structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasfreeeapuseridentitya
     * @since windows5.0
     */
    static RasFreeEapUserIdentityA(pRasEapUserIdentity) {
        DllCall("RASAPI32.dll\RasFreeEapUserIdentityA", "ptr", pRasEapUserIdentity)
    }

    /**
     * The RasDeleteSubEntry function deletes the specified subentry from the specified phone-book entry. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasDeleteSubEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} pszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file.
     * @param {PSTR} pszEntry Pointer to a <b>null</b>-terminated string that contains the name of an existing entry from which a subentry is to be deleted.
     * @param {Integer} dwSubentryId TBD
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasdeletesubentrya
     * @since windows5.1.2600
     */
    static RasDeleteSubEntryA(pszPhonebook, pszEntry, dwSubentryId) {
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry

        result := DllCall("RASAPI32.dll\RasDeleteSubEntryA", "ptr", pszPhonebook, "ptr", pszEntry, "uint", dwSubentryId, "uint")
        return result
    }

    /**
     * The RasDeleteSubEntry function deletes the specified subentry from the specified phone-book entry. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The ras.h header defines RasDeleteSubEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} pszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file.
     * @param {PWSTR} pszEntry Pointer to a <b>null</b>-terminated string that contains the name of an existing entry from which a subentry is to be deleted.
     * @param {Integer} dwSubEntryId Specifies the one-based index of the subentry.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasdeletesubentryw
     * @since windows5.1.2600
     */
    static RasDeleteSubEntryW(pszPhonebook, pszEntry, dwSubEntryId) {
        pszPhonebook := pszPhonebook is String ? StrPtr(pszPhonebook) : pszPhonebook
        pszEntry := pszEntry is String ? StrPtr(pszEntry) : pszEntry

        result := DllCall("RASAPI32.dll\RasDeleteSubEntryW", "ptr", pszPhonebook, "ptr", pszEntry, "uint", dwSubEntryId, "uint")
        return result
    }

    /**
     * The RasUpdateConnection function updates the tunnel endpoints of an Internet Key Exchange version 2 (IKEv2) connection.
     * @remarks
     * Note that 32-bit applications that call <b>RasUpdateConnection</b> will fail when run on a 64-bit machine. The workaround is to write a 64-bit version of the application for 64-bit machines.
     * @param {HRASCONN} hrasconn A handle to the IKEv2 RAS connection for which the tunnel endpoints are to be changed. This can be a handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a> function.
     * @param {Pointer<RASUPDATECONN>} lprasupdateconn A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd408110(v=vs.85)">RASUPDATECONN</a> structure that contains the new tunnel endpoints  for the RAS connection specified by <i>hrasconn</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the error codes from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasupdateconnection
     * @since windows6.1
     */
    static RasUpdateConnection(hrasconn, lprasupdateconn) {
        hrasconn := hrasconn is Win32Handle ? NumGet(hrasconn, "ptr") : hrasconn

        result := DllCall("RASAPI32.dll\RasUpdateConnection", "ptr", hrasconn, "ptr", lprasupdateconn, "uint")
        return result
    }

    /**
     * Obtains information about Point-to-Point Protocol (PPP) or Internet Key Exchange version 2 (IKEv2) remote access projection operations for all RAS connections on the local client.
     * @remarks
     * Remote access projection is the process whereby a remote access server and a remote client negotiate network protocol-specific information. A remote access server uses this network protocol-specific information to represent a remote client on the network.
     * 
     * Remote access projection information is not available until the operating system has executed the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376727(v=vs.85)">RASCS_Projected</a> state on the remote access connection. If 
     * <b>RasGetProjectionInfoEx</b> is called prior to the <b>RASCS_Projected</b> state, it returns <b>ERROR_PROJECTION_NOT_COMPLETE</b>.
     * @param {HRASCONN} hrasconn A handle to the RAS connection for which the tunnel endpoints are to be changed. This can be a handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a> function.
     * @param {Pointer<RAS_PROJECTION_INFO>} pRasProjection A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ras/ns-ras-ras_projection_info">RAS_PROJECTION_INFO</a> structure that receives the projection information for the RAS connections.
     * @param {Pointer<Integer>} lpdwSize A pointer, in input, that specifies the size, in bytes, of the buffer pointed to by pRasProjection. On output, this variable receives the size, in bytes, of the buffer needed to store the number of <a href="https://docs.microsoft.com/windows/desktop/api/ras/ns-ras-ras_projection_info">RAS_PROJECTION_INFO</a> structures pointed to by 
     * 					<i>pRasProjection</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes or a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>pRasProjection</i> is not large enough to contain the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hrasconn</i> parameter is not a valid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was called with an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwSize</i> member of the structure pointed to by <i>pRasProjection</i> specifies an invalid size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PROTOCOL_NOT_CONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control protocol for which information was requested neither succeeded nor failed, because the connection's phone-book entry did not require that an attempt to negotiate the protocol be made.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ras/nf-ras-rasgetprojectioninfoex
     * @since windows6.1
     */
    static RasGetProjectionInfoEx(hrasconn, pRasProjection, lpdwSize) {
        hrasconn := hrasconn is Win32Handle ? NumGet(hrasconn, "ptr") : hrasconn

        lpdwSizeMarshal := lpdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("RASAPI32.dll\RasGetProjectionInfoEx", "ptr", hrasconn, "ptr", pRasProjection, lpdwSizeMarshal, lpdwSize, "uint")
        return result
    }

    /**
     * The RasPhonebookDlg function displays the main Dial-Up Networking dialog box. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The rasdlg.h header defines RasPhonebookDlg as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} lpszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file. The default phone-book file is the one selected by the user in the <b>User Preferences</b> property sheet of the <b>Dial-Up Networking</b> dialog box.
     * @param {PSTR} lpszEntry Pointer to a <b>null</b>-terminated string that specifies the name of the phone-book entry to highlight initially. If this parameter is <b>NULL</b>, or if the specified entry does not exist, the dialog box highlights the first entry in the alphabetic list.
     * @param {Pointer<RASPBDLGA>} lpInfo Pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377607(v=vs.85)">RASPBDLG</a> structure that specifies additional input and output parameters. 
     * 
     * 
     * 
     * 
     * On input, the <b>dwSize</b> member of this structure must specify the sizeof(
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377607(v=vs.85)">RASPBDLG</a>).
     * 
     * If an error occurs, the <b>dwError</b> member of the structure receives, on output, an error code; otherwise, it receives zero.
     * @returns {BOOL} If the user selects the <b>Connect</b> button and the function establishes a connection, the return value is <b>TRUE</b>. Otherwise, the function returns <b>FALSE</b>.
     * 
     *  If an error occurs, the <b>dwError</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377607(v=vs.85)">RASPBDLG</a> structure returns a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * The following sample code brings up the <b>Dial-Up Networking</b> dialog. The dialog  displays dialing information for the first entry from the default phonebook file.
     * 
     * 
     * ```cpp
     * @see https://learn.microsoft.com/windows/win32/api/rasdlg/nf-rasdlg-rasphonebookdlga
     * @since windows5.0
     */
    static RasPhonebookDlgA(lpszPhonebook, lpszEntry, lpInfo) {
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook
        lpszEntry := lpszEntry is String ? StrPtr(lpszEntry) : lpszEntry

        result := DllCall("RASDLG.dll\RasPhonebookDlgA", "ptr", lpszPhonebook, "ptr", lpszEntry, "ptr", lpInfo, "int")
        return result
    }

    /**
     * The RasPhonebookDlg function displays the main Dial-Up Networking dialog box. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The rasdlg.h header defines RasPhonebookDlg as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} lpszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file. The default phone-book file is the one selected by the user in the <b>User Preferences</b> property sheet of the <b>Dial-Up Networking</b> dialog box.
     * @param {PWSTR} lpszEntry Pointer to a <b>null</b>-terminated string that specifies the name of the phone-book entry to highlight initially. If this parameter is <b>NULL</b>, or if the specified entry does not exist, the dialog box highlights the first entry in the alphabetic list.
     * @param {Pointer<RASPBDLGW>} lpInfo Pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377607(v=vs.85)">RASPBDLG</a> structure that specifies additional input and output parameters. 
     * 
     * 
     * 
     * 
     * On input, the <b>dwSize</b> member of this structure must specify the sizeof(
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377607(v=vs.85)">RASPBDLG</a>).
     * 
     * If an error occurs, the <b>dwError</b> member of the structure receives, on output, an error code; otherwise, it receives zero.
     * @returns {BOOL} If the user selects the <b>Connect</b> button and the function establishes a connection, the return value is <b>TRUE</b>. Otherwise, the function returns <b>FALSE</b>.
     * 
     *  If an error occurs, the <b>dwError</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377607(v=vs.85)">RASPBDLG</a> structure returns a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * 
     * The following sample code brings up the <b>Dial-Up Networking</b> dialog. The dialog  displays dialing information for the first entry from the default phonebook file.
     * 
     * 
     * ```cpp
     * @see https://learn.microsoft.com/windows/win32/api/rasdlg/nf-rasdlg-rasphonebookdlgw
     * @since windows5.0
     */
    static RasPhonebookDlgW(lpszPhonebook, lpszEntry, lpInfo) {
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook
        lpszEntry := lpszEntry is String ? StrPtr(lpszEntry) : lpszEntry

        result := DllCall("RASDLG.dll\RasPhonebookDlgW", "ptr", lpszPhonebook, "ptr", lpszEntry, "ptr", lpInfo, "int")
        return result
    }

    /**
     * The RasEntryDlg function displays modal property sheets that allow a user to manipulate phone-book entries. (ANSI)
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rascreatephonebookentrya">RasCreatePhonebookEntry</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-raseditphonebookentrya">RasEditPhonebookEntry</a> functions call the 
     * <b>RasEntryDlg</b> function.
     * 
     * The following sample code brings up a property sheet to create a new entry. The <i>lpszEntry</i> variable specifies the default name for the new entry.
     * 
     * 
     * ```cpp
     * @param {PSTR} lpszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file. The default phone-book file is the one selected by the user in the <b>User Preferences</b> property sheet of the <b>Dial-Up Networking</b> dialog box.
     * @param {PSTR} lpszEntry Pointer to a <b>null</b>-terminated string that specifies the name of the phone-book entry to edit, copy, or create. 
     * 
     * 
     * 
     * 
     * If you are editing or copying an entry, this parameter is the name of an existing phone-book entry. If you are copying an entry, set the <b>RASEDFLAG_CloneEntry</b> flag in the <b>dwFlags</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377023(v=vs.85)">RASENTRYDLG</a> structure.
     * 
     * <div class="alert"><b>Note</b>  The <b>RASEDFLAG_CloneEntry</b> flag has been deprecated, as of 
     *   Windows Vista and Windows Server 2008. It may be altered or unavailable in subsequent versions. Instead, copy an entry by calling <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetentrypropertiesa">RasGetEntryProperties</a> to get the entry and then calling <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrypropertiesa">RasSetEntryProperties</a> to save the entry with a new name.</div>
     * <div> </div>
     * If you are creating an entry, this parameter is a default new entry name that the user can change. If this parameter is <b>NULL</b>, the function provides a default name. If you are creating an entry, set the <b>RASEDFLAG_NewEntry</b> flag in the <b>dwFlags</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377023(v=vs.85)">RASENTRYDLG</a> structure.
     * @param {Pointer<RASENTRYDLGA>} lpInfo Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a> structure that specifies additional input and output parameters. The <b>dwSize</b> member of this structure must specify sizeof(<b>RASENTRYDLG</b>). Use the <b>dwFlags</b> member to indicate whether you are creating, editing, or copying an entry. If an error occurs, the <b>dwError</b> member returns an error code; otherwise, it returns zero.
     * @returns {BOOL} If the user creates, copies, or edits a phone-book entry, the return value is <b>TRUE</b>. Otherwise, the function returns <b>FALSE</b>.
     * 
     *  If an error occurs, <b>RasEntryDlg</b> sets the <b>dwError</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a> structure to a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/rasdlg/nf-rasdlg-rasentrydlga
     * @since windows5.0
     */
    static RasEntryDlgA(lpszPhonebook, lpszEntry, lpInfo) {
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook
        lpszEntry := lpszEntry is String ? StrPtr(lpszEntry) : lpszEntry

        result := DllCall("RASDLG.dll\RasEntryDlgA", "ptr", lpszPhonebook, "ptr", lpszEntry, "ptr", lpInfo, "int")
        return result
    }

    /**
     * The RasEntryDlg function displays modal property sheets that allow a user to manipulate phone-book entries. (Unicode)
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rascreatephonebookentrya">RasCreatePhonebookEntry</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-raseditphonebookentrya">RasEditPhonebookEntry</a> functions call the 
     * <b>RasEntryDlg</b> function.
     * 
     * The following sample code brings up a property sheet to create a new entry. The <i>lpszEntry</i> variable specifies the default name for the new entry.
     * 
     * 
     * ```cpp
     * @param {PWSTR} lpszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file. The default phone-book file is the one selected by the user in the <b>User Preferences</b> property sheet of the <b>Dial-Up Networking</b> dialog box.
     * @param {PWSTR} lpszEntry Pointer to a <b>null</b>-terminated string that specifies the name of the phone-book entry to edit, copy, or create. 
     * 
     * 
     * 
     * 
     * If you are editing or copying an entry, this parameter is the name of an existing phone-book entry. If you are copying an entry, set the <b>RASEDFLAG_CloneEntry</b> flag in the <b>dwFlags</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377023(v=vs.85)">RASENTRYDLG</a> structure.
     * 
     * <div class="alert"><b>Note</b>  The <b>RASEDFLAG_CloneEntry</b> flag has been deprecated, as of 
     *   Windows Vista and Windows Server 2008. It may be altered or unavailable in subsequent versions. Instead, copy an entry by calling <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetentrypropertiesa">RasGetEntryProperties</a> to get the entry and then calling <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrypropertiesa">RasSetEntryProperties</a> to save the entry with a new name.</div>
     * <div> </div>
     * If you are creating an entry, this parameter is a default new entry name that the user can change. If this parameter is <b>NULL</b>, the function provides a default name. If you are creating an entry, set the <b>RASEDFLAG_NewEntry</b> flag in the <b>dwFlags</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377023(v=vs.85)">RASENTRYDLG</a> structure.
     * @param {Pointer<RASENTRYDLGW>} lpInfo Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a> structure that specifies additional input and output parameters. The <b>dwSize</b> member of this structure must specify sizeof(<b>RASENTRYDLG</b>). Use the <b>dwFlags</b> member to indicate whether you are creating, editing, or copying an entry. If an error occurs, the <b>dwError</b> member returns an error code; otherwise, it returns zero.
     * @returns {BOOL} If the user creates, copies, or edits a phone-book entry, the return value is <b>TRUE</b>. Otherwise, the function returns <b>FALSE</b>.
     * 
     *  If an error occurs, <b>RasEntryDlg</b> sets the <b>dwError</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377260(v=vs.85)">RASENTRYDLG</a> structure to a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/rasdlg/nf-rasdlg-rasentrydlgw
     * @since windows5.0
     */
    static RasEntryDlgW(lpszPhonebook, lpszEntry, lpInfo) {
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook
        lpszEntry := lpszEntry is String ? StrPtr(lpszEntry) : lpszEntry

        result := DllCall("RASDLG.dll\RasEntryDlgW", "ptr", lpszPhonebook, "ptr", lpszEntry, "ptr", lpInfo, "int")
        return result
    }

    /**
     * The RasDialDlg function establishes a RAS connection using a specified phone-book entry and the credentials of the logged-on user. The function displays a stream of dialog boxes that indicate the state of the connection operation. (ANSI)
     * @remarks
     * The 
     * <b>RasDialDlg</b> function displays a series of dialog boxes that are similar to the dialog boxes the main <b>Dial-Up Networking</b> dialog box displays when the user selects the <b>Dial</b> button. Use the 
     * <b>RasDialDlg</b> function to display a standard user interface for a connection operation without presenting the main phone-book dialog box. For example, the RAS AutoDial service uses this function to establish a connection using the phone-book entry associated with a remote address.
     * 
     * The 
     * <b>RasDialDlg</b> function displays dialog boxes during the connection operation to provide feedback to the user about the progress of the operation. For example, the dialog boxes might indicate when the operation is dialing, when it is authenticating the user's credentials on the remote server, and so on. The dialog boxes also provide a <b>Cancel</b> button for the user to terminate the operation.
     * 
     * <b>RasDialDlg</b> returns when the connection is established, or when the user cancels the operation.
     * 
     * The following sample code dials the entry in the default phone-book specified by the variable <i>lpszEntry</i>.
     * 
     * <div class="alert"><b>Note</b>  This simple sample is intended to run on Windows Vista and later versions of Windows. Please be aware the call to sizeof(RASENTRY) will return a different value depending on what version of the operating system the code is being run. Please take steps to ensure this is handled appropriately.</div>
     * <div> </div>
     * 
     * ```cpp
     * @param {PSTR} lpszPhonebook Pointer to a null-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file. The default phone-book file is the one selected by the user in the <b>User Preferences</b> property sheet of the <b>Dial-Up Networking</b> dialog box.
     * @param {PSTR} lpszEntry Pointer to a null-terminated string that specifies the name of the phone-book entry to dial.
     * @param {PSTR} lpszPhoneNumber Pointer to a null-terminated string that specifies a phone number that overrides the numbers stored in the phone-book entry. If this parameter is <b>NULL</b>, 
     * <b>RasDialDlg</b> uses the numbers in the phone-book entry.
     * @param {Pointer<RASDIALDLG>} lpInfo Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377023(v=vs.85)">RASDIALDLG</a> structure that specifies additional input and output parameters. The <b>dwSize</b> member of this structure must specify sizeof(<b>RASDIALDLG</b>). If an error occurs, the <b>dwError</b> member returns an error code; otherwise, it returns zero.
     * @returns {BOOL} If the function establishes a RAS connection, the return value is <b>TRUE</b>. Otherwise, the function should return <b>FALSE</b>.
     * 
     * If an error occurs, <b>RasDialDlg</b> should set the <b>dwError</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377023(v=vs.85)">RASDIALDLG</a> structure to a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/rasdlg/nf-rasdlg-rasdialdlga
     * @since windows5.0
     */
    static RasDialDlgA(lpszPhonebook, lpszEntry, lpszPhoneNumber, lpInfo) {
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook
        lpszEntry := lpszEntry is String ? StrPtr(lpszEntry) : lpszEntry
        lpszPhoneNumber := lpszPhoneNumber is String ? StrPtr(lpszPhoneNumber) : lpszPhoneNumber

        result := DllCall("RASDLG.dll\RasDialDlgA", "ptr", lpszPhonebook, "ptr", lpszEntry, "ptr", lpszPhoneNumber, "ptr", lpInfo, "int")
        return result
    }

    /**
     * The RasDialDlg function establishes a RAS connection using a specified phone-book entry and the credentials of the logged-on user. The function displays a stream of dialog boxes that indicate the state of the connection operation. (Unicode)
     * @remarks
     * The 
     * <b>RasDialDlg</b> function displays a series of dialog boxes that are similar to the dialog boxes the main <b>Dial-Up Networking</b> dialog box displays when the user selects the <b>Dial</b> button. Use the 
     * <b>RasDialDlg</b> function to display a standard user interface for a connection operation without presenting the main phone-book dialog box. For example, the RAS AutoDial service uses this function to establish a connection using the phone-book entry associated with a remote address.
     * 
     * The 
     * <b>RasDialDlg</b> function displays dialog boxes during the connection operation to provide feedback to the user about the progress of the operation. For example, the dialog boxes might indicate when the operation is dialing, when it is authenticating the user's credentials on the remote server, and so on. The dialog boxes also provide a <b>Cancel</b> button for the user to terminate the operation.
     * 
     * <b>RasDialDlg</b> returns when the connection is established, or when the user cancels the operation.
     * 
     * The following sample code dials the entry in the default phone-book specified by the variable <i>lpszEntry</i>.
     * 
     * <div class="alert"><b>Note</b>  This simple sample is intended to run on Windows Vista and later versions of Windows. Please be aware the call to sizeof(RASENTRY) will return a different value depending on what version of the operating system the code is being run. Please take steps to ensure this is handled appropriately.</div>
     * <div> </div>
     * 
     * ```cpp
     * @param {PWSTR} lpszPhonebook Pointer to a null-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file. The default phone-book file is the one selected by the user in the <b>User Preferences</b> property sheet of the <b>Dial-Up Networking</b> dialog box.
     * @param {PWSTR} lpszEntry Pointer to a null-terminated string that specifies the name of the phone-book entry to dial.
     * @param {PWSTR} lpszPhoneNumber Pointer to a null-terminated string that specifies a phone number that overrides the numbers stored in the phone-book entry. If this parameter is <b>NULL</b>, 
     * <b>RasDialDlg</b> uses the numbers in the phone-book entry.
     * @param {Pointer<RASDIALDLG>} lpInfo Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377023(v=vs.85)">RASDIALDLG</a> structure that specifies additional input and output parameters. The <b>dwSize</b> member of this structure must specify sizeof(<b>RASDIALDLG</b>). If an error occurs, the <b>dwError</b> member returns an error code; otherwise, it returns zero.
     * @returns {BOOL} If the function establishes a RAS connection, the return value is <b>TRUE</b>. Otherwise, the function should return <b>FALSE</b>.
     * 
     * If an error occurs, <b>RasDialDlg</b> should set the <b>dwError</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377023(v=vs.85)">RASDIALDLG</a> structure to a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/rasdlg/nf-rasdlg-rasdialdlgw
     * @since windows5.0
     */
    static RasDialDlgW(lpszPhonebook, lpszEntry, lpszPhoneNumber, lpInfo) {
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook
        lpszEntry := lpszEntry is String ? StrPtr(lpszEntry) : lpszEntry
        lpszPhoneNumber := lpszPhoneNumber is String ? StrPtr(lpszPhoneNumber) : lpszPhoneNumber

        result := DllCall("RASDLG.dll\RasDialDlgW", "ptr", lpszPhonebook, "ptr", lpszEntry, "ptr", lpszPhoneNumber, "ptr", lpInfo, "int")
        return result
    }

    /**
     * The MprAdminConnectionEnumEx function enumerates the active connections for a specified RRAS server.
     * @remarks
     * The caller should free the memory pointed to by <i>ppRasConn</i> by calling the function <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @param {Pointer} hRasServer A handle to the RAS server on which connections are enumerated. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Pointer<MPRAPI_OBJECT_HEADER>} pObjectHeader A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a>   structure that specifies the structure version received by <i>ppRasConn</i>.
     * @param {Integer} dwPreferedMaxLen A value that specifies the preferred maximum length of returned data in 8-bit bytes. If <i>dwPrefMaxLen</i> is -1, the buffer returned is large enough to hold all available information.
     * @param {Pointer<Integer>} lpdwEntriesRead A pointer to a <b>DWORD</b> that receives the total number of connections enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwTotalEntries A pointer to a <b>DWORD</b> that receives the total number of connections that could have been enumerated from the current resume position.
     * @param {Pointer<Pointer<RAS_CONNECTION_EX>>} ppRasConn A pointer, on output, to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_ex">RAS_CONNECTION_EX</a> structures that contain the active connection information for the RRAS server in  <i>hRasServer</i>. The number of array elements is determined by the value pointed to by <i>lpdwEntriesRead</i>.
     * @param {Pointer<Integer>} lpdwResumeHandle A pointer to a <b>DWORD</b> variable that specifies a resume handle used to continue the enumeration. The <i>lpdwResumeHandle</i> parameter is <b>NULL</b> on the first call, and left unchanged on subsequent calls. If the return code is <b>ERROR_MORE_DATA</b>, another call may be made using this handle to retrieve more data. If the handle is <b>NULL</b> upon return, the enumeration is complete. This handle is invalid for other types of error returns.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all of the data was returned with this call. To obtain additional data, call the function again using the resume handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PROC_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified procedure could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error from MprError.h, RasError.h, or WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminconnectionenumex
     * @since windows6.1
     */
    static MprAdminConnectionEnumEx(hRasServer, pObjectHeader, dwPreferedMaxLen, lpdwEntriesRead, lpdwTotalEntries, ppRasConn, lpdwResumeHandle) {
        lpdwEntriesReadMarshal := lpdwEntriesRead is VarRef ? "uint*" : "ptr"
        lpdwTotalEntriesMarshal := lpdwTotalEntries is VarRef ? "uint*" : "ptr"
        ppRasConnMarshal := ppRasConn is VarRef ? "ptr*" : "ptr"
        lpdwResumeHandleMarshal := lpdwResumeHandle is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminConnectionEnumEx", "ptr", hRasServer, "ptr", pObjectHeader, "uint", dwPreferedMaxLen, lpdwEntriesReadMarshal, lpdwEntriesRead, lpdwTotalEntriesMarshal, lpdwTotalEntries, ppRasConnMarshal, ppRasConn, lpdwResumeHandleMarshal, lpdwResumeHandle, "uint")
        return result
    }

    /**
     * Retrieves the connection information for a specific connection on a specified RRAS server.
     * @remarks
     * The caller should free the memory pointed to by <i>pRasConnection</i> by calling the function <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @param {Pointer} hRasServer A handle to the computer from which the connection information is retrieved. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hRasConnection A handle to the connection to retrieve data about. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminconnectionenum">MprAdminConnectionEnum</a>.
     * @param {Pointer<RAS_CONNECTION_EX>} pRasConnection A pointer, on output, to  a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_ex">RAS_CONNECTION_EX</a> structure that contains the connection information for the RRAS server in <i>hRasServer</i>.
     * 
     * To free this memory, call <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PROC_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified procedure could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error from MprError.h, RasError.h, or WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminconnectiongetinfoex
     * @since windows6.1
     */
    static MprAdminConnectionGetInfoEx(hRasServer, hRasConnection, pRasConnection) {
        hRasConnection := hRasConnection is Win32Handle ? NumGet(hRasConnection, "ptr") : hRasConnection

        result := DllCall("MPRAPI.dll\MprAdminConnectionGetInfoEx", "ptr", hRasServer, "ptr", hRasConnection, "ptr", pRasConnection, "uint")
        return result
    }

    /**
     * The MprAdminServerGetInfoEx function retrieves port information about the specified RRAS server.
     * @param {Pointer} hMprServer A handle to the server to query. Obtain this handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Pointer<MPR_SERVER_EX1>} pServerInfo A pointer, on output, to  a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_ex0">MPR_SERVER_EX</a> structure that contains the port information for the RRAS server in <i>hMprServer</i>.
     * 
     * To free this memory, call <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PROC_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified procedure could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminservergetinfoex
     * @since windowsserver2008
     */
    static MprAdminServerGetInfoEx(hMprServer, pServerInfo) {
        result := DllCall("MPRAPI.dll\MprAdminServerGetInfoEx", "ptr", hMprServer, "ptr", pServerInfo, "uint")
        return result
    }

    /**
     * The MprAdminServerSetInfoEx function sets port information on a specified RRAS server.
     * @param {Pointer} hMprServer A handle to the router to query. Obtain this handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Pointer<MPR_SERVER_SET_CONFIG_EX1>} pServerInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_set_config_ex0">MPR_SERVER_SET_CONFIG_EX</a> structure that contains the port information being set on the server in <i>hMprServer</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PROC_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified procedure could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminserversetinfoex
     * @since windowsserver2008
     */
    static MprAdminServerSetInfoEx(hMprServer, pServerInfo) {
        result := DllCall("MPRAPI.dll\MprAdminServerSetInfoEx", "ptr", hMprServer, "ptr", pServerInfo, "uint")
        return result
    }

    /**
     * The MprConfigServerGetInfoEx function retrieves port information for a specified server.
     * @param {HANDLE} hMprConfig A handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {Pointer<MPR_SERVER_EX1>} pServerInfo A pointer, on output, to  a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_ex0">MPR_SERVER_EX</a> structure that contains the port information for the RRAS server in <i>hMprConfig</i>.
     * 
     * To free this memory, call <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PROC_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified procedure could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigservergetinfoex
     * @since windowsserver2008
     */
    static MprConfigServerGetInfoEx(hMprConfig, pServerInfo) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig

        result := DllCall("MPRAPI.dll\MprConfigServerGetInfoEx", "ptr", hMprConfig, "ptr", pServerInfo, "uint")
        return result
    }

    /**
     * The MprConfigServerSetInfoEx function sets port information on a specified RRAS server.
     * @remarks
     * These changes to a server configuration are persistent, but have no effect on a RRAS server until it is restarted.
     * @param {HANDLE} hMprConfig A handle to the router configuration. Obtain this handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {Pointer<MPR_SERVER_SET_CONFIG_EX1>} pSetServerConfig A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_set_config_ex0">MPR_SERVER_SET_CONFIG_EX</a> structure that contains the port information being set on the server in <i>hMprServer</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>pSetServerConfig</b> parameter is <b>NULL</b> or the <b>Header</b> field values are erroneous.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigserversetinfoex
     * @since windowsserver2008
     */
    static MprConfigServerSetInfoEx(hMprConfig, pSetServerConfig) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig

        result := DllCall("MPRAPI.dll\MprConfigServerSetInfoEx", "ptr", hMprConfig, "ptr", pSetServerConfig, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} hRasServer 
     * @param {HANDLE} hRasConnection 
     * @param {Pointer<RAS_UPDATE_CONNECTION>} pRasUpdateConnection 
     * @returns {Integer} 
     */
    static MprAdminUpdateConnection(hRasServer, hRasConnection, pRasUpdateConnection) {
        hRasConnection := hRasConnection is Win32Handle ? NumGet(hRasConnection, "ptr") : hRasConnection

        result := DllCall("MPRAPI.dll\MprAdminUpdateConnection", "ptr", hRasServer, "ptr", hRasConnection, "ptr", pRasUpdateConnection, "uint")
        return result
    }

    /**
     * The MprAdminIsServiceInitialized function checks whether the RRAS service is running on a specified server if the calling process has access.
     * @param {PWSTR} lpwsServerName A pointer to a <b>null</b>-terminated Unicode string that specifies the name of the server to query. If this parameter is <b>NULL</b>, the function queries the local machine.
     * @param {Pointer<BOOL>} fIsServiceInitialized On output, a pointer to a BOOL   that specifies whether the RRAS service is running on the server in <i>lpwsServerName</i>:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is running on the specified server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is not running on the specified server and/or the calling process does not have access to the RRAS service.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>fIsServiceInitialized</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RRAS service is not running on the server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminisserviceinitialized
     * @since windowsserver2008
     */
    static MprAdminIsServiceInitialized(lpwsServerName, fIsServiceInitialized) {
        lpwsServerName := lpwsServerName is String ? StrPtr(lpwsServerName) : lpwsServerName

        fIsServiceInitializedMarshal := fIsServiceInitialized is VarRef ? "int*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminIsServiceInitialized", "ptr", lpwsServerName, fIsServiceInitializedMarshal, fIsServiceInitialized, "uint")
        return result
    }

    /**
     * Sets the tunnel specific custom configuration for a specified demand dial interface on a specified server.
     * @remarks
     * If you need to delete the custom configuration for IKEv2 tunnel of an interface, call the  <b>MprAdminInterfaceSetCustomInfoEx</b> function with the <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_if_custominfoex0">MPR_IF_CUSTOMINFOEX</a>   structure set to zero.
     * 
     * If you need to delete the IKEv2 main mode and quick mode policy configuration for an interface, set the <b>customPolicy</b> parameter of the <b>customIkev2Config</b> member in <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_if_custominfoex0">MPR_IF_CUSTOMINFOEX</a>   structure to <b>NULL</b>.
     * 
     * If you need to delete the certificate configured to be used during IKEv2 main mode SA negotiation, set the <b>cbData</b> member of <b>certificateName</b> in <b>customIkev2Config</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_if_custominfoex0">MPR_IF_CUSTOMINFOEX</a>   structure to 0.
     * @param {Pointer} hMprServer The handle to the router to query. This handle is obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a> function.
     * @param {HANDLE} hInterface The handle to the interface.  This handle is  obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacegethandle">MprAdminInterfaceGetHandle</a> function.
     * @param {Pointer<MPR_IF_CUSTOMINFOEX2>} pCustomInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_if_custominfoex0">MPR_IF_CUSTOMINFOEX</a>  structure that contains tunnel specific custom configuration.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>. If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pCustomInfo</i> parameter is <b>NULL</b> or the interface type is not <b>ROUTER_IF_TYPE_FULL_ROUTER</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There were insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacesetcustominfoex
     * @since windowsserver2012
     */
    static MprAdminInterfaceSetCustomInfoEx(hMprServer, hInterface, pCustomInfo) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        result := DllCall("MPRAPI.dll\MprAdminInterfaceSetCustomInfoEx", "ptr", hMprServer, "ptr", hInterface, "ptr", pCustomInfo, "uint")
        return result
    }

    /**
     * Retrieves tunnel-specific configuration for a specified demand dial interface on a specified server.
     * @param {Pointer} hMprServer A handle to the router to query. This handle is obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a> function.
     * @param {HANDLE} hInterface A handle to the interface. This handle is obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a> function.
     * @param {Pointer<MPR_IF_CUSTOMINFOEX2>} pCustomInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_if_custominfoex0">MPR_IF_CUSTOMINFOEX</a>  structure. When you have finished using the structure, free the memory by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>. If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is not valid or if the interface type is not <b>ROUTER_IF_TYPE_FULL_ROUTER</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There were insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacegetcustominfoex
     * @since windowsserver2012
     */
    static MprAdminInterfaceGetCustomInfoEx(hMprServer, hInterface, pCustomInfo) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        result := DllCall("MPRAPI.dll\MprAdminInterfaceGetCustomInfoEx", "ptr", hMprServer, "ptr", hInterface, "ptr", pCustomInfo, "uint")
        return result
    }

    /**
     * Retrieves the custom IKEv2 policy configuration for the specified interface.
     * @param {HANDLE} hMprConfig The handle to the router configuration. This handle is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a> function.
     * @param {HANDLE} hRouterInterface The handle to the interface configuration being updated. Obtain this handle by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a> function, the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacegethandle">MprConfigInterfaceGetHandle</a> function, or the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfaceenum">MprConfigInterfaceEnum</a> function.
     * @param {Pointer<MPR_IF_CUSTOMINFOEX2>} pCustomInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_if_custominfoex0">MPR_IF_CUSTOMINFOEX</a>  structure. When you have finished using the structure, free the buffer by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigbufferfree">MprConfigBufferFree</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>. If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true:
     * 
     * <ul>
     * <li>The <i>hMprConfig</i> parameter is <b>NULL</b>.</li>
     * <li>The <i>hRouterInterface</i> parameter is <b>NULL</b>.</li>
     * <li>The <i>pCustomInfo</i> parameter is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There were insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface that corresponds to <i>hRouterInterface</i> parameter is not present in the router configuration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacegetcustominfoex
     * @since windowsserver2012
     */
    static MprConfigInterfaceGetCustomInfoEx(hMprConfig, hRouterInterface, pCustomInfo) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterInterface := hRouterInterface is Win32Handle ? NumGet(hRouterInterface, "ptr") : hRouterInterface

        result := DllCall("MPRAPI.dll\MprConfigInterfaceGetCustomInfoEx", "ptr", hMprConfig, "ptr", hRouterInterface, "ptr", pCustomInfo, "uint")
        return result
    }

    /**
     * Sets the custom IKEv2 policy configuration for the specified interface.
     * @param {HANDLE} hMprConfig The handle to the router configuration. Obtain this handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a> function.
     * @param {HANDLE} hRouterInterface The handle to the interface configuration being updated. Obtain this handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a> function, the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacegethandle">MprConfigInterfaceGetHandle</a> function, or the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfaceenum">MprConfigInterfaceEnum</a> function.
     * @param {Pointer<MPR_IF_CUSTOMINFOEX2>} pCustomInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_if_custominfoex0">MPR_IF_CUSTOMINFOEX</a>  structure.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>. If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true:
     * 
     * <ul>
     * <li>The <i>hMprConfig</i> parameter is <b>NULL</b>.</li>
     * <li>The <i>hRouterInterface</i> parameter is <b>NULL</b>.</li>
     * <li>The <i>pCustomInfo</i> parameter is <b>NULL</b>.</li>
     * <li>The interface type is not <b>ROUTER_IF_TYPE_FULL_ROUTER</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface that corresponds to <i>hRouterInterface</i> is not present in the router configuration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacesetcustominfoex
     * @since windowsserver2012
     */
    static MprConfigInterfaceSetCustomInfoEx(hMprConfig, hRouterInterface, pCustomInfo) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterInterface := hRouterInterface is Win32Handle ? NumGet(hRouterInterface, "ptr") : hRouterInterface

        result := DllCall("MPRAPI.dll\MprConfigInterfaceSetCustomInfoEx", "ptr", hMprConfig, "ptr", hRouterInterface, "ptr", pCustomInfo, "uint")
        return result
    }

    /**
     * The MprAdminConnectionEnum function enumerates all active connections.
     * @remarks
     * This function is available on Windows NT 4.0 if the RRAS redistributable is installed. However, the version of Mprapi.dll that ships with the RRAS redistributable exports the function as <b>RasAdminConnectionEnum</b> rather than 
     * <b>MprAdminConnectionEnum</b>. Therefore, when using the RRAS redistributable, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access this function.
     * @param {Pointer} hRasServer Handle to the RAS server on which connections are enumerated. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpbBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0, 1, 2, and 3, as listed in the following table.
     * 
     * <b>Windows NT 4.0:  </b>This parameter must be zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_0">RAS_CONNECTION_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Windows 2000 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_1">RAS_CONNECTION_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Windows 2000 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_2">RAS_CONNECTION_2</a>
     * </td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_3">RAS_CONNECTION_3</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Integer>>} lplpbBuffer On successful completion, a pointer to an array of structures that describe the connection. These structures are of type <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_0">RAS_CONNECTION_0</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_1">RAS_CONNECTION_1</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_2">RAS_CONNECTION_2</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_3">RAS_CONNECTION_3</a>, depending on the value of the <i>dwLevel</i> parameter. 
     * 
     * To free this memory, call <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @param {Integer} dwPrefMaxLen Specifies the preferred maximum length of returned data in 8-bit bytes. If <i>dwPrefMaxLen</i> is -1, the buffer returned is large enough to hold all available information.
     * @param {Pointer<Integer>} lpdwEntriesRead Pointer to a <b>DWORD</b> variable. This variable receives the total number of connections enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwTotalEntries Pointer to a <b>DWORD</b> variable. This variable receives the total number of connections that could have been enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwResumeHandle Pointer to a <b>DWORD</b> variable. This variable specifies a resume handle used to continue the enumeration. The <i>lpdwResumeHandle</i> parameter is zero on the first call, and left unchanged on subsequent calls. If the return code is ERROR_MORE_DATA, another call may be made using this handle to retrieve more data. If the handle is <b>NULL</b> upon return, the enumeration is complete. This handle is invalid for other types of error returns.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running, possibly because the Dynamic Interface Manager (DIM) is configured to run only on a LAN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value passed for <i>dwLevel</i> is not zero, one, two, or three. Levels one and two are supported only on Windows 2000 or later. Level three is supported only on Windows Server 2008 or later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following parameters is <b>NULL</b> or does not point to valid memory: <i>lplpBuffer</i>, <i>lpdwEntriesRead</i>, or <i>lpdwTotalEntries</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all of the data was returned with this call. To obtain additional data, call the function again using the resume handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle passed in the <i>hRasServer</i> parameter is <b>NULL</b> or invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error from MprError.h, RasError.h, or WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminconnectionenum
     * @since windows5.0
     */
    static MprAdminConnectionEnum(hRasServer, dwLevel, lplpbBuffer, dwPrefMaxLen, lpdwEntriesRead, lpdwTotalEntries, lpdwResumeHandle) {
        lplpbBufferMarshal := lplpbBuffer is VarRef ? "ptr*" : "ptr"
        lpdwEntriesReadMarshal := lpdwEntriesRead is VarRef ? "uint*" : "ptr"
        lpdwTotalEntriesMarshal := lpdwTotalEntries is VarRef ? "uint*" : "ptr"
        lpdwResumeHandleMarshal := lpdwResumeHandle is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminConnectionEnum", "ptr", hRasServer, "uint", dwLevel, lplpbBufferMarshal, lplpbBuffer, "uint", dwPrefMaxLen, lpdwEntriesReadMarshal, lpdwEntriesRead, lpdwTotalEntriesMarshal, lpdwTotalEntries, lpdwResumeHandleMarshal, lpdwResumeHandle, "uint")
        return result
    }

    /**
     * Enumerates all active ports in a specific connection, or all ports available for use or currently used by RAS.
     * @remarks
     * If the RRAS redistributable is installed, this function is available on Windows NT 4.0. However, the version of Mprapi.dll that is provided with the RRAS redistributable exports the function as 
     * <b>RasAdminPortEnum</b> rather than 
     * <b>MprAdminPortEnum</b>. Therefore, when using the RRAS redistributable, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access this function.
     * @param {Pointer} hRasServer A handle to the RAS server whose ports are to be enumerated. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpbBuffer</i> parameter. Must be zero.
     * @param {HANDLE} hRasConnection A handle to a connection for which the active ports are enumerated. If this parameter is <b>INVALID_HANDLE_VALUE</b>, all the ports in use or available for use by RRAS are enumerated. To obtain this handle, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminconnectionenum">MprAdminConnectionEnum</a>.
     * @param {Pointer<Pointer<Integer>>} lplpbBuffer On successful completion, a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_port_0">RAS_PORT_0</a> structures that describes the port. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @param {Integer} dwPrefMaxLen A value that specifies the preferred maximum length of returned data, in 8-bit bytes. If this parameter is -1, the buffer that is returned is large enough to hold all available data.
     * @param {Pointer<Integer>} lpdwEntriesRead A pointer to a <b>DWORD</b> variable. This variable receives the total number of ports that are enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwTotalEntries A pointer to a <b>DWORD</b> variable. This variable receives the total number of ports that could have been enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwResumeHandle A pointer to a <b>DWORD</b> variable. On successful execution, this parameter specifies a handle that can be used to resume the enumeration. This parameter should be zero on the first call and left unchanged on subsequent calls. If the return code is <b>ERROR_MORE_DATA</b>, the call can be reissued with the handle to retrieve more data. If the handle is <b>NULL</b> on return, the enumeration cannot be continued. This handle is invalid for other types of error returns.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the error codes listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running, possibly because the Dynamic Interface Manager (DIM) is configured to run only on a LAN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following parameters is <b>NULL</b> or does not point to valid memory: <i>lplpBuffer</i>, <i>lpdwEntriesRead</i>, or <i>lpdwTotalEntries</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all of the data was returned with this call. To obtain additional data, call the function again using the handle that was returned in the <i>IpdwResumeHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> parameter is not zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hConnection</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error from MprError.h, RasError.h, or WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminportenum
     * @since windows5.0
     */
    static MprAdminPortEnum(hRasServer, dwLevel, hRasConnection, lplpbBuffer, dwPrefMaxLen, lpdwEntriesRead, lpdwTotalEntries, lpdwResumeHandle) {
        hRasConnection := hRasConnection is Win32Handle ? NumGet(hRasConnection, "ptr") : hRasConnection

        lplpbBufferMarshal := lplpbBuffer is VarRef ? "ptr*" : "ptr"
        lpdwEntriesReadMarshal := lpdwEntriesRead is VarRef ? "uint*" : "ptr"
        lpdwTotalEntriesMarshal := lpdwTotalEntries is VarRef ? "uint*" : "ptr"
        lpdwResumeHandleMarshal := lpdwResumeHandle is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminPortEnum", "ptr", hRasServer, "uint", dwLevel, "ptr", hRasConnection, lplpbBufferMarshal, lplpbBuffer, "uint", dwPrefMaxLen, lpdwEntriesReadMarshal, lpdwEntriesRead, lpdwTotalEntriesMarshal, lpdwTotalEntries, lpdwResumeHandleMarshal, lpdwResumeHandle, "uint")
        return result
    }

    /**
     * Retrieves data about a specific connection.
     * @remarks
     * This function is available on Windows NT 4.0 if the RRAS redistributable is installed. However, the version of Mprapi.dll included in the RRAS redistributable exports the function as <b>RasAdminConnectionGetInfo</b> rather than 
     * <b>MprAdminConnectionGetInfo</b>. Therefore, when using the RRAS redistributable, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access this function.
     * @param {Pointer} hRasServer A handle to the computer from which the connection information is retrieved. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpbBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0, 1, 2, and 3, as listed in the following table.
     * 
     * <b>Windows NT 4.0:  </b>This parameter must be zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_0">RAS_CONNECTION_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Windows 2000 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_1">RAS_CONNECTION_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Windows 2000 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_2">RAS_CONNECTION_2</a>
     * </td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_3">RAS_CONNECTION_3</a>
     * </td>
     * </tr>
     * </table>
     * @param {HANDLE} hRasConnection A handle to the connection to retrieve data about. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminconnectionenum">MprAdminConnectionEnum</a>.
     * @param {Pointer<Pointer<Integer>>} lplpbBuffer On successful completion, a pointer to an array of structures that describe the connection. These structures are of type <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_0">RAS_CONNECTION_0</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_1">RAS_CONNECTION_1</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_2">RAS_CONNECTION_2</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_3">RAS_CONNECTION_3</a>, depending on the value of the <i>dwLevel</i> parameter. 
     * 
     * To free this memory, call <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the error codes listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the RAS server or the handle to the RAS connection is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value passed for <i>dwLevel</i> is not zero, one, two, or three. Levels one and two are supported only on Windows 2000 or later. Level three is supported only on Windows Server 2008 or later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERFACE_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The <i>hConnection</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hRasServer</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error from MprError.h, RasError.h, or WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminconnectiongetinfo
     * @since windows5.0
     */
    static MprAdminConnectionGetInfo(hRasServer, dwLevel, hRasConnection, lplpbBuffer) {
        hRasConnection := hRasConnection is Win32Handle ? NumGet(hRasConnection, "ptr") : hRasConnection

        lplpbBufferMarshal := lplpbBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminConnectionGetInfo", "ptr", hRasServer, "uint", dwLevel, "ptr", hRasConnection, lplpbBufferMarshal, lplpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminPortGetInfo function gets information for a specific port.
     * @remarks
     * This function is available on Windows NT 4.0 if the RRAS redistributable is installed. However, the version of Mprapi.dll that ships with the RRAS redistributable exports the function as 
     * <b>RasAdminPortGetInfo</b> rather than 
     * <b>MprAdminPortGetInfo</b>. Therefore, when using the RRAS redistributable, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access this function.
     * @param {Pointer} hRasServer Handle to the RAS server computer on which to collect port information. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpbBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0 and 1 as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_port_0">RAS_PORT_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_port_1">RAS_PORT_1</a>
     * </td>
     * </tr>
     * </table>
     * @param {HANDLE} hPort Handle to the port for which to collect information. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminportenum">MprAdminPortEnum</a>.
     * @param {Pointer<Pointer<Integer>>} lplpbBuffer On successful completion, a pointer to a structure that describes the port. These structures are of type <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_port_0">RAS_PORT_0</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_port_1">RAS_PORT_1</a> depending on the value of the <i>dwLevel</i> parameter. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running, possibly because the Dynamic Interface Manager (DIM) is configured to run only on a LAN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following parameters is <b>NULL</b> or does not point to valid memory: <i>lplpBuffer</i>, <i>lpdwEntriesRead</i>, or <i>lpdwTotalEntries</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PORT_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPort</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> parameter is not zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error from MprError.h, RasError.h, or WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminportgetinfo
     * @since windows5.0
     */
    static MprAdminPortGetInfo(hRasServer, dwLevel, hPort, lplpbBuffer) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort

        lplpbBufferMarshal := lplpbBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminPortGetInfo", "ptr", hRasServer, "uint", dwLevel, "ptr", hPort, lplpbBufferMarshal, lplpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminConnectionClearStats function resets the statistics counters for the specified connection.
     * @remarks
     * This function is available on Windows NT 4.0 if the RRAS redistributable is installed. However, the version of Mprapi.dll that ships with the RRAS redistributable exports the function as <b>RasAdminConnectionClearStats</b> rather than 
     * <b>MprAdminConnectionClearStats</b>. Therefore, when using the RRAS redistributable, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access this function.
     * @param {Pointer} hRasServer Handle to the Remote Access Server on which to execute 
     * <b>MprAdminConnectionClearStats</b>. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hRasConnection Handle to the connection for which to reset the statistics. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminconnectionenum">MprAdminConnectionEnum</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running, possibly because the Dynamic Interface Manager (DIM) is configured to run only on a LAN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the port is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function was called with <i>hRasServer</i> parameter equal to  <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error from MprError.h, RasError.h, or WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminconnectionclearstats
     * @since windows5.0
     */
    static MprAdminConnectionClearStats(hRasServer, hRasConnection) {
        hRasConnection := hRasConnection is Win32Handle ? NumGet(hRasConnection, "ptr") : hRasConnection

        result := DllCall("MPRAPI.dll\MprAdminConnectionClearStats", "ptr", hRasServer, "ptr", hRasConnection, "uint")
        return result
    }

    /**
     * The MprAdminPortClearStats function resets the statistics for the specified port.
     * @remarks
     * This function is available on Windows NT Server 4.0 if the RRAS redistributable is installed. However, the version of Mprapi.dll that ships with the RRAS redistributable exports the function as <b>RasAdminPortClearStats</b> rather than 
     * <b>MprAdminPortClearStats</b>. Therefore, when using the RRAS redistributable, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access this function.
     * @param {Pointer} hRasServer Handle to the RAS server on which to clear the statistics for the specified port. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hPort Handle to the port for which statistics are reset. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminportenum">MprAdminPortEnum</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running, possibly because the Dynamic Interface Manager (DIM) is configured to run only on a LAN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the RAS server or the handle to the port is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error from MprError.h, RasError.h, or WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminportclearstats
     * @since windows5.0
     */
    static MprAdminPortClearStats(hRasServer, hPort) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort

        result := DllCall("MPRAPI.dll\MprAdminPortClearStats", "ptr", hRasServer, "ptr", hPort, "uint")
        return result
    }

    /**
     * The MprAdminPortReset function resets the communication device attached to the specified port.
     * @remarks
     * This function is available on Windows NT 4.0 if the RRAS redistributable is installed. However, the version of Mprapi.dll that ships with the RRAS redistributable exports the function as <b>RasAdminPortReset</b> rather than 
     * <b>MprAdminPortReset</b>. Therefore, when using the RRAS redistributable, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access this function.
     * @param {Pointer} hRasServer Handle to the RAS server on which to reset the specified port. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hPort Handle to the port to be reset. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminportenum">MprAdminPortEnum</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running, possibly because the Dynamic Interface Manager (DIM) is configured to run only on a LAN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the RAS server or the handle to the port is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error from MprError.h, RasError.h, or WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminportreset
     * @since windows5.0
     */
    static MprAdminPortReset(hRasServer, hPort) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort

        result := DllCall("MPRAPI.dll\MprAdminPortReset", "ptr", hRasServer, "ptr", hPort, "uint")
        return result
    }

    /**
     * The MprAdminPortDisconnect function disconnects a connection on a specific port.
     * @remarks
     * This function is available on Windows NT Server 4.0 if the RRAS redistributable is installed. However, the version of Mprapi.dll that ships with the RRAS redistributable exports the function as 
     * <b>RasAdminPortDisconnect</b> rather than 
     * <b>MprAdminPortDisconnect</b>. Therefore, when using the RRAS redistributable, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access this function.
     * @param {Pointer} hRasServer Handle to the RAS server on which to disconnect the port. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hPort Handle to the port to disconnect. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminportenum">MprAdminPortEnum</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running, possibly because the Dynamic Interface Manager (DIM) is configured to run only on a LAN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the RAS server or the handle to the port is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error from MprError.h, RasError.h, or WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminportdisconnect
     * @since windows5.0
     */
    static MprAdminPortDisconnect(hRasServer, hPort) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort

        result := DllCall("MPRAPI.dll\MprAdminPortDisconnect", "ptr", hRasServer, "ptr", hPort, "uint")
        return result
    }

    /**
     * The MprAdminConnectionRemoveQuarantine function removes quarantine filters on a dialed-in RAS client if the filters were applied as a result of Internet Authentication Service (IAS) policies.
     * @remarks
     * If <a href="https://docs.microsoft.com/previous-versions/ms688288(v=vs.85)">Internet Authentication Service (IAS)</a> policies configure regular filters, then these filters are added to the RAS client interface as a result of calling 
     * <b>MprAdminConnectionRemoveQuarantine</b>.
     * @param {HANDLE} hRasServer Handle to the RAS server that services the connection. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hRasConnection Handle to connection for the RAS client for which to remove the quarantine filters. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminconnectionenum">MprAdminConnectionEnum</a>. 
     * 
     * 
     * 
     * 
     * Alternatively, this parameter specifies the IP address of the RAS client for which to remove the quarantine filter. The IP address should be specified as a <b>DWORD</b> in network byte order. Obtain the IP address by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminconnectionenum">MprAdminConnectionEnum</a>. If this parameter specifies an IP address, the <i>fIsIpAddress</i> parameter should specify a <b>TRUE</b> value.
     * @param {BOOL} fIsIpAddress Specifies a Boolean value that indicates whether the <i>hRasConnection</i> parameter specifies the IP address of the client for which to remove the quarantine filters. If this parameter is a <b>TRUE</b> value, <i>hRasConnection</i> specifies an IP address. Otherwise, <i>hRasConnection</i> specifies a handle to a connection.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the RAS server or the handle to the RAS connection is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RAS client is not in quarantine.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error from MprError.h, RasError.h, or WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminconnectionremovequarantine
     * @since windows6.0.6000
     */
    static MprAdminConnectionRemoveQuarantine(hRasServer, hRasConnection, fIsIpAddress) {
        hRasServer := hRasServer is Win32Handle ? NumGet(hRasServer, "ptr") : hRasServer
        hRasConnection := hRasConnection is Win32Handle ? NumGet(hRasConnection, "ptr") : hRasConnection

        result := DllCall("MPRAPI.dll\MprAdminConnectionRemoveQuarantine", "ptr", hRasServer, "ptr", hRasConnection, "int", fIsIpAddress, "uint")
        return result
    }

    /**
     * The MprAdminUserGetInfo function retrieves all RAS information for a particular user.
     * @remarks
     * This function is available on Windows NT 4.0 if the RRAS redistributable is installed. However, the version of Mprapi.dll that ships with the RRAS redistributable exports the function as 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/rasadminusergetinfo">RasAdminUserGetInfo</a> rather than 
     * <b>MprAdminUserGetInfo</b>. Therefore, when using the RRAS redistributable, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access this function.
     * @param {PWSTR} lpszServer Pointer to a Unicode string that specifies the name of the server  with the master User Accounts Subsystem (UAS). If the remote access server is part of a domain, the computer with the UAS is either the primary domain controller or the backup domain controller. If the remote access server is not part of a domain, then the server itself  stores the UAS. In either case, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmingetpdcserver">MprAdminGetPDCServer</a> function to obtain the value for this parameter. 
     * 
     * 
     * 
     * 
     * If the server itself stores the UAS, this parameter can be <b>NULL</b>.
     * @param {PWSTR} lpszUser Pointer to a Unicode string that specifies the name of the user for which to get RAS information.
     * @param {Integer} dwLevel This parameter may be zero or one.
     * 
     * <b>Windows NT Server 4.0 with SP3 and later:  </b>This parameter must be zero.
     * @param {Pointer<Integer>} lpbBuffer Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_user_0">RAS_USER_0</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_user_1">RAS_USER_1</a> structure. The caller must allocate (and free) the memory for this structure. Upon successful return, this structure contains the RAS data for the specified user. 
     * 
     * 
     * 
     * 
     * <b>Windows NT Server 4.0 with SP3 and later:  </b>If the <i>dwLevel</i> parameter specifies zero, <i>lpbBuffer</i> should point to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_user_0">RAS_USER_0</a> structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>dwLevel</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>lpbBuffer</i> is <b>NULL</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_USER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user specified by <i>lpwsUserName</i> does not exist on the server specified by <i>lpwsServerName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminusergetinfo
     * @since windows5.0
     */
    static MprAdminUserGetInfo(lpszServer, lpszUser, dwLevel, lpbBuffer) {
        lpszServer := lpszServer is String ? StrPtr(lpszServer) : lpszServer
        lpszUser := lpszUser is String ? StrPtr(lpszUser) : lpszUser

        lpbBufferMarshal := lpbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminUserGetInfo", "ptr", lpszServer, "ptr", lpszUser, "uint", dwLevel, lpbBufferMarshal, lpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminUserSetInfo function sets RAS information for the specified user.
     * @remarks
     * This function is available on Windows NT 4.0 if the RRAS redistributable is installed. However, the version of Mprapi.dll that ships with the RRAS redistributable exports the function as 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/rasadminusersetinfo">RasAdminUserSetInfo</a> rather than 
     * <b>MprAdminUserSetInfo</b>. Therefore, when using the RRAS redistributable, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access this function.
     * @param {PWSTR} lpszServer Pointer to a Unicode string that specifies the name of the server  with the master User Accounts Subsystem (UAS). If the remote access server is part of a domain, the computer with the UAS is either the primary domain controller or the backup domain controller. If the remote access server is not part of a domain, then the server itself  stores the UAS. In either case, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmingetpdcserver">MprAdminGetPDCServer</a> function to obtain the value for this parameter. 
     * 
     * 
     * 
     * 
     * If the server itself stores the UAS, this parameter can be <b>NULL</b>.
     * @param {PWSTR} lpszUser Pointer to a Unicode string that specifies the name of the user for which to set RAS information.
     * @param {Integer} dwLevel This parameter can be zero or one, corresponding to the structure type pointed to by the <i>lpbBuffer</i> parameter.
     * 
     * <b>Windows NT Server 4.0 with SP3 and later:  </b>This parameter must be zero.
     * @param {Pointer<Integer>} lpbBuffer Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_user_0">RAS_USER_0</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_user_1">RAS_USER_1</a> structure that specifies the new RAS information for the user. 
     * 
     * 
     * 
     * 
     * <b>Windows NT Server 4.0 with SP3 and later:  </b>If the <i>dwLevel</i> parameter specifies zero, <i>lpbBuffer</i> should point to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_user_0">RAS_USER_0</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR _INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>dwLevel</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_USER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user specified by <i>lpwsUserName</i> does not exist on the server specified by <i>lpwsServerName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminusersetinfo
     * @since windows5.0
     */
    static MprAdminUserSetInfo(lpszServer, lpszUser, dwLevel, lpbBuffer) {
        lpszServer := lpszServer is String ? StrPtr(lpszServer) : lpszServer
        lpszUser := lpszUser is String ? StrPtr(lpszUser) : lpszUser

        lpbBufferMarshal := lpbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminUserSetInfo", "ptr", lpszServer, "ptr", lpszUser, "uint", dwLevel, lpbBufferMarshal, lpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminSendUserMessage function sends a message to the user connected on the specified connection.
     * @param {Pointer} hMprServer Handle to the RAS server on which the user is connected. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hConnection Handle to the connection on which the user is connected. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminconnectionenum">MprAdminConnectionEnum</a> to obtain this handle.
     * @param {PWSTR} lpwszMessage Pointer to a Unicode string that specifies the message to the user.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running, possibly because the Dynamic Interface Manager (DIM) is configured to run only on a LAN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERFACE_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hConnection</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpwszMessage</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminsendusermessage
     * @since windows5.0
     */
    static MprAdminSendUserMessage(hMprServer, hConnection, lpwszMessage) {
        hConnection := hConnection is Win32Handle ? NumGet(hConnection, "ptr") : hConnection
        lpwszMessage := lpwszMessage is String ? StrPtr(lpwszMessage) : lpwszMessage

        result := DllCall("MPRAPI.dll\MprAdminSendUserMessage", "ptr", hMprServer, "ptr", hConnection, "ptr", lpwszMessage, "uint")
        return result
    }

    /**
     * The MprAdminGetPDCServer function retrieves the name of the server with the master User Accounts Subsystem (UAS) from either a domain name or a server name. Either the domain name parameter or the server name parameter may be NULL, but not both.
     * @remarks
     * The 
     * <b>MprAdminGetPDCServer</b> function can obtain the name of the server with the user accounts database given the name of the RAS server, or the name of the domain in which the RAS server resides. To get the server name, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getcomputernamea">GetComputerName</a> function
     * 
     * If the server name specified by <i>lpszServer</i> is part of a domain, The server returned by 
     * <b>MprAdminGetPDCServer</b> will be either the primary domain controller or a backup domain controller.
     * 
     * If the server name specified by <i>lpszServer</i> is a stand-alone Windows NT/Windows 2000 server (that is, the server or workstation does not participate in a domain), then the server name itself is returned in the <i>lpszUserAccountServer</i> buffer.
     * 
     * You can then use the name of the user account server in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netquerydisplayinformation">NetQueryDisplayInformation</a> function to enumerate the users in the user account database. You can also use the server name in calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminusergetinfo">MprAdminUserGetInfo</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminusersetinfo">MprAdminUserSetInfo</a> functions to get and set RAS privileges for a specified user account.
     * @param {PWSTR} lpszDomain Pointer to a null-terminated Unicode string that specifies the name of the domain to which the RAS server belongs. This parameter can be <b>NULL</b> if you are running your RAS administration application on a Windows NT/Windows 2000 server that is not participating in a domain. If this parameter is <b>NULL</b>, the <i>lpwsServerName</i> parameter must not be <b>NULL</b>.
     * @param {PWSTR} lpszServer Pointer to a null-terminated Unicode string that specifies the name of the Windows NT/Windows 2000 RAS server. Specify the name with leading "\\" characters, in the form: <b>\\servername</b>. This parameter can be <b>NULL</b> if the <i>lpwsDomain</i> parameter is not <b>NULL</b>.
     * @param {PWSTR} lpszPDCServer Pointer to a buffer that receives a null-terminated Unicode string that contains the name of a domain controller that has the user account database. The buffer should be big enough to hold the server name (UNCLEN +1). The function prefixes the returned server name with leading "\\" characters, in the form: <b>\\servername</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain specified is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NERR_InvalidComputer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpwsDomainName</i> parameter is <b>NULL</b>, and <i>lpwsServerName</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmingetpdcserver
     * @since windows5.0
     */
    static MprAdminGetPDCServer(lpszDomain, lpszServer, lpszPDCServer) {
        lpszDomain := lpszDomain is String ? StrPtr(lpszDomain) : lpszDomain
        lpszServer := lpszServer is String ? StrPtr(lpszServer) : lpszServer
        lpszPDCServer := lpszPDCServer is String ? StrPtr(lpszPDCServer) : lpszPDCServer

        result := DllCall("MPRAPI.dll\MprAdminGetPDCServer", "ptr", lpszDomain, "ptr", lpszServer, "ptr", lpszPDCServer, "uint")
        return result
    }

    /**
     * The MprAdminIsServiceRunning function checks whether the RRAS service is running on a specified server if the calling process has access.
     * @remarks
     * This function returns <b>FALSE</b> if the RRAS service is running, but the calling process does not have  sufficient privileges to access the service. If the access rights of the calling process on the server are unknown, it is recommended that <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a> is called prior to calling this function. Doing so will determine  if the process has the required access rights to the server.
     * @param {PWSTR} lpwsServerName A pointer to a <b>null</b>-terminated Unicode string that specifies the name of the server to query. If this parameter is <b>NULL</b>, the function queries the local machine.
     * @returns {BOOL} The return value is one of the following Boolean values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is running on the specified server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is not running on the specified server and/or the calling process does not have access to the RRAS service.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminisservicerunning
     * @since windowsserver2000
     */
    static MprAdminIsServiceRunning(lpwsServerName) {
        lpwsServerName := lpwsServerName is String ? StrPtr(lpwsServerName) : lpwsServerName

        result := DllCall("MPRAPI.dll\MprAdminIsServiceRunning", "ptr", lpwsServerName, "int")
        return result
    }

    /**
     * The MprAdminServerConnect function establishes a connection to a router for the purpose of administering that router.
     * @remarks
     * <b>MprAdminIsServiceRunning</b> must be used to determine the status of the RRAS service on the remote server. <b>MprAdminServerConnect</b> does not query the RRAS service when establishing a connection.
     * @param {PWSTR} lpwsServerName A pointer to a <b>null</b>-terminated Unicode string that specifies the name of the remote server. If this parameter is <b>NULL</b>, the function returns a handle to the local machine.
     * @param {Pointer<Pointer>} phMprServer A pointer to a <b>HANDLE</b> variable that receives a handle to the server. Use this handle in subsequent calls to administer the server.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function was called with <i>phMprServer</i> parameter equal to  <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_UNKNOWN_IF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is not running the Routing and RAS service.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminserverconnect
     * @since windowsserver2000
     */
    static MprAdminServerConnect(lpwsServerName, phMprServer) {
        lpwsServerName := lpwsServerName is String ? StrPtr(lpwsServerName) : lpwsServerName

        phMprServerMarshal := phMprServer is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminServerConnect", "ptr", lpwsServerName, phMprServerMarshal, phMprServer, "uint")
        return result
    }

    /**
     * The MprAdminServerDisconnect function disconnects the connection made by a previous call to MprAdminServerConnect.
     * @param {Pointer} hMprServer Handle to the router from which to disconnect. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminserverdisconnect
     * @since windowsserver2000
     */
    static MprAdminServerDisconnect(hMprServer) {
        DllCall("MPRAPI.dll\MprAdminServerDisconnect", "ptr", hMprServer)
    }

    /**
     * The MprAdminServerGetCredentials function retrieves the pre-shared key for the specified server.
     * @remarks
     * The server maintains a single pre-shared key for all users.
     * @param {Pointer} hMprServer Handle to a Windows server. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibserverconnect">MprAdminMIBServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpbBuffer</i> parameter. Must be zero.
     * @param {Pointer<Pointer<Integer>>} lplpbBuffer On successful completion, a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_1">MPR_CREDENTIALSEX_1</a> structure that contains the pre-shared key for the server. Free the memory occupied by this structure with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lplpbBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> parameter is not zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminservergetcredentials
     * @since windowsserver2003
     */
    static MprAdminServerGetCredentials(hMprServer, dwLevel, lplpbBuffer) {
        lplpbBufferMarshal := lplpbBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminServerGetCredentials", "ptr", hMprServer, "uint", dwLevel, lplpbBufferMarshal, lplpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminServerSetCredentials functions sets the pre-shared key for the specified server.
     * @remarks
     * The server maintains a single pre-shared key for all users.
     * 
     * To delete the pre-shared key, call 
     * <b>MprAdminServerSetCredentials</b> with the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_1">MPR_CREDENTIALSEX_1</a><b>dwSize</b> member set to zero.
     * @param {Pointer} hMprServer Handle to a Windows server. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibserverconnect">MprAdminMIBServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is structured in the <i>lpbBuffer</i> parameter. Must be zero.
     * @param {Pointer<Integer>} lpbBuffer A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_1">MPR_CREDENTIALSEX_1</a> structure that contains the pre-shared key for the server.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpbBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> parameter is not zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminserversetcredentials
     * @since windowsserver2003
     */
    static MprAdminServerSetCredentials(hMprServer, dwLevel, lpbBuffer) {
        lpbBufferMarshal := lpbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminServerSetCredentials", "ptr", hMprServer, "uint", dwLevel, lpbBufferMarshal, lpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminBufferFree function frees memory buffers returned by _MprAdminDeviceEnum, MprAdminInterfaceGetInfo, MprAdminInterfaceDeviceGetInfo, MprAdminInterfaceEnum, MprAdminServerGetInfo, MprAdminInterfaceTransportGetInfo, and MprAdminTransportGetInfo.
     * @param {Pointer<Void>} pBuffer Pointer to the memory buffer to free.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is the following error code.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminbufferfree
     * @since windowsserver2000
     */
    static MprAdminBufferFree(pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminBufferFree", pBufferMarshal, pBuffer, "uint")
        return result
    }

    /**
     * The MprAdminGetErrorString function returns the string associated with a router error from Mprerror.h.
     * @param {Integer} dwError Specifies the error code for a  router error.
     * @param {Pointer<PWSTR>} lplpwsErrorString Pointer to an <b>LPWSTR</b> variable that points to the text associated with the <i>dwError</i> code on successful return. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MR_MID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The error code in <i>dwError</i> is unknown.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmingeterrorstring
     * @since windowsserver2000
     */
    static MprAdminGetErrorString(dwError, lplpwsErrorString) {
        lplpwsErrorStringMarshal := lplpwsErrorString is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminGetErrorString", "uint", dwError, lplpwsErrorStringMarshal, lplpwsErrorString, "uint")
        return result
    }

    /**
     * The MprAdminServerGetInfo function retrieves information about the specified RRAS server.
     * @param {Pointer} hMprServer Handle to the router to query. Obtain this handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0, 1, and 2 as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Windows 2000 Server or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_0">MPR_SERVER_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Windows Server 2003 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_1">MPR_SERVER_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_2">MPR_SERVER_2</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Integer>>} lplpbBuffer On successful completion, a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_0">MPR_SERVER_0</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_1">MPR_SERVER_1</a>,  
     * or   <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_2">MPR_SERVER_2</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * 					Free the memory for this buffer using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lplpbBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hMprServer</i> parameter is <b>NULL</b>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminservergetinfo
     * @since windowsserver2000
     */
    static MprAdminServerGetInfo(hMprServer, dwLevel, lplpbBuffer) {
        lplpbBufferMarshal := lplpbBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminServerGetInfo", "ptr", hMprServer, "uint", dwLevel, lplpbBufferMarshal, lplpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminServerSetInfo function is used to set the number of ports for L2TP, PPTP, and SSTP devices when the RRAS service is running.
     * @remarks
     * This function is used to set the port count for L2TP, PPTP, and SSTP ports and enable or disable RRAS when the service is running. These values are persistent, meaning that you do not have to follow this call with a call to <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserversetinfo">MprConfigServerSetInfo</a>. Note that this function is asynchronous, so you might not see the affect of the changes immediately.
     * @param {Pointer} hMprServer Handle to the router to query. Obtain this handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is structured in the <i>lpbBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 1 and 2 as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Windows Server 2003 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_1">MPR_SERVER_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_2">MPR_SERVER_2</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpbBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_1">MPR_SERVER_1</a>  
     * or   <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_2">MPR_SERVER_2</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS_REBOOT_REQUIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A system reboot is required for such a change to take affect. Change the port count using the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserversetinfo">MprConfigServerSetInfo</a> call and reboot.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If you try to set the number of ports to more than the system supported limits as defined on the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_1">MPR_SERVER_1</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_2">MPR_SERVER_2</a> topics.
     * 
     * Returns this error if you try to set the number of PPTP ports to 0.
     * 
     * Returns this error if the flags are not valid or if <i>lpbBuffer</i> or <i>hMprServer</i> is <b>NULL</b>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RRAS service is not running on this server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>dwLevel</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hMprServer</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminserversetinfo
     * @since windowsserver2003
     */
    static MprAdminServerSetInfo(hMprServer, dwLevel, lpbBuffer) {
        lpbBufferMarshal := lpbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminServerSetInfo", "ptr", hMprServer, "uint", dwLevel, lpbBufferMarshal, lpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminEstablishDomainRasServer function establishes the given machine as a Remote Access Server in the domain. This function must be executed only on a machine joined to a domain.
     * @param {PWSTR} pszDomain The domain  in which you want the server to be advertised.
     * @param {PWSTR} pszMachine The name of the RAS server.
     * @param {BOOL} bEnable A <b>BOOL</b> that is <b>TRUE</b> if the RAS server should be advertised in the domain. Otherwise, it is <b>FALSE</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DS_SERVER_DOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * pszDomain is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * pszMachine is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DS_OPERATIONS_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User is a non-domain user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Function executed on a machine not joined to any domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminestablishdomainrasserver
     * @since windowsserver2003
     */
    static MprAdminEstablishDomainRasServer(pszDomain, pszMachine, bEnable) {
        pszDomain := pszDomain is String ? StrPtr(pszDomain) : pszDomain
        pszMachine := pszMachine is String ? StrPtr(pszMachine) : pszMachine

        result := DllCall("MPRAPI.dll\MprAdminEstablishDomainRasServer", "ptr", pszDomain, "ptr", pszMachine, "int", bEnable, "uint")
        return result
    }

    /**
     * The MprAdminIsDomainRasServer function returns information regarding whether the given machine is registered as the remote access server in the domain.
     * @remarks
     * This function must be executed only on a machine joined to a domain.
     * @param {PWSTR} pszDomain The domain  in which you want to query the remote access server.
     * @param {PWSTR} pszMachine The name of the remote access server.
     * @param {Pointer<BOOL>} pbIsRasServer Returns <b>TRUE</b> if the machine is registered in the domain, otherwise it returns <b>FALSE</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DS_SERVER_DOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * pszDomain is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * pszMachine is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DS_OPERATIONS_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User is a non-domain user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Function executed on a machine not joined to any domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminisdomainrasserver
     * @since windowsserver2003
     */
    static MprAdminIsDomainRasServer(pszDomain, pszMachine, pbIsRasServer) {
        pszDomain := pszDomain is String ? StrPtr(pszDomain) : pszDomain
        pszMachine := pszMachine is String ? StrPtr(pszMachine) : pszMachine

        pbIsRasServerMarshal := pbIsRasServer is VarRef ? "int*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminIsDomainRasServer", "ptr", pszDomain, "ptr", pszMachine, pbIsRasServerMarshal, pbIsRasServer, "uint")
        return result
    }

    /**
     * The MprAdminTransportCreate function loads a new transport, and starts the router manager for the transport.
     * @param {Pointer} hMprServer Handle to the router on which to set the information. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport configuration type to set. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {PWSTR} lpwsTransportName Pointer to a <b>null</b>-terminated Unicode string that specifies the name of the transport.
     * @param {Pointer<Integer>} pGlobalInfo Pointer to a buffer that specifies global information for the transport. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers.
     * @param {Integer} dwGlobalInfoSize Specifies the size, in bytes, of the data pointed to by the <i>pGlobalInfo</i> parameter.
     * @param {Pointer<Integer>} pClientInterfaceInfo Pointer to a buffer that specifies default client interface information for the transport. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not set the default client interface information.
     * @param {Integer} dwClientInterfaceInfoSize Specifies the size, in bytes, of the buffer pointed to by the <i>pClientInterfaceInfo</i> parameter.
     * @param {PWSTR} lpwsDLLPath Pointer to a <b>null</b>-terminated Unicode string that specifies the path to the DLL for the transport.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pGlobalInfo</i> parameter and the <i>pClientInterfaceInfo</i> parameter are both <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PROTOCOL_ALREADY_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified transport is already running on the specified router.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any supported transport protocol.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmintransportcreate
     * @since windowsserver2000
     */
    static MprAdminTransportCreate(hMprServer, dwTransportId, lpwsTransportName, pGlobalInfo, dwGlobalInfoSize, pClientInterfaceInfo, dwClientInterfaceInfoSize, lpwsDLLPath) {
        lpwsTransportName := lpwsTransportName is String ? StrPtr(lpwsTransportName) : lpwsTransportName
        lpwsDLLPath := lpwsDLLPath is String ? StrPtr(lpwsDLLPath) : lpwsDLLPath

        pGlobalInfoMarshal := pGlobalInfo is VarRef ? "char*" : "ptr"
        pClientInterfaceInfoMarshal := pClientInterfaceInfo is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminTransportCreate", "ptr", hMprServer, "uint", dwTransportId, "ptr", lpwsTransportName, pGlobalInfoMarshal, pGlobalInfo, "uint", dwGlobalInfoSize, pClientInterfaceInfoMarshal, pClientInterfaceInfo, "uint", dwClientInterfaceInfoSize, "ptr", lpwsDLLPath, "uint")
        return result
    }

    /**
     * The MprAdminTransportSetInfo function sets global information, or default client interface information, or both, for a specified transport.
     * @param {Pointer} hMprServer Handle to the router on which information is being set. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport type to set. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pGlobalInfo Pointer to a buffer that specifies global information for the transport. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not set the global information.
     * @param {Integer} dwGlobalInfoSize Specifies the size, in bytes, of the buffer pointed to by the <i>pGlobalInfo</i> parameter.
     * @param {Pointer<Integer>} pClientInterfaceInfo Pointer to a buffer that specifies default client interface information for the transport. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not set the default client interface information.
     * @param {Integer} dwClientInterfaceInfoSize Specifies the size, in bytes, of the buffer pointed to by the <i>pClientInterfaceInfo</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pGlobalInfo</i> parameter and the <i>pClientInterfaceInfo</i> parameter are both <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any supported transport protocols.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmintransportsetinfo
     * @since windowsserver2000
     */
    static MprAdminTransportSetInfo(hMprServer, dwTransportId, pGlobalInfo, dwGlobalInfoSize, pClientInterfaceInfo, dwClientInterfaceInfoSize) {
        pGlobalInfoMarshal := pGlobalInfo is VarRef ? "char*" : "ptr"
        pClientInterfaceInfoMarshal := pClientInterfaceInfo is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminTransportSetInfo", "ptr", hMprServer, "uint", dwTransportId, pGlobalInfoMarshal, pGlobalInfo, "uint", dwGlobalInfoSize, pClientInterfaceInfoMarshal, pClientInterfaceInfo, "uint", dwClientInterfaceInfoSize, "uint")
        return result
    }

    /**
     * The MprAdminTransportGetInfo function retrieves global information, default client interface information, or both, for a specified transport.
     * @remarks
     * The <i>ppGlobalInfo</i> and <i>ppClientInterfaceInfo</i> parameters cannot both be <b>NULL</b>.
     * @param {Pointer} hMprServer Handle to the router from which information is being retrieved. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport type to retrieve. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Integer>>} ppGlobalInfo Pointer to a pointer variable. This variable points to an information header that receives global information for this transport. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers. 
     * 
     * 
     * 
     * 
     * Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not retrieve the global information.
     * @param {Pointer<Integer>} lpdwGlobalInfoSize Pointer to a <b>DWORD</b> variable. This variable receives the size, in bytes, of the global information for the transport.
     * @param {Pointer<Pointer<Integer>>} ppClientInterfaceInfo Pointer to a pointer variable. This variable points to default client interface information for this transport. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not retrieve the client interface information.
     * @param {Pointer<Integer>} lpdwClientInterfaceInfoSize Pointer to a <b>DWORD</b> variable. This variable receives the size, in bytes, of the client interface information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The <i>ppGlobalInfo</i> parameter and the <i>ppClientInterfaceInfo</i> parameter are both <b>NULL</b>.</li>
     * <li>The <i>ppGlobalInfo</i> parameter does not point to valid memory.</li>
     * <li>The <i>ppClientInterfaceInfo</i> parameter does not point to valid memory.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any installed transport.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmintransportgetinfo
     * @since windowsserver2000
     */
    static MprAdminTransportGetInfo(hMprServer, dwTransportId, ppGlobalInfo, lpdwGlobalInfoSize, ppClientInterfaceInfo, lpdwClientInterfaceInfoSize) {
        ppGlobalInfoMarshal := ppGlobalInfo is VarRef ? "ptr*" : "ptr"
        lpdwGlobalInfoSizeMarshal := lpdwGlobalInfoSize is VarRef ? "uint*" : "ptr"
        ppClientInterfaceInfoMarshal := ppClientInterfaceInfo is VarRef ? "ptr*" : "ptr"
        lpdwClientInterfaceInfoSizeMarshal := lpdwClientInterfaceInfoSize is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminTransportGetInfo", "ptr", hMprServer, "uint", dwTransportId, ppGlobalInfoMarshal, ppGlobalInfo, lpdwGlobalInfoSizeMarshal, lpdwGlobalInfoSize, ppClientInterfaceInfoMarshal, ppClientInterfaceInfo, lpdwClientInterfaceInfoSizeMarshal, lpdwClientInterfaceInfoSize, "uint")
        return result
    }

    /**
     * Function is called to enumerate RAS capable devices installed on the computer that can return their name and type.
     * @param {Pointer} hMprServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpbBuffer</i> parameter. Must be zero.
     * @param {Pointer<Pointer<Integer>>} lplpbBuffer On successful completion, an array of <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_device_0">MPR_DEVICE_0</a> structures that contains the RAS capable device information. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @param {Pointer<Integer>} lpdwTotalEntries The number of entries of type <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_device_0">MPR_DEVICE_0</a> in <i>lplpbBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwlevel</i> parameter does not equal zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lplpbBuffer</i> or <i>lpdwTotalEntries</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmindeviceenum
     * @since windowsserver2000
     */
    static MprAdminDeviceEnum(hMprServer, dwLevel, lplpbBuffer, lpdwTotalEntries) {
        lplpbBufferMarshal := lplpbBuffer is VarRef ? "ptr*" : "ptr"
        lpdwTotalEntriesMarshal := lpdwTotalEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminDeviceEnum", "ptr", hMprServer, "uint", dwLevel, lplpbBufferMarshal, lplpbBuffer, lpdwTotalEntriesMarshal, lpdwTotalEntries, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceGetHandle function retrieves a handle to a specified interface.
     * @param {Pointer} hMprServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {PWSTR} lpwsInterfaceName Pointer to a <b>null</b>-terminated Unicode string that specifies the name of the interface to be retrieved.
     * @param {Pointer<HANDLE>} phInterface Pointer to a <b>HANDLE</b> variable that receives a handle to the interface specified by <i>lpwsInterfaceName</i>.
     * @param {BOOL} fIncludeClientInterfaces Specifies whether the function returns a client interface. If this parameter is <b>FALSE</b>, interfaces of type <b>ROUTER_IF_TYPE_CLIENT</b> are ignored in the search for the interface with the name specified by <i>lpwsInterfaceName</i>. If this parameter is <b>TRUE</b> and an interface with the specified name exists, 
     * <b>MprAdminInterfaceGetHandle</b> returns a handle to an interface of type <b>ROUTER_IF_TYPE_CLIENT</b>. Since it is possible that there are several interfaces of type <b>ROUTER_IF_TYPE_CLIENT</b>, the handle returned references the first interface found with the name specified by <i>lpwsInterfaceName</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No interface exists with the name specified by <i>lpwsInterfaceName</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_INVALID_BINDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The passed in handle to the server is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_NULL_REF_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>lpwsInterfaceName</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacegethandle
     * @since windowsserver2000
     */
    static MprAdminInterfaceGetHandle(hMprServer, lpwsInterfaceName, phInterface, fIncludeClientInterfaces) {
        lpwsInterfaceName := lpwsInterfaceName is String ? StrPtr(lpwsInterfaceName) : lpwsInterfaceName

        result := DllCall("MPRAPI.dll\MprAdminInterfaceGetHandle", "ptr", hMprServer, "ptr", lpwsInterfaceName, "ptr", phInterface, "int", fIncludeClientInterfaces, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceCreate function creates an interface on a specified server.
     * @remarks
     * The 
     * <b>MprAdminInterfaceCreate</b> function supports the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a> structure. However, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a> does not. In order to create a demand-dial interface that is persistent after a reboot, call 
     * <b>MprAdminInterfaceCreate</b> with 
     * <b>MPR_INTERFACE_2</b>, then call 
     * <b>MprConfigInterfaceCreate</b> with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>.
     * @param {Pointer} hMprServer Handle to the  router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is structured in the <i>lpBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0, 1, 2, and 3, as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>
     * </td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpbBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>,  
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * @param {Pointer<HANDLE>} phInterface Pointer to a <b>HANDLE</b> variable. The variable receives a handle to use in all subsequent calls to manage this interface.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The router interface type  is not supported because the Dynamic Interface Manager is configured to run only on a LAN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERFACE_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An interface with the same name already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacecreate
     * @since windowsserver2000
     */
    static MprAdminInterfaceCreate(hMprServer, dwLevel, lpbBuffer, phInterface) {
        lpbBufferMarshal := lpbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceCreate", "ptr", hMprServer, "uint", dwLevel, lpbBufferMarshal, lpbBuffer, "ptr", phInterface, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceGetInfo function retrieves information for a specified interface on a specified server.
     * @param {Pointer} hMprServer Handle to the  router to query. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface obtained by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is structured in the <i>lplpbBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0, 1, 2, and 3, as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>
     * </td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Values of 1, 2, and 3 are valid only for interfaces of type <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_connection_state">ROUTER_CONNECTION_STATE</a>.
     * @param {Pointer<Pointer<Integer>>} lplpbBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>,  
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * 					Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> is  2, but that level is not supported for the interface. For example, the type of interface, as defined in the MPR_INTERFACE_X structure,  is not <b>IF_TYPE_FULL_ROUTER</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lplpbBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacegetinfo
     * @since windowsserver2000
     */
    static MprAdminInterfaceGetInfo(hMprServer, hInterface, dwLevel, lplpbBuffer) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        lplpbBufferMarshal := lplpbBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceGetInfo", "ptr", hMprServer, "ptr", hInterface, "uint", dwLevel, lplpbBufferMarshal, lplpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceSetInfo function sets information for a specified interface on a specified server.
     * @remarks
     * The 
     * <b>MprAdminInterfaceSetInfo</b> function supports the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a> structure. However, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacesetinfo">MprConfigInterfaceSetInfo</a> does not. In order to make persistent changes to a demand-dial interface, call 
     * <b>MprAdminInterfaceSetInfo</b> with 
     * <b>MPR_INTERFACE_2</b>, then call 
     * <b>MprConfigInterfaceSetInfo</b> with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>.
     * @param {Pointer} hMprServer Handle to the  router to query. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface obtained by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is structured in the <i>lpbBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0, 1, 2, and 3, as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>
     * </td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpbBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>,  
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lplpbBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacesetinfo
     * @since windowsserver2000
     */
    static MprAdminInterfaceSetInfo(hMprServer, hInterface, dwLevel, lpbBuffer) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        lpbBufferMarshal := lpbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceSetInfo", "ptr", hMprServer, "ptr", hInterface, "uint", dwLevel, lpbBufferMarshal, lpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceDelete function deletes an interface on a specified server.
     * @param {Pointer} hMprServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface to delete. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERFACE_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface specified is a demand-dial interface and is currently connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacedelete
     * @since windowsserver2000
     */
    static MprAdminInterfaceDelete(hMprServer, hInterface) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        result := DllCall("MPRAPI.dll\MprAdminInterfaceDelete", "ptr", hMprServer, "ptr", hInterface, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceDeviceGetInfo retrieves information about a device that is used in a router demand-dial interface.
     * @param {Pointer} hMprServer Handle to router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface. Obtain this handle from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>, or by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfaceenum">MprAdminInterfaceEnum</a>
     * @param {Integer} dwIndex Specifies the one-based index of the device. A multi-linked demand-dial interface uses multiple devices.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0 or 1 as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_device_0">MPR_DEVICE_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_device_1">MPR_DEVICE_1</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Integer>>} lplpBuffer On successful completion, a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_device_0">MPR_DEVICE_0</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_device_1">MPR_DEVICE_1</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * 					Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lplpbBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacedevicegetinfo
     * @since windowsserver2000
     */
    static MprAdminInterfaceDeviceGetInfo(hMprServer, hInterface, dwIndex, dwLevel, lplpBuffer) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        lplpBufferMarshal := lplpBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceDeviceGetInfo", "ptr", hMprServer, "ptr", hInterface, "uint", dwIndex, "uint", dwLevel, lplpBufferMarshal, lplpBuffer, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceDeviceSetInfo creates or modifies a device that is used in a router demand-dial interface.
     * @param {Pointer} hMprServer Handle to the  router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface. Obtain this handle from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>, or by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfaceenum">MprAdminInterfaceEnum</a>.
     * @param {Integer} dwIndex Specifies the one-based index of the device. A multi-linked demand-dial interface uses multiple devices.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is structured in the <i>lplpBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0 or 1 as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_device_0">MPR_DEVICE_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_device_1">MPR_DEVICE_1</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpbBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_device_0">MPR_DEVICE_0</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_device_1">MPR_DEVICE_1</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lplpBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacedevicesetinfo
     * @since windowsserver2000
     */
    static MprAdminInterfaceDeviceSetInfo(hMprServer, hInterface, dwIndex, dwLevel, lpbBuffer) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        lpbBufferMarshal := lpbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceDeviceSetInfo", "ptr", hMprServer, "ptr", hInterface, "uint", dwIndex, "uint", dwLevel, lpbBufferMarshal, lpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceTransportRemove function removes a transport (for example, IP or IPX) from a specified interface.
     * @param {Pointer} hMprServer Handle to the router from which the transport is being removed. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface from which the transport is being removed. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport type to remove. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERFACE_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface specified is a demand-dial interface and is currently connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified transport is not running on the specified interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any supported transport.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacetransportremove
     * @since windowsserver2000
     */
    static MprAdminInterfaceTransportRemove(hMprServer, hInterface, dwTransportId) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        result := DllCall("MPRAPI.dll\MprAdminInterfaceTransportRemove", "ptr", hMprServer, "ptr", hInterface, "uint", dwTransportId, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceTransportAdd function adds a transport (for example, IP or IPX) to a specified interface.
     * @remarks
     * The <i>dwTransportId</i> parameter also specifies the router manager because a router uses a different router manager for each transport.
     * @param {Pointer} hMprServer Handle to the router on which information is being added. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface on which the transport is being added. This handle is obtained by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport type to add to the interface. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pInterfaceInfo Pointer to an information header that specifies interface information for this transport. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers.
     * @param {Integer} dwInterfaceInfoSize Specifies the size, in bytes, of the information pointed to by <i>pInterfaceInfo</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pInterfaceInfo</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any supported transport.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacetransportadd
     * @since windowsserver2000
     */
    static MprAdminInterfaceTransportAdd(hMprServer, hInterface, dwTransportId, pInterfaceInfo, dwInterfaceInfoSize) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        pInterfaceInfoMarshal := pInterfaceInfo is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceTransportAdd", "ptr", hMprServer, "ptr", hInterface, "uint", dwTransportId, pInterfaceInfoMarshal, pInterfaceInfo, "uint", dwInterfaceInfoSize, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceTransportGetInfo function retrieves information about a transport running on a specified interface.
     * @param {Pointer} hMprServer Handle to the router from which information is being retrieved. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport for which information is requested. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Integer>>} ppInterfaceInfo Pointer to a pointer variable. The pointer variable points to an information header that receives information for the specified interface and transport. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @param {Pointer<Integer>} lpdwInterfaceInfoSize Pointer to a <b>DWORD</b> variable. This variable receives the size in bytes of the interface information returned through the <i>ppInterfaceInfo</i> parameter. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not return the size of the interface information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid, or if the interface specified is administratively disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified transport is not running on the specified interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any supported transports.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacetransportgetinfo
     * @since windowsserver2000
     */
    static MprAdminInterfaceTransportGetInfo(hMprServer, hInterface, dwTransportId, ppInterfaceInfo, lpdwInterfaceInfoSize) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        ppInterfaceInfoMarshal := ppInterfaceInfo is VarRef ? "ptr*" : "ptr"
        lpdwInterfaceInfoSizeMarshal := lpdwInterfaceInfoSize is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceTransportGetInfo", "ptr", hMprServer, "ptr", hInterface, "uint", dwTransportId, ppInterfaceInfoMarshal, ppInterfaceInfo, lpdwInterfaceInfoSizeMarshal, lpdwInterfaceInfoSize, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceTransportSetInfo function sets information for a transport running on a specified interface.
     * @param {Pointer} hMprServer Handle to the router on which the transport is being set. Obtain the handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface on which the transport is being set. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport type to set. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pInterfaceInfo Pointer to an information header that contains information for the specified interface and transport. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers.
     * @param {Integer} dwInterfaceInfoSize Specifies the size, in bytes, of the information pointed to by <i>pInterfaceInfo</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pInterfaceInfo</i> parameter is NULL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified transport is not running on the specified interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any supported transport.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacetransportsetinfo
     * @since windowsserver2000
     */
    static MprAdminInterfaceTransportSetInfo(hMprServer, hInterface, dwTransportId, pInterfaceInfo, dwInterfaceInfoSize) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        pInterfaceInfoMarshal := pInterfaceInfo is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceTransportSetInfo", "ptr", hMprServer, "ptr", hInterface, "uint", dwTransportId, pInterfaceInfoMarshal, pInterfaceInfo, "uint", dwInterfaceInfoSize, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceEnum function enumerates all the interfaces on a specified server.
     * @param {Pointer} hMprServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpbBuffer</i> parameter. Must be zero.
     * @param {Pointer<Pointer<Integer>>} lplpbBuffer On successful completion, a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a> structures.  Free this memory buffer by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @param {Integer} dwPrefMaxLen Specifies the preferred maximum length of returned data (in 8-bit bytes). If this parameter is -1, the buffer returned is large enough to hold all available information.
     * @param {Pointer<Integer>} lpdwEntriesRead Pointer to a <b>DWORD</b> variable. This variable receives the total number of interfaces that were enumerated from the current position in the enumeration.
     * @param {Pointer<Integer>} lpdwTotalEntries Pointer to a <b>DWORD</b> variable. This variable receives the total number of interfaces that could have been enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwResumeHandle Pointer to a <b>DWORD</b> variable. This variable specifies a resume handle that can be used to continue the enumeration. The handle should be zero on the first call, and left unchanged on subsequent calls. If the return code is ERROR_MORE_DATA then the call can be re-issued using the handle to retrieve more data. If on return, the handle is <b>NULL</b>, the enumeration cannot be continued. For other types of error returns, this handle is invalid. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not return a resume handle.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More information is available; the enumeration can be continued.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>dwLevel</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfaceenum
     * @since windowsserver2000
     */
    static MprAdminInterfaceEnum(hMprServer, dwLevel, lplpbBuffer, dwPrefMaxLen, lpdwEntriesRead, lpdwTotalEntries, lpdwResumeHandle) {
        lplpbBufferMarshal := lplpbBuffer is VarRef ? "ptr*" : "ptr"
        lpdwEntriesReadMarshal := lpdwEntriesRead is VarRef ? "uint*" : "ptr"
        lpdwTotalEntriesMarshal := lpdwTotalEntries is VarRef ? "uint*" : "ptr"
        lpdwResumeHandleMarshal := lpdwResumeHandle is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceEnum", "ptr", hMprServer, "uint", dwLevel, lplpbBufferMarshal, lplpbBuffer, "uint", dwPrefMaxLen, lpdwEntriesReadMarshal, lpdwEntriesRead, lpdwTotalEntriesMarshal, lpdwTotalEntries, lpdwResumeHandleMarshal, lpdwResumeHandle, "uint")
        return result
    }

    /**
     * Use MprAdminInterfaceSetCredentials function to set the domain, user name, and password that will be used for dialing out on the specified demand-dial interface.
     * @remarks
     * The <i>lpwsUserName</i>, <i>lpwsPassword</i>, and <i>lpwsDomainName</i> parameters are optional. If the calling application specifies <b>NULL</b> for all three parameters, 
     * <b>MprAdminInterfaceSetCredentials</b> removes all credential information for this interface.
     * 
     * The constants UNLEN, PWLEN, and DNLEN are the maximum lengths for the user name, password, and domain name. These constants are defined in Lmcons.h.
     * 
     * Note that the order of the parameters in 
     * <b>MprAdminInterfaceSetCredentials</b> is different from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacegetcredentials">MprAdminInterfaceGetCredentials</a>.
     * @param {PWSTR} lpwsServer Pointer to a <b>null</b>-terminated Unicode string that specifies the name of the router on which to execute this call. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the call is executed on the local machine.
     * @param {PWSTR} lpwsInterfaceName Pointer to a <b>null</b>-terminated Unicode string that specifies the name of the demand-dial interface. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacegetinfo">MprAdminInterfaceGetInfo</a> to obtain the interface name.
     * @param {PWSTR} lpwsUserName Pointer to a <b>null</b>-terminated Unicode string that specifies the user name. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not change the user name associated with this interface.
     * @param {PWSTR} lpwsDomainName Pointer to a <b>null</b>-terminated Unicode string that specifies the domain name. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not change the domain name associated with this interface.
     * @param {PWSTR} lpwsPassword Pointer to a <b>null</b>-terminated Unicode string that specifies the password. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not change the password associated with this interface.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The <i>lpwsInterfaceName</i> parameter is <b>NULL</b>, or it is longer than MAX_INTERFACE_NAME_LEN.</li>
     * <li>At least one of the <i>lpwsUserName</i>, <i>lpwsPassword</i>, and <i>lpwsDomainName</i> parameters is too long, and therefore invalid. See the Remarks section for more information.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to create a new data structure to contain the credentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacesetcredentials
     * @since windowsserver2000
     */
    static MprAdminInterfaceSetCredentials(lpwsServer, lpwsInterfaceName, lpwsUserName, lpwsDomainName, lpwsPassword) {
        lpwsServer := lpwsServer is String ? StrPtr(lpwsServer) : lpwsServer
        lpwsInterfaceName := lpwsInterfaceName is String ? StrPtr(lpwsInterfaceName) : lpwsInterfaceName
        lpwsUserName := lpwsUserName is String ? StrPtr(lpwsUserName) : lpwsUserName
        lpwsDomainName := lpwsDomainName is String ? StrPtr(lpwsDomainName) : lpwsDomainName
        lpwsPassword := lpwsPassword is String ? StrPtr(lpwsPassword) : lpwsPassword

        result := DllCall("MPRAPI.dll\MprAdminInterfaceSetCredentials", "ptr", lpwsServer, "ptr", lpwsInterfaceName, "ptr", lpwsUserName, "ptr", lpwsDomainName, "ptr", lpwsPassword, "uint")
        return result
    }

    /**
     * Use the MprAdminInterfaceGetCredentials function to retrieve the domain, user name, and password for dialing out on the specified demand-dial interface.
     * @remarks
     * The <i>lpwsUserName</i>, <i>lpwsPassword</i>, and <i>lpwsDomainName</i> parameters are optional. If the calling application specifies <b>NULL</b> for all three parameters, 
     * <b>MprAdminInterfaceGetCredentials</b> returns NO_ERROR and the domain, user name, and password are not returned.
     * 
     * The constants UNLEN, PWLEN, and DNLEN are the maximum lengths for the user name, password, and domain name. These constants are defined in lmcons.h.
     * 
     * Note that the order of the parameters in 
     * <b>MprAdminInterfaceGetCredentials</b> is different from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacesetcredentials">MprAdminInterfaceSetCredentials</a>.
     * @param {PWSTR} lpwsServer Pointer to a <b>null</b>-terminated Unicode string that specifies the name of the router on which to execute this call. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the call is executed on the local machine.
     * @param {PWSTR} lpwsInterfaceName Pointer to a <b>null</b>-terminated Unicode string that specifies the name of the demand-dial interface. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacegetinfo">MprAdminInterfaceGetInfo</a> to obtain the interface name.
     * @param {PWSTR} lpwsUserName Pointer to a Unicode string that receives the name of the user. This string should be UNLEN+1 long. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not return the user name.
     * @param {PWSTR} lpwsPassword Pointer to a Unicode string that receives the password. This string should be PWLEN+1 long. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not return the password.
     * @param {PWSTR} lpwsDomainName Pointer to a Unicode string that receives the domain name. This string should be DNLEN+1 long. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not return the domain name.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_FIND_PHONEBOOK_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified interface does not have any demand-dial parameters associated with it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpwsInterfaceName</i> parameter is <b>NULL</b>.
     * 							
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpwsUserName</i>, <i>lpwsPassword</i>, and <i>lpwsDomainName</i> parameters are all <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacegetcredentials
     * @since windowsserver2000
     */
    static MprAdminInterfaceGetCredentials(lpwsServer, lpwsInterfaceName, lpwsUserName, lpwsPassword, lpwsDomainName) {
        lpwsServer := lpwsServer is String ? StrPtr(lpwsServer) : lpwsServer
        lpwsInterfaceName := lpwsInterfaceName is String ? StrPtr(lpwsInterfaceName) : lpwsInterfaceName
        lpwsUserName := lpwsUserName is String ? StrPtr(lpwsUserName) : lpwsUserName
        lpwsPassword := lpwsPassword is String ? StrPtr(lpwsPassword) : lpwsPassword
        lpwsDomainName := lpwsDomainName is String ? StrPtr(lpwsDomainName) : lpwsDomainName

        result := DllCall("MPRAPI.dll\MprAdminInterfaceGetCredentials", "ptr", lpwsServer, "ptr", lpwsInterfaceName, "ptr", lpwsUserName, "ptr", lpwsPassword, "ptr", lpwsDomainName, "uint")
        return result
    }

    /**
     * Use the MprAdminInterfaceSetCredentialsEx function to set extended credentials information for an interface. Use this function to set credentials information used for Extensible Authentication Protocols (EAPs).
     * @remarks
     * To a delete a pre-shared key, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacesetcredentials">MprAdminInterfaceSetCredentials</a> with the <b>dwSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_1">MPR_CREDENTIALSEX_1</a> structure set to zero.
     * @param {Pointer} hMprServer Handle to a  router. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is structured in the <i>lpbBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0 or 1 as listed in the following table. A value of 1 indicates the information is a pre-shared key for the interface.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Windows 2000 Server: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_0">MPR_CREDENTIALSEX_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Windows Server 2003 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_1">MPR_CREDENTIALSEX_1</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpbBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_0">MPR_CREDENTIALSEX_0</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_1">MPR_CREDENTIALSEX_1</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lplpbBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacesetcredentialsex
     * @since windowsserver2000
     */
    static MprAdminInterfaceSetCredentialsEx(hMprServer, hInterface, dwLevel, lpbBuffer) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        lpbBufferMarshal := lpbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceSetCredentialsEx", "ptr", hMprServer, "ptr", hInterface, "uint", dwLevel, lpbBufferMarshal, lpbBuffer, "uint")
        return result
    }

    /**
     * Use the MprAdminInterfaceGetCredentialsEx function to retrieve extended credentials information for the specified interface. Use this function to retrieve credentials information used for Extensible Authentication Protocols (EAPs).
     * @param {Pointer} hMprServer Handle to a router. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpbBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0 or 1, as listed in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Windows 2000 Server: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_0">MPR_CREDENTIALSEX_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Windows Server 2003 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_1">MPR_CREDENTIALSEX_1</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * A value of 1 indicates the information is a pre-shared key for the interface, which is in an encrypted format.
     * @param {Pointer<Pointer<Integer>>} lplpbBuffer On successful completion, a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_0">MPR_CREDENTIALSEX_0</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_credentialsex_1">MPR_CREDENTIALSEX_1</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * 					Free the memory occupied by this structure with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminbufferfree">MprAdminBufferFree</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lplpbBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwLevel</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacegetcredentialsex
     * @since windowsserver2000
     */
    static MprAdminInterfaceGetCredentialsEx(hMprServer, hInterface, dwLevel, lplpbBuffer) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        lplpbBufferMarshal := lplpbBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceGetCredentialsEx", "ptr", hMprServer, "ptr", hInterface, "uint", dwLevel, lplpbBufferMarshal, lplpbBuffer, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceConnect function creates a connection to the specified WAN interface.
     * @remarks
     * The following table summarizes the relationship between <i>hEvent</i> and <i>fBlocking</i>.
     * 
     * <table>
     * <tr>
     * <th>hEvent</th>
     * <th>fBlocking</th>
     * <th>Result</th>
     * </tr>
     * <tr>
     * <td>Event Handle</td>
     * <td>Ignored</td>
     * <td>The call returns immediately. A return value of PENDING indicates that the attempt was initiated successfully. Wait on <i>hEvent</i>. When <i>hEvent</i> is signaled, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacegetinfo">MprAdminInterfaceGetInfo</a> to determine the success or failure of the connection attempt.</td>
     * </tr>
     * <tr>
     * <td><b>NULL</b></td>
     * <td><b>TRUE</b></td>
     * <td>The call does not return until the connection attempt has completed.</td>
     * </tr>
     * <tr>
     * <td><b>NULL</b></td>
     * <td><b>FALSE</b></td>
     * <td>The call returns immediately. A return value of PENDING indicates that the attempt was initiated successfully.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @param {Pointer} hMprServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @param {HANDLE} hEvent Handle to an event that is signaled after the attempt to connect the interface has completed. The function initiates the connection attempt and returns immediately. After the event is signaled, you can obtain the result of the connection attempt by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacegetinfo">MprAdminInterfaceGetInfo</a>. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, and <i>fBlocking</i> is <b>TRUE</b>, then this call is synchronous, that is, the function does not return until the connection attempt has completed.
     * 
     * The calling application must specify <b>NULL</b> for this parameter, if <i>hMprServer</i> specifies a remote router.
     * @param {BOOL} fSynchronous If <i>hEvent</i> is <b>NULL</b> and this parameter is set to <b>TRUE</b>, the function does not return until the connection attempt has completed. 
     * 
     * 
     * 
     * 
     * If <i>hEvent</i> is <b>NULL</b>, and this parameter is set to <b>FALSE</b>, the function will return immediately. A return value of PENDING indicates that the connection attempt was initiated successfully.
     * 
     * If <i>hEvent</i> is not <b>NULL</b>, this parameter is ignored.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_CONNECTING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A connection is already in progress on this interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERFACE_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is currently disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERFACE_HAS_NO_DEVICES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No adapters are available for this interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_IS_PAUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial service is currently paused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is in the process of connecting. The calling application must wait on the <i>hEvent</i> handle, if one was specified. After the event is signaled, you can obtain the state of the connection and any associated error by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacegetinfo">MprAdminInterfaceGetInfo</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfaceconnect
     * @since windowsserver2000
     */
    static MprAdminInterfaceConnect(hMprServer, hInterface, hEvent, fSynchronous) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := DllCall("MPRAPI.dll\MprAdminInterfaceConnect", "ptr", hMprServer, "ptr", hInterface, "ptr", hEvent, "int", fSynchronous, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceDisconnect function disconnects a connected WAN interface.
     * @param {Pointer} hMprServer Handle to the  router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERFACE_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This interface is not connected. Therefore, it cannot be disconnected.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-management-reference">Router Management Reference</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-administration-functions">Router Administration Functions</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfaceconnect">MprAdminInterfaceConnect</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacedisconnect
     * @since windowsserver2000
     */
    static MprAdminInterfaceDisconnect(hMprServer, hInterface) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        result := DllCall("MPRAPI.dll\MprAdminInterfaceDisconnect", "ptr", hMprServer, "ptr", hInterface, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceUpdateRoutes function requests a specified router manager to update its routing information for a specified interface.
     * @remarks
     * The <i>dwTransportId</i> parameter specifies both a transport protocol and a unique router manager because the router uses a different router manager for each transport.
     * @param {Pointer} hMprServer Handle to the router on which information is being updated. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface being updated. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @param {Integer} dwProtocolId A <b>DWORD</b> value that specifies which router manager is updating its routing information. The router uses a different router manager for each transport protocol. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {HANDLE} hEvent Handle to an event that is signaled when the attempt to update routing information for the specified interface has completed. If <b>NULL</b>, then the function is synchronous. The calling application must specify <b>NULL</b> for this parameter, if <i>hMprServer</i> specifies a remote router.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERFACE_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified interface is not connected. Therefore, routes cannot be updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified transport is not running on the specified interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any of the router managers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UPDATE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A routing information update operation is already in progress on this interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is in the process of updating routing information. The calling application must wait on the event object specified by <i>hEvent</i>. After the event is signaled, the status of the update operation can be obtained by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacequeryupdateresult">MprAdminInterfaceQueryUpdateResult</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfaceupdateroutes
     * @since windowsserver2000
     */
    static MprAdminInterfaceUpdateRoutes(hMprServer, hInterface, dwProtocolId, hEvent) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := DllCall("MPRAPI.dll\MprAdminInterfaceUpdateRoutes", "ptr", hMprServer, "ptr", hInterface, "uint", dwProtocolId, "ptr", hEvent, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceQueryUpdateResult function returns the result of the last request to a specified router manager to update its routes for an interface. For more information, see MprAdminInterfaceUpdateRoutes.
     * @remarks
     * The <i>dwProtocolId</i> parameter specifies both a transport and a router manager, since the router maintains a router manager for each transport.
     * @param {Pointer} hMprServer Handle to the router from which information is being retrieved. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to the interface. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @param {Integer} dwProtocolId A <b>DWORD</b> value that specifies which router manager is being queried. The router uses a different router manager for each transport protocol. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpdwUpdateResult Pointer to a <b>DWORD</b> variable. This variable receives the result of the last call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfaceupdateroutes">MprAdminInterfaceUpdateRoutes</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERFACE_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified interface is not connected; the result of the last update is no longer available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpdwUpdateResult</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified transport is not running on the specified interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwProtocolId</i> value does not match any supported router manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfacequeryupdateresult
     * @since windowsserver2000
     */
    static MprAdminInterfaceQueryUpdateResult(hMprServer, hInterface, dwProtocolId, lpdwUpdateResult) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        lpdwUpdateResultMarshal := lpdwUpdateResult is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminInterfaceQueryUpdateResult", "ptr", hMprServer, "ptr", hInterface, "uint", dwProtocolId, lpdwUpdateResultMarshal, lpdwUpdateResult, "uint")
        return result
    }

    /**
     * The MprAdminInterfaceUpdatePhonebookInfo function forces the router to pick up changes made on a specified demand-dial interface. Call this function after changes are made to a phone-book entry for a demand-dial interface.
     * @param {Pointer} hMprServer Handle to the router on which to execute this call. Obtain the handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hInterface Handle to a demand-dial interface. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_LOAD_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not load the phone book into memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PHONEBOOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not find the phone-book file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERFACE_HAS_NO_DEVICES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No device is currently associated with this interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInterface</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradmininterfaceupdatephonebookinfo
     * @since windowsserver2000
     */
    static MprAdminInterfaceUpdatePhonebookInfo(hMprServer, hInterface) {
        hInterface := hInterface is Win32Handle ? NumGet(hInterface, "ptr") : hInterface

        result := DllCall("MPRAPI.dll\MprAdminInterfaceUpdatePhonebookInfo", "ptr", hMprServer, "ptr", hInterface, "uint")
        return result
    }

    /**
     * The MprAdminRegisterConnectionNotification function registers an event object with the Demand Dial Manager (DDM) so that, if an interface connects or disconnects, the event is signaled.
     * @remarks
     * The event is signaled when an interface connects or disconnects. When an event is signaled, the calling application can determine which interface is affected by using a function such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminconnectionenum">MprAdminConnectionEnum</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfaceenum">MprAdminInterfaceEnum</a>.
     * @param {Pointer} hMprServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hEventNotification Handle to an event object. This event is signaled whenever an interface connects or disconnects.
     * @returns {Integer} If the function is successful, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hEventNotification</i> parameter is <b>NULL</b> or is an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminregisterconnectionnotification
     * @since windowsserver2000
     */
    static MprAdminRegisterConnectionNotification(hMprServer, hEventNotification) {
        hEventNotification := hEventNotification is Win32Handle ? NumGet(hEventNotification, "ptr") : hEventNotification

        result := DllCall("MPRAPI.dll\MprAdminRegisterConnectionNotification", "ptr", hMprServer, "ptr", hEventNotification, "uint")
        return result
    }

    /**
     * The MprAdminDeregisterConnectionNotification function deregisters an event object that was previously registered using MprAdminRegisterConnectionNotification. Once deregistered, this event is no longer signaled when an interface connects or disconnects.
     * @param {Pointer} hMprServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserverconnect">MprAdminServerConnect</a>.
     * @param {HANDLE} hEventNotification Handle to an event object to deregister. This event is no longer  signaled when an interface connects or disconnects.
     * @returns {Integer} If the function is successful, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DDM_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Demand Dial Manager (DDM) is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hEventNotification</i> parameter is <b>NULL</b> or is an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminderegisterconnectionnotification
     * @since windowsserver2000
     */
    static MprAdminDeregisterConnectionNotification(hMprServer, hEventNotification) {
        hEventNotification := hEventNotification is Win32Handle ? NumGet(hEventNotification, "ptr") : hEventNotification

        result := DllCall("MPRAPI.dll\MprAdminDeregisterConnectionNotification", "ptr", hMprServer, "ptr", hEventNotification, "uint")
        return result
    }

    /**
     * The MprAdminMIBServerConnect function establishes a connection to the router being administered. This call should be made before any other calls to the server. The handle returned by this function is used in subsequent MIB calls.
     * @param {PWSTR} lpwsServerName Pointer to a Unicode string that specifies the name of the remote server. If the caller specifies <b>NULL</b> for this parameter, the function returns a handle to the local server.
     * @param {Pointer<Pointer>} phMibServer Pointer to a handle variable. This variable receives a handle to the server.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminmibserverconnect
     * @since windowsserver2000
     */
    static MprAdminMIBServerConnect(lpwsServerName, phMibServer) {
        lpwsServerName := lpwsServerName is String ? StrPtr(lpwsServerName) : lpwsServerName

        phMibServerMarshal := phMibServer is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminMIBServerConnect", "ptr", lpwsServerName, phMibServerMarshal, phMibServer, "uint")
        return result
    }

    /**
     * The MprAdminMIBServerDisconnect function disconnects the connection made by a previous call to MprAdminMIBServerConnect.
     * @param {Pointer} hMibServer Handle to the router from which to disconnect. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibserverconnect">MprAdminMIBServerConnect</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminmibserverdisconnect
     * @since windowsserver2000
     */
    static MprAdminMIBServerDisconnect(hMibServer) {
        DllCall("MPRAPI.dll\MprAdminMIBServerDisconnect", "ptr", hMibServer)
    }

    /**
     * The MprAdminMIBEntryCreate function creates an entry for one of the variables exported by a routing protocol or router manager.
     * @remarks
     * Do not pass in <b>NULL</b> for the <i>lpEntry</i> parameter because the resulting behavior is undefined.
     * @param {Pointer} hMibServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibserverconnect">MprAdminMIBServerConnect</a>.
     * @param {Integer} dwPid Receives the router manager that exported the variable.
     * @param {Integer} dwRoutingPid Specifies the routing protocol that exported the variable.
     * @param {Pointer<Void>} lpEntry Pointer to an opaque data 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mib/mib-structures">structure</a>. The data structure's format is determined by the router manager or router manager client servicing the call. The data structure should contain information that specifies the variable being created and the value to assign to the variable.
     * @param {Integer} dwEntrySize Specifies the size, in bytes, of the data pointed to by the <i>lpEntry</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwRoutingPid</i> variable does not match any installed routing protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any installed router manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminmibentrycreate
     * @since windowsserver2000
     */
    static MprAdminMIBEntryCreate(hMibServer, dwPid, dwRoutingPid, lpEntry, dwEntrySize) {
        lpEntryMarshal := lpEntry is VarRef ? "ptr" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminMIBEntryCreate", "ptr", hMibServer, "uint", dwPid, "uint", dwRoutingPid, lpEntryMarshal, lpEntry, "uint", dwEntrySize, "uint")
        return result
    }

    /**
     * The MprAdminMIBEntryDelete function deletes an entry for one of the variables exported by a routing protocol or router manager.
     * @remarks
     * Do not pass in <b>NULL</b> for the <i>lpEntry</i> parameter because the resulting behavior is undefined.
     * @param {Pointer} hMibServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibserverconnect">MprAdminMIBServerConnect</a>.
     * @param {Integer} dwProtocolId Specifies the router manager that exported the variable.
     * @param {Integer} dwRoutingPid Specifies the routing protocol that exported the variable.
     * @param {Pointer<Void>} lpEntry Pointer to an opaque data 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mib/mib-structures">structure</a>. The data structure's format is determined by the module servicing the call. The data structure should contain information that specifies the variable to be deleted.
     * @param {Integer} dwEntrySize Specifies the size, in bytes, of the data pointed to by <i>lpEntry</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwRoutingPid</i> variable does not match any installed routing protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any installed router manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminmibentrydelete
     * @since windowsserver2000
     */
    static MprAdminMIBEntryDelete(hMibServer, dwProtocolId, dwRoutingPid, lpEntry, dwEntrySize) {
        lpEntryMarshal := lpEntry is VarRef ? "ptr" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminMIBEntryDelete", "ptr", hMibServer, "uint", dwProtocolId, "uint", dwRoutingPid, lpEntryMarshal, lpEntry, "uint", dwEntrySize, "uint")
        return result
    }

    /**
     * The MprAdminMIBEntrySet function sets the value of one of the variables exported by a routing protocol or router manager.
     * @remarks
     * Do not pass in <b>NULL</b> for the <i>lpEntry</i> parameter because the resulting behavior is undefined.
     * @param {Pointer} hMibServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibserverconnect">MprAdminMIBServerConnect</a>.
     * @param {Integer} dwProtocolId Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/transport-identifiers">router manager</a> that exported the variable.
     * @param {Integer} dwRoutingPid Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/protocol-identifiers">routing protocol</a> that exported the variable.
     * @param {Pointer<Void>} lpEntry Pointer to an opaque data 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mib/mib-structures">structure</a>. The data structure's format is determined by the module that services the call. The data structure should contain information that specifies the variable being set and the value to be assigned to the variable.
     * @param {Integer} dwEntrySize Specifies the size, in bytes, of the data pointed to by the <i>lpEntry</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwRoutingPid</i> variable does not match any installed routing protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any installed router manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminmibentryset
     * @since windowsserver2000
     */
    static MprAdminMIBEntrySet(hMibServer, dwProtocolId, dwRoutingPid, lpEntry, dwEntrySize) {
        lpEntryMarshal := lpEntry is VarRef ? "ptr" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminMIBEntrySet", "ptr", hMibServer, "uint", dwProtocolId, "uint", dwRoutingPid, lpEntryMarshal, lpEntry, "uint", dwEntrySize, "uint")
        return result
    }

    /**
     * The MprAdminMIBEntryGet function retrieves the value of one of the variables exported by a routing protocol or router manager.
     * @remarks
     * Do not pass in <b>NULL</b> for the <i>lpInEntry</i> parameter because the resulting behavior is undefined.
     * @param {Pointer} hMibServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibserverconnect">MprAdminMIBServerConnect</a>.
     * @param {Integer} dwProtocolId Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/transport-identifiers">router manager</a> that exported the variable.
     * @param {Integer} dwRoutingPid Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/protocol-identifiers">routing protocol</a> that exported the variable.
     * @param {Pointer<Void>} lpInEntry Pointer to an opaque data 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mib/mib-structures">structure</a>. The data structure's format is determined by the module servicing the call. The data structure should contain information that specifies the variable being queried.
     * @param {Integer} dwInEntrySize Specifies the size, in bytes, of the data structure pointed to by <i>lpInEntry</i>.
     * @param {Pointer<Pointer<Void>>} lplpOutEntry Pointer to a pointer variable. On successful return, this pointer variable points to an opaque data 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mib/mib-structures">structure</a>. The data structure's format is determined by the module servicing the call. The data structure receives the value of the variable that was queried. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibbufferfree">MprAdminMIBBufferFree</a>.
     * @param {Pointer<Integer>} lpOutEntrySize Pointer to a <b>DWORD</b> variable that, on successful return, receives the size in bytes of the data structure returned through the <i>lplpOutEntry</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwRoutingPid</i> variable does not match any installed routing protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any installed router manager.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminmibentryget
     * @since windowsserver2000
     */
    static MprAdminMIBEntryGet(hMibServer, dwProtocolId, dwRoutingPid, lpInEntry, dwInEntrySize, lplpOutEntry, lpOutEntrySize) {
        lpInEntryMarshal := lpInEntry is VarRef ? "ptr" : "ptr"
        lplpOutEntryMarshal := lplpOutEntry is VarRef ? "ptr*" : "ptr"
        lpOutEntrySizeMarshal := lpOutEntrySize is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminMIBEntryGet", "ptr", hMibServer, "uint", dwProtocolId, "uint", dwRoutingPid, lpInEntryMarshal, lpInEntry, "uint", dwInEntrySize, lplpOutEntryMarshal, lplpOutEntry, lpOutEntrySizeMarshal, lpOutEntrySize, "uint")
        return result
    }

    /**
     * The MprAdminMIBEntryGetFirst function retrieves the first variable of some set of variables exported by a protocol or router manager. The module that services the call defines first.
     * @remarks
     * Do not pass in <b>NULL</b> for the <i>lpInEntry</i> parameter because the resulting behavior is undefined.
     * @param {Pointer} hMibServer Handle to the router on which to execute this call. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibserverconnect">MprAdminMIBServerConnect</a>.
     * @param {Integer} dwProtocolId Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/transport-identifiers">router manager</a> that exported the variable.
     * @param {Integer} dwRoutingPid Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/protocol-identifiers">routing protocol</a> that exported the variable.
     * @param {Pointer<Void>} lpInEntry Pointer to an opaque data 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mib/mib-structures">structure</a>. The data structure's format is determined by the module servicing the call. The data structure should contain information that specifies the variable being queried.
     * @param {Integer} dwInEntrySize Specifies the size, in bytes, of the data pointed to by <i>lpInEntry</i>.
     * @param {Pointer<Pointer<Void>>} lplpOutEntry Pointer to a pointer variable. On successful return, this pointer variable points to an opaque data 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mib/mib-structures">structure</a>. The data structure's format is determined by the module servicing the call. The data structure receives the value of the first variable from the set of variables exported. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibbufferfree">MprAdminMIBBufferFree</a>.
     * @param {Pointer<Integer>} lpOutEntrySize Pointer to a <b>DWORD</b> variable. On successful return, this variable receives the size, in bytes, of the data structure that was returned through the <i>lplpOutEntry</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwRoutingPid</i> variable does not match any installed routing protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any installed transport/router manager.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminmibentrygetfirst
     * @since windowsserver2000
     */
    static MprAdminMIBEntryGetFirst(hMibServer, dwProtocolId, dwRoutingPid, lpInEntry, dwInEntrySize, lplpOutEntry, lpOutEntrySize) {
        lpInEntryMarshal := lpInEntry is VarRef ? "ptr" : "ptr"
        lplpOutEntryMarshal := lplpOutEntry is VarRef ? "ptr*" : "ptr"
        lpOutEntrySizeMarshal := lpOutEntrySize is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminMIBEntryGetFirst", "ptr", hMibServer, "uint", dwProtocolId, "uint", dwRoutingPid, lpInEntryMarshal, lpInEntry, "uint", dwInEntrySize, lplpOutEntryMarshal, lplpOutEntry, lpOutEntrySizeMarshal, lpOutEntrySize, "uint")
        return result
    }

    /**
     * The MprAdminMIBEntryGetNext function retrieves the next variable of some set of variables exported by a protocol or router manager. The module that services the call defines next.
     * @remarks
     * Do not pass in <b>NULL</b> for the <i>lpInEntry</i> parameter because the resulting behavior is undefined.
     * @param {Pointer} hMibServer Handle to the router on which to execute this call. This handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibserverconnect">MprAdminMIBServerConnect</a>.
     * @param {Integer} dwProtocolId Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/transport-identifiers">router manager</a> that exported the variable.
     * @param {Integer} dwRoutingPid Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/protocol-identifiers">routing protocol</a> that exported the variable.
     * @param {Pointer<Void>} lpInEntry Pointer to an opaque data 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mib/mib-structures">structure</a>. The data structure's format is determined by the module that services the call. The data structure should contain information that specifies the variable being queried.
     * @param {Integer} dwInEntrySize Specifies the size, in bytes, of the data structure pointed to by <i>lpInEntry</i>.
     * @param {Pointer<Pointer<Void>>} lplpOutEntry Pointer to a pointer variable. On successful return, this pointer variable points to an opaque data 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mib/mib-structures">structure</a>. The data structure's format is determined by the module that services the call. The data structure receives the value of the next variable from the set of variables exported. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminmibbufferfree">MprAdminMIBBufferFree</a>.
     * @param {Pointer<Integer>} lpOutEntrySize Pointer to a <b>DWORD</b> variable. This variable receives the size in bytes of the data structure returned through the <i>lplpOutEntry</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwRoutingPid</i> variable does not match any installed routing protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransportId</i> value does not match any installed router manager.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminmibentrygetnext
     * @since windowsserver2000
     */
    static MprAdminMIBEntryGetNext(hMibServer, dwProtocolId, dwRoutingPid, lpInEntry, dwInEntrySize, lplpOutEntry, lpOutEntrySize) {
        lpInEntryMarshal := lpInEntry is VarRef ? "ptr" : "ptr"
        lplpOutEntryMarshal := lplpOutEntry is VarRef ? "ptr*" : "ptr"
        lpOutEntrySizeMarshal := lpOutEntrySize is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminMIBEntryGetNext", "ptr", hMibServer, "uint", dwProtocolId, "uint", dwRoutingPid, lpInEntryMarshal, lpInEntry, "uint", dwInEntrySize, lplpOutEntryMarshal, lplpOutEntry, lpOutEntrySizeMarshal, lpOutEntrySize, "uint")
        return result
    }

    /**
     * The MprAdminMIBBufferFree function frees buffers returned by the following functions MprAdminMIBEntryGet, MprAdminMIBEntryGetFirst, MprAdminMIBEntryGetNext
     * @param {Pointer<Void>} pBuffer Pointer to a memory buffer to free.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mpradminmibbufferfree
     * @since windowsserver2000
     */
    static MprAdminMIBBufferFree(pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("MPRAPI.dll\MprAdminMIBBufferFree", pBufferMarshal, pBuffer, "uint")
        return result
    }

    /**
     * The MprConfigServerInstall function configures Routing and Remote Access Service with a default configuration.
     * @remarks
     * The 
     * <b>MprConfigServerInstall</b> function performs the following tasks:
     * 
     * <ul>
     * <li>Resets the current Router Manager and Interface keys.</li>
     * <li>Initializes RAS structures for IP.</li>
     * <li>Sets the router type to include: 
     * 
     * 
     * ROUTER_TYPE_RAS
     * 
     * ROUTER_TYPE_WAN
     * 
     * ROUTER_TYPE_LAN
     * 
     * </li>
     * <li>Sets the error logging level and authorization settings to defaults.</li>
     * <li>Sets the devices for Routing and RAS.</li>
     * <li>Adds the RRAS snap-in to the computer management console.</li>
     * <li>Deletes the router phone book.</li>
     * <li>Registers the router in the domain.</li>
     * <li>Writes out the <b>router is configured</b> registry key.</li>
     * </ul>
     * The 
     * <b>MprConfigServerInstall</b> function does not start Routing and RAS or  set the service start type for Routing and RAS.
     * @param {Integer} dwLevel This parameter is reserved for future use, and should be zero.
     * @param {Pointer<Void>} pBuffer This parameter is reserved for future use, and should be <b>NULL</b>.
     * @returns {Integer} If the functions succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>dwLevel</i> is not zero.</li>
     * <li><i>pBuffer</i> is non-<b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigserverinstall
     * @since windowsserver2000
     */
    static MprConfigServerInstall(dwLevel, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigServerInstall", "uint", dwLevel, pBufferMarshal, pBuffer, "uint")
        return result
    }

    /**
     * The MprConfigServerConnect function connects to the router to be configured.
     * @param {PWSTR} lpwsServerName Pointer to a Unicode string that specifies the name of the remote server to configure. If this parameter is <b>NULL</b>, the function returns a handle to the router configuration on the local machine.
     * @param {Pointer<HANDLE>} phMprConfig Pointer to a handle variable. This variable receives a handle to the router configuration.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>phMprConfig</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigserverconnect
     * @since windowsserver2000
     */
    static MprConfigServerConnect(lpwsServerName, phMprConfig) {
        lpwsServerName := lpwsServerName is String ? StrPtr(lpwsServerName) : lpwsServerName

        result := DllCall("MPRAPI.dll\MprConfigServerConnect", "ptr", lpwsServerName, "ptr", phMprConfig, "uint")
        return result
    }

    /**
     * The MprConfigServerDisconnect function disconnects a connection made by a previous call to MprConfigServerConnect.
     * @param {HANDLE} hMprConfig Handle to a router configuration obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigserverdisconnect
     * @since windowsserver2000
     */
    static MprConfigServerDisconnect(hMprConfig) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig

        DllCall("MPRAPI.dll\MprConfigServerDisconnect", "ptr", hMprConfig)
    }

    /**
     * 
     * @param {HANDLE} hMprConfig 
     * @returns {Integer} 
     */
    static MprConfigServerRefresh(hMprConfig) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig

        result := DllCall("MPRAPI.dll\MprConfigServerRefresh", "ptr", hMprConfig, "uint")
        return result
    }

    /**
     * The MprConfigBufferFree function frees buffers. MprConfigXEnum, MprConfigXGetInfo
     * @param {Pointer<Void>} pBuffer Pointer to a memory buffer allocated by a previous call to: 
     * 
     * 
     * 
     * 
     * MprConfigXEnum
     * 						
     * 
     * MprConfigXGetInfo
     * 						
     * 
     * where X stands for Server, 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/interface">Interface</a>, Transport, or InterfaceTransport.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigbufferfree
     * @since windowsserver2000
     */
    static MprConfigBufferFree(pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigBufferFree", pBufferMarshal, pBuffer, "uint")
        return result
    }

    /**
     * The MprConfigServerGetInfo function retrieves server-level configuration information for the specified router.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0, 1, and 2 as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Windows 2000 Server or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_0">MPR_SERVER_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Windows Server 2003 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_1">MPR_SERVER_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_2">MPR_SERVER_2</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Integer>>} lplpbBuffer On successful completion, a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_0">MPR_SERVER_0</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_1">MPR_SERVER_1</a>,  
     * or   <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_2">MPR_SERVER_2</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * 					Free the memory for this buffer using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigbufferfree">MprConfigBufferFree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The <i>hMprConfig</i> parameter is <b>NULL</b>.</li>
     * <li>The <i>dwLevel</i> parameter is not zero.</li>
     * <li>The <i>lplpBuffer</i> parameter is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigservergetinfo
     * @since windowsserver2000
     */
    static MprConfigServerGetInfo(hMprConfig, dwLevel, lplpbBuffer) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig

        lplpbBufferMarshal := lplpbBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigServerGetInfo", "ptr", hMprConfig, "uint", dwLevel, lplpbBufferMarshal, lplpbBuffer, "uint")
        return result
    }

    /**
     * The MprConfigServerSetInfo function is used to set the port count for L2TP, PPTP, and SSTP ports and enable or disable RRAS on them in the registry when the RRAS service is not running so that it is picked up next time the system restarts.
     * @remarks
     * These changes to a server configuration are persistent, but have no effect on a RRAS server until it is restarted.
     * @param {Pointer} hMprServer Handle to the router configuration. Obtain this handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is structured in the <i>lpbBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 1 and 2 as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Windows Server 2003 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_1">MPR_SERVER_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_2">MPR_SERVER_2</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpbBuffer A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_1">MPR_SERVER_1</a>  
     * or   <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_2">MPR_SERVER_2</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS_REBOOT_REQUIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A system reboot is required for such a change to take affect. Change the port count using the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserversetinfo">MprConfigServerSetInfo</a> call and reboot.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If you try to set the number of ports to more than the system supported limits as defined on the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_1">MPR_SERVER_1</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_2">MPR_SERVER_2</a> topics.
     * 
     * Returns this error if you try to set the number of PPTP ports to 0.
     * 
     * Returns this error if the flags are not valid or if <i>lpbBuffer</i> or <i>hMprServer</i> is <b>NULL</b>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of dwLevel is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hMprServer</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigserversetinfo
     * @since windowsserver2003
     */
    static MprConfigServerSetInfo(hMprServer, dwLevel, lpbBuffer) {
        lpbBufferMarshal := lpbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigServerSetInfo", "ptr", hMprServer, "uint", dwLevel, lpbBufferMarshal, lpbBuffer, "uint")
        return result
    }

    /**
     * The MprConfigServerBackup function creates a backup of the router-manager, interface, and phone-book configuration for the router.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {PWSTR} lpwsPath Pointer to a <b>null</b>-terminated Unicode string that specifies the path to the directory in which to write the backup files. This path should end with a trailing backslash.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hMprConfig</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigserverbackup
     * @since windowsserver2000
     */
    static MprConfigServerBackup(hMprConfig, lpwsPath) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        lpwsPath := lpwsPath is String ? StrPtr(lpwsPath) : lpwsPath

        result := DllCall("MPRAPI.dll\MprConfigServerBackup", "ptr", hMprConfig, "ptr", lpwsPath, "uint")
        return result
    }

    /**
     * The MprConfigServerRestore function restores the router-manager, interface, and phone-book configuration from a backup created by a previous call to MprConfigServerBackup.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {PWSTR} lpwsPath Pointer to a Unicode string that specifies the path to the directory that contains the backup files. This path should end with a trailing backslash.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hMprConfig</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigserverrestore
     * @since windowsserver2000
     */
    static MprConfigServerRestore(hMprConfig, lpwsPath) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        lpwsPath := lpwsPath is String ? StrPtr(lpwsPath) : lpwsPath

        result := DllCall("MPRAPI.dll\MprConfigServerRestore", "ptr", hMprConfig, "ptr", lpwsPath, "uint")
        return result
    }

    /**
     * The MprConfigTransportCreate function adds the specified transport to the list of transport protocols present in the specified router configuration.
     * @remarks
     * If the specified transport already exists, 
     * <b>MprConfigTransportCreate</b> does the equivalent of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigtransportsetinfo">MprConfigTransportSetInfo</a> call using the supplied parameter values.
     * @param {HANDLE} hMprConfig Handle to the router configuration to which to add the transport. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport to add to the configuration. This parameter also identifies the router manager for the transport. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {PWSTR} lpwsTransportName Pointer to a <b>null</b>-terminated Unicode string that specifies the name of the transport being added. If this parameter is not specified, the <i>dwTransportId</i> parameter is converted into a string and used as the transport name.
     * @param {Pointer} pGlobalInfo Pointer to an information header that specifies global information for the transport. The router manager for the transport interprets this information. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers.
     * @param {Integer} dwGlobalInfoSize Specifies the size, in bytes, of the data pointed to by the <i>pGlobalInfo</i> parameter.
     * @param {Pointer} pClientInterfaceInfo Pointer to an information header that specifies default interface information for client routers. This information is used to configure dynamic interfaces for client routers for this transport. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers. 
     * 
     * 
     * 
     * 
     * This parameter is optional; the calling application can specify <b>NULL</b> for this parameter.
     * @param {Integer} dwClientInterfaceInfoSize Specifies the size, in bytes, of the data pointed to by the <i>pClientInterfaceInfo</i> parameter. If the calling application specifies <b>NULL</b> for <i>pClientInterfaceInfo</i>, the calling application should specify zero for this parameter.
     * @param {PWSTR} lpwsDLLPath Pointer to a <b>null</b>-terminated Unicode string that specifies the name of the router manager DLL for the specified transport. If this name is specified, the function sets the DLL path for this transport to this name. 
     * 
     * 
     * 
     * 
     * This parameter is optional; the calling application can specify <b>NULL</b> for this parameter.
     * @param {Pointer<HANDLE>} phRouterTransport A pointer to a  
     * <b>HANDLE</b> variable that receives the transport configuration handle type indicated in the <i>dwTransportId</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hMprConfig</i> parameter is <b>NULL</b>, or the <i>phRouterTransport</i> parameter is <b>NULL</b>, or both are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigtransportcreate
     * @since windowsserver2000
     */
    static MprConfigTransportCreate(hMprConfig, dwTransportId, lpwsTransportName, pGlobalInfo, dwGlobalInfoSize, pClientInterfaceInfo, dwClientInterfaceInfoSize, lpwsDLLPath, phRouterTransport) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        lpwsTransportName := lpwsTransportName is String ? StrPtr(lpwsTransportName) : lpwsTransportName
        lpwsDLLPath := lpwsDLLPath is String ? StrPtr(lpwsDLLPath) : lpwsDLLPath

        result := DllCall("MPRAPI.dll\MprConfigTransportCreate", "ptr", hMprConfig, "uint", dwTransportId, "ptr", lpwsTransportName, "ptr", pGlobalInfo, "uint", dwGlobalInfoSize, "ptr", pClientInterfaceInfo, "uint", dwClientInterfaceInfoSize, "ptr", lpwsDLLPath, "ptr", phRouterTransport, "uint")
        return result
    }

    /**
     * The MprConfigTransportDelete function removes the specified transport from the list of transports present in the specified router configuration.
     * @param {HANDLE} hMprConfig Handle to the router configuration from which to remove the transport. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterTransport Handle to the configuration for the transport being deleted. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigtransportcreate">MprConfigTransportCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigtransportgethandle">MprConfigTransportGetHandle</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hMprConfig</i> parameter is <b>NULL</b>, or the <i>hRouterTransport</i> parameter is <b>NULL</b>, or both are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigtransportdelete
     * @since windowsserver2000
     */
    static MprConfigTransportDelete(hMprConfig, hRouterTransport) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterTransport := hRouterTransport is Win32Handle ? NumGet(hRouterTransport, "ptr") : hRouterTransport

        result := DllCall("MPRAPI.dll\MprConfigTransportDelete", "ptr", hMprConfig, "ptr", hRouterTransport, "uint")
        return result
    }

    /**
     * The MprConfigTransportGetHandle function retrieves a handle to the specified transport protocol's configuration in the specified router configuration.
     * @param {HANDLE} hMprConfig Handle to the router configuration. The handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport configuration handle type in the <i>phRouterTransport</i> parameter. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {Pointer<HANDLE>} phRouterTransport A pointer to a  
     * <b>HANDLE</b> variable that receives the transport configuration handle type indicated in the <i>dwTransportId</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hMprConfig</i> parameter and/or the <i>phRouterTransport</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transport protocol specified by <i>dwTransportId</i> was not found in the router configuration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigtransportgethandle
     * @since windowsserver2000
     */
    static MprConfigTransportGetHandle(hMprConfig, dwTransportId, phRouterTransport) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig

        result := DllCall("MPRAPI.dll\MprConfigTransportGetHandle", "ptr", hMprConfig, "uint", dwTransportId, "ptr", phRouterTransport, "uint")
        return result
    }

    /**
     * The MprConfigTransportSetInfo function changes the configuration for the specified transport protocol in the specified router configuration.
     * @remarks
     * Use 
     * <b>MprConfigTransportSetInfo</b> to set the transport's global information, default interface information, or the name of the router manager DLL for the transport.
     * 
     * <b>MprConfigTransportSetInfo</b> attempts to set the items in the order in which they appear in the parameter list:
     * 
     * <ol>
     * <li>Global information.</li>
     * <li>Default interface information for client routers.</li>
     * <li>Router manager DLL name.</li>
     * </ol>
     * If 
     * <b>MprConfigTransportSetInfo</b> is unable to set any one of the items, it returns immediately without attempting to set the remaining items.
     * 
     * If the <i>pGlobalInfo</i>, <i>pClientInterfaceInfo</i>, and <i>lpwsDLLPath</i> parameters are all <b>NULL</b>, the function does nothing, returning a value of NO_ERROR.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterTransport Handle to the transport protocol configuration being updated. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigtransportcreate">MprConfigTransportCreate</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigtransportgethandle">MprConfigTransportGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigtransportenum">MprConfigTransportEnum</a>. Supported transport protocol types are listed on <a href="https://docs.microsoft.com/windows/desktop/RRAS/transport-identifiers">Transport Identifiers</a>.
     * @param {Pointer} pGlobalInfo Pointer to an information header that specifies global information for the transport protocol. The router manager for the transport interprets this information. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers. 
     * 
     * 
     * 
     * 
     * This parameter is optional; the calling application may specify <b>NULL</b> for this parameter.
     * @param {Integer} dwGlobalInfoSize Specifies the size, in bytes, of the data pointed to by <i>pGlobalInfo</i>. If the calling application specifies <b>NULL</b> for <i>pGlobalInfo</i>, the calling application should specify zero for this parameter.
     * @param {Pointer} pClientInterfaceInfo Pointer to an information header that specifies default interface information for client routers. The information is used to configure dynamic interfaces for client routers for this transport. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers. 
     * 
     * 
     * 
     * 
     * This parameter is optional; the calling application can specify <b>NULL</b> for this parameter.
     * @param {Integer} dwClientInterfaceInfoSize Specifies the size, in bytes, of the data pointed to by <i>pClientInterfaceInfo</i>. If the calling application specifies <b>NULL</b> for <i>pClientInterfaceInfo</i>, the calling application should specify zero for this parameter.
     * @param {PWSTR} lpwsDLLPath Pointer to a <b>null</b>-terminated Unicode string that specifies the name of the router manager DLL for the specified transport. 
     * 
     * 
     * 
     * 
     * This parameter is optional; the calling application may specify <b>NULL</b> for this parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR. For more information, see the Remarks section later in this topic.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hMprConfig</i> parameter is <b>NULL</b>, the <i>hRouterTransport</i> parameter is <b>NULL</b>, or both are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transport protocol configuration that corresponds to <i>hRouterTransport</i> was not found in the router configuration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigtransportsetinfo
     * @since windowsserver2000
     */
    static MprConfigTransportSetInfo(hMprConfig, hRouterTransport, pGlobalInfo, dwGlobalInfoSize, pClientInterfaceInfo, dwClientInterfaceInfoSize, lpwsDLLPath) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterTransport := hRouterTransport is Win32Handle ? NumGet(hRouterTransport, "ptr") : hRouterTransport
        lpwsDLLPath := lpwsDLLPath is String ? StrPtr(lpwsDLLPath) : lpwsDLLPath

        result := DllCall("MPRAPI.dll\MprConfigTransportSetInfo", "ptr", hMprConfig, "ptr", hRouterTransport, "ptr", pGlobalInfo, "uint", dwGlobalInfoSize, "ptr", pClientInterfaceInfo, "uint", dwClientInterfaceInfoSize, "ptr", lpwsDLLPath, "uint")
        return result
    }

    /**
     * The MprConfigTransportGetInfo function retrieves the configuration for the specified transport protocol from the router.
     * @remarks
     * If the <i>pGlobalInfo</i>, <i>pClientInterfaceInfo</i>, and <i>lpwsDLLPath</i> parameters are all <b>NULL</b>, the function does nothing and returns a value of NO_ERROR.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterTransport Handle to the transport protocol configuration being retrieved. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigtransportcreate">MprConfigTransportCreate</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigtransportgethandle">MprConfigTransportGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigtransportenum">MprConfigTransportEnum</a>. Supported transport protocol types are listed on <a href="https://docs.microsoft.com/windows/desktop/RRAS/transport-identifiers">Transport Identifiers</a>.
     * @param {Pointer<Pointer<Integer>>} ppGlobalInfo On input, pointer to a pointer variable. 
     * 
     * 
     * 
     * 
     * On output, this pointer variable points to an information header that contains global information for the transport. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers. Free this buffer by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigbufferfree">MprConfigBufferFree</a>.
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not retrieve the global information.
     * @param {Pointer<Integer>} lpdwGlobalInfoSize Pointer to a <b>DWORD</b> variable. This variable receives the size, in bytes, of the buffer returned through the <i>ppGlobalInfo</i> parameter. 
     * 
     * 
     * 
     * 
     * This parameter is optional; the calling application may specify <b>NULL</b> for this parameter. However, if <i>ppGlobalInfo</i> is not <b>NULL</b>, this parameter cannot be <b>NULL</b>.
     * @param {Pointer<Pointer<Integer>>} ppClientInterfaceInfo On input, pointer to a pointer variable. 
     * 
     * 
     * 
     * 
     * On output, this pointer points to an information header that contains default interface information for client routers for this transport. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers. Free the buffer by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigbufferfree">MprConfigBufferFree</a>.
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not retrieve the interface information.
     * @param {Pointer<Integer>} lpdwClientInterfaceInfoSize Pointer to a <b>DWORD</b> variable. This variable receives the size, in bytes, of the buffer returned through the <i>ppClientInterfaceInfo</i> parameter. 
     * 
     * 
     * 
     * 
     * This parameter is optional; the calling application may specify <b>NULL</b> for this parameter. However, if <i>ppClientInterfaceInfo</i> is not <b>NULL</b>, this parameter cannot be <b>NULL</b>.
     * @param {Pointer<PWSTR>} lplpwsDLLPath On input, pointer to a pointer to a <b>null</b>-terminated Unicode string. 
     * 
     * 
     * 
     * 
     * On output, the Unicode string receives the name of the router manager DLL for the specified transport.
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not retrieve the name of the router manager DLL.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b></li>
     * <li><i>hRouterTransport</i> is <b>NULL</b></li>
     * <li><i>ppGlobalInfo</i> is not <b>NULL</b>, but <i>lpdwGlobalInfoSize</i> is <b>NULL</b>.</li>
     * <li><i>ppClientInterfaceInfo</i> is not <b>NULL</b>, but <i>lpdwClientInterfaceInfo</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_PROTOCOL_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transport protocol configuration that corresponds to <i>hRouterTransport</i> was not found in the router configuration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigtransportgetinfo
     * @since windowsserver2000
     */
    static MprConfigTransportGetInfo(hMprConfig, hRouterTransport, ppGlobalInfo, lpdwGlobalInfoSize, ppClientInterfaceInfo, lpdwClientInterfaceInfoSize, lplpwsDLLPath) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterTransport := hRouterTransport is Win32Handle ? NumGet(hRouterTransport, "ptr") : hRouterTransport

        ppGlobalInfoMarshal := ppGlobalInfo is VarRef ? "ptr*" : "ptr"
        lpdwGlobalInfoSizeMarshal := lpdwGlobalInfoSize is VarRef ? "uint*" : "ptr"
        ppClientInterfaceInfoMarshal := ppClientInterfaceInfo is VarRef ? "ptr*" : "ptr"
        lpdwClientInterfaceInfoSizeMarshal := lpdwClientInterfaceInfoSize is VarRef ? "uint*" : "ptr"
        lplpwsDLLPathMarshal := lplpwsDLLPath is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigTransportGetInfo", "ptr", hMprConfig, "ptr", hRouterTransport, ppGlobalInfoMarshal, ppGlobalInfo, lpdwGlobalInfoSizeMarshal, lpdwGlobalInfoSize, ppClientInterfaceInfoMarshal, ppClientInterfaceInfo, lpdwClientInterfaceInfoSizeMarshal, lpdwClientInterfaceInfoSize, lplpwsDLLPathMarshal, lplpwsDLLPath, "uint")
        return result
    }

    /**
     * The MprConfigTransportEnum function enumerates the transports configured on the router.
     * @param {HANDLE} hMprConfig Handle to the router configuration for the transports. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {Integer} dwLevel A <b>DWORD</b> value that describes the format in which the information is returned in the <i>lplpBuffer</i> parameter. Must be zero.
     * @param {Pointer<Pointer<Integer>>} lplpBuffer On input, a non-<b>NULL</b> pointer. 
     * 
     * 
     * 
     * 
     * On successful completion, a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_transport_0">MPR_TRANSPORT_0</a> structures. Free this memory buffer by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigbufferfree">MprConfigBufferFree</a>.
     * @param {Integer} dwPrefMaxLen Specifies the preferred maximum length of returned data in 8-bit bytes. If this parameter is -1, the buffer returned will be large enough to hold all available information.
     * @param {Pointer<Integer>} lpdwEntriesRead Pointer to a <b>DWORD</b> variable. This variable receives the total number of entries that were enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwTotalEntries Pointer to a <b>DWORD</b> variable. This variable receives the total number of entries that could have been enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwResumeHandle Pointer to a <b>DWORD</b> variable. 
     * 
     * 
     * 
     * 
     * On input, the handle should be zero on the first call and left unchanged on subsequent calls.
     * 
     * On output, this variable contains a resume handle used to continue the enumeration. If the handle is <b>NULL</b>, the enumeration is complete.
     * 
     * If an error occurs in the enumeration, this handle is invalid.
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not return a resume handle.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b>.</li>
     * <li><i>dwLevel</i> is not zero.</li>
     * <li><i>lplpBuffer</i> is <b>NULL</b>.</li>
     * <li><i>dwPrefMaxLen</i> is smaller than the size of a single 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_transport_0">MPR_TRANSPORT_0</a> structure.</li>
     * <li><i>lpdwEntriesRead</i> is <b>NULL</b>.</li>
     * <li><i>lpdwTotalEntries</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more entries available from the current resume position.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigtransportenum
     * @since windowsserver2000
     */
    static MprConfigTransportEnum(hMprConfig, dwLevel, lplpBuffer, dwPrefMaxLen, lpdwEntriesRead, lpdwTotalEntries, lpdwResumeHandle) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig

        lplpBufferMarshal := lplpBuffer is VarRef ? "ptr*" : "ptr"
        lpdwEntriesReadMarshal := lpdwEntriesRead is VarRef ? "uint*" : "ptr"
        lpdwTotalEntriesMarshal := lpdwTotalEntries is VarRef ? "uint*" : "ptr"
        lpdwResumeHandleMarshal := lpdwResumeHandle is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigTransportEnum", "ptr", hMprConfig, "uint", dwLevel, lplpBufferMarshal, lplpBuffer, "uint", dwPrefMaxLen, lpdwEntriesReadMarshal, lpdwEntriesRead, lpdwTotalEntriesMarshal, lpdwTotalEntries, lpdwResumeHandleMarshal, lpdwResumeHandle, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceCreate function creates a router interface in the specified router configuration.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacecreate">MprAdminInterfaceCreate</a> function supports the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a> structure. However, 
     * <b>MprConfigInterfaceCreate</b> does not. In order to create a demand-dial interface that is persistent after a reboot, call 
     * <b>MprAdminInterfaceCreate</b> with 
     * <b>MPR_INTERFACE_2</b>, then call 
     * <b>MprConfigInterfaceCreate</b> with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is structured in the <i>lpbBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0, 1, 2, and 3, as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>
     * </td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpbBuffer A pointer  to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>,  
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * @param {Pointer<HANDLE>} phRouterInterface Pointer to a handle variable. This variable receives a handle to the interface configuration.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b></li>
     * <li><i>dwLevel</i> is not 0, 1, 2, or 3.</li>
     * <li><i>lpbBuffer</i> is <b>NULL</b></li>
     * <li><i>phRouterInterface</i> is <b>NULL</b></li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacecreate
     * @since windowsserver2000
     */
    static MprConfigInterfaceCreate(hMprConfig, dwLevel, lpbBuffer, phRouterInterface) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig

        lpbBufferMarshal := lpbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigInterfaceCreate", "ptr", hMprConfig, "uint", dwLevel, lpbBufferMarshal, lpbBuffer, "ptr", phRouterInterface, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceDelete function removes a router interface from the router configuration. All transport information associated with this interface is also removed.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterInterface Handle to the interface configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacegethandle">MprConfigInterfaceGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfaceenum">MprConfigInterfaceEnum</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hMprConfig</i> parameter is <b>NULL</b>, or the <i>hRouterInterface</i> parameter is <b>NULL</b>, or both parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacedelete
     * @since windowsserver2000
     */
    static MprConfigInterfaceDelete(hMprConfig, hRouterInterface) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterInterface := hRouterInterface is Win32Handle ? NumGet(hRouterInterface, "ptr") : hRouterInterface

        result := DllCall("MPRAPI.dll\MprConfigInterfaceDelete", "ptr", hMprConfig, "ptr", hRouterInterface, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceGetHandle function retrieves a handle to the specified interface's configuration in the specified router configuration.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {PWSTR} lpwsInterfaceName Pointer to a <b>null</b>-terminated Unicode string that specifies the name of the interface for which the configuration handle is requested. Use the interface GUID as the name of a LAN interface.
     * @param {Pointer<HANDLE>} phRouterInterface Pointer to a handle variable. This variable receives a handle to the interface configuration.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hMprConfig</i> parameter is <b>NULL</b>, or the <i>lpwsInterfaceName</i> parameter is <b>NULL</b>, or both parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified interface was not found in the router configuration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacegethandle
     * @since windowsserver2000
     */
    static MprConfigInterfaceGetHandle(hMprConfig, lpwsInterfaceName, phRouterInterface) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        lpwsInterfaceName := lpwsInterfaceName is String ? StrPtr(lpwsInterfaceName) : lpwsInterfaceName

        result := DllCall("MPRAPI.dll\MprConfigInterfaceGetHandle", "ptr", hMprConfig, "ptr", lpwsInterfaceName, "ptr", phRouterInterface, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceGetInfo function retrieves the configuration for the specified interface from the router.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterInterface Handle to the interface configuration for which to retrieve information. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacegethandle">MprConfigInterfaceGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfaceenum">MprConfigInterfaceEnum</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is returned in the <i>lplpBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0, 1, 2 and 3, as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>
     * </td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Integer>>} lplpBuffer On input, a non-<b>NULL</b> pointer. 
     * 
     * On successful completion, a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>,  
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * 					Free this buffer by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigbufferfree">MprConfigBufferFree</a>.
     * @param {Pointer<Integer>} lpdwBufferSize Pointer to a <b>DWORD</b> variable. This variable receives the size, in bytes, of the data returned through <i>lplpBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b></li>
     * <li><i>hRouterInterface</i> is <b>NULL</b></li>
     * <li><i>dwLevel</i> is not 0, 1, 2, or 3.</li>
     * <li><i>lplpBuffer</i> is <b>NULL</b></li>
     * <li><i>lpdwBufferSize</i> is <b>NULL</b></li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface that corresponds to <i>hRouterInterface</i> is not present in the router configuration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacegetinfo
     * @since windowsserver2000
     */
    static MprConfigInterfaceGetInfo(hMprConfig, hRouterInterface, dwLevel, lplpBuffer, lpdwBufferSize) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterInterface := hRouterInterface is Win32Handle ? NumGet(hRouterInterface, "ptr") : hRouterInterface

        lplpBufferMarshal := lplpBuffer is VarRef ? "ptr*" : "ptr"
        lpdwBufferSizeMarshal := lpdwBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigInterfaceGetInfo", "ptr", hMprConfig, "ptr", hRouterInterface, "uint", dwLevel, lplpBufferMarshal, lplpBuffer, lpdwBufferSizeMarshal, lpdwBufferSize, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceSetInfo function sets the configuration for the specified interface.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacesetinfo">MprAdminInterfaceSetInfo</a> function supports the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a> structure. However, 
     * <b>MprConfigInterfaceSetInfo</b> does not. In order to make persistent changes to a demand-dial interface, call 
     * <b>MprAdminInterfaceSetInfo</b> with 
     * <b>MPR_INTERFACE_2</b>, then call 
     * <b>MprConfigInterfaceSetInfo</b> with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterInterface Handle to the interface configuration being updated. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacegethandle">MprConfigInterfaceGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfaceenum">MprConfigInterfaceEnum</a>.
     * @param {Integer} dwLevel A DWORD value that describes the format in which the information is structured in the <i>lpBuffer</i> parameter. Acceptable values for <i>dwLevel</i> include 0, 1, 2, and 3, as listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Structure Format</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>
     * </td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Windows Server 2008 or later: <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpbBuffer A pointer to a  
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_1">MPR_INTERFACE_1</a>,  
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_3">MPR_INTERFACE_3</a> structure. The <i>dwLevel</i> parameter indicates the type of structure.
     * 					The information in this structure is used to update the interface configuration.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true:
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b>.</li>
     * <li><i>hRouterInterface</i> is <b>NULL</b>.</li>
     * <li><i>dwLevel</i> is not 0, 1, 2, or 3.</li>
     * <li><i>lpBuffer</i> is <b>NULL</b>.</li>
     * </ul>
     * Also returns this error code if the interface is of type <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">ROUTER_IF_TYPE_DEDICATED</a> or <b>ROUTER_IF_TYPE_INTERNAL</b> and the interface is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface that corresponds to <i>hRouterInterface</i> is not present in the router configuration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacesetinfo
     * @since windowsserver2000
     */
    static MprConfigInterfaceSetInfo(hMprConfig, hRouterInterface, dwLevel, lpbBuffer) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterInterface := hRouterInterface is Win32Handle ? NumGet(hRouterInterface, "ptr") : hRouterInterface

        lpbBufferMarshal := lpbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigInterfaceSetInfo", "ptr", hMprConfig, "ptr", hRouterInterface, "uint", dwLevel, lpbBufferMarshal, lpbBuffer, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceEnum function enumerates the interfaces that are configured for the router.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {Integer} dwLevel A <b>DWORD</b> value that describes the format in which the information is returned in the <i>lplpBuffer</i> parameter. Must be zero.
     * @param {Pointer<Pointer<Integer>>} lplpBuffer On input, a non-<b>NULL</b> pointer. 
     * 
     * 
     * 
     * 
     * On successful completion, a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a> structures. Free this memory buffer by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigbufferfree">MprConfigBufferFree</a>.
     * @param {Integer} dwPrefMaxLen Specifies the preferred maximum length of returned data (in 8-bit bytes). If this parameter is -1, the buffer returned will be large enough to hold all available information.
     * @param {Pointer<Integer>} lpdwEntriesRead Pointer to a <b>DWORD</b> variable. This variable receives the total number of entries that were enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwTotalEntries Pointer to a <b>DWORD</b> variable. This variable receives the total number of entries that could have been enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwResumeHandle Pointer to a <b>DWORD</b> variable. 
     * 
     * 
     * 
     * 
     * On input, the handle should be zero on the first call, and left unchanged on subsequent calls to continue the enumeration.
     * 
     * On output, contains a resume handle that can be used to continue the enumeration. If the handle is <b>NULL</b>, the enumeration is complete.
     * 
     * If an error occurs in the enumeration, this handle is invalid.
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not return a resume handle.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b>.</li>
     * <li><i>dwLevel</i> is not zero.</li>
     * <li><i>lplpBuffer</i> is <b>NULL</b>.</li>
     * <li><i>dwPrefMaxLen</i> is smaller than the size of a single 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_0">MPR_INTERFACE_0</a> structure.</li>
     * <li><i>lpdwEntriesRead</i> is <b>NULL</b>.</li>
     * <li><i>lpdwTotalEntries</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more entries available from the current resume position.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfaceenum
     * @since windowsserver2000
     */
    static MprConfigInterfaceEnum(hMprConfig, dwLevel, lplpBuffer, dwPrefMaxLen, lpdwEntriesRead, lpdwTotalEntries, lpdwResumeHandle) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig

        lplpBufferMarshal := lplpBuffer is VarRef ? "ptr*" : "ptr"
        lpdwEntriesReadMarshal := lpdwEntriesRead is VarRef ? "uint*" : "ptr"
        lpdwTotalEntriesMarshal := lpdwTotalEntries is VarRef ? "uint*" : "ptr"
        lpdwResumeHandleMarshal := lpdwResumeHandle is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigInterfaceEnum", "ptr", hMprConfig, "uint", dwLevel, lplpBufferMarshal, lplpBuffer, "uint", dwPrefMaxLen, lpdwEntriesReadMarshal, lpdwEntriesRead, lpdwTotalEntriesMarshal, lpdwTotalEntries, lpdwResumeHandleMarshal, lpdwResumeHandle, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceTransportAdd function adds a transport protocol to an interface configuration on the router.
     * @remarks
     * In addition to specifying a transport, the <i>dwTransportId</i> parameter also specifies a router manager, because a router maintains a unique router manager for each transport.
     * 
     * If the specified transport already exists, 
     * <b>MprConfigInterfaceTransportAdd</b> does the equivalent of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacetransportsetinfo">MprConfigInterfaceTransportSetInfo</a> call using the specified parameter values.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterInterface Handle to the interface configuration to which the specified transport is added. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacegethandle">MprConfigInterfaceGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfaceenum">MprConfigInterfaceEnum</a>.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport to add to the configuration. This parameter also identifies the router manager for the transport. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {PWSTR} lpwsTransportName Pointer to a <b>null</b>-terminated Unicode string that specifies the name for the transport being added. If this parameter is not specified and the transport is IP or IPX, 
     * <b>MprConfigInterfaceTransportAdd</b> uses IP or IPX. If this parameter is not specified and the transport is other than IP or IPX, 
     * <b>MprConfigInterfaceTransportAdd</b> converts the <i>dwTransportId</i> parameter into a string and uses that as the transport name.
     * @param {Pointer} pInterfaceInfo Pointer to an information header that contains information for the specified interface and transport. The router manager for the specified transport interprets this information. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers.
     * @param {Integer} dwInterfaceInfoSize Specifies the size, in bytes, of the data pointed to by <i>pInterfaceInfo</i>.
     * @param {Pointer<HANDLE>} phRouterIfTransport A pointer to a  
     * <b>HANDLE</b> variable that receives the transport configuration handle type for this interface indicated in the <i>dwTransportId</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b>.</li>
     * <li><i>hRouterInterface</i> is <b>NULL</b>.</li>
     * <li><i>phRouterIfTransport</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacetransportadd
     * @since windowsserver2000
     */
    static MprConfigInterfaceTransportAdd(hMprConfig, hRouterInterface, dwTransportId, lpwsTransportName, pInterfaceInfo, dwInterfaceInfoSize, phRouterIfTransport) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterInterface := hRouterInterface is Win32Handle ? NumGet(hRouterInterface, "ptr") : hRouterInterface
        lpwsTransportName := lpwsTransportName is String ? StrPtr(lpwsTransportName) : lpwsTransportName

        result := DllCall("MPRAPI.dll\MprConfigInterfaceTransportAdd", "ptr", hMprConfig, "ptr", hRouterInterface, "uint", dwTransportId, "ptr", lpwsTransportName, "ptr", pInterfaceInfo, "uint", dwInterfaceInfoSize, "ptr", phRouterIfTransport, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceTransportRemove function removes the specified transport from the specified interface configuration on the router.
     * @param {HANDLE} hMprConfig Handle to the router configuration. The handle is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterInterface Handle to the interface configuration from which to delete the specified transport. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacegethandle">MprConfigInterfaceGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfaceenum">MprConfigInterfaceEnum</a>.
     * @param {HANDLE} hRouterIfTransport Handle to the interface transport configuration to be deleted. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacetransportadd">MprConfigInterfaceTransportAdd</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacetransportgethandle">MprConfigInterfaceTransportGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacetransportenum">MprConfigInterfaceTransportEnum</a>. Supported transport protocol types are listed on <a href="https://docs.microsoft.com/windows/desktop/RRAS/transport-identifiers">Transport Identifiers</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b>.</li>
     * <li><i>hRouterInterface</i> is <b>NULL</b>.</li>
     * <li><i>phRouterIfTransport</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacetransportremove
     * @since windowsserver2000
     */
    static MprConfigInterfaceTransportRemove(hMprConfig, hRouterInterface, hRouterIfTransport) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterInterface := hRouterInterface is Win32Handle ? NumGet(hRouterInterface, "ptr") : hRouterInterface
        hRouterIfTransport := hRouterIfTransport is Win32Handle ? NumGet(hRouterIfTransport, "ptr") : hRouterIfTransport

        result := DllCall("MPRAPI.dll\MprConfigInterfaceTransportRemove", "ptr", hMprConfig, "ptr", hRouterInterface, "ptr", hRouterIfTransport, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceTransportGetHandle function retrieves a handle to the transport configuration of an interface in the specified router configuration.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterInterface Handle to the interface configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacegethandle">MprConfigInterfaceGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfaceenum">MprConfigInterfaceEnum</a>.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport configuration handle type in the <i>phRouterIfTransport</i> parameter. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {Pointer<HANDLE>} phRouterIfTransport A pointer to a  
     * <b>HANDLE</b> variable that receives the transport configuration handle type for this interface indicated in the <i>dwTransportId</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b>.</li>
     * <li><i>hRouterInterface</i> is <b>NULL</b>.</li>
     * <li><i>phRouterIfTransport</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface specified by <i>hRouterInterface</i> was not found in the router configuration, or the transport specified by <i>dwTransportId</i> was not enabled on the specified interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacetransportgethandle
     * @since windowsserver2000
     */
    static MprConfigInterfaceTransportGetHandle(hMprConfig, hRouterInterface, dwTransportId, phRouterIfTransport) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterInterface := hRouterInterface is Win32Handle ? NumGet(hRouterInterface, "ptr") : hRouterInterface

        result := DllCall("MPRAPI.dll\MprConfigInterfaceTransportGetHandle", "ptr", hMprConfig, "ptr", hRouterInterface, "uint", dwTransportId, "ptr", phRouterIfTransport, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceTransportGetInfo function retrieves the configuration information for the specified client on the specified interface.
     * @remarks
     * If the <i>ppInterfaceInfo</i> parameter is <b>NULL</b>, 
     * <b>MprConfigInterfaceTransportGetInfo</b> does nothing and returns immediately with a value of NO_ERROR.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterInterface Handle to the interface configuration from which to retrieve the specified client information. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacegethandle">MprConfigInterfaceGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfaceenum">MprConfigInterfaceEnum</a>.
     * @param {HANDLE} hRouterIfTransport Handle to the transport configuration from which to retrieve the specified client information. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacetransportadd">MprConfigInterfaceTransportAdd</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacetransportgethandle">MprConfigInterfaceTransportGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacetransportenum">MprConfigInterfaceTransportEnum</a>. Supported transport protocol types are listed on <a href="https://docs.microsoft.com/windows/desktop/RRAS/transport-identifiers">Transport Identifiers</a>.
     * @param {Pointer<Pointer<Integer>>} ppInterfaceInfo On input, pointer to a pointer variable. 
     * 
     * 
     * 
     * 
     * On output, this pointer variable points to an information header that contains configuration information for the client. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers. Free this memory by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigbufferfree">MprConfigBufferFree</a>.
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not return the configuration information.
     * @param {Pointer<Integer>} lpdwInterfaceInfoSize Pointer to a <b>DWORD</b> variable. This variable receives the size, in bytes, of the data pointed to by <i>ppInterfaceInfo</i>. 
     * 
     * 
     * 
     * 
     * This parameter is optional; the calling application may specify <b>NULL</b> for this parameter. However, if <i>ppInterfaceInfo</i> is not <b>NULL</b>, this parameter cannot be <b>NULL</b>. For more information, see the Remarks section later in this topic.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR. For more information, see the Remarks section later in this topic.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b>.</li>
     * <li><i>hRouterInterface</i> is <b>NULL</b>.</li>
     * <li><i>hRouterIfTransport</i> is <b>NULL</b>.</li>
     * <li><i>ppInterfaceInfo</i> is not <b>NULL</b>, but <i>lpdwInterfaceInfoSize</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface specified by <i>hRouterIfTransport</i> was not found in the router configuration, or the transport specified by <i>hRouterIfTransport</i> was not enabled on the specified interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacetransportgetinfo
     * @since windowsserver2000
     */
    static MprConfigInterfaceTransportGetInfo(hMprConfig, hRouterInterface, hRouterIfTransport, ppInterfaceInfo, lpdwInterfaceInfoSize) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterInterface := hRouterInterface is Win32Handle ? NumGet(hRouterInterface, "ptr") : hRouterInterface
        hRouterIfTransport := hRouterIfTransport is Win32Handle ? NumGet(hRouterIfTransport, "ptr") : hRouterIfTransport

        ppInterfaceInfoMarshal := ppInterfaceInfo is VarRef ? "ptr*" : "ptr"
        lpdwInterfaceInfoSizeMarshal := lpdwInterfaceInfoSize is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigInterfaceTransportGetInfo", "ptr", hMprConfig, "ptr", hRouterInterface, "ptr", hRouterIfTransport, ppInterfaceInfoMarshal, ppInterfaceInfo, lpdwInterfaceInfoSizeMarshal, lpdwInterfaceInfoSize, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceTransportSetInfo function updates the configuration information for the client on the specified interface and transport protocol.
     * @remarks
     * If the <i>pInterfaceInfo</i> parameter is <b>NULL</b>, 
     * <b>MprConfigInterfaceTransportSetInfo</b> does nothing and returns immediately with a value of NO_ERROR.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterInterface Handle to the interface configuration in which to update the information. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfaceenum">MprConfigInterfaceEnum</a>.
     * @param {HANDLE} hRouterIfTransport Handle to the transport configuration in which to update the information for the client. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacetransportadd">MprConfigInterfaceTransportAdd</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacetransportgethandle">MprConfigInterfaceTransportGetHandle</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacetransportenum">MprConfigInterfaceTransportEnum</a>. Supported transport protocol types are listed on <a href="https://docs.microsoft.com/windows/desktop/RRAS/transport-identifiers">Transport Identifiers</a>.
     * @param {Pointer} pInterfaceInfo Pointer to an information header that contains configuration information for the client on the specified interface and transport. The router manager for the specified transport interprets this information. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-information-functions">Information Header Functions</a> to manipulate information headers. 
     * 
     * 
     * 
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not update the configuration information for the client.
     * @param {Integer} dwInterfaceInfoSize Specifies the size, in bytes, of the data pointed to by <i>pInterfaceInfo</i>. 
     * 
     * 
     * 
     * 
     * This parameter is optional; the calling application may specify zero for this parameter. However, if <i>pInterfaceInfo</i> is not <b>NULL</b>, this parameter cannot be zero. For more information, see the Remarks section later in this topic.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR. For more information, see the Remarks section later in this topic.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b>.</li>
     * <li><i>hRouterInterface</i> is <b>NULL</b>.</li>
     * <li><i>hRouterIfTransport</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface specified by <i>hRouterInterface</i> is no longer present in the router configuration, or the transport specified by <i>hRouterInterface</i> is no longer present on the interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacetransportsetinfo
     * @since windowsserver2000
     */
    static MprConfigInterfaceTransportSetInfo(hMprConfig, hRouterInterface, hRouterIfTransport, pInterfaceInfo, dwInterfaceInfoSize) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterInterface := hRouterInterface is Win32Handle ? NumGet(hRouterInterface, "ptr") : hRouterInterface
        hRouterIfTransport := hRouterIfTransport is Win32Handle ? NumGet(hRouterIfTransport, "ptr") : hRouterIfTransport

        result := DllCall("MPRAPI.dll\MprConfigInterfaceTransportSetInfo", "ptr", hMprConfig, "ptr", hRouterInterface, "ptr", hRouterIfTransport, "ptr", pInterfaceInfo, "uint", dwInterfaceInfoSize, "uint")
        return result
    }

    /**
     * The MprConfigInterfaceTransportEnum function enumerates the transports configured on the specified interface.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {HANDLE} hRouterInterface Handle to the interface configuration from which to enumerate the transports. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfacecreate">MprConfigInterfaceCreate</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfiginterfaceenum">MprConfigInterfaceEnum</a>.
     * @param {Integer} dwLevel A <b>DWORD</b> value that describes the format in which the information is returned in the <i>lplpBuffer</i> parameter. Must be zero.
     * @param {Pointer<Pointer<Integer>>} lplpBuffer On input, a non-<b>NULL</b> pointer. 
     * 
     * 
     * 
     * 
     * On successful completion, a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_transport_0">MPR_IFTRANSPORT_0</a> structures. Free this memory buffer by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigbufferfree">MprConfigBufferFree</a>.
     * @param {Integer} dwPrefMaxLen Specifies the preferred maximum length of returned data (in 8-bit bytes). If this parameter is -1, the buffer returned is large enough to hold all available information.
     * @param {Pointer<Integer>} lpdwEntriesRead Pointer to a <b>DWORD</b> variable. This variable receives the total number of entries that were enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwTotalEntries Pointer to a <b>DWORD</b> variable. This variable receives the total number of entries that could have been enumerated from the current resume position.
     * @param {Pointer<Integer>} lpdwResumeHandle Pointer to a <b>DWORD</b> variable. 
     * 
     * 
     * 
     * 
     * On input, the handle should be zero on the first call and left unchanged on subsequent calls.
     * 
     * On output, this variable contains a resume handle used to continue the enumeration. If the handle is <b>NULL</b>, the enumeration is complete.
     * 
     * If an error occurs in the enumeration, this handle is invalid.
     * 
     * This parameter is optional. If the calling application specifies <b>NULL</b> for this parameter, the function does not return a resume handle.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>hMprConfig</i> is <b>NULL</b>.</li>
     * <li><i>HRouterInterface</i> is <b>NULL</b>.</li>
     * <li><i>dwLevel</i> is not zero.</li>
     * <li><i>lplpBuffer</i> is <b>NULL</b>.</li>
     * <li><i>dwPrefMaxLen</i> is smaller than the size of a single 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_transport_0">MPR_IFTRANSPORT_0</a> structure.</li>
     * <li><i>lpdwEntriesRead</i> is <b>NULL</b>.</li>
     * <li><i>lpdwTotalEntries</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more entries available from the current resume position.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the system error message that corresponds to the error code returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiginterfacetransportenum
     * @since windowsserver2000
     */
    static MprConfigInterfaceTransportEnum(hMprConfig, hRouterInterface, dwLevel, lplpBuffer, dwPrefMaxLen, lpdwEntriesRead, lpdwTotalEntries, lpdwResumeHandle) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        hRouterInterface := hRouterInterface is Win32Handle ? NumGet(hRouterInterface, "ptr") : hRouterInterface

        lplpBufferMarshal := lplpBuffer is VarRef ? "ptr*" : "ptr"
        lpdwEntriesReadMarshal := lpdwEntriesRead is VarRef ? "uint*" : "ptr"
        lpdwTotalEntriesMarshal := lpdwTotalEntries is VarRef ? "uint*" : "ptr"
        lpdwResumeHandleMarshal := lpdwResumeHandle is VarRef ? "uint*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigInterfaceTransportEnum", "ptr", hMprConfig, "ptr", hRouterInterface, "uint", dwLevel, lplpBufferMarshal, lplpBuffer, "uint", dwPrefMaxLen, lpdwEntriesReadMarshal, lpdwEntriesRead, lpdwTotalEntriesMarshal, lpdwTotalEntries, lpdwResumeHandleMarshal, lpdwResumeHandle, "uint")
        return result
    }

    /**
     * The MprConfigGetFriendlyName function returns the friendly name for an interface that corresponds to the specified GUID name.
     * @remarks
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/avoiding-buffer-overruns">Avoiding Buffer Overruns</a>.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {PWSTR} pszGuidName Pointer to a <b>null</b>-terminated Unicode string that specifies the GUID name for the interface.
     * @param {Pointer} pszBuffer Pointer to a buffer that receives the friendly name for the interface.
     * @param {Integer} dwBufferSize Specifies the size, in bytes, of the buffer pointed to by <i>pszBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>pszBuffer</i> is not large enough to hold the returned GUID name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following parameters <i>hMprConfig</i>, <i>pszGuidName</i>, or <i>pszBuffer</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No GUID name was found that corresponds to the specified friendly name.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiggetfriendlyname
     * @since windowsserver2000
     */
    static MprConfigGetFriendlyName(hMprConfig, pszGuidName, pszBuffer, dwBufferSize) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        pszGuidName := pszGuidName is String ? StrPtr(pszGuidName) : pszGuidName

        result := DllCall("MPRAPI.dll\MprConfigGetFriendlyName", "ptr", hMprConfig, "ptr", pszGuidName, "ptr", pszBuffer, "uint", dwBufferSize, "uint")
        return result
    }

    /**
     * The MprConfigGetGuidName function returns the GUID name for an interface that corresponds to the specified friendly name.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {PWSTR} pszFriendlyName Pointer to a Unicode string that specifies the friendly name for the interface.
     * @param {Pointer} pszBuffer Pointer to a buffer that receives the GUID name for the interface.
     * @param {Integer} dwBufferSize Specifies the size, in bytes, of the buffer pointed to by <i>pszBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>pszBuffer</i> is not large enough to hold the returned GUID name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the parameters <i>hMprConfig</i>, <i>pszFriendlyName</i>, or <i>pszBuffer</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No GUID name was found that corresponds to the specified friendly name.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfiggetguidname
     * @since windowsserver2000
     */
    static MprConfigGetGuidName(hMprConfig, pszFriendlyName, pszBuffer, dwBufferSize) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig
        pszFriendlyName := pszFriendlyName is String ? StrPtr(pszFriendlyName) : pszFriendlyName

        result := DllCall("MPRAPI.dll\MprConfigGetGuidName", "ptr", hMprConfig, "ptr", pszFriendlyName, "ptr", pszBuffer, "uint", dwBufferSize, "uint")
        return result
    }

    /**
     * Returns static filtering information for a specified transport protocol type.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {Integer} dwLevel A <b>DWORD</b> value that describes the format in which the information is returned in the <i>lpBuffer</i> parameter. Must be zero.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport protocol type of the static filtering information in the <i>lpBuffer</i> parameter. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpBuffer On successful completion, a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_filter_0">MPR_FILTER_0</a> structure that contains the filter driver configuration information. Free this memory buffer by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigbufferfree">MprConfigBufferFree</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hMprConfig</i> or <i>lpBuffer</i> is <b>NULL</b>, or <i>dwLevel</i> is not set to 0.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigfiltergetinfo
     * @since windowsserver2008
     */
    static MprConfigFilterGetInfo(hMprConfig, dwLevel, dwTransportId, lpBuffer) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig

        lpBufferMarshal := lpBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigFilterGetInfo", "ptr", hMprConfig, "uint", dwLevel, "uint", dwTransportId, lpBufferMarshal, lpBuffer, "uint")
        return result
    }

    /**
     * Sets the static filtering information for a specified transport protocol type.
     * @param {HANDLE} hMprConfig Handle to the router configuration. Obtain this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserverconnect">MprConfigServerConnect</a>.
     * @param {Integer} dwLevel A <b>DWORD</b> value that describes the format in which the information is structured in the <i>lpBuffer</i> parameter. Must be zero.
     * @param {Integer} dwTransportId A <b>DWORD</b> value that describes the transport protocol type of the static filtering information in the <i>lpBuffer</i> parameter. Acceptable values for <i>dwTransportId</i> are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transport (Protocol Family)</th>
     * </tr>
     * <tr>
     * <td>PID_ATALK</td>
     * <td>AppleTalk</td>
     * </tr>
     * <tr>
     * <td>PID_IP</td>
     * <td>Internet Protocol version 4</td>
     * </tr>
     * <tr>
     * <td>PID_IPX</td>
     * <td>Internet Packet Exchange</td>
     * </tr>
     * <tr>
     * <td>PID_NBF</td>
     * <td>NetBIOS Frames Protocol</td>
     * </tr>
     * <tr>
     * <td>PID_IPV6</td>
     * <td>Windows Server 2008 or later: Internet Protocol version 6</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_filter_0">MPR_FILTER_0</a> structure that contains the filter driver configuration information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hMprConfig</i> or <i>lpBuffer</i> is <b>NULL</b>, or <i>dwLevel</i> is not set to 0.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprconfigfiltersetinfo
     * @since windowsserver2008
     */
    static MprConfigFilterSetInfo(hMprConfig, dwLevel, dwTransportId, lpBuffer) {
        hMprConfig := hMprConfig is Win32Handle ? NumGet(hMprConfig, "ptr") : hMprConfig

        lpBufferMarshal := lpBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("MPRAPI.dll\MprConfigFilterSetInfo", "ptr", hMprConfig, "uint", dwLevel, "uint", dwTransportId, lpBufferMarshal, lpBuffer, "uint")
        return result
    }

    /**
     * The MprInfoCreate function creates a new information header.
     * @param {Integer} dwVersion Specifies the version of the information header structure to be created. The only value currently supported is RTR_INFO_BLOCK_VERSION, as declared in Mprapi.h.
     * @param {Pointer<Pointer<Void>>} lplpNewHeader Pointer to the allocated and initialized header.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lplpNewHeader</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested memory allocation could not be completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call failed. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the error message that corresponds to the returned error code.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprinfocreate
     * @since windowsserver2000
     */
    static MprInfoCreate(dwVersion, lplpNewHeader) {
        lplpNewHeaderMarshal := lplpNewHeader is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprInfoCreate", "uint", dwVersion, lplpNewHeaderMarshal, lplpNewHeader, "uint")
        return result
    }

    /**
     * The MprInfoDelete function deletes an information header created using MprInfoCreate, or retrieved by MprInfoBlockAdd, MprInfoBlockRemove, or MprInfoBlockSet.
     * @param {Pointer<Void>} lpHeader Pointer to the header to be deallocated.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpHeader</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call failed. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the error message that corresponds to the returned error code.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprinfodelete
     * @since windowsserver2000
     */
    static MprInfoDelete(lpHeader) {
        lpHeaderMarshal := lpHeader is VarRef ? "ptr" : "ptr"

        result := DllCall("MPRAPI.dll\MprInfoDelete", lpHeaderMarshal, lpHeader, "uint")
        return result
    }

    /**
     * The MprInfoRemoveAll function removes all information blocks from the specified header.
     * @param {Pointer<Void>} lpHeader Pointer to the information header from which to remove all information blocks.
     * @param {Pointer<Pointer<Void>>} lplpNewHeader Pointer to a pointer variable. On successful return, this variable points to the information header with all information blocks removed.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either the <i>lpHeader</i> parameter is <b>NULL</b> or the <i>lplpNewHeader</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the error message that corresponds to the returned error code.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprinforemoveall
     * @since windowsserver2000
     */
    static MprInfoRemoveAll(lpHeader, lplpNewHeader) {
        lpHeaderMarshal := lpHeader is VarRef ? "ptr" : "ptr"
        lplpNewHeaderMarshal := lplpNewHeader is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprInfoRemoveAll", lpHeaderMarshal, lpHeader, lplpNewHeaderMarshal, lplpNewHeader, "uint")
        return result
    }

    /**
     * The MprInfoDuplicate function duplicates an existing information header.
     * @param {Pointer<Void>} lpHeader Pointer to the information header to duplicate.
     * @param {Pointer<Pointer<Void>>} lplpNewHeader Pointer to a pointer variable. On successful return, this variable points to the new (duplicate) information header.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lplpNewHeader</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested memory allocation could not be completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call failed. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the error message that corresponds to the returned error code.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprinfoduplicate
     * @since windowsserver2000
     */
    static MprInfoDuplicate(lpHeader, lplpNewHeader) {
        lpHeaderMarshal := lpHeader is VarRef ? "ptr" : "ptr"
        lplpNewHeaderMarshal := lplpNewHeader is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprInfoDuplicate", lpHeaderMarshal, lpHeader, lplpNewHeaderMarshal, lplpNewHeader, "uint")
        return result
    }

    /**
     * The MprInfoBlockAdd function creates a new header that is identical to an existing header with the addition of a new block.
     * @remarks
     * After adding an information block, obtain the new size of the information header by call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprinfoblockquerysize">MprInfoBlockQuerySize</a>.
     * @param {Pointer<Void>} lpHeader Pointer to the header in which to add the new block.
     * @param {Integer} dwInfoType Specifies the type of block to add. The types available depend on the transport: 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/ip-information-types-for-router-information-blocks">IPv4</a>, <a href="https://docs.microsoft.com/windows/desktop/RRAS/ipv6-information-types-for-router-information-blocks">IPv6</a>, or <a href="https://docs.microsoft.com/windows/desktop/RRAS/ipx-information-types-for-router-information-blocks">IPX</a>.
     * 
     * <b>Windows Server 2008:  </b>If <i>dwInfoTYpe</i> contains <a href="https://docs.microsoft.com/windows/desktop/RRAS/ip-information-types-for-router-information-blocks">IP_ROUTE_INFO</a>, <i>lpItemData</i> must point to a <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-rrasm/784d8544-140a-4769-b659-7d3168de9242">INTERFACE_ROUTE_INFO</a> structure.
     * @param {Integer} dwItemSize Specifies the size of each item in the block to be added.
     * @param {Integer} dwItemCount Specifies the number of items of size <i>dwItemSize</i> to be copied as data for the new block.
     * @param {Pointer<Integer>} lpItemData Pointer to the data for the new block. The size in bytes of this buffer should be equal to the product of <i>dwItemSize</i> and <i>dwItemCount</i>.
     * @param {Pointer<Pointer<Void>>} lplpNewHeader Pointer to a pointer variable that, on successful return, points to the new header.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpHeader</i>, <i>lplpNewHeader</i>, or <i>lpItemData</i> parameter is <b>NULL</b>, or a block of type <i>dwInfoType</i> already exists in the header.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call failed. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the error message that corresponds to the returned error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprinfoblockadd
     * @since windowsserver2000
     */
    static MprInfoBlockAdd(lpHeader, dwInfoType, dwItemSize, dwItemCount, lpItemData, lplpNewHeader) {
        lpHeaderMarshal := lpHeader is VarRef ? "ptr" : "ptr"
        lpItemDataMarshal := lpItemData is VarRef ? "char*" : "ptr"
        lplpNewHeaderMarshal := lplpNewHeader is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprInfoBlockAdd", lpHeaderMarshal, lpHeader, "uint", dwInfoType, "uint", dwItemSize, "uint", dwItemCount, lpItemDataMarshal, lpItemData, lplpNewHeaderMarshal, lplpNewHeader, "uint")
        return result
    }

    /**
     * The MprInfoBlockRemove function creates a new header that is identical to an existing header with a specified block removed.
     * @remarks
     * After removing an information block, obtain the new size of the information header by call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprinfoblockquerysize">MprInfoBlockQuerySize</a>.
     * @param {Pointer<Void>} lpHeader Pointer to the header from which the block should be removed.
     * @param {Integer} dwInfoType Specifies the type of block to be removed. The types available depend on the transport: 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/ip-information-types-for-router-information-blocks">IP</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/ipx-information-types-for-router-information-blocks">IPX</a>.
     * @param {Pointer<Pointer<Void>>} lplpNewHeader Pointer to a pointer variable that receives the new header.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpHeader</i> parameter is <b>NULL</b>, or no block of type <i>dwInfoType</i> exists in the header.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The memory allocation required for successful execution of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprinfoblockremove">MprInfoBlockRemove</a> could not be completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call failed. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the error message that corresponds to the returned error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprinfoblockremove
     * @since windowsserver2000
     */
    static MprInfoBlockRemove(lpHeader, dwInfoType, lplpNewHeader) {
        lpHeaderMarshal := lpHeader is VarRef ? "ptr" : "ptr"
        lplpNewHeaderMarshal := lplpNewHeader is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprInfoBlockRemove", lpHeaderMarshal, lpHeader, "uint", dwInfoType, lplpNewHeaderMarshal, lplpNewHeader, "uint")
        return result
    }

    /**
     * The MprInfoBlockSet creates a new header that is identical to an existing header with a specified block modified.
     * @param {Pointer<Void>} lpHeader Pointer to the header in which to modify the specified block.
     * @param {Integer} dwInfoType Specifies the type of block to change. The types available depend on the transport: 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/ip-information-types-for-router-information-blocks">IP</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/ipx-information-types-for-router-information-blocks">IPX</a>.
     * @param {Integer} dwItemSize Specifies the size of each item in the block's new data.
     * @param {Integer} dwItemCount Specifies the number of items of size <i>dwItemSize</i> to be copied as the new data for the block.
     * @param {Pointer<Integer>} lpItemData Pointer to the new data for the block. This should point to a buffer with a size (in bytes) equal to the product of <i>dwItemSize</i> and <i>dwItemCount</i>.
     * @param {Pointer<Pointer<Void>>} lplpNewHeader Pointer to a pointer variable that, on successful return, points to the new header.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One (or more) required parameters is <b>NULL</b>, or no block of type <i>dwInfoType</i> exists in the header.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call failed. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the error message that corresponds to the returned error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprinfoblockset
     * @since windowsserver2000
     */
    static MprInfoBlockSet(lpHeader, dwInfoType, dwItemSize, dwItemCount, lpItemData, lplpNewHeader) {
        lpHeaderMarshal := lpHeader is VarRef ? "ptr" : "ptr"
        lpItemDataMarshal := lpItemData is VarRef ? "char*" : "ptr"
        lplpNewHeaderMarshal := lplpNewHeader is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprInfoBlockSet", lpHeaderMarshal, lpHeader, "uint", dwInfoType, "uint", dwItemSize, "uint", dwItemCount, lpItemDataMarshal, lpItemData, lplpNewHeaderMarshal, lplpNewHeader, "uint")
        return result
    }

    /**
     * The MprInfoBlockFind function locates a specified block in an information header, and retrieves information about the block.
     * @param {Pointer<Void>} lpHeader Specifies the header in which to locate the block.
     * @param {Integer} dwInfoType Specifies the type of block to locate. The types available depend on the transport: 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/ip-information-types-for-router-information-blocks">IP</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/ipx-information-types-for-router-information-blocks">IPX</a>.
     * @param {Pointer<Integer>} lpdwItemSize Pointer to a <b>DWORD</b> variable that receives the size of each item in the located block's data. This parameter is optional. If this parameter is <b>NULL</b>, the item size is not returned.
     * @param {Pointer<Integer>} lpdwItemCount Pointer to a <b>DWORD</b> variable that receives the number of items of size <i>dwItemSize</i> contained in the block's data. This parameter is optional. If this parameter is <b>NULL</b>, the item count is not  returned.
     * @param {Pointer<Pointer<Integer>>} lplpItemData Pointer to a pointer that, on successful return, points to the data for the located block. This parameter is optional. If this parameter is <b>NULL</b>, the data is  not  returned.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpInfoHeader</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No block of type <i>dwInfoType</i> exists in the header.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call failed. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to retrieve the error message that corresponds to the returned error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprinfoblockfind
     * @since windowsserver2000
     */
    static MprInfoBlockFind(lpHeader, dwInfoType, lpdwItemSize, lpdwItemCount, lplpItemData) {
        lpHeaderMarshal := lpHeader is VarRef ? "ptr" : "ptr"
        lpdwItemSizeMarshal := lpdwItemSize is VarRef ? "uint*" : "ptr"
        lpdwItemCountMarshal := lpdwItemCount is VarRef ? "uint*" : "ptr"
        lplpItemDataMarshal := lplpItemData is VarRef ? "ptr*" : "ptr"

        result := DllCall("MPRAPI.dll\MprInfoBlockFind", lpHeaderMarshal, lpHeader, "uint", dwInfoType, lpdwItemSizeMarshal, lpdwItemSize, lpdwItemCountMarshal, lpdwItemCount, lplpItemDataMarshal, lplpItemData, "uint")
        return result
    }

    /**
     * The MprInfoBlockQuerySize function returns the returns the size of the information header.
     * @param {Pointer<Void>} lpHeader Pointer to the information header for which to return the size.
     * @returns {Integer} <b>MprInfoBlockQuerySize</b> returns the size of the information header.
     * @see https://learn.microsoft.com/windows/win32/api/mprapi/nf-mprapi-mprinfoblockquerysize
     * @since windowsserver2000
     */
    static MprInfoBlockQuerySize(lpHeader) {
        lpHeaderMarshal := lpHeader is VarRef ? "ptr" : "ptr"

        result := DllCall("MPRAPI.dll\MprInfoBlockQuerySize", lpHeaderMarshal, lpHeader, "uint")
        return result
    }

    /**
     * The MgmRegisterMProtocol function is used by clients to register with the multicast group manager.
     * @remarks
     * Registering a protocol is the first operation any multicast routing protocol should perform. After registration, a routing protocol should take ownership of the appropriate interfaces before adding or deleting group memberships.
     * 
     * Only one routing protocol may take ownership of an interface at any given time. Multiple routing protocols may be registered with the multicast group manager, each protocol owning different interfaces.
     * @param {Pointer<ROUTING_PROTOCOL_CONFIG>} prpiInfo Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/ns-mgm-routing_protocol_config">ROUTING_PROTOCOL_CONFIG</a> structure that contains pointers to callbacks into the client.
     * @param {Integer} dwProtocolId Specifies the ID of the client. The ID is unique for each client.
     * @param {Integer} dwComponentId Specifies the component ID for a specific instance of the client. This parameter is used with <i>dwProtocolId</i> to uniquely identify an instance of a client.
     * @param {Pointer<HANDLE>} phProtocol On input, the client must supply a pointer to a handle. 
     * 
     * 
     * 
     * 
     * On output, <i>phProtocol</i> receives the registration handle for the client. This handle must be used in subsequent calls to the multicast group manager.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot register the specified client because an entry with the same protocol ID and component ID already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmregistermprotocol
     * @since windowsserver2000
     */
    static MgmRegisterMProtocol(prpiInfo, dwProtocolId, dwComponentId, phProtocol) {
        result := DllCall("rtm.dll\MgmRegisterMProtocol", "ptr", prpiInfo, "uint", dwProtocolId, "uint", dwComponentId, "ptr", phProtocol, "uint")
        return result
    }

    /**
     * The MgmDeRegisterMProtocol function deregisters a client handle obtained from a call to MgmRegisterMProtocol.
     * @remarks
     * A multicast routing protocol must not call this function until it has released ownership of all the interfaces the protocol owns by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmreleaseinterfaceownership">MgmReleaseInterfaceOwnership</a>.
     * @param {HANDLE} hProtocol Handle to the protocol obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmregistermprotocol">MgmRegisterMProtocol</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function. The client did not first release the interfaces it owns.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid handle to a client.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmderegistermprotocol
     * @since windowsserver2000
     */
    static MgmDeRegisterMProtocol(hProtocol) {
        hProtocol := hProtocol is Win32Handle ? NumGet(hProtocol, "ptr") : hProtocol

        result := DllCall("rtm.dll\MgmDeRegisterMProtocol", "ptr", hProtocol, "uint")
        return result
    }

    /**
     * The MgmTakeInterfaceOwnership function is called by a client (such as a routing protocol) when it is enabled on an interface.
     * @remarks
     * A client must take ownership of an interface only after registering itself with the multicast group manager, but before it adds group membership entries.
     * @param {HANDLE} hProtocol Handle to the protocol obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmregistermprotocol">MgmRegisterMProtocol</a>.
     * @param {Integer} dwIfIndex Specifies the index of the interface of which to take ownership.
     * @param {Integer} dwIfNextHopAddr Specifies the address of the next hop that corresponds to the index specified by <i>dwIfIndex</i>. The <i>dwIfIndex</i> and <i>dwIfNextHopIPAddr</i> parameters uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <i>dwIfIndex</i>, specify zero.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified interface is already owned by another routing protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid handle to a client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmtakeinterfaceownership
     * @since windowsserver2000
     */
    static MgmTakeInterfaceOwnership(hProtocol, dwIfIndex, dwIfNextHopAddr) {
        hProtocol := hProtocol is Win32Handle ? NumGet(hProtocol, "ptr") : hProtocol

        result := DllCall("rtm.dll\MgmTakeInterfaceOwnership", "ptr", hProtocol, "uint", dwIfIndex, "uint", dwIfNextHopAddr, "uint")
        return result
    }

    /**
     * The MgmReleaseInterfaceOwnership function is used by a client to relinquish ownership of an interface. When this function is called, all MFEs maintained by the multicast group manager on behalf of the client and for the specified interface are deleted.
     * @remarks
     * A client must release ownership of all the interfaces it owns before deregistering itself with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmderegistermprotocol">MgmDeRegisterMProtocol</a> function.
     * @param {HANDLE} hProtocol Handle to the protocol obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmregistermprotocol">MgmRegisterMProtocol</a>.
     * @param {Integer} dwIfIndex Specifies the index of the interface to release.
     * @param {Integer} dwIfNextHopAddr Specifies the address of the next hop that corresponds to the index specified by <i>dwIfIndex</i>. The <i>dwIfIndex</i> and <i>dwIfNextHopIPAddr</i> parameters uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <i>dwIfIndex</i>, specify zero.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid handle to a client, or the interface was not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmreleaseinterfaceownership
     * @since windowsserver2000
     */
    static MgmReleaseInterfaceOwnership(hProtocol, dwIfIndex, dwIfNextHopAddr) {
        hProtocol := hProtocol is Win32Handle ? NumGet(hProtocol, "ptr") : hProtocol

        result := DllCall("rtm.dll\MgmReleaseInterfaceOwnership", "ptr", hProtocol, "uint", dwIfIndex, "uint", dwIfNextHopAddr, "uint")
        return result
    }

    /**
     * The MgmGetProtocolOnInterface function retrieves the protocol ID of the multicast routing protocol that owns the specified interface.
     * @param {Integer} dwIfIndex Specifies the index of the interface for which to retrieve the protocol ID.
     * @param {Integer} dwIfNextHopAddr Specifies the address of the next hop that corresponds to the index specified by <i>dwIfIndex</i>. The <i>dwIfIndex</i> and <i>dwIfNextHopIPAddr</i> parameters uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <i>dwIfIndex</i>, specify zero.
     * @param {Pointer<Integer>} pdwIfProtocolId On input, the client must supply a pointer to a <b>DWORD</b>-sized memory location. 
     * 
     * 
     * 
     * 
     * On output, <i>pdwIfProtocolId</i> receives the ID of the protocol on the interface specified by <i>dwIfIndex</i>.
     * @param {Pointer<Integer>} pdwIfComponentId On input, the client must supply a pointer to a <b>DWORD</b> value. 
     * 
     * 
     * 
     * 
     * On output, <i>pdwIfComponentId</i> receives the component ID for the instance of the protocol on the interface. This parameter is used with <i>pdwIfProtocolId</i> to uniquely identify an instance of a routing protocol.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified interface was not found by the multicast group manager.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmgetprotocoloninterface
     * @since windowsserver2000
     */
    static MgmGetProtocolOnInterface(dwIfIndex, dwIfNextHopAddr, pdwIfProtocolId, pdwIfComponentId) {
        pdwIfProtocolIdMarshal := pdwIfProtocolId is VarRef ? "uint*" : "ptr"
        pdwIfComponentIdMarshal := pdwIfComponentId is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\MgmGetProtocolOnInterface", "uint", dwIfIndex, "uint", dwIfNextHopAddr, pdwIfProtocolIdMarshal, pdwIfProtocolId, pdwIfComponentIdMarshal, pdwIfComponentId, "uint")
        return result
    }

    /**
     * The MgmAddGroupMembershipEntry function notifies the multicast group manager that there are new receivers for the specified groups on the specified interface.
     * @remarks
     * This version of the MGM API supports only wildcard sources or specific sources, not a range of sources. The same restriction applies to groups, that is, no group ranges are permitted.
     * 
     * When this function is called, the multicast group manager may invoke the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nc-mgm-pmgm_join_alert_callback">PMGM_JOIN_ALERT_CALLBACK</a> callback to notify other routing protocols that there are new receivers for the specified group.
     * @param {HANDLE} hProtocol Handle to the protocol obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmregistermprotocol">MgmRegisterMProtocol</a>.
     * @param {Integer} dwSourceAddr Specifies the source address from which to receive multicast data. Specify zero to receive data from all sources (a wildcard receiver for a group); otherwise, specify the IP address of the source or source network. 
     * 
     * 
     * 
     * 
     * To specify a range of source addresses, specify the source network using <i>dwSourceAddr</i>, and specify a subnet mask using <i>dwSourceMask</i>.
     * @param {Integer} dwSourceMask Specifies the subnet mask that corresponds to <i>dwSourceAddr</i>. The <i>dwSourceAddr</i> and <i>dwSourceMask</i> parameters are used together to define a range of sources from which to receive multicast data. 
     * 
     * 
     * 
     * 
     * Specify zero for this parameter if zero was specified for <i>dwSourceAddr</i> (a wildcard receiver).
     * @param {Integer} dwGroupAddr Specifies the multicast group for which to receive data. Specify zero to receive all groups (a wildcard receiver); otherwise, specify the IP address of the group. 
     * 
     * 
     * 
     * 
     * To specify a range of group addresses, specify the group address using <i>dwGroupAddr</i>, and specify a subnet mask using <i>dwGroupMask</i>.
     * @param {Integer} dwGroupMask Specifies the subnet mask that corresponds to <i>dwGroupAddr</i>. The <i>dwGroupAddr</i> and <i>dwGroupMask</i> parameters are used together to define a range of multicast groups. 
     * 
     * 
     * 
     * 
     * Specify zero for this parameter if zero was specified for <i>dwGroupAddr</i> (a wildcard receiver).
     * @param {Integer} dwIfIndex Specifies the interface on which to add the group membership. Multicast data for the specified groups will be forwarded out over this interface.
     * @param {Integer} dwIfNextHopIPAddr Specifies the address of the next hop that corresponds to the index specified by <i>dwIfIndex</i>. The <i>dwIfIndex</i> and <i>dwIfNextHopIPAddr</i> parameters uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <i>dwIfIndex</i>, specify zero.
     * @param {Integer} dwFlags Specifies any additional processing that must take place when the group membership is added. Valid values are: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MGM_JOIN_STATE_FLAG"></a><a id="mgm_join_state_flag"></a><dl>
     * <dt><b>MGM_JOIN_STATE_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Add group membership for the specified source and group. Update any forwarding entries for the specified source group to reflect this change in group membership.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MGM_FORWARD_STATE"></a><a id="mgm_forward_state"></a><dl>
     * <dt><b>MGM_FORWARD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Add the specified interface to the list of outgoing interfaces for the forwarding entry that corresponds to the specified source and group.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid handle to the protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmaddgroupmembershipentry
     * @since windowsserver2000
     */
    static MgmAddGroupMembershipEntry(hProtocol, dwSourceAddr, dwSourceMask, dwGroupAddr, dwGroupMask, dwIfIndex, dwIfNextHopIPAddr, dwFlags) {
        hProtocol := hProtocol is Win32Handle ? NumGet(hProtocol, "ptr") : hProtocol

        result := DllCall("rtm.dll\MgmAddGroupMembershipEntry", "ptr", hProtocol, "uint", dwSourceAddr, "uint", dwSourceMask, "uint", dwGroupAddr, "uint", dwGroupMask, "uint", dwIfIndex, "uint", dwIfNextHopIPAddr, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The MgmDeleteGroupMembershipEntry function notifies the multicast group manager that there are no more receivers present for the specified groups on the specified interface.
     * @remarks
     * This version of the MGM API supports only wildcard sources or specific sources, not a range of sources. The same restriction applies to groups (that is, no group ranges are permitted).
     * 
     * When this function is called, the multicast group manager may invoke the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nc-mgm-pmgm_prune_alert_callback">PMGM_PRUNE_ALERT_CALLBACK</a> callback to notify other routing protocols that no more receivers are present for the specified group.
     * @param {HANDLE} hProtocol Handle to the protocol obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmregistermprotocol">MgmRegisterMProtocol</a>.
     * @param {Integer} dwSourceAddr Specifies the source address from which to stop receiving multicast data. Specify zero to stop receiving data from all sources (a wildcard receiver for a group); otherwise, specify the IP address of the source or source network. 
     * 
     * 
     * 
     * 
     * To specify a range of source addresses, specify the source network using <i>dwSourceAddr</i>, and specify a subnet mask using <i>dwSourceMask</i>.
     * @param {Integer} dwSourceMask Specifies the subnet mask that corresponds to <i>dwSourceAddr</i>. The <i>dwSourceAddr</i> and <i>dwSourceMask</i> parameters are used together to define a range of sources from which to stop receiving multicast data. 
     * 
     * 
     * 
     * 
     * Specify zero for this parameter if zero was specified for <i>dwSourceAddr</i> (a wildcard receiver).
     * @param {Integer} dwGroupAddr Specifies the multicast group for which to stop receiving data. Specify zero to stop receiving all groups (a wildcard receiver); otherwise, specify the IP address of the group. 
     * 
     * 
     * 
     * 
     * To specify a range of group addresses, specify the group address using <i>dwGroupAddr</i>, and specify a subnet mask using <i>dwGroupMask</i>.
     * @param {Integer} dwGroupMask Specifies the subnet mask that corresponds to <i>dwGroupAddr</i>. The <i>dwGroupAddr</i> and <i>dwGroupMask</i> parameters are used together to define a range of multicast groups. 
     * 
     * 
     * 
     * 
     * Specify zero for this parameter if zero was specified for <i>dwGroupAddr</i> (a wildcard receiver).
     * @param {Integer} dwIfIndex Specifies the interface on which to delete the group membership. Multicast data for the specified groups are no longer  forwarded out over this interface.
     * @param {Integer} dwIfNextHopIPAddr Specifies the address of the next hop that corresponds to the index specified by <i>dwIfIndex</i>. The <i>dwIfIndex</i> and <i>dwIfNextHopIPAddr</i> parameters uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <i>dwIfIndex</i>, specify zero.
     * @param {Integer} dwFlags Specifies any additional processing that must take place when the group membership is removed. Valid values are: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MGM_JOIN_STATE_FLAG"></a><a id="mgm_join_state_flag"></a><dl>
     * <dt><b>MGM_JOIN_STATE_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remove group membership for the specified source and group. Update any forwarding entries for the specified source group to reflect this change in group membership.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MGM_FORWARD_STATE"></a><a id="mgm_forward_state"></a><dl>
     * <dt><b>MGM_FORWARD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remove the specified interface from the list of outgoing interfaces for the forwarding entry that corresponds to the specified source and group.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid handle to a protocol, or the interface is owned by another protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified interface was not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmdeletegroupmembershipentry
     * @since windowsserver2000
     */
    static MgmDeleteGroupMembershipEntry(hProtocol, dwSourceAddr, dwSourceMask, dwGroupAddr, dwGroupMask, dwIfIndex, dwIfNextHopIPAddr, dwFlags) {
        hProtocol := hProtocol is Win32Handle ? NumGet(hProtocol, "ptr") : hProtocol

        result := DllCall("rtm.dll\MgmDeleteGroupMembershipEntry", "ptr", hProtocol, "uint", dwSourceAddr, "uint", dwSourceMask, "uint", dwGroupAddr, "uint", dwGroupMask, "uint", dwIfIndex, "uint", dwIfNextHopIPAddr, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The MgmGetMfe function retrieves a specific MFE.
     * @param {Pointer<MIB_IPMCAST_MFE>} pimm Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe">MIB_IPMCAST_MFE</a> structure that specifies the MFE to retrieve. The information to be returned is indicated by the <b>dwSource</b> and <b>dwGroup</b> members of the 
     * <b>MIB_IPMCAST_MFE</b> structure.
     * @param {Pointer<Integer>} pdwBufferSize On input, <i>pdwBufferSize</i> is a pointer to a <b>DWORD</b>-sized memory location that contains the size, in bytes, of the buffer pointed to by <i>pbBuffer</i>. 
     * 
     * 
     * 
     * 
     * On output, if the return value is ERROR_INSUFFICIENT_BUFFER, <i>pdwBufferSize</i> receives the minimum size the buffer pointed to by <i>pbBuffer</i> must be to hold the MFE; otherwise the value of <i>pdwBufferSize</i> remains unchanged.
     * @param {Pointer<Integer>} pbBuffer On input, the client must supply a pointer to a buffer. 
     * 
     * 
     * 
     * 
     * On output, <i>pbBuffer</i> contains the specified MFE. The MFE is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe">MIB_IPMCAST_MFE</a> structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified buffer is too small to hold the MFE. The client should check the value of <i>pdwBufferSize</i> for the minimum buffer size required to retrieve the MFE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified MFE was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmgetmfe
     * @since windowsserver2000
     */
    static MgmGetMfe(pimm, pdwBufferSize, pbBuffer) {
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("rtm.dll\MgmGetMfe", "ptr", pimm, pdwBufferSizeMarshal, pdwBufferSize, pbBufferMarshal, pbBuffer, "uint")
        return result
    }

    /**
     * The MgmGetFirstMfe function retrieves MFEs starting at the beginning of the MFE list.
     * @remarks
     * This function is used to begin sequential retrieval of MFEs; use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetnextmfe">MgmGetNextMfe</a> to continue the retrieval process.
     * 
     * In general, to retrieve MFEs, first call 
     * <b>MgmGetFirstMfe</b>. Then, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetnextmfe">MgmGetNextMfe</a> one or more times, until there are no more MFEs to return. Each call to 
     * <b>MgmGetNextMfe</b> should begin after the last MFE returned by the previous call to 
     * <b>MgmGetNextMfe</b> (or the initial call to 
     * <b>MgmGetFirstMfe</b>). To do this, the client specifies the last source and group in the buffer returned by a previous call.
     * 
     * <div class="alert"><b>Note</b>  The minimum size of the buffer pointed to by <i>pbBuffer</i> is not fixed; it is different for each MFE. Use the 
     * sizeof(<a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe">MIB_IPMCAST_MFE</a>) macro to determine the size of each MFE returned in the buffer.</div>
     * <div> </div>
     * @param {Pointer<Integer>} pdwBufferSize On input, <i>pdwBufferSize</i> is a pointer to a <b>DWORD</b>-sized memory location containing the size, in bytes, of <i>pbBuffer</i>. 
     * 
     * 
     * 
     * 
     * On output, if the return value is ERROR_INSUFFICIENT_BUFFER, <i>pdwBufferSize</i> receives the minimum size <i>pbBuffer</i> must be to hold the MFE; otherwise, the value of <i>pdwBufferSize</i> remains unchanged.
     * @param {Pointer<Integer>} pbBuffer On input, the client must supply a pointer to a buffer. 
     * 
     * 
     * 
     * 
     * On output, <i>pbBuffer</i> contains one or more MFEs. Each MFE is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe">MIB_IPMCAST_MFE</a> structure.
     * @param {Pointer<Integer>} pdwNumEntries On input, the client must supply a pointer to a <b>DWORD</b>-sized memory location. 
     * 
     * 
     * 
     * 
     * On output, <i>pdwNumEntries</i> receives the number of MFEs contained in <i>pbBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified buffer is too small for even one MFE. The client should check the value of <i>pdwBufferSize</i> for the minimum buffer size required to retrieve one MFE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More MFEs are available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more MFEs are available. Zero or more MFEs were returned; check the value of <i>pdwNumEntries</i> to verify how many MFEs were returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmgetfirstmfe
     * @since windowsserver2000
     */
    static MgmGetFirstMfe(pdwBufferSize, pbBuffer, pdwNumEntries) {
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwNumEntriesMarshal := pdwNumEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\MgmGetFirstMfe", pdwBufferSizeMarshal, pdwBufferSize, pbBufferMarshal, pbBuffer, pdwNumEntriesMarshal, pdwNumEntries, "uint")
        return result
    }

    /**
     * The MgmGetNextMfe function retrieves one or more MFEs.
     * @remarks
     * This function is used to continue the sequential retrieval of MFEs; use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetfirstmfe">MgmGetFirstMfe</a> to start the retrieval process.
     * 
     * In general, to retrieve MFEs, first call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetfirstmfe">MgmGetFirstMfe</a>. Then, call 
     * <b>MgmGetNextMfe</b> one or more times, until there are no more MFEs to return. Each call to 
     * <b>MgmGetNextMfe</b> should begin after the last MFE returned by the previous call to 
     * <b>MgmGetNextMfe</b> (or the initial call to 
     * <b>MgmGetFirstMfe</b>). To do this, the client specifies the last source and group in the buffer returned by a previous call.
     * 
     * <div class="alert"><b>Note</b>  The minimum size of the buffer pointed to by <i>pbBuffer</i> is not fixed; it is different for each MFE. Use the 
     * sizeof(<a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe">MIB_IPMCAST_MFE</a>) macro to determine the size of each MFE returned in the buffer.</div>
     * <div> </div>
     * @param {Pointer<MIB_IPMCAST_MFE>} pimmStart Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe">MIB_IPMCAST_MFE</a> structure that specifies from where to begin retrieving MFEs. The <b>dwSource</b> and <b>dwGroup</b> members of the 
     * <b>MIB_IPMCAST_MFE</b> structure identify an MFE. Specify the source and group of the last MFE that was returned by the previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetfirstmfe">MgmGetFirstMfe</a> or 
     * <b>MgmGetNextMfe</b>.
     * @param {Pointer<Integer>} pdwBufferSize On input, <i>pdwBufferSize</i> is a pointer to a <b>DWORD</b>-sized memory location containing the size, in bytes, of <i>pbBuffer</i>. 
     * 
     * 
     * 
     * 
     * On output, if the return value is ERROR_INSUFFICIENT_BUFFER, <i>pdwBufferSize</i> receives the minimum size <i>pbBuffer</i> must be to hold the MFE; otherwise, the value of <i>pdwBufferSize</i> remains unchanged.
     * @param {Pointer<Integer>} pbBuffer On input, the client must supply a pointer to a buffer. 
     * 
     * 
     * 
     * 
     * On output, <i>pbBuffer</i> contains one or more MFEs. Each MFE is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe">MIB_IPMCAST_MFE</a> structure.
     * @param {Pointer<Integer>} pdwNumEntries On input, the client must supply a pointer to a <b>DWORD</b>-sized memory location. 
     * 
     * 
     * 
     * 
     * On output, <i>pdwNumEntries</i> receives the number of MFEs contained in <i>pbBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified buffer is too small for even one MFE. The client should check the value of <i>pdwBufferSize</i> for the minimum buffer size required to retrieve one MFE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More MFEs are available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more MFEs are available. Zero or more MFEs were returned; check the value of <i>pdwNumEntries</i> to verify how many MFEs were returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmgetnextmfe
     * @since windowsserver2000
     */
    static MgmGetNextMfe(pimmStart, pdwBufferSize, pbBuffer, pdwNumEntries) {
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwNumEntriesMarshal := pdwNumEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\MgmGetNextMfe", "ptr", pimmStart, pdwBufferSizeMarshal, pdwBufferSize, pbBufferMarshal, pbBuffer, pdwNumEntriesMarshal, pdwNumEntries, "uint")
        return result
    }

    /**
     * The MgmGetMfeStats function retrieves the statistics for a specific MFE. The statistics returned include the packets received, bytes received, and the packets forwarded on each outgoing interface.
     * @remarks
     * The MFE statistics are returned in either an <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats">MIB_IPMCAST_MFE_STATS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats_ex_xp">MIB_IPMCAST_MFE_STATS_EX</a> structure determined by the <i>dwFlags</i> parameter.
     * @param {Pointer<MIB_IPMCAST_MFE>} pimm Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe">MIB_IPMCAST_MFE</a> structure that specifies the MFE for which to retrieve statistics. The information to be returned is indicated by the <b>dwSource</b> and <b>dwGroup</b> members of the 
     * <b>MIB_IPMCAST_MFE</b> structure.
     * @param {Pointer<Integer>} pdwBufferSize On input, <i>pdwBufferSize</i> is a pointer to a <b>DWORD</b>-sized memory location that contains the size, in bytes, of the buffer pointed to by <i>pbBuffer</i>. 
     * 
     * 
     * 
     * 
     * On output, if the return value is ERROR_INSUFFICIENT_BUFFER, <i>pdwBufferSize</i> receives the minimum size the buffer pointed to by <i>pbBuffer</i> must be to hold the set of MFE statistics; otherwise the value of <i>pdwBufferSize</i> remains unchanged.
     * @param {Pointer<Integer>} pbBuffer On input, the client must supply a pointer to a buffer. 
     * 
     * 
     * 
     * 
     * On output, <i>pbBuffer</i> contains the specified set of MFE statistics.
     * @param {Integer} dwFlags Determines the data structure returned.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MGM_MFE_STATS_0"></a><a id="mgm_mfe_stats_0"></a><dl>
     * <dt><b>MGM_MFE_STATS_0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include statistics corresponding to <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats">MIB_IPMCAST_MFE_STATS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MGM_MFE_STATS_1"></a><a id="mgm_mfe_stats_1"></a><dl>
     * <dt><b>MGM_MFE_STATS_1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include statistics corresponding to <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats_ex_xp">MIB_IPMCAST_MFE_STATS_EX</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified buffer is too small for the statistics for even one MFE. The client should check the value of <i>pdwBufferSize</i> for the minimum buffer size required to retrieve statistics for one MFE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified MFE was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmgetmfestats
     * @since windowsserver2000
     */
    static MgmGetMfeStats(pimm, pdwBufferSize, pbBuffer, dwFlags) {
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("rtm.dll\MgmGetMfeStats", "ptr", pimm, pdwBufferSizeMarshal, pdwBufferSize, pbBufferMarshal, pbBuffer, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The MgmGetFirstMfeStats function retrieves MFE statistics starting at the beginning of the MFE list.
     * @remarks
     * This function is used to begin sequential retrieval of MFE statistics; use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetnextmfestats">MgmGetNextMfeStats</a> to continue the retrieval process.
     * 
     * In general, to retrieve MFE statistics, first call 
     * <b>MgmGetFirstMfeStats</b>. Then, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetnextmfestats">MgmGetNextMfeStats</a> one or more times, until there are no more MFEs to return. Each call to 
     * <b>MgmGetNextMfeStats</b> should begin after the last MFE returned by the previous call to 
     * <b>MgmGetNextMfeStats</b> (or the initial call to 
     * <b>MgmGetFirstMfeStats</b>) To do this, the client specifies the last source and group in the buffer returned by a previous call.
     * 
     * The MFE statistics are returned in either an <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats">MIB_IPMCAST_MFE_STATS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats_ex_xp">MIB_IPMCAST_MFE_STATS_EX</a> structure determined by the <i>dwFlags</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  The minimum size of the buffer pointed to by <i>pbBuffer</i> is not fixed; it is different for each set of MFE statistics. Use the 
     * <b>sizeof</b> macro to determine the size of each set of statistics returned in the buffer.</div>
     * <div> </div>
     * @param {Pointer<Integer>} pdwBufferSize On input, <i>pdwBufferSize</i> is a pointer to a <b>DWORD</b>-sized memory location containing the size, in bytes, of <i>pbBuffer</i>. 
     * 
     * 
     * 
     * 
     * On output, if the return value is ERROR_INSUFFICIENT_BUFFER, <i>pdwBufferSize</i> receives the minimum size <i>pbBuffer</i> must be to hold a set of MFE statistics; otherwise, the value of <i>pdwBufferSize</i> remains unchanged.
     * @param {Pointer<Integer>} pbBuffer On input, the client must supply a pointer to a buffer. 
     * 
     * 
     * 
     * 
     * On output, <i>pbBuffer</i> contains one or more sets of MFE statistics. Each set of MFE statistics is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats">MIB_IPMCAST_MFE_STATS</a> structure.
     * @param {Pointer<Integer>} pdwNumEntries On input, the client must supply a pointer to a <b>DWORD</b>-sized memory location. 
     * 
     * 
     * 
     * 
     * On output, <i>pdwNumEntries</i> receives the number of sets of MFE statistics contained in <i>pbBuffer</i>.
     * @param {Integer} dwFlags Determines the data structure returned.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MGM_MFE_STATS_0"></a><a id="mgm_mfe_stats_0"></a><dl>
     * <dt><b>MGM_MFE_STATS_0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include statistics corresponding to <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats">MIB_IPMCAST_MFE_STATS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MGM_MFE_STATS_1"></a><a id="mgm_mfe_stats_1"></a><dl>
     * <dt><b>MGM_MFE_STATS_1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include statistics corresponding to <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats_ex_xp">MIB_IPMCAST_MFE_STATS_EX</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified buffer is too small for even one set of MFE statistics. The client should check the value of <i>pdwBufferSize</i> for the minimum buffer size required to retrieve one set of statistics.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More MFE statistics are available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more MFE statistics are available. Zero or more sets of MFE statistics were returned; check the value of <i>pdwNumEntries</i> to verify how many sets of statistics were returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmgetfirstmfestats
     * @since windowsserver2000
     */
    static MgmGetFirstMfeStats(pdwBufferSize, pbBuffer, pdwNumEntries, dwFlags) {
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwNumEntriesMarshal := pdwNumEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\MgmGetFirstMfeStats", pdwBufferSizeMarshal, pdwBufferSize, pbBufferMarshal, pbBuffer, pdwNumEntriesMarshal, pdwNumEntries, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The MgmGetNextMfeStats function retrieves one or more sets of MFE statistics.
     * @remarks
     * This function is used to continue the sequential retrieval of MFE statistics; use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetfirstmfestats">MgmGetFirstMfeStats</a> to start the retrieval process.
     * 
     * In general, to retrieve MFE statistics, first call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetfirstmfestats">MgmGetFirstMfeStats</a>. Then, call 
     * <b>MgmGetNextMfeStats</b> one or more times, until there are no more MFEs to return. Each call to 
     * <b>MgmGetNextMfeStats</b> should begin after the last MFE returned by the previous call to 
     * <b>MgmGetNextMfeStats</b> (or the initial call to 
     * <b>MgmGetFirstMfeStats</b>) To do this, the client specifies the last source and group in the buffer returned by a previous call.
     * 
     * The MFE statistics are returned in either an <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats">MIB_IPMCAST_MFE_STATS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats_ex_xp">MIB_IPMCAST_MFE_STATS_EX</a> structure determined by the <i>dwFlags</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  The minimum size of the buffer pointed to by <i>pbBuffer</i> is not fixed; it is different for each set of MFE statistics. Use the 
     * <b>sizeof</b> macro to determine the size of each set of statistics returned in the buffer.</div>
     * <div> </div>
     * @param {Pointer<MIB_IPMCAST_MFE>} pimmStart Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe">MIB_IPMCAST_MFE</a> structure that specifies from where to begin retrieving MFE statistics. The <b>dwSource</b> and <b>dwGroup</b> members of the 
     * <b>MIB_IPMCAST_MFE</b> structure identify an MFE. Specify the source and group of the last MFE that was returned by the previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgetfirstmfestats">MgmGetFirstMfeStats</a> or 
     * <b>MgmGetNextMfeStats</b>.
     * @param {Pointer<Integer>} pdwBufferSize On input, <i>pdwBufferSize</i> is a pointer to a <b>DWORD</b>-sized memory location that contains the size, in bytes, of <i>pbBuffer</i>. 
     * 
     * 
     * 
     * 
     * On output, if the return value is <b>ERROR_INSUFFICIENT_BUFFER</b>, <i>pdwBufferSize</i> receives the minimum size <i>pbBuffer</i> must be to hold a set of MFE statistics; otherwise, the value of <i>pdwBufferSize</i> remains unchanged.
     * @param {Pointer<Integer>} pbBuffer On input, the client must supply a pointer to a buffer. 
     * 
     * 
     * 
     * 
     * On output, <i>pbBuffer</i> contains one or more sets of MFE statistics. Each set of MFE statistics is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats">MIB_IPMCAST_MFE_STATS</a> structure.
     * @param {Pointer<Integer>} pdwNumEntries On input, the client must supply a pointer to a <b>DWORD</b>-sized memory location. 
     * 
     * 
     * 
     * 
     * On output, <i>pdwNumEntries</i> receives the number of sets of MFE statistics contained in <i>pbBuffer</i>.
     * @param {Integer} dwFlags Determines the data structure returned.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MGM_MFE_STATS_0"></a><a id="mgm_mfe_stats_0"></a><dl>
     * <dt><b>MGM_MFE_STATS_0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include statistics corresponding to <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats">MIB_IPMCAST_MFE_STATS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MGM_MFE_STATS_1"></a><a id="mgm_mfe_stats_1"></a><dl>
     * <dt><b>MGM_MFE_STATS_1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include statistics corresponding to <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats_ex_xp">MIB_IPMCAST_MFE_STATS_EX</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified buffer is too small for even one set of MFE statistics. The client should check the value of <i>pdwBufferSize</i> for the minimum buffer size required to retrieve one set of statistics.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More MFE statistics are available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more MFE statistics are available. Zero or more sets of MFE statistics were returned; check the value of <i>pdwNumEntries</i> to verify how many sets of statistics were returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmgetnextmfestats
     * @since windowsserver2000
     */
    static MgmGetNextMfeStats(pimmStart, pdwBufferSize, pbBuffer, pdwNumEntries, dwFlags) {
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwNumEntriesMarshal := pdwNumEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\MgmGetNextMfeStats", "ptr", pimmStart, pdwBufferSizeMarshal, pdwBufferSize, pbBufferMarshal, pbBuffer, pdwNumEntriesMarshal, pdwNumEntries, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The MgmGroupEnumerationStart function obtains an enumeration handle that is later used to obtain the list of groups that have been joined. After the client obtains the handle, it should use the MgmGroupEnumerationGetNext function to enumerate the groups.
     * @param {HANDLE} hProtocol Handle to the protocol obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmregistermprotocol">MgmRegisterMProtocol</a>.
     * @param {Integer} metEnumType Specifies the type of enumeration. The following enumerations are available. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Enumeration</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ALL_SOURCES"></a><a id="all_sources"></a><dl>
     * <dt><b>ALL_SOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves wildcard joins (*, g) and source-specific joins (s, g).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ANY_SOURCE"></a><a id="any_source"></a><dl>
     * <dt><b>ANY_SOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves group entries that have at least one source specified.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<HANDLE>} phEnumHandle Receives the handle to the enumeration. Use this handle in calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgroupenumerationgetnext">MgmGroupEnumerationGetNext</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgroupenumerationend">MgmGroupEnumerationEnd</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid handle to a protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmgroupenumerationstart
     * @since windowsserver2000
     */
    static MgmGroupEnumerationStart(hProtocol, metEnumType, phEnumHandle) {
        hProtocol := hProtocol is Win32Handle ? NumGet(hProtocol, "ptr") : hProtocol

        result := DllCall("rtm.dll\MgmGroupEnumerationStart", "ptr", hProtocol, "int", metEnumType, "ptr", phEnumHandle, "uint")
        return result
    }

    /**
     * The MgmGroupEnumerationGetNext function retrieves the next set of group entries. The information that is returned by this function is a list of groups joined and the sources requested, if any.
     * @param {HANDLE} hEnum Handle to the enumeration that was obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmgroupenumerationstart">MgmGroupEnumerationStart</a>.
     * @param {Pointer<Integer>} pdwBufferSize On input, <i>pdwBufferSize</i> is a pointer to a <b>DWORD</b>-sized memory location that contains the size, in bytes, of the buffer pointed to by <i>pbBuffer</i>. 
     * 
     * 
     * 
     * 
     * On output, if the return value is ERROR_INSUFFICIENT_BUFFER, <i>pdwBufferSize</i> receives the minimum size that the buffer pointed to by <i>pbBuffer</i> must be to hold a group entry; otherwise the value of <i>pdwBufferSize</i> remains unchanged.
     * @param {Pointer<Integer>} pbBuffer On input, the client must supply a pointer to a buffer. 
     * 
     * 
     * 
     * 
     * On output, <i>pbBuffer</i> contains one or more group entries. Each group entry is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/ns-mgm-source_group_entry">SOURCE_GROUP_ENTRY</a> structure.
     * @param {Pointer<Integer>} pdwNumEntries On input, the client must supply a pointer to a <b>DWORD</b> value. 
     * 
     * 
     * 
     * 
     * On output, <i>pdwNumEntries</i> receives the number of groups in <i>pbBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified buffer is too small to hold even one group. The client should check the value of <i>pdwBufferSize</i> for the minimum buffer size required to retrieve one group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid handle to an enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More groups are available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more groups are available. Zero or more groups were returned; check the value of <i>pdwNumEntries</i> to verify how many groups were returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmgroupenumerationgetnext
     * @since windowsserver2000
     */
    static MgmGroupEnumerationGetNext(hEnum, pdwBufferSize, pbBuffer, pdwNumEntries) {
        hEnum := hEnum is Win32Handle ? NumGet(hEnum, "ptr") : hEnum

        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwNumEntriesMarshal := pdwNumEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\MgmGroupEnumerationGetNext", "ptr", hEnum, pdwBufferSizeMarshal, pdwBufferSize, pbBufferMarshal, pbBuffer, pdwNumEntriesMarshal, pdwNumEntries, "uint")
        return result
    }

    /**
     * The MgmGroupEnumerationEnd function releases the specified enumeration handle that was obtained from a previous call to MgmGroupEnumerationStart.
     * @param {HANDLE} hEnum Specifies the enumeration handle to release.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CAN_NOT_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not complete the call to this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid enumeration handle.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mgm/nf-mgm-mgmgroupenumerationend
     * @since windowsserver2000
     */
    static MgmGroupEnumerationEnd(hEnum) {
        hEnum := hEnum is Win32Handle ? NumGet(hEnum, "ptr") : hEnum

        result := DllCall("rtm.dll\MgmGroupEnumerationEnd", "ptr", hEnum, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTM_NET_ADDRESS>} pNetAddress 
     * @param {Pointer<IN6_ADDR>} pAddress 
     * @param {Pointer<Integer>} pLength 
     * @param {Integer} dwAddressSize 
     * @returns {Integer} 
     */
    static RtmConvertNetAddressToIpv6AddressAndLength(pNetAddress, pAddress, pLength, dwAddressSize) {
        pLengthMarshal := pLength is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\RtmConvertNetAddressToIpv6AddressAndLength", "ptr", pNetAddress, "ptr", pAddress, pLengthMarshal, pLength, "uint", dwAddressSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTM_NET_ADDRESS>} pNetAddress 
     * @param {IN6_ADDR} Address 
     * @param {Integer} dwLength 
     * @param {Integer} dwAddressSize 
     * @returns {Integer} 
     */
    static RtmConvertIpv6AddressAndLengthToNetAddress(pNetAddress, Address, dwLength, dwAddressSize) {
        result := DllCall("rtm.dll\RtmConvertIpv6AddressAndLengthToNetAddress", "ptr", pNetAddress, "ptr", Address, "uint", dwLength, "uint", dwAddressSize, "uint")
        return result
    }

    /**
     * The RtmRegisterEntity function registers a client with an instance of the routing table manager for a specific address family.
     * @remarks
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/register-with-the-routing-table-manager">Register With the Routing Table Manager</a>.
     * @param {Pointer<RTM_ENTITY_INFO>} RtmEntityInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_entity_info">RTM_ENTITY_INFO</a> structure. This structure contains information that identifies the client to the routing table manager, such as the routing table manager instance and address family with which to register.
     * @param {Pointer<RTM_ENTITY_EXPORT_METHODS>} ExportMethods Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_entity_export_methods">RTM_ENTITY_EXPORT_METHODS</a> structure that contains a list of methods exported by the client. This parameter is optional and can be set to <b>NULL</b> if the calling client has no methods to export.
     * @param {Pointer<RTM_EVENT_CALLBACK>} EventCallback A <b>RTM_EVENT_CALLBACK</b> structure that specifies the callback the routing table manager  uses to notify the client of events. The events are when a client registers and unregisters, when routes expire, and when changes to the best route to a destination have occurred. Only those changes specified when the client called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterforchangenotification">RtmRegisterForChangeNotification</a>.
     * @param {BOOL} ReserveOpaquePointer Specifies whether to reserve an opaque pointer in each destination for this instance of the protocol. Specify <b>TRUE</b> to reserve an opaque pointer in each destination. Specify <b>FALSE</b> to skip this action. These opaque pointers can be used to point to a private, protocol-specific context for each destination.
     * @param {Pointer<RTM_REGN_PROFILE>} RtmRegProfile On input, <i>RtmRegProfile</i> is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_regn_profile">RTM_REGN_PROFILE</a> structure. 
     * 
     * 
     * 
     * 
     * On output, <i>RtmRegProfile</i> is filled with the requested registration profile structure. The client must use the information returned in other function calls (information returned includes the number of equal-cost next hops and the maximum number of items returned by an enumeration function call).
     * @param {Pointer<Pointer>} RtmRegHandle Receives a registration handle for the client. This handle must be used in all subsequent calls to the routing table manager.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified client has already registered with the routing table manager.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_CONFIGURATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Registry information for the routing table manager is corrupt.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Registry information for the routing table manager was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contains incorrect information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contains incorrect information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are not enough available system resources to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmregisterentity
     * @since windowsserver2000
     */
    static RtmRegisterEntity(RtmEntityInfo, ExportMethods, EventCallback, ReserveOpaquePointer, RtmRegProfile, RtmRegHandle) {
        RtmRegHandleMarshal := RtmRegHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmRegisterEntity", "ptr", RtmEntityInfo, "ptr", ExportMethods, "ptr", EventCallback, "int", ReserveOpaquePointer, "ptr", RtmRegProfile, RtmRegHandleMarshal, RtmRegHandle, "uint")
        return result
    }

    /**
     * The RtmDeregisterEntity function unregisters a client from a routing table manager instance and address family.
     * @remarks
     * Before calling this function, the client must ensure that all locks, handles, and information structures are released with the appropriate functions.
     * 
     * When the client calls 
     * <b>RtmDeregisterEntity</b>, the handle that was returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a> is released. The client must not call any RTMv2 functions after releasing this handle.
     * 
     * If the client does call any functions that access the routing table manager after the client has unregistered, the client's process may be terminated.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmderegisterentity
     * @since windowsserver2000
     */
    static RtmDeregisterEntity(RtmRegHandle) {
        result := DllCall("rtm.dll\RtmDeregisterEntity", "ptr", RtmRegHandle, "uint")
        return result
    }

    /**
     * The RtmGetRegisteredEntities function returns information about all clients that have registered with the specified instance of the routing table manager and specified address family.
     * @remarks
     * If <b>ERROR_INSUFFICIENT_BUFFER</b> is returned, there may be some data in <i>EntityHandles</i>. The <i>NumEntities</i> parameter specifies how many entities were actually returned.
     * 
     * The 
     * <b>RtmGetRegisteredEntities</b> function can be used by routing protocols to verify which other protocols are running for that address family and routing table manager instance. Based on the information returned, a client can then perform protocol-specific processing.
     * 
     * The RTMv2 API supports only one instance of the routing table manager.
     * 
     * When the entities are no longer required, release them by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleaseentities">RtmReleaseEntities</a>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/enumerate-the-registered-entities">Enumerate the Registered Entities</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<Integer>} NumEntities On input, <i>NumEntities</i> is a pointer to a <b>UINT</b> value, which specifies the maximum number of clients that can be received by <i>EntityInfos</i>. On output, <i>NumEntities</i> receives the actual number of clients received by <i>EntityInfos</i>.
     * @param {Pointer<Pointer>} EntityHandles If handles must be returned: On input, <i>EntityHandles</i> is a pointer to <b>NULL</b>. On output, <i>EntityHandles</i> receives a pointer to an array of entity handle; otherwise, <i>EntityHandles</i> remains unchanged. 
     * 
     * 
     * 
     * 
     * If handles do not need to be returned: On input, <i>EntityHandles</i> is <b>NULL</b>.
     * @param {Pointer<RTM_ENTITY_INFO>} EntityInfos If a pointer must be returned: On input, <i>EntityInfos</i> is a pointer to <b>NULL</b>. On output, <i>EntityInfos</i> receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_entity_info">RTM_ENTITY_INFO</a> structures; otherwise, <i>EntityInfos</i> remains unchanged. 
     * 
     * 
     * 
     * 
     * If a pointer does not need to be returned: On input, <i>EntityInfos</i> is <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer supplied is not large enough to hold all the requested information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetregisteredentities
     * @since windowsserver2000
     */
    static RtmGetRegisteredEntities(RtmRegHandle, NumEntities, EntityHandles, EntityInfos) {
        NumEntitiesMarshal := NumEntities is VarRef ? "uint*" : "ptr"
        EntityHandlesMarshal := EntityHandles is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmGetRegisteredEntities", "ptr", RtmRegHandle, NumEntitiesMarshal, NumEntities, EntityHandlesMarshal, EntityHandles, "ptr", EntityInfos, "uint")
        return result
    }

    /**
     * The RtmReleaseEntities function releases the client handles returned by RtmGetRegisteredEntities.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Integer} NumEntities Specifies the number of clients in <i>EntityHandles</i>.
     * @param {Pointer<Pointer>} EntityHandles Pointer to an array of client handles to release. The handles were obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetregisteredentities">RtmGetRegisteredEntities</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmreleaseentities
     * @since windowsserver2000
     */
    static RtmReleaseEntities(RtmRegHandle, NumEntities, EntityHandles) {
        EntityHandlesMarshal := EntityHandles is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmReleaseEntities", "ptr", RtmRegHandle, "uint", NumEntities, EntityHandlesMarshal, EntityHandles, "uint")
        return result
    }

    /**
     * The RtmLockDestination function locks or unlocks a destination in the routing table. Use this function to protect a destination while changing opaque pointers.
     * @remarks
     * This function also locks the associated routes. Avoid locking destinations for long periods of time, because no other client can access the destination and associated routes until the lock is released.
     * 
     * A client can also use this function when reading information for a destination, while preventing changes during the client's read operation. In this case, consider using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetdestinfo">RtmGetDestInfo</a> instead.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/update-a-route-in-place-using-rtmupdateandunlockroute">Update a Route In Place Using RtmUpdateAndUnlockRoute</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} DestHandle Handle to the destination to lock.
     * @param {BOOL} Exclusive Specifies whether to lock or unlock the destination in an exclusive (<b>TRUE</b>) or shared (<b>FALSE</b>) mode.
     * @param {BOOL} LockDest Specifies whether to lock or unlock the destination. Specify <b>TRUE</b> to lock the destination; specify <b>FALSE</b> to unlock it.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling client does not own this destination.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmlockdestination
     * @since windowsserver2000
     */
    static RtmLockDestination(RtmRegHandle, DestHandle, Exclusive, LockDest) {
        result := DllCall("rtm.dll\RtmLockDestination", "ptr", RtmRegHandle, "ptr", DestHandle, "int", Exclusive, "int", LockDest, "uint")
        return result
    }

    /**
     * The RtmGetOpaqueInformationPointer function returns a pointer to the opaque information field in a destination that is reserved for this client.
     * @remarks
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/access-the-opaque-pointer-in-a-destination">Access the Opaque Pointer in a Destination</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} DestHandle Handle to the destination.
     * @param {Pointer<Pointer<Void>>} OpaqueInfoPointer On input, <i>OpaqueInfoPointer</i> is a pointer to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * On output, <i>OpaqueInfoPointer</i> receives a pointer to the opaque information pointer. If a client has not reserved an opaque pointer during registration, this parameter remains unchanged.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No opaque pointer was reserved by the client.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetopaqueinformationpointer
     * @since windowsserver2000
     */
    static RtmGetOpaqueInformationPointer(RtmRegHandle, DestHandle, OpaqueInfoPointer) {
        OpaqueInfoPointerMarshal := OpaqueInfoPointer is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmGetOpaqueInformationPointer", "ptr", RtmRegHandle, "ptr", DestHandle, OpaqueInfoPointerMarshal, OpaqueInfoPointer, "uint")
        return result
    }

    /**
     * The RtmGetEntityMethods function queries the specified client to determine which methods are available for another client to invoke.
     * @remarks
     * Do not call another client's method directly, always use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtminvokemethod">RtmInvokeMethod</a>. The routing table manager performs error checking when using 
     * <b>RtmInvokeMethod</b> to ensure that the client is not unregistering or already unregistered.
     * 
     * If ERROR_INSUFFICIENT_BUFFER is returned, there may be some data in <i>ExptMethods</i>; <i>NumMethods</i> specifies how many methods actually fit in the buffer.
     * 
     * When the entity handle is no longer required, release it by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleaseentities">RtmReleaseEntities</a>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/obtain-and-call-the-exported-methods-for-a-client">Obtain and Call the Exported Methods for a Client</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} EntityHandle Handle to the client for which to obtain methods.
     * @param {Pointer<Integer>} NumMethods On input, <i>NumMethods</i> specifies a valid pointer to a <b>UINT</b> value. Specify zero to return the number of methods available to be exported. 
     * 
     * 
     * 
     * 
     * On output, <i>NumMethods</i> receives the number of methods exported by the client.
     * @param {Pointer<Pointer<RTM_ENTITY_EXPORT_METHOD>>} ExptMethods Receives a pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/rtmv2/nc-rtmv2-_entity_method">RTM_ENTITY_EXPORT_METHOD</a> structure that contains the set of method identifiers requested by the calling client.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer supplied is not large enough to hold all the requested information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetentitymethods
     * @since windowsserver2000
     */
    static RtmGetEntityMethods(RtmRegHandle, EntityHandle, NumMethods, ExptMethods) {
        NumMethodsMarshal := NumMethods is VarRef ? "uint*" : "ptr"
        ExptMethodsMarshal := ExptMethods is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmGetEntityMethods", "ptr", RtmRegHandle, "ptr", EntityHandle, NumMethodsMarshal, NumMethods, ExptMethodsMarshal, ExptMethods, "uint")
        return result
    }

    /**
     * The RtmInvokeMethod function invokes a method exported by another client.
     * @remarks
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/obtain-and-call-the-exported-methods-for-a-client">Obtain and Call the Exported Methods for a Client</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} EntityHandle Handle to the client whose methods are being invoked.
     * @param {Pointer<RTM_ENTITY_METHOD_INPUT>} Input Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_entity_method_input">RTM_ENTITY_METHOD_INPUT</a> structure that contains the method to be invoked and a common input buffer.
     * @param {Pointer<Integer>} OutputSize On input, <i>OutputSize</i> is a pointer to a <b>UINT</b> value that specifies the size, in bytes, of <i>Output</i>. 
     * 
     * 
     * 
     * 
     * On output, <i>OutputSize</i> receives a pointer to a <b>UINT</b> value that specifies the actual size, in bytes, of <i>Output</i>.
     * @param {Pointer<RTM_ENTITY_METHOD_OUTPUT>} Output Receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_entity_method_output">RTM_ENTITY_METHOD_OUTPUT</a> structures. Each structure consists of a (method identifier, correct output) tuple.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtminvokemethod
     * @since windowsserver2000
     */
    static RtmInvokeMethod(RtmRegHandle, EntityHandle, Input, OutputSize, Output) {
        OutputSizeMarshal := OutputSize is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\RtmInvokeMethod", "ptr", RtmRegHandle, "ptr", EntityHandle, "ptr", Input, OutputSizeMarshal, OutputSize, "ptr", Output, "uint")
        return result
    }

    /**
     * The RtmBlockMethods function blocks or unblocks the execution of methods for a specified destination, route, or next hop, or for all destinations, routes, and next hops.
     * @remarks
     * Currently, this function does not support blocking methods for a specific destination, route, or next hop.
     * 
     * Methods are typically blocked when client-specific data in the route is being changed; a client blocks methods, rearranges data, and then unblocks methods.
     * 
     * Clients should only block methods for a short period of time. If a second client calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtminvokemethod">RtmInvokeMethod</a> and the first client's methods are blocked, 
     * <b>RtmInvokeMethod</b> does not return until methods are unblocked and the function call is completed.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {HANDLE} TargetHandle Handle to a destination, route, or next hop for which to block methods. This parameter is optional and can be set to <b>NULL</b> to block methods for all targets.
     * @param {Integer} TargetType Specifies the type of the handle in <i>TargetHandle</i>. This parameter is optional and can be set to <b>NULL</b> to block methods for all targets. The following flags are used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEST_TYPE"></a><a id="dest_type"></a><dl>
     * <dt><b>DEST_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>TargetHandle</i> is a destination.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NEXTHOP_TYPE"></a><a id="nexthop_type"></a><dl>
     * <dt><b>NEXTHOP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>TargetHandle</i> is a next hop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ROUTE_TYPE"></a><a id="route_type"></a><dl>
     * <dt><b>ROUTE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>TargetHandle</i> is a route.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} BlockingFlag Specifies whether to block or unblock methods. The following flags are used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_BLOCK_METHODS"></a><a id="rtm_block_methods"></a><dl>
     * <dt><b>RTM_BLOCK_METHODS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Block methods for the specified target.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_RESUME_METHODS"></a><a id="rtm_resume_methods"></a><dl>
     * <dt><b>RTM_RESUME_METHODS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unblock methods for the specified target.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is the following error code.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmblockmethods
     * @since windowsserver2000
     */
    static RtmBlockMethods(RtmRegHandle, TargetHandle, TargetType, BlockingFlag) {
        TargetHandle := TargetHandle is Win32Handle ? NumGet(TargetHandle, "ptr") : TargetHandle

        result := DllCall("rtm.dll\RtmBlockMethods", "ptr", RtmRegHandle, "ptr", TargetHandle, "char", TargetType, "uint", BlockingFlag, "uint")
        return result
    }

    /**
     * The RtmGetEntityInfo function returns information about a previously registered client.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} EntityHandle Handle to the client for which to return information.
     * @param {Pointer<RTM_ENTITY_INFO>} EntityInfo On input, <i>EntityInfo</i> is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_entity_info">RTM_ENTITY_INFO</a> structure. 
     * 
     * 
     * 
     * 
     * On output, <i>EntityInfo</i> receives the requested information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetentityinfo
     * @since windowsserver2000
     */
    static RtmGetEntityInfo(RtmRegHandle, EntityHandle, EntityInfo) {
        result := DllCall("rtm.dll\RtmGetEntityInfo", "ptr", RtmRegHandle, "ptr", EntityHandle, "ptr", EntityInfo, "uint")
        return result
    }

    /**
     * The RtmGetDestInfo function returns information about a destination.
     * @remarks
     * The  structure pointed to by <i>DestInfo</i> is a variable-sized structure. If the client specifies more than one view with <i>TargetViews</i>, the size of <i>DestInfo</i> increases for each view. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtm_size_of_dest_info">RTM_SIZE_OF_DEST_INFO</a> macro to determine how large a <i>DestInfo</i> structure to allocate before calling this function. Use the value specified for <i>TargetViews</i> as a parameter to 
     * <b>RTM_SIZE_OF_DEST_INFO</b>.
     * 
     * Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleasedestinfo">RtmReleaseDestInfo</a> to release the <i>DestInfo</i> buffer.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} DestHandle Handle to the destination for which to return information.
     * @param {Integer} ProtocolId Specifies the protocol identifier. The <i>ProtocolID</i> is not part of the search criteria. The routing table manager uses this identifier to determine which route information to return. For example, if a client specifies the RIP protocol identifier, the best RIP route is returned, even if a non-RIP route is the best route to the destination. 
     * 
     * 
     * 
     * 
     * Specify RTM_BEST_PROTOCOL to return a route regardless of which protocol owns it. Specify RTM_THIS_PROTOCOL to return the best route for the calling protocol.
     * @param {Integer} TargetViews Specifies the views from which to return information. If the client specifies RTM_VIEW_MASK_ANY, destination information is returned from all views; however, no view-specific information is returned.
     * @param {Pointer<RTM_DEST_INFO>} DestInfo On input, <i>DestInfo</i> is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structure. 
     * 
     * 
     * 
     * 
     * On output, <i>DestInfo</i> is filled with the requested destination information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetdestinfo
     * @since windowsserver2000
     */
    static RtmGetDestInfo(RtmRegHandle, DestHandle, ProtocolId, TargetViews, DestInfo) {
        result := DllCall("rtm.dll\RtmGetDestInfo", "ptr", RtmRegHandle, "ptr", DestHandle, "uint", ProtocolId, "uint", TargetViews, "ptr", DestInfo, "uint")
        return result
    }

    /**
     * The RtmGetRouteInfo function returns information for the specified route.
     * @remarks
     * When the routes are no longer required, release them by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleaserouteinfo">RtmReleaseRouteInfo</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} RouteHandle Handle to the route to find.
     * @param {Pointer<RTM_ROUTE_INFO>} RouteInfo If a pointer must be returned: On input, <i>RouteInfo</i> is a pointer to <b>NULL</b>. On output, <i>RouteInfo</i> receives a pointer to the route; otherwise, <i>RouteInfo</i> remains unchanged. 
     * 
     * 
     * 
     * 
     * If a pointer does not need to be returned: On input, <i>RouteInfo</i> is <b>NULL</b>.
     * @param {Pointer<RTM_NET_ADDRESS>} DestAddress If a pointer must be returned: On input, <i>DestAddress</i> is a pointer to <b>NULL</b>. On output, <i>DestAddress</i> receives a pointer to the destination's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_net_address">RTM_NET_ADDRESS</a> structure; otherwise, <i>DestAddress</i> remains unchanged. 
     * 
     * 
     * 
     * 
     * If a pointer does not need to be returned: On input, <i>DestAddress</i> is <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetrouteinfo
     * @since windowsserver2000
     */
    static RtmGetRouteInfo(RtmRegHandle, RouteHandle, RouteInfo, DestAddress) {
        result := DllCall("rtm.dll\RtmGetRouteInfo", "ptr", RtmRegHandle, "ptr", RouteHandle, "ptr", RouteInfo, "ptr", DestAddress, "uint")
        return result
    }

    /**
     * The RtmGetNextHopInfo function returns information about the specified next hop.
     * @remarks
     * When the next hop handle is no longer required, release it by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmdeletenexthop">RtmDeleteNextHop</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} NextHopHandle Handle to the next hop.
     * @param {Pointer<RTM_NEXTHOP_INFO>} NextHopInfo On input, <i>NextHopInfo</i> a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_nexthop_info">RTM_NEXTHOP_INFO</a> structure. 
     * 
     * 
     * 
     * 
     * On output, <i>NextHopInfo</i> is filled with the requested next-hop information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetnexthopinfo
     * @since windowsserver2000
     */
    static RtmGetNextHopInfo(RtmRegHandle, NextHopHandle, NextHopInfo) {
        result := DllCall("rtm.dll\RtmGetNextHopInfo", "ptr", RtmRegHandle, "ptr", NextHopHandle, "ptr", NextHopInfo, "uint")
        return result
    }

    /**
     * The RtmReleaseEntityInfo function releases a client structure.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<RTM_ENTITY_INFO>} EntityInfo Pointer to the handle to release. The handle was obtained with a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetentityinfo">RtmGetEntityInfo</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmreleaseentityinfo
     * @since windowsserver2000
     */
    static RtmReleaseEntityInfo(RtmRegHandle, EntityInfo) {
        result := DllCall("rtm.dll\RtmReleaseEntityInfo", "ptr", RtmRegHandle, "ptr", EntityInfo, "uint")
        return result
    }

    /**
     * The RtmReleaseDestInfo function releases a destination structure.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<RTM_DEST_INFO>} DestInfo Pointer to the destination to release. The destination was obtained from a previous call to a function that returns an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structure.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmreleasedestinfo
     * @since windowsserver2000
     */
    static RtmReleaseDestInfo(RtmRegHandle, DestInfo) {
        result := DllCall("rtm.dll\RtmReleaseDestInfo", "ptr", RtmRegHandle, "ptr", DestInfo, "uint")
        return result
    }

    /**
     * The RtmReleaseRouteInfo function releases a route structure.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<RTM_ROUTE_INFO>} RouteInfo Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_route_info">RTM_ROUTE_INFO</a> structure to release. The route was obtained with a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetrouteinfo">RtmGetRouteInfo</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmreleaserouteinfo
     * @since windowsserver2000
     */
    static RtmReleaseRouteInfo(RtmRegHandle, RouteInfo) {
        result := DllCall("rtm.dll\RtmReleaseRouteInfo", "ptr", RtmRegHandle, "ptr", RouteInfo, "uint")
        return result
    }

    /**
     * The RtmReleaseNextHopInfo function releases a next-hop structure.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<RTM_NEXTHOP_INFO>} NextHopInfo Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_nexthop_info">RTM_NEXTHOP_INFO</a> structure to release. The next hop was obtained with a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetnexthopinfo">RtmGetNextHopInfo</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmreleasenexthopinfo
     * @since windowsserver2000
     */
    static RtmReleaseNextHopInfo(RtmRegHandle, NextHopInfo) {
        result := DllCall("rtm.dll\RtmReleaseNextHopInfo", "ptr", RtmRegHandle, "ptr", NextHopInfo, "uint")
        return result
    }

    /**
     * The RtmAddRouteToDest function adds a new route to the routing table or updates an existing route in the routing table. If the best route changes, a change notification is generated.
     * @remarks
     * Two routes are considered equal if the following values are equal:
     * 
     * <ul>
     * <li>The destination network</li>
     * <li>The owner of the route</li>
     * <li>The neighbor that supplied the route</li>
     * </ul>
     * When a client is updating a route, it is more efficient to pass a handle to the route to update in the <i>RouteHandle</i> parameter, because the routing table manager does not have to perform a search for the route in the routing table.
     * 
     * If a handle was returned, release the handle when it is no longer required by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleaseroutes">RtmReleaseRoutes</a>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/add-and-update-routes-using-rtmaddroutetodest">Add and Update Routes Using RtmAddRouteToDest</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<Pointer>} RouteHandle If the client has a handle (updating a route): On input, <i>RouteHandle</i> is a pointer to the route handle. On output, <i>RouteHandle</i> is unchanged. 
     * 
     * 
     * 
     * 
     * If the client does not have a handle and a handle must be returned (client is adding or updating a route): On input, <i>RouteHandle</i> is a pointer to <b>NULL</b>. On output, <i>RouteHandle</i> receives a pointer to the route handle. The values in <i>RouteInfo</i> are used to identify the route to update.
     * 
     * If a handle does not need to be returned (client is adding or updating a route): On input, <i>RouteHandle</i> is <b>NULL</b>. The values in <i>RouteInfo</i> are used to identify the route to update.
     * @param {Pointer<RTM_NET_ADDRESS>} DestAddress Pointer to the destination network address to which the route is being added or updated.
     * @param {Pointer<RTM_ROUTE_INFO>} RouteInfo Pointer to the route information to add or update.
     * @param {Integer} TimeToLive Specifies the time, in milliseconds, after which the route is expired. Specify INFINITE to prevent routes from expiring.
     * @param {Pointer} RouteListHandle Handle to a route list to which to move the route. This parameter is optional and can be set to <b>NULL</b>.
     * @param {Integer} NotifyType Set this parameter to <b>NULL</b>. This parameter is reserved for future use.
     * @param {Pointer} NotifyHandle Set this parameter to <b>NULL</b>. This parameter is reserved for future use.
     * @param {Pointer<Integer>} ChangeFlags On input, <i>ChangeFlags</i> is a pointer to an <b>RTM_ROUTE_CHANGE_FLAGS</b> data type that  indicates whether the routing table manager should add a new route or update an existing one. 
     * 
     * 
     * 
     * 
     * On output, <i>ChangeFlags</i> is a pointer to an <b>RTM_ROUTE_CHANGE_FLAGS</b> data type that receives the flag indicating the type of change that was actually performed, and if the best route was changed. The following flags are used.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_CHANGE_FIRST"></a><a id="rtm_route_change_first"></a><dl>
     * <dt><b>RTM_ROUTE_CHANGE_FIRST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the routing table manager should not check the <b>Neighbour</b> member of the <i>RouteInfo</i> parameter when determining if two routes are equal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_CHANGE_NEW"></a><a id="rtm_route_change_new"></a><dl>
     * <dt><b>RTM_ROUTE_CHANGE_NEW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned by the routing table manager to indicate a new route was created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_CHANGE_BEST"></a><a id="rtm_route_change_best"></a><dl>
     * <dt><b>RTM_ROUTE_CHANGE_BEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned by the routing table manager to indicate that the route that was added or updated was the best route, or that because of the change, a new route became the best route.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling client does not own this route.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contains incorrect information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmaddroutetodest
     * @since windowsserver2000
     */
    static RtmAddRouteToDest(RtmRegHandle, RouteHandle, DestAddress, RouteInfo, TimeToLive, RouteListHandle, NotifyType, NotifyHandle, ChangeFlags) {
        RouteHandleMarshal := RouteHandle is VarRef ? "ptr*" : "ptr"
        ChangeFlagsMarshal := ChangeFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\RtmAddRouteToDest", "ptr", RtmRegHandle, RouteHandleMarshal, RouteHandle, "ptr", DestAddress, "ptr", RouteInfo, "uint", TimeToLive, "ptr", RouteListHandle, "uint", NotifyType, "ptr", NotifyHandle, ChangeFlagsMarshal, ChangeFlags, "uint")
        return result
    }

    /**
     * The RtmDeleteRouteToDest function deletes a route from the routing table and updates the best-route information for the corresponding destination, if the best route changed. If the best route changes, a change notification is generated.
     * @remarks
     * The <i>RouteHandle</i> should not subsequently be released by a client if the client has already called 
     * <b>RtmDeleteRouteToDest</b> using that handle. The 
     * <b>RtmDeleteRouteToDest</b> function deletes the route and releases the handle.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} RouteHandle Handle to the route to delete.
     * @param {Pointer<Integer>} ChangeFlags On input, <i>ChangeFlags</i> is a pointer to <b>RTM_ROUTE_CHANGE_FLAGS</b> data type. 
     * 
     * 
     * 
     * 
     * On output, <i>ChangeFlags</i> receives RTM_ROUTE_CHANGE_BEST flag if the best route was changed.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling client does not own this route.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified route was not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmdeleteroutetodest
     * @since windowsserver2000
     */
    static RtmDeleteRouteToDest(RtmRegHandle, RouteHandle, ChangeFlags) {
        ChangeFlagsMarshal := ChangeFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\RtmDeleteRouteToDest", "ptr", RtmRegHandle, "ptr", RouteHandle, ChangeFlagsMarshal, ChangeFlags, "uint")
        return result
    }

    /**
     * The RtmHoldDestination function marks a destination to be put in the hold-down state for a certain amount of time. A hold down only happens if the last route for the destination in any view is deleted.
     * @remarks
     * All routes in a hold-down state are held for all views for a single, maximum hold-down time, regardless of the <i>HoldTime</i> specified.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/use-the-route-hold-down-state">Use the Route Hold-Down State</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} DestHandle Handle to the destination to mark for holding.
     * @param {Integer} TargetViews Specifies the views in which to hold the destination.
     * @param {Integer} HoldTime Specifies how long, in milliseconds, to hold the destination.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The hold time specified was zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmholddestination
     * @since windowsserver2000
     */
    static RtmHoldDestination(RtmRegHandle, DestHandle, TargetViews, HoldTime) {
        result := DllCall("rtm.dll\RtmHoldDestination", "ptr", RtmRegHandle, "ptr", DestHandle, "uint", TargetViews, "uint", HoldTime, "uint")
        return result
    }

    /**
     * The RtmGetRoutePointer function obtains a direct pointer to a route that allows the owner of the route read access.
     * @remarks
     * The pointer that was returned points to the public part of the route.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} RouteHandle Handle to the route.
     * @param {Pointer<Pointer<RTM_ROUTE_INFO>>} RoutePointer On input, <i>RoutePointer</i> is a pointer to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * On output, <i>RoutePointer</i> receives a pointer to the route.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling client does not own this route.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetroutepointer
     * @since windowsserver2000
     */
    static RtmGetRoutePointer(RtmRegHandle, RouteHandle, RoutePointer) {
        RoutePointerMarshal := RoutePointer is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmGetRoutePointer", "ptr", RtmRegHandle, "ptr", RouteHandle, RoutePointerMarshal, RoutePointer, "uint")
        return result
    }

    /**
     * The RtmLockRoute function locks or unlocks a route in the routing table. This protects the route while a client makes the necessary changes to the opaque route pointers owned by the client.
     * @remarks
     * Do not call any other RTMv2 functions until the route is unlocked by a call to 
     * <b>RtmLockRoute</b> and the <i>LockRoute</i> parameter is set to <b>FALSE</b>, or a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmupdateandunlockroute">RtmUpdateAndUnlockRoute</a>.
     * 
     * Currently, this function locks the entire destination, not just the route.
     * 
     * Clients can only change the <b>Neighbour</b>, <b>PrefInfo</b>, <b>BelongsToViews</b>, <b>EntitySpecificInfo</b>, and <b>NextHopsList</b> members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_route_info">RTM_ROUTE_INFO</a> structure.
     * 
     * If any of these values are changed, the client must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmupdateandunlockroute">RtmUpdateAndUnlockRoute</a> to notify the routing table manager of the changes.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} RouteHandle Handle to the route to lock.
     * @param {BOOL} Exclusive Specifies whether to lock or unlock the route in an exclusive (<b>TRUE</b>) or shared (<b>FALSE</b>) mode.
     * @param {BOOL} LockRoute Specifies whether to lock or unlock the route. Specify <b>TRUE</b> to lock the route; specify <b>FALSE</b> to unlock it.
     * @param {Pointer<Pointer<RTM_ROUTE_INFO>>} RoutePointer If a pointer must be returned: On input, <i>RoutePointer</i> is a pointer to <b>NULL</b>. On output, if the client owns the route, <i>RoutePointer</i> receives a pointer to the next-hop; otherwise, <i>RoutePointer</i> remains unchanged. 
     * 
     * 
     * 
     * 
     * If a handle does not need to be returned: On input, <i>RoutePointer</i> is <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling client does not own this route.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmlockroute
     * @since windowsserver2000
     */
    static RtmLockRoute(RtmRegHandle, RouteHandle, Exclusive, LockRoute, RoutePointer) {
        RoutePointerMarshal := RoutePointer is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmLockRoute", "ptr", RtmRegHandle, "ptr", RouteHandle, "int", Exclusive, "int", LockRoute, RoutePointerMarshal, RoutePointer, "uint")
        return result
    }

    /**
     * The RtmUpdateAndUnlockRoute function updates the position of the route in the set of routes for a destination, and adjusts the best route information for the destination.
     * @remarks
     * Before calling this function, the client should lock the route using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmlockroute">RtmLockRoute</a>, which returns a pointer to the route. Then, the client can update the route information using the pointer. Finally, the client should call 
     * <b>RtmUpdateAndUnlockRoute</b>. If the function executes successfully, the route is unlocked. If the call failed, the client must unlock the route by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmlockroute">RtmLockRoute</a> with the <i>LockRoute</i> parameter set to <b>FALSE</b>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/update-a-route-in-place-using-rtmupdateandunlockroute">Update a Route In Place Using RtmUpdateAndUnlockRoute</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} RouteHandle Handle to the route to change.
     * @param {Integer} TimeToLive Specifies the time, in milliseconds, after which the route is expired. Specify INFINITE to prevent routes from expiring.
     * @param {Pointer} RouteListHandle Handle to an optional route list to which to move the route. This parameter is optional and can be set to <b>NULL</b>.
     * @param {Integer} NotifyType Set this parameter to <b>NULL</b>. <i>NotifyType</i> is reserved for future use.
     * @param {Pointer} NotifyHandle Set this parameter to <b>NULL</b>. <i>NotifyHandle</i> is reserved for future use.
     * @param {Pointer<Integer>} ChangeFlags Receives RTM_ROUTE_CHANGE_BEST if the best route was changed.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling client does not own this route.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmupdateandunlockroute
     * @since windowsserver2000
     */
    static RtmUpdateAndUnlockRoute(RtmRegHandle, RouteHandle, TimeToLive, RouteListHandle, NotifyType, NotifyHandle, ChangeFlags) {
        ChangeFlagsMarshal := ChangeFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\RtmUpdateAndUnlockRoute", "ptr", RtmRegHandle, "ptr", RouteHandle, "uint", TimeToLive, "ptr", RouteListHandle, "uint", NotifyType, "ptr", NotifyHandle, ChangeFlagsMarshal, ChangeFlags, "uint")
        return result
    }

    /**
     * The RtmGetExactMatchDestination function searches the routing table for a destination that exactly matches the specified network address and subnet mask. If an exact match is found, the information for that destination is returned.
     * @remarks
     * The <i>DestInfo</i> structure is a variable-sized structure. If the client specifies more than one view with <i>TargetViews</i>, the size of <i>DestInfo</i> increases for each view. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtm_size_of_dest_info">RTM_SIZE_OF_DEST_INFO</a> macro to determine how large a <i>DestInfo</i> structure to allocate before calling this function. Use the value specified for <i>TargetViews</i> as a parameter to 
     * <b>RTM_SIZE_OF_DEST_INFO</b>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<RTM_NET_ADDRESS>} DestAddress Pointer to the destination network address.
     * @param {Integer} ProtocolId Specifies the protocol identifier. The <i>ProtocolID</i> is not part of the search criteria. The routing table manager uses this identifier to determine which destination and route information to return. For example, if a client specifies the RIP protocol identifier, the best RIP route is returned, even if a non-RIP route is the best route to the destination. 
     * 
     * 
     * 
     * 
     * Specify RTM_BEST_PROTOCOL to return a route regardless of which protocol owns it. Specify RTM_THIS_PROTOCOL to return the best route for the calling protocol.
     * @param {Integer} TargetViews Specifies the views from which to return information. If the client specifies RTM_VIEW_MASK_ANY, destination information is returned from all views; however, no view-specific information is returned.
     * @param {Pointer<RTM_DEST_INFO>} DestInfo On input, <i>DestInfo</i> is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structure. 
     * 
     * 
     * 
     * 
     * On output, <i>DestInfo</i> is filled with the requested destination information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified destination was not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetexactmatchdestination
     * @since windowsserver2000
     */
    static RtmGetExactMatchDestination(RtmRegHandle, DestAddress, ProtocolId, TargetViews, DestInfo) {
        result := DllCall("rtm.dll\RtmGetExactMatchDestination", "ptr", RtmRegHandle, "ptr", DestAddress, "uint", ProtocolId, "uint", TargetViews, "ptr", DestInfo, "uint")
        return result
    }

    /**
     * The RtmGetMostSpecificDestination function searches the routing table for a destination with the exact match for a specified network address and subnet mask; if the exact match is not found, the best prefix is matched.
     * @remarks
     * The <i>DestInfo</i> structure is a variable-sized structure. If the client specifies more than one view with <i>TargetViews</i>, the size of <i>DestInfo</i> increases for each view. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtm_size_of_dest_info">RTM_SIZE_OF_DEST_INFO</a> macro to determine how much memory to allocate for the <i>DestInfo</i> structure before calling this function. Use the value specified for <i>TargetViews</i> as a parameter to 
     * <b>RTM_SIZE_OF_DEST_INFO</b>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/search-for-routes-using-rtmgetmostspecificdestination-and-rtmgetlessspecificdestination">Search for Routes Using a Prefix Tree</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<RTM_NET_ADDRESS>} DestAddress Pointer to the destination network address.
     * @param {Integer} ProtocolId Specifies the protocol identifier. The <i>ProtocolID</i> is not part of the search criteria. The routing table manager uses this identifier to determine which route information to return. For example, if a client specifies the RIP protocol identifier, the best RIP route is returned, even if a non-RIP route is the best route to the destination. 
     * 
     * 
     * 
     * 
     * Specify RTM_BEST_PROTOCOL to return a route regardless of which protocol owns it. Specify RTM_THIS_PROTOCOL to return the best route for the calling protocol.
     * @param {Integer} TargetViews Specifies the views from which to return information. If the client specifies RTM_VIEW_MASK_ANY, destination information is returned from all views; however, no view-specific information is returned.
     * @param {Pointer<RTM_DEST_INFO>} DestInfo On input, <i>DestInfo</i> is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structure. 
     * 
     * 
     * 
     * 
     * On output, <i>DestInfo</i> is filled with the requested destination information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified destination was not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetmostspecificdestination
     * @since windowsserver2000
     */
    static RtmGetMostSpecificDestination(RtmRegHandle, DestAddress, ProtocolId, TargetViews, DestInfo) {
        result := DllCall("rtm.dll\RtmGetMostSpecificDestination", "ptr", RtmRegHandle, "ptr", DestAddress, "uint", ProtocolId, "uint", TargetViews, "ptr", DestInfo, "uint")
        return result
    }

    /**
     * The RtmGetLessSpecificDestination function searches the routing table for a destination with the next-best-match (longest) prefix, given a destination prefix. The requested destination information is returned.
     * @remarks
     * The <i>DestInfo</i> parameter is a variable-sized 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structure. If the client specifies more than one view using <i>TargetViews</i>, the size of <i>DestInfo</i> increases for each view. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtm_size_of_dest_info">RTM_SIZE_OF_DEST_INFO</a> macro to determine how much memory to allocate for the <i>DestInfo</i> structure before calling this function. Use the value specified for <i>TargetViews</i> as a parameter to 
     * <b>RTM_SIZE_OF_DEST_INFO</b>.
     * 
     * The 
     * <b>RtmGetLessSpecificDestination</b> function is used after a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetmostspecificdestination">RtmGetMostSpecificDestination</a> to return the next-best match for a destination. This call is also used after a prior call to 
     * <b>RtmGetLessSpecificDestination</b> to return the next successive less-specific match. Clients can use this function to "walk up" the prefix tree for a destination.
     * 
     * This call is also used after calls to functions that return an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structure, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetdestinfo">RtmGetDestInfo</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetchangeddests">RtmGetChangedDests</a>.
     * 
     * The 
     * <b>RtmGetLessSpecificDestination</b> function returns matches until it reaches the default route, if it exists. Once the default route is found, 
     * <b>RtmGetLessSpecificDestination</b> returns ERROR_NOT_FOUND.
     * 
     * One common use for the 
     * <b>RtmGetLessSpecificDestination</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetmostspecificdestination">RtmGetMostSpecificDestination</a> functions, is to retrieve each of the matching destinations.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/search-for-routes-using-rtmgetmostspecificdestination-and-rtmgetlessspecificdestination">Search for Routes Using a Prefix Tree</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} DestHandle Handle to the destination.
     * @param {Integer} ProtocolId Specifies the protocol identifier. The <i>ProtocolID</i> is not part of the search criteria. The routing table manager uses this identifier to determine which route information to return. For example, if a client specifies the RIP protocol identifier, the best RIP route is returned, even if a non-RIP route is the best route to the destination. 
     * 
     * 
     * 
     * 
     * Specify RTM_BEST_PROTOCOL to return a route regardless of which protocol owns it. Specify RTM_THIS_PROTOCOL to return the best route for the calling protocol.
     * @param {Integer} TargetViews Specifies the views from which to return information. If the client specifies RTM_VIEW_MASK_ANY, destination information is returned from all views; however, no view-specific information is returned.
     * @param {Pointer<RTM_DEST_INFO>} DestInfo On input, <i>DestInfo</i> is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structure. 
     * 
     * 
     * 
     * 
     * On output, <i>DestInfo</i> is filled with the requested destination information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contains incorrect information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The next best destination cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetlessspecificdestination
     * @since windowsserver2000
     */
    static RtmGetLessSpecificDestination(RtmRegHandle, DestHandle, ProtocolId, TargetViews, DestInfo) {
        result := DllCall("rtm.dll\RtmGetLessSpecificDestination", "ptr", RtmRegHandle, "ptr", DestHandle, "uint", ProtocolId, "uint", TargetViews, "ptr", DestInfo, "uint")
        return result
    }

    /**
     * The RtmGetExactMatchRoute function searches the routing table for a route that exactly matches the specified route.
     * @remarks
     * Consider using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetexactmatchdestination">RtmGetExactMatchDestination</a> if you have no route-matching criteria specified in the <i>MatchingFlags</i> parameter.
     * 
     * The following members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_route_info">RTM_ROUTE_INFO</a> structure that is passed in the <i>RouteInfo</i> parameter are used to match a route:
     * 
     * <ul>
     * <li><b>Neighbour</b></li>
     * <li><b>NextHopsList</b></li>
     * <li><b>PrefInfo</b></li>
     * <li><b>RouteOwner</b></li>
     * </ul>
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<RTM_NET_ADDRESS>} DestAddress Pointer to the destination network address.
     * @param {Integer} MatchingFlags Specifies the criteria to use when searching for the route. The following flags are used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_FULL"></a><a id="rtm_match_full"></a><dl>
     * <dt><b>RTM_MATCH_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes with all criteria.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_INTERFACE"></a><a id="rtm_match_interface"></a><dl>
     * <dt><b>RTM_MATCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes that are on the same interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_NEIGHBOUR"></a><a id="rtm_match_neighbour"></a><dl>
     * <dt><b>RTM_MATCH_NEIGHBOUR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes with the same neighbor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_NEXTHOP"></a><a id="rtm_match_nexthop"></a><dl>
     * <dt><b>RTM_MATCH_NEXTHOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes that have the same next hop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_NONE"></a><a id="rtm_match_none"></a><dl>
     * <dt><b>RTM_MATCH_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match none of the criteria; all routes for the destination are returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_OWNER"></a><a id="rtm_match_owner"></a><dl>
     * <dt><b>RTM_MATCH_OWNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes with the same owner.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_PREF"></a><a id="rtm_match_pref"></a><dl>
     * <dt><b>RTM_MATCH_PREF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes that have the same preference.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<RTM_ROUTE_INFO>} RouteInfo On input, <i>RouteInfo</i> is a pointer an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_route_info">RTM_ROUTE_INFO</a> structure that contains the criteria that specifies the route to find. 
     * 
     * 
     * 
     * 
     * On output, <i>RouteInfo</i> receives the route information for the route that matched the criteria.
     * @param {Integer} InterfaceIndex If RTM_MATCH_INTERFACE is specified in <i>MatchingFlags</i>, <i>InterfaceIndex</i> specifies the interface on which the route must be present (that is, the route has a next hop on that interface).
     * @param {Integer} TargetViews Specifies the views from which to return information. If the client specifies RTM_VIEW_MASK_ANY, destination information is returned from all views; however, no view-specific information is returned.
     * @param {Pointer<Pointer>} RouteHandle If a handle must be returned: On input, <i>RouteHandle</i> is a pointer to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * On output, <i>RouteHandle</i> receives a pointer to the route handle; otherwise, <i>RouteHandle</i> remains unchanged.
     * 
     * If a handle does not need to be returned: On input, <i>RouteHandle</i> is <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified route was not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetexactmatchroute
     * @since windowsserver2000
     */
    static RtmGetExactMatchRoute(RtmRegHandle, DestAddress, MatchingFlags, RouteInfo, InterfaceIndex, TargetViews, RouteHandle) {
        RouteHandleMarshal := RouteHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmGetExactMatchRoute", "ptr", RtmRegHandle, "ptr", DestAddress, "uint", MatchingFlags, "ptr", RouteInfo, "uint", InterfaceIndex, "uint", TargetViews, RouteHandleMarshal, RouteHandle, "uint")
        return result
    }

    /**
     * The RtmIsBestRoute function returns the set of views in which the specified route is the best route to a destination.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} RouteHandle Handle to the route to check.
     * @param {Pointer<Integer>} BestInViews Receives a pointer to the set of views for which the specified route is the best route.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmisbestroute
     * @since windowsserver2000
     */
    static RtmIsBestRoute(RtmRegHandle, RouteHandle, BestInViews) {
        BestInViewsMarshal := BestInViews is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\RtmIsBestRoute", "ptr", RtmRegHandle, "ptr", RouteHandle, BestInViewsMarshal, BestInViews, "uint")
        return result
    }

    /**
     * The RtmAddNextHop function adds a new next-hop entry or updates an existing next-hop entry to a client's next-hop list.
     * @remarks
     * If <i>NextHopHandle</i> points to a non-<b>NULL</b> handle, the next hop specified by the handle is updated. Otherwise, a search is made for the address specified by <i>NextHopInfo</i>. If a next hop is found, it is updated. If no match is found, a new next hop is added.
     * 
     * If a handle was returned, release the handle when it is no longer required by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleasenexthops">RtmReleaseNextHops</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<RTM_NEXTHOP_INFO>} NextHopInfo 
     * @param {Pointer<Pointer>} NextHopHandle If the client has a handle (client is updating a next hop): On input, <i>NextHopHandle</i> is a pointer to the next-hop handle. On output, <i>NextHopHandle</i> is unchanged. 
     * 
     * 
     * 
     * 
     * If the client does not have a handle and a handle must be returned (client is adding or updating a next hop): On input, <i>NextHopHandle</i> is a pointer to <b>NULL</b>. On output, <i>NextHopHandle</i> receives a pointer to the next-hop handle. The values in <i>NextHopInfo</i> are used to identify the next hop to update.
     * 
     * If a handle does not need to be returned (client is adding or updating a next hop): On input, <i>NextHopHandle</i> is <b>NULL</b>. The values in <i>NextHopInfo</i> are used to identify the next hop to update.
     * @param {Pointer<Integer>} ChangeFlags On input, <i>ChangeFlags</i> is a pointer to an <b>RTM_NEXTHOP_CHANGE_FLAGS</b> data type. 
     * 
     * 
     * 
     * 
     * On output, <i>ChangeFlags</i> receives a flag indicating whether a next hop was added or updated. If <i>ChangeFlags</i> is zero, a next hop was updated; if <i>ChangeFlags</i> is <b>RTM_NEXTHOP_CHANGE_NEW</b>, a next hop was added.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling client does not own this next hop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmaddnexthop
     * @since windowsserver2000
     */
    static RtmAddNextHop(RtmRegHandle, NextHopInfo, NextHopHandle, ChangeFlags) {
        NextHopHandleMarshal := NextHopHandle is VarRef ? "ptr*" : "ptr"
        ChangeFlagsMarshal := ChangeFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\RtmAddNextHop", "ptr", RtmRegHandle, "ptr", NextHopInfo, NextHopHandleMarshal, NextHopHandle, ChangeFlagsMarshal, ChangeFlags, "uint")
        return result
    }

    /**
     * The RtmFindNextHop function finds a specific next hop in a client's next-hop list.
     * @remarks
     * The <i>NextHopPointer</i> is valid as long as the client has not released <i>NextHopHandle</i>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<RTM_NEXTHOP_INFO>} NextHopInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_nexthop_info">RTM_NEXTHOP_INFO</a> structure that contains information identifying the next hop to find. Use the <b>NextHopAddress</b> and <b>InterfaceIndex</b> members to identify the next hop to find.
     * @param {Pointer<Pointer>} NextHopHandle If a handle must be returned: On input, <i>NextHopPointer</i> is a pointer to <b>NULL</b>. On output, if the client owns the next hop, <i>NextHopPointer</i> receives a pointer to the next-hop handle; otherwise, <i>NextHopPointer</i> remains unchanged. 
     * 
     * 
     * 
     * 
     * If a handle does not need to be returned: On input, <i>NextHopPointer</i> is <b>NULL</b>.
     * @param {Pointer<Pointer<RTM_NEXTHOP_INFO>>} NextHopPointer If a pointer must be returned: On input, <i>NextHopPointer</i> is a pointer to <b>NULL</b>. On output, if the client owns the next hop, <i>NextHopPointer</i> receives a pointer to the next-hop; otherwise, <i>NextHopPointer</i> remains unchanged. 
     * 
     * 
     * 
     * 
     * If a pointer does not need to be returned: On input, <i>NextHopPointer</i> is <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling client does not own this next hop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified next hop was not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmfindnexthop
     * @since windowsserver2000
     */
    static RtmFindNextHop(RtmRegHandle, NextHopInfo, NextHopHandle, NextHopPointer) {
        NextHopHandleMarshal := NextHopHandle is VarRef ? "ptr*" : "ptr"
        NextHopPointerMarshal := NextHopPointer is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmFindNextHop", "ptr", RtmRegHandle, "ptr", NextHopInfo, NextHopHandleMarshal, NextHopHandle, NextHopPointerMarshal, NextHopPointer, "uint")
        return result
    }

    /**
     * The RtmDeleteNextHop function deletes a next hop from the next-hop list.
     * @remarks
     * If a client specifies a <i>NextHopHandle</i>, the client should not subsequently release the handle using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleasenexthops">RtmReleaseNextHops</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} NextHopHandle Handle to the next hop to delete. This parameter is optional and can be set to <b>NULL</b>; if it is <b>NULL</b>, the values in <i>NextHopInfo</i> are used to identify the next hop to delete.
     * @param {Pointer<RTM_NEXTHOP_INFO>} NextHopInfo Pointer to a structure that contains information identifying the next hop to delete. This parameter is optional and can be set to <b>NULL</b>; if it is <b>NULL</b>, the handle in <i>NextHopHandle</i> is used to identify the next hop to delete.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling client does not own this next hop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified next hop was not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmdeletenexthop
     * @since windowsserver2000
     */
    static RtmDeleteNextHop(RtmRegHandle, NextHopHandle, NextHopInfo) {
        result := DllCall("rtm.dll\RtmDeleteNextHop", "ptr", RtmRegHandle, "ptr", NextHopHandle, "ptr", NextHopInfo, "uint")
        return result
    }

    /**
     * The RtmGetNextHopPointer function obtains a direct pointer to the specified next hop. The pointer allows the next-hop owner direct read access to the routing table manager's RTM_NEXTHOP_INFO structure.
     * @remarks
     * Clients should only use this pointer for read-only access.
     * 
     * When the next hop handle is no longer required, release it by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleasenexthopinfo">RtmReleaseNextHopInfo</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} NextHopHandle Handle to the next hop.
     * @param {Pointer<Pointer<RTM_NEXTHOP_INFO>>} NextHopPointer If the client is the owner of the next hop, <i>NextHopPointer</i> receives a pointer to the next hop.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling client does not own this next hop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetnexthoppointer
     * @since windowsserver2000
     */
    static RtmGetNextHopPointer(RtmRegHandle, NextHopHandle, NextHopPointer) {
        NextHopPointerMarshal := NextHopPointer is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmGetNextHopPointer", "ptr", RtmRegHandle, "ptr", NextHopHandle, NextHopPointerMarshal, NextHopPointer, "uint")
        return result
    }

    /**
     * The RtmLockNextHop function locks or unlocks a next hop. This function should be called by the next hop's owner to lock the next hop before making changes to the next hop. A pointer to the next hop is returned.
     * @remarks
     * Clients cannot change the <b>NextHopAddress</b> and <b>InterfaceIndex</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_nexthop_info">RTM_NEXTHOP_INFO</a> structure; these values are used to uniquely identify a next hop.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} NextHopHandle Handle to the next hop to lock or unlock.
     * @param {BOOL} Exclusive Specifies whether to lock or unlock the next hop in an exclusive (<b>TRUE</b>) or shared (<b>FALSE</b>) mode.
     * @param {BOOL} LockNextHop Specifies whether to lock or unlock the next hop. Specify <b>TRUE</b> to lock the next hop; specify <b>FALSE</b> to unlock it.
     * @param {Pointer<Pointer<RTM_NEXTHOP_INFO>>} NextHopPointer On input, <i>NextHopPointer</i> is a pointer to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * On output, if the client owns the next hop, <i>NextHopPointer</i> receives a pointer to the next-hop; otherwise, <i>NextHopPointer</i> remains unchanged.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling client does not own this next hop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified next hop was not found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmlocknexthop
     * @since windowsserver2000
     */
    static RtmLockNextHop(RtmRegHandle, NextHopHandle, Exclusive, LockNextHop, NextHopPointer) {
        NextHopPointerMarshal := NextHopPointer is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmLockNextHop", "ptr", RtmRegHandle, "ptr", NextHopHandle, "int", Exclusive, "int", LockNextHop, NextHopPointerMarshal, NextHopPointer, "uint")
        return result
    }

    /**
     * The RtmCreateDestEnum function starts an enumeration of the destinations in the routing table. A client can enumerate destinations for one or more views, or for all views.
     * @remarks
     * If <i>EnumFlags</i> contains RTM_ENUM_RANGE, use <i>NetAddress</i> to specify the range of the routing table to enumerate. For example, if a client sets <i>NetAddress</i> to 10/8, destinations in the range 10.0.0.0/8 to 10.255.255.255/32 are returned.
     * 
     * When the enumeration handle is no longer required, release it by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmdeleteenumhandle">RtmDeleteEnumHandle</a>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/enumerate-all-destinations">Enumerate All Destinations</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Integer} TargetViews Specifies the set of views to use when creating the enumeration. The following flags are used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_VIEW_MASK_ANY"></a><a id="rtm_view_mask_any"></a><dl>
     * <dt><b>RTM_VIEW_MASK_ANY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return destinations from all views. This is the default value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_VIEW_MASK_UCAST"></a><a id="rtm_view_mask_ucast"></a><dl>
     * <dt><b>RTM_VIEW_MASK_UCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return destinations from the unicast view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_VIEW_MASK_MCAST"></a><a id="rtm_view_mask_mcast"></a><dl>
     * <dt><b>RTM_VIEW_MASK_MCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return destinations from the multicast view.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} EnumFlags Specifies which destinations to include in the enumeration. Two sets of flags are used; use one flag from each set (for example, use RTM_ENUM_ALL_DESTS and RTM_ENUM_START). 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_ALL_DESTS"></a><a id="rtm_enum_all_dests"></a><dl>
     * <dt><b>RTM_ENUM_ALL_DESTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return all destinations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_OWN_DESTS"></a><a id="rtm_enum_own_dests"></a><dl>
     * <dt><b>RTM_ENUM_OWN_DESTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return destinations for which the client owns the best route to a destination in any of the specified views.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_NEXT"></a><a id="rtm_enum_next"></a><dl>
     * <dt><b>RTM_ENUM_NEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate destinations starting at the specified address/mask length (such as 10/8). The enumeration continues to the end of the routing table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_RANGE"></a><a id="rtm_enum_range"></a><dl>
     * <dt><b>RTM_ENUM_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate destinations in the range specified by the address/mask length (such as 10/8).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_START"></a><a id="rtm_enum_start"></a><dl>
     * <dt><b>RTM_ENUM_START</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate destinations starting at 0/0. Specify <b>NULL</b> for <i>NetAddress</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<RTM_NET_ADDRESS>} NetAddress Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_net_address">RTM_NET_ADDRESS</a> structure that contains the starting address of the enumeration. Specify <b>NULL</b> if <i>EnumFlags</i> contains RTM_ENUM_START.
     * @param {Integer} ProtocolId Specifies the protocol identifier used to determine the best route information returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetenumdests">RtmGetEnumDests</a> function. The <i>ProtocolID</i> is not part of the search criteria. The routing table manager uses this identifier to determine which route information to return (for example, if a client specifies the RIP protocol identifier, the best RIP route is returned, even if a non-RIP route is the best route to the destination). 
     * 
     * 
     * 
     * 
     * Specify RTM_BEST_PROTOCOL to return a route regardless of which protocol owns it. Specify RTM_THIS_PROTOCOL to return the best route for the calling protocol.
     * @param {Pointer<Pointer>} RtmEnumHandle On input, <i>RtmEnumHandle</i> is a pointer to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * On output, <i>RtmEnumHandle</i> receives a pointer to a handle to the enumeration. Use this handle in all subsequent calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetenumdests">RtmGetEnumDests</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleasedests">RtmReleaseDests</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmdeleteenumhandle">RtmDeleteEnumHandle</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contains incorrect information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the specified views is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmcreatedestenum
     * @since windowsserver2000
     */
    static RtmCreateDestEnum(RtmRegHandle, TargetViews, EnumFlags, NetAddress, ProtocolId, RtmEnumHandle) {
        RtmEnumHandleMarshal := RtmEnumHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmCreateDestEnum", "ptr", RtmRegHandle, "uint", TargetViews, "uint", EnumFlags, "ptr", NetAddress, "uint", ProtocolId, RtmEnumHandleMarshal, RtmEnumHandle, "uint")
        return result
    }

    /**
     * The RtmGetEnumDests function retrieves the next set of destinations in the specified enumeration.
     * @remarks
     * The structure pointed to by <i>DestInfos</i>  is a variable-sized structure. If the client specifies more than one view with <i>TargetViews</i>, the size of <i>DestInfos</i> increases for each view. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtm_size_of_dest_info">RTM_SIZE_OF_DEST_INFO</a> macro to determine how large a <i>DestInfos</i> structure to allocate before calling this function. Use the value specified for <i>TargetViews</i> as a parameter to 
     * <b>RTM_SIZE_OF_DEST_INFO</b>.
     * 
     * When the destinations are no longer required, release them by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleasedests">RtmReleaseDests</a>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/enumerate-all-destinations">Enumerate All Destinations</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} EnumHandle Handle to the destination enumeration.
     * @param {Pointer<Integer>} NumDests On input, <i>NumDests</i> is a pointer to a <b>UINT</b> value specifying the maximum number of destinations that can be received by <i>DestInfos</i>. On output, <i>NumDests</i> receives the actual number of destinations received by <i>DestInfos</i>.
     * @param {Pointer<RTM_DEST_INFO>} DestInfos On input, <i>DestInfos</i> is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structure. 
     * 
     * 
     * 
     * 
     * On output, <i>DestInfos</i> receives an array of handles to destinations.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value pointed to by <i>NumRoutes</i> is larger than the maximum number of routes a client is allowed to retrieve with one call. Check 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_regn_profile">RTM_REGN_PROFILE</a> for the maximum number of destinations that the client is allowed to retrieve with one call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more destinations to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetenumdests
     * @since windowsserver2000
     */
    static RtmGetEnumDests(RtmRegHandle, EnumHandle, NumDests, DestInfos) {
        NumDestsMarshal := NumDests is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\RtmGetEnumDests", "ptr", RtmRegHandle, "ptr", EnumHandle, NumDestsMarshal, NumDests, "ptr", DestInfos, "uint")
        return result
    }

    /**
     * The RtmReleaseDests function releases the destination handles.
     * @remarks
     * Do not use this function to release 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structures obtained from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetchangeddests">RtmGetChangedDests</a>. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleasechangeddests">RtmReleaseChangedDests</a> instead.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structure is a variable-sized structure. If a destination contains information for more than one view, the size of 
     * <b>RTM_DEST_INFO</b> increases for each view. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtm_size_of_dest_info">RTM_SIZE_OF_DEST_INFO</a> macro to determine how large a <i>DestInfos</i> buffer to allocate before calling this function.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Integer} NumDests Specifies the number of destinations in <i>DestInfos</i>.
     * @param {Pointer<RTM_DEST_INFO>} DestInfos Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structures to release. The destinations were obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetenumdests">RtmGetEnumDests</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmreleasedests
     * @since windowsserver2000
     */
    static RtmReleaseDests(RtmRegHandle, NumDests, DestInfos) {
        result := DllCall("rtm.dll\RtmReleaseDests", "ptr", RtmRegHandle, "uint", NumDests, "ptr", DestInfos, "uint")
        return result
    }

    /**
     * The RtmCreateRouteEnum function creates an enumeration of the routes for a particular destination or range of destinations in the routing table. A client can enumerate routes for one or more views, or for all views.
     * @remarks
     * If <i>EnumFlags</i> contains RTM_ENUM_RANGE, use <i>NetAddress</i> to specify the range of the routing table to enumerate. For example, if a client sets <i>NetAddress</i> to 10/8, destinations in the range 10.0.0.0/8 to 10.255.255.255/32 are returned.
     * 
     * When the enumeration handle is no longer required, release it by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmdeleteenumhandle">RtmDeleteEnumHandle</a>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/enumerate-all-routes">Enumerate All Routes</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} DestHandle Handle to the destination for which to enumerate routes. This parameter is optional, and can be set to <b>NULL</b>; specifying <b>NULL</b> enumerates all routes for all destinations. Specify <b>NULL</b> if <i>EnumFlags</i> contains RTM_ENUM_START.
     * @param {Integer} TargetViews Specifies the set of views to use when creating the enumeration. The following flags are used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_VIEW_MASK_ANY"></a><a id="rtm_view_mask_any"></a><dl>
     * <dt><b>RTM_VIEW_MASK_ANY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return destinations from all views. This is the default value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_VIEW_MASK_UCAST"></a><a id="rtm_view_mask_ucast"></a><dl>
     * <dt><b>RTM_VIEW_MASK_UCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return destinations from the unicast view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_VIEW_MASK_MCAST"></a><a id="rtm_view_mask_mcast"></a><dl>
     * <dt><b>RTM_VIEW_MASK_MCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return destinations from the multicast view.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} EnumFlags Specifies which routes to include in the enumeration. Two sets of flags are used; use one flag from each set (such as RTM_ENUM_ALL_ROUTES and RTM_ENUM_START). 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_ALL_ROUTES"></a><a id="rtm_enum_all_routes"></a><dl>
     * <dt><b>RTM_ENUM_ALL_ROUTES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return all routes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_OWN_ROUTES"></a><a id="rtm_enum_own_routes"></a><dl>
     * <dt><b>RTM_ENUM_OWN_ROUTES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return only those routes that the client owns.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_NEXT"></a><a id="rtm_enum_next"></a><dl>
     * <dt><b>RTM_ENUM_NEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate routes starting at the specified address/mask length (such as 10/8). The enumeration continues to the end of the routing table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_RANGE"></a><a id="rtm_enum_range"></a><dl>
     * <dt><b>RTM_ENUM_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate routes in the specified range specified by the address/mask length (such as 10/8).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_START"></a><a id="rtm_enum_start"></a><dl>
     * <dt><b>RTM_ENUM_START</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate routes starting at 0/0. Specify <b>NULL</b> for <i>NetAddress</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<RTM_NET_ADDRESS>} StartDest Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_net_address">RTM_NET_ADDRESS</a> structure that contains the starting address of the enumeration. This parameter is ignored if <i>EnumFlags</i> contains RTM_ENUM_START.
     * @param {Integer} MatchingFlags Specifies the elements of the route to match. Only routes that match the criteria specified in <i>CriteriaRoute</i> and <i>CriteriaInterface</i> are returned, unless otherwise noted. The following flags are used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_FULL"></a><a id="rtm_match_full"></a><dl>
     * <dt><b>RTM_MATCH_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes with all criteria.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_INTERFACE"></a><a id="rtm_match_interface"></a><dl>
     * <dt><b>RTM_MATCH_INTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes that are on the same interface. The client can specify <b>NULL</b> for <i>CriteriaRoute</i>.
     * 							
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_NEIGHBOUR"></a><a id="rtm_match_neighbour"></a><dl>
     * <dt><b>RTM_MATCH_NEIGHBOUR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes with the same neighbor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_NEXTHOP"></a><a id="rtm_match_nexthop"></a><dl>
     * <dt><b>RTM_MATCH_NEXTHOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes that have the same next hop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_NONE"></a><a id="rtm_match_none"></a><dl>
     * <dt><b>RTM_MATCH_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match none of the criteria; all routes for the destination are returned. The <i>CriteriaRoute</i> parameter is ignored if this flag is set.
     * 							
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_OWNER"></a><a id="rtm_match_owner"></a><dl>
     * <dt><b>RTM_MATCH_OWNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes with same owner.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_MATCH_PREF"></a><a id="rtm_match_pref"></a><dl>
     * <dt><b>RTM_MATCH_PREF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Match routes that have the same preference.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<RTM_ROUTE_INFO>} CriteriaRoute Specifies which routes to enumerate. This parameter is optional and can be set to <b>NULL</b> if <i>MatchingFlags</i> contains RTM_MATCH_INTERFACE or RTM_MATCH_NONE.
     * @param {Integer} CriteriaInterface Pointer to a <b>ULONG</b> that specifies on which interfaces routes should be located. This parameter is ignored unless <i>MatchingFlags</i> contains RTM_MATCH_INTERFACE.
     * @param {Pointer<Pointer>} RtmEnumHandle On input, <i>RtmEnumHandle</i> is a pointer to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * On output, <i>RtmEnumHandle</i> receives a pointer to a handle to the enumeration. Use this handle in all subsequent calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetenumroutes">RtmGetEnumRoutes</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleaseroutes">RtmReleaseRoutes</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmdeleteenumhandle">RtmDeleteEnumHandle</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contains incorrect information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the specified views is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmcreaterouteenum
     * @since windowsserver2000
     */
    static RtmCreateRouteEnum(RtmRegHandle, DestHandle, TargetViews, EnumFlags, StartDest, MatchingFlags, CriteriaRoute, CriteriaInterface, RtmEnumHandle) {
        RtmEnumHandleMarshal := RtmEnumHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmCreateRouteEnum", "ptr", RtmRegHandle, "ptr", DestHandle, "uint", TargetViews, "uint", EnumFlags, "ptr", StartDest, "uint", MatchingFlags, "ptr", CriteriaRoute, "uint", CriteriaInterface, RtmEnumHandleMarshal, RtmEnumHandle, "uint")
        return result
    }

    /**
     * The RtmGetEnumRoutes function retrieves the next set of routes in the specified enumeration.
     * @remarks
     * When the routes are no longer required, release them by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleaseroutes">RtmReleaseRoutes</a>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/enumerate-all-routes">Enumerate All Routes</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} EnumHandle Handle to the route enumeration.
     * @param {Pointer<Integer>} NumRoutes On input, <i>NumRoutes</i> is a pointer to a <b>UINT</b> value that specifies the maximum number of routes that can be received by <i>RouteHandles</i>. 
     * 
     * 
     * 
     * 
     * On output, <i>NumRoutes</i> receives the actual number of routes received by <i>RouteHandles</i>.
     * @param {Pointer<Pointer>} RouteHandles On input, <i>RouteHandles</i> is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_route_info">RTM_ROUTE_INFO</a> structure. 
     * 
     * 
     * 
     * 
     * On output, <i>RouteHandles</i> receives an array of handles to routes.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value pointed to by <i>NumRoutes</i> is larger than the maximum number of routes a client is allowed to retrieve with one call. Check 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_regn_profile">RTM_REGN_PROFILE</a> for the maximum number of routes that the client is allowed to retrieve with one call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more routes to enumerate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetenumroutes
     * @since windowsserver2000
     */
    static RtmGetEnumRoutes(RtmRegHandle, EnumHandle, NumRoutes, RouteHandles) {
        NumRoutesMarshal := NumRoutes is VarRef ? "uint*" : "ptr"
        RouteHandlesMarshal := RouteHandles is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmGetEnumRoutes", "ptr", RtmRegHandle, "ptr", EnumHandle, NumRoutesMarshal, NumRoutes, RouteHandlesMarshal, RouteHandles, "uint")
        return result
    }

    /**
     * The RtmReleaseRoutes function releases the route handles.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Integer} NumRoutes Specifies the number of routes in <i>RouteHandles</i>.
     * @param {Pointer<Pointer>} RouteHandles Pointer to an array of route handles to release. The handles were obtained with a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetenumroutes">RtmGetEnumRoutes</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmreleaseroutes
     * @since windowsserver2000
     */
    static RtmReleaseRoutes(RtmRegHandle, NumRoutes, RouteHandles) {
        RouteHandlesMarshal := RouteHandles is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmReleaseRoutes", "ptr", RtmRegHandle, "uint", NumRoutes, RouteHandlesMarshal, RouteHandles, "uint")
        return result
    }

    /**
     * The RtmCreateNextHopEnum enumerates the next hops in the next-hop list.
     * @remarks
     * If <i>EnumFlags</i> contains RTM_ENUM_RANGE, use <i>NetAddress</i> to specify the range of the routing table to enumerate. For example, if a client sets <i>NetAddress</i> to 10/8, next hops in the range 10.0.0.0/8 to 10.255.255.255/32 are returned.
     * 
     * When the enumeration handle is no longer required, release it by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmdeleteenumhandle">RtmDeleteEnumHandle</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Integer} EnumFlags Specifies which next hops to include in the enumeration. The following flags are used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_NEXT"></a><a id="rtm_enum_next"></a><dl>
     * <dt><b>RTM_ENUM_NEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate next hops starting at the specified address/mask length (such as 10/8). The enumeration continues to the end of the next hop list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_RANGE"></a><a id="rtm_enum_range"></a><dl>
     * <dt><b>RTM_ENUM_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate next hops in the specified range specified by the address/mask length (such as 10/8).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ENUM_START"></a><a id="rtm_enum_start"></a><dl>
     * <dt><b>RTM_ENUM_START</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate next hops starting at 0/0. Specify <b>NULL</b> for <i>NetAddress</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<RTM_NET_ADDRESS>} NetAddress Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_net_address">RTM_NET_ADDRESS</a> structure that contains the starting address of the enumeration. Specify <b>NULL</b> if <i>EnumFlags</i> contains RTM_ENUM_START.
     * @param {Pointer<Pointer>} RtmEnumHandle On input, <i>RtmEnumHandle</i> is a pointer to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * On output, <i>RtmEnumHandle</i> receives a pointer to a handle to the enumeration. Use this handle in all subsequent calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetenumnexthops">RtmGetEnumNextHops</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleasenexthops">RtmReleaseNextHops</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmdeleteenumhandle">RtmDeleteEnumHandle</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contains incorrect information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmcreatenexthopenum
     * @since windowsserver2000
     */
    static RtmCreateNextHopEnum(RtmRegHandle, EnumFlags, NetAddress, RtmEnumHandle) {
        RtmEnumHandleMarshal := RtmEnumHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmCreateNextHopEnum", "ptr", RtmRegHandle, "uint", EnumFlags, "ptr", NetAddress, RtmEnumHandleMarshal, RtmEnumHandle, "uint")
        return result
    }

    /**
     * The RtmGetEnumNextHops function retrieves the next set of next hops in the specified enumeration.
     * @remarks
     * When the next hops are no longer required, release them by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleasenexthops">RtmReleaseNextHops</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} EnumHandle Handle to the next-hop enumeration.
     * @param {Pointer<Integer>} NumNextHops On input, <i>NumNextHops</i> is a pointer to a <b>UINT</b> value specifying the maximum number of next hops that can be received by <i>NextHopHandles</i>. 
     * 
     * 
     * 
     * 
     * On output, <i>NumNextHops</i> receives the actual number of next hops received by <i>NextHopHandles</i>.
     * @param {Pointer<Pointer>} NextHopHandles On input, <i>NextHopHandles</i> pointers to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_nexthop_info">RTM_NEXTHOP_INFO</a> structure. 
     * 
     * 
     * 
     * 
     * On output, <i>NextHopHandles</i> receives an array of handles to next hops.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value pointed to by <i>NumRoutes</i> is larger than the maximum number of routes a client is allowed to retrieve with one call. Check 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_regn_profile">RTM_REGN_PROFILE</a> for the maximum number of next hops that the client is allowed to retrieve with one call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more next hops to enumerate.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetenumnexthops
     * @since windowsserver2000
     */
    static RtmGetEnumNextHops(RtmRegHandle, EnumHandle, NumNextHops, NextHopHandles) {
        NumNextHopsMarshal := NumNextHops is VarRef ? "uint*" : "ptr"
        NextHopHandlesMarshal := NextHopHandles is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmGetEnumNextHops", "ptr", RtmRegHandle, "ptr", EnumHandle, NumNextHopsMarshal, NumNextHops, NextHopHandlesMarshal, NextHopHandles, "uint")
        return result
    }

    /**
     * The RtmReleaseNextHops function releases the next-hop handles.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Integer} NumNextHops Specifies the number of next hops in <i>NextHopHandles</i>.
     * @param {Pointer<Pointer>} NextHopHandles Pointer to an array of next-hop handles to release. The handles were obtained with a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetenumnexthops">RtmGetEnumNextHops</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmreleasenexthops
     * @since windowsserver2000
     */
    static RtmReleaseNextHops(RtmRegHandle, NumNextHops, NextHopHandles) {
        NextHopHandlesMarshal := NextHopHandles is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmReleaseNextHops", "ptr", RtmRegHandle, "uint", NumNextHops, NextHopHandlesMarshal, NextHopHandles, "uint")
        return result
    }

    /**
     * The RtmDeleteEnumHandle function deletes the specified enumeration handle and frees all resources allocated for the enumeration.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} EnumHandle Handle to be released. Any resources associated with the handle are also freed.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmdeleteenumhandle
     * @since windowsserver2000
     */
    static RtmDeleteEnumHandle(RtmRegHandle, EnumHandle) {
        result := DllCall("rtm.dll\RtmDeleteEnumHandle", "ptr", RtmRegHandle, "ptr", EnumHandle, "uint")
        return result
    }

    /**
     * The RtmRegisterForChangeNotification function informs the routing table manager that the client should receive change notifications for the specified types of changes.
     * @remarks
     * A client calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmmarkdestforchangenotification">RtmMarkDestForChangeNotification</a> when it is registering for changes to a specific destination.
     * 
     * The routing table manager uses the 
     * <a href="https://docs.microsoft.com/windows/win32/api/rtmv2/nc-rtmv2-_event_callback">RTM_EVENT_CALLBACK</a> callback, specified when the client called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>, to notify the client when changes have occurred; the client must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetchangeddests">RtmGetChangedDests</a> to receive the actual change information.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/register-for-change-notification">Register For Change Notification</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Integer} TargetViews Specifies the views in which to register for change notification.
     * @param {Integer} NotifyFlags Specifies the flags that indicate the type of changes for which the client requests notification. The following flags are used. (The flags are to be joined using a logical OR.) 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_CHANGE_TYPE_ALL"></a><a id="rtm_change_type_all"></a><dl>
     * <dt><b>RTM_CHANGE_TYPE_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notify the client of any change to a destination.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_CHANGE_TYPE_BEST"></a><a id="rtm_change_type_best"></a><dl>
     * <dt><b>RTM_CHANGE_TYPE_BEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notify the client of changes to the current best route, or when the best route changes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_CHANGE_TYPE_FORWARDING"></a><a id="rtm_change_type_forwarding"></a><dl>
     * <dt><b>RTM_CHANGE_TYPE_FORWARDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notify the client of any best route changes that affect forwarding, such as next hop changes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_NOTIFY_ONLY_MARKED_DESTS"></a><a id="rtm_notify_only_marked_dests"></a><dl>
     * <dt><b>RTM_NOTIFY_ONLY_MARKED_DESTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notify the client of changes to destinations that the client has marked. If this flag is not specified, change notification messages for all destinations are sent.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} NotifyContext Specifies the notification context that the 
     * <a href="https://docs.microsoft.com/windows/win32/api/rtmv2/nc-rtmv2-_event_callback">RTM_EVENT_CALLBACK</a> uses to indicate new changes. The notification context is the <i>Context2</i> parameter of the 
     * <b>RTM_EVENT_CALLBACK</b> callback.
     * @param {Pointer<Pointer>} NotifyHandle Receives a handle to a change notification. The handle must be used when calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetchangeddests">RtmGetChangedDests</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contains incorrect information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are not enough available system resources to complete this operation. The routing table manager has exceeded the maximum number of change notifications that can be cached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the specified views is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmregisterforchangenotification
     * @since windowsserver2000
     */
    static RtmRegisterForChangeNotification(RtmRegHandle, TargetViews, NotifyFlags, NotifyContext, NotifyHandle) {
        NotifyContextMarshal := NotifyContext is VarRef ? "ptr" : "ptr"
        NotifyHandleMarshal := NotifyHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmRegisterForChangeNotification", "ptr", RtmRegHandle, "uint", TargetViews, "uint", NotifyFlags, NotifyContextMarshal, NotifyContext, NotifyHandleMarshal, NotifyHandle, "uint")
        return result
    }

    /**
     * The RtmGetChangedDests function returns a set of destinations with changed information.
     * @remarks
     * A client is notified of changes by an 
     * <a href="https://docs.microsoft.com/windows/win32/api/rtmv2/nc-rtmv2-_event_callback">RTM_EVENT_CALLBACK</a>. The 
     * <b>RTM_EVENT_CALLBACK</b> is only used to notify the client, not deliver the changes. After a change notification is received, the client must call 
     * <b>RtmGetChangedDests</b> repeatedly to retrieve all the changes.
     * 
     * If two or more changes to the same destination have occurred since the notification, only the latest change is returned.
     * 
     * When a client no longer needs the handles in <i>ChangedDests</i>, the client must use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleasechangeddests">RtmReleaseChangedDests</a> to release the handles.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/use-the-event-notification-callback">Use the Event Notification Callback</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} NotifyHandle Handle to a change notification obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterforchangenotification">RtmRegisterForChangeNotification</a>.
     * @param {Pointer<Integer>} NumDests On input, <i>NumDests</i> is a pointer to a <b>UINT</b> value that specifies the maximum number of destinations that can be received by <i>ChangedDests</i>. 
     * 
     * 
     * 
     * 
     * On output, <i>NumDests</i> receives the actual number of destinations received by <i>ChangedDests</i>.
     * @param {Pointer<RTM_DEST_INFO>} ChangedDests On input, <i>ChangedDests</i> is a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structures. 
     * 
     * 
     * 
     * 
     * On output, <i>ChangedDests</i> is filled with the changed destination information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contains incorrect information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more changed destinations to retrieve.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetchangeddests
     * @since windowsserver2000
     */
    static RtmGetChangedDests(RtmRegHandle, NotifyHandle, NumDests, ChangedDests) {
        NumDestsMarshal := NumDests is VarRef ? "uint*" : "ptr"

        result := DllCall("rtm.dll\RtmGetChangedDests", "ptr", RtmRegHandle, "ptr", NotifyHandle, NumDestsMarshal, NumDests, "ptr", ChangedDests, "uint")
        return result
    }

    /**
     * The RtmReleaseChangedDests function releases the changed destination handles.
     * @remarks
     * Always use this function to release changed 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structures obtained from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetchangeddests">RtmGetChangedDests</a>.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structure is a variable-sized structure. If a destination contains information for more than one view, the size of 
     * <b>RTM_DEST_INFO</b> increases for each view. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtm_size_of_dest_info">RTM_SIZE_OF_DEST_INFO</a> macro to determine how large a <i>ChangedDests</i> buffer to allocate before calling this function.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} NotifyHandle Handle to a change notification, obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterforchangenotification">RtmRegisterForChangeNotification</a>.
     * @param {Integer} NumDests Specifies the number of destinations in <i>ChangedDests</i>.
     * @param {Pointer<RTM_DEST_INFO>} ChangedDests Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structures to release. The changed destinations were obtained from a prior call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetchangeddests">RtmGetChangedDests</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmreleasechangeddests
     * @since windowsserver2000
     */
    static RtmReleaseChangedDests(RtmRegHandle, NotifyHandle, NumDests, ChangedDests) {
        result := DllCall("rtm.dll\RtmReleaseChangedDests", "ptr", RtmRegHandle, "ptr", NotifyHandle, "uint", NumDests, "ptr", ChangedDests, "uint")
        return result
    }

    /**
     * The RtmIgnoreChangedDests function skips the next change for each destination if it has already occurred.
     * @remarks
     * When the destinations are no longer required, release them by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleasechangeddests">RtmReleaseChangedDests</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} NotifyHandle Handle to a change notification.
     * @param {Integer} NumDests Specifies the number of destinations in <i>ChangedDests</i>.
     * @param {Pointer<Pointer>} ChangedDests Pointer to an array of <b>RTM_DEST_HANDLE</b> handles that indicate the destinations for which to ignore any pending changes.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmignorechangeddests
     * @since windowsserver2000
     */
    static RtmIgnoreChangedDests(RtmRegHandle, NotifyHandle, NumDests, ChangedDests) {
        ChangedDestsMarshal := ChangedDests is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmIgnoreChangedDests", "ptr", RtmRegHandle, "ptr", NotifyHandle, "uint", NumDests, ChangedDestsMarshal, ChangedDests, "uint")
        return result
    }

    /**
     * The RtmGetChangeStatus function checks whether there are pending changes that have not been retrieved with RtmGetChangedDests.
     * @remarks
     * This function can be used to make portions of the client code more efficient. For example, a client may postpone some operation if there are changes that the client has not yet processed.
     * 
     * This function can also be used to monitor change notification in another thread.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} NotifyHandle Handle to a change notification.
     * @param {Pointer} DestHandle Handle to the destination for which to return change status.
     * @param {Pointer<BOOL>} ChangeStatus On input, <i>ChangeStatus</i> is a pointer to a <b>BOOL</b> value. 
     * 
     * 
     * 
     * 
     * On output, <i>ChangeStatus</i> receives either <b>TRUE</b> or <b>FALSE</b> to indicate if the destination specified by <i>DestHandle</i> has a change notification pending.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetchangestatus
     * @since windowsserver2000
     */
    static RtmGetChangeStatus(RtmRegHandle, NotifyHandle, DestHandle, ChangeStatus) {
        ChangeStatusMarshal := ChangeStatus is VarRef ? "int*" : "ptr"

        result := DllCall("rtm.dll\RtmGetChangeStatus", "ptr", RtmRegHandle, "ptr", NotifyHandle, "ptr", DestHandle, ChangeStatusMarshal, ChangeStatus, "uint")
        return result
    }

    /**
     * The RtmMarkDestForChangeNotification function marks a destination for a client.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} NotifyHandle Handle to a change notification obtained via a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterforchangenotification">RtmRegisterForChangeNotification</a>.
     * @param {Pointer} DestHandle Handle to the destination that the client is marking for notification of changes.
     * @param {BOOL} MarkDest Specifies whether to mark a destination and receive change notifications. Specify <b>TRUE</b> to mark a destination and start receive change notifications for the specified destination. Specify <b>FALSE</b> to stop receiving change notifications a previously marked destination.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmmarkdestforchangenotification
     * @since windowsserver2000
     */
    static RtmMarkDestForChangeNotification(RtmRegHandle, NotifyHandle, DestHandle, MarkDest) {
        result := DllCall("rtm.dll\RtmMarkDestForChangeNotification", "ptr", RtmRegHandle, "ptr", NotifyHandle, "ptr", DestHandle, "int", MarkDest, "uint")
        return result
    }

    /**
     * The RtmIsMarkedForChangeNotification function queries the routing table manager to determine if a destination has previously been marked by a call to RtmMarkDestForChangeNotification.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} NotifyHandle Handle to a change notification, obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterforchangenotification">RtmRegisterForChangeNotification</a>.
     * @param {Pointer} DestHandle Handle to the destination to check.
     * @param {Pointer<BOOL>} DestMarked Pointer to a <b>BOOL</b> variable that is <b>TRUE</b> if the destination is marked, <b>FALSE</b> if it is not.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmismarkedforchangenotification
     * @since windowsserver2000
     */
    static RtmIsMarkedForChangeNotification(RtmRegHandle, NotifyHandle, DestHandle, DestMarked) {
        DestMarkedMarshal := DestMarked is VarRef ? "int*" : "ptr"

        result := DllCall("rtm.dll\RtmIsMarkedForChangeNotification", "ptr", RtmRegHandle, "ptr", NotifyHandle, "ptr", DestHandle, DestMarkedMarshal, DestMarked, "uint")
        return result
    }

    /**
     * The RtmDeregisterFromChangeNotification function unregisters a client from change notification and frees all resources allocated to the notification.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterforchangenotification">RtmRegisterForChangeNotification</a>.
     * @param {Pointer} NotifyHandle Handle to the change notification to unregister that is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterforchangenotification">RtmRegisterForChangeNotification</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmderegisterfromchangenotification
     * @since windowsserver2000
     */
    static RtmDeregisterFromChangeNotification(RtmRegHandle, NotifyHandle) {
        result := DllCall("rtm.dll\RtmDeregisterFromChangeNotification", "ptr", RtmRegHandle, "ptr", NotifyHandle, "uint")
        return result
    }

    /**
     * The RtmCreateRouteList function creates a list in which the caller can keep a copy of the routes it owns.
     * @remarks
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/use-a-client-specific-route-list">Use a Client-Specific Route List</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer<Pointer>} RouteListHandle On input, <i>RouteListHandle</i> is a pointer to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * On output, <i>RouteListHandle</i> receives a pointer to a handle to the new route list.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmcreateroutelist
     * @since windowsserver2000
     */
    static RtmCreateRouteList(RtmRegHandle, RouteListHandle) {
        RouteListHandleMarshal := RouteListHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmCreateRouteList", "ptr", RtmRegHandle, RouteListHandleMarshal, RouteListHandle, "uint")
        return result
    }

    /**
     * The RtmInsertInRouteList function inserts the specified set of routes into the client's route list. If a route is already in another list, the route is removed from the old list and inserted into the new one.
     * @remarks
     * When the routes are no longer required, release them by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleaseroutes">RtmReleaseRoutes</a>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/use-a-client-specific-route-list">Use a Client-Specific Route List</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} RouteListHandle Handle to the route list to which to add routes. Specify <b>NULL</b> to remove the specified routes from their old lists.
     * @param {Integer} NumRoutes Specifies the number of routes in <i>RouteHandles</i>.
     * @param {Pointer<Pointer>} RouteHandles Pointer to an array of route handles to move from the old list to the new list.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtminsertinroutelist
     * @since windowsserver2000
     */
    static RtmInsertInRouteList(RtmRegHandle, RouteListHandle, NumRoutes, RouteHandles) {
        RouteHandlesMarshal := RouteHandles is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmInsertInRouteList", "ptr", RtmRegHandle, "ptr", RouteListHandle, "uint", NumRoutes, RouteHandlesMarshal, RouteHandles, "uint")
        return result
    }

    /**
     * The RtmCreateRouteListEnum function creates an enumeration of routes on the specified route list.
     * @remarks
     * When the enumeration handle is no longer required, release it by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmdeleteenumhandle">RtmDeleteEnumHandle</a>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/use-a-client-specific-route-list">Use a Client-Specific Route List</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} RouteListHandle Handle to the route list to enumerate that is obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmcreateroutelist">RtmCreateRouteList</a>.
     * @param {Pointer<Pointer>} RtmEnumHandle On input, <i>RtmEnumHandle</i> is a pointer to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * On output, <i>RtmEnumHandle</i> receives a pointer to a handle to the enumeration. Use this handle in all subsequent calls to functions that enumerate the list of routes.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmcreateroutelistenum
     * @since windowsserver2000
     */
    static RtmCreateRouteListEnum(RtmRegHandle, RouteListHandle, RtmEnumHandle) {
        RtmEnumHandleMarshal := RtmEnumHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmCreateRouteListEnum", "ptr", RtmRegHandle, "ptr", RouteListHandle, RtmEnumHandleMarshal, RtmEnumHandle, "uint")
        return result
    }

    /**
     * The RtmGetListEnumRoutes function enumerates a set of routes in a specified route list.
     * @remarks
     * Call this function repeatedly to retrieve all routes.
     * 
     * There are no more routes to enumerate when the routing table manager returns zero in <i>NumRoutes</i>.
     * 
     * For sample code using this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/use-a-client-specific-route-list">Use a Client-Specific Route List</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} EnumHandle Handle to the route list to enumerate.
     * @param {Pointer<Integer>} NumRoutes On input, <i>NumRoutes</i> is a pointer to a <b>UINT</b> value that specifies the maximum number of routes that can be received by <i>RouteHandles</i>. 
     * 
     * 
     * 
     * 
     * On output, <i>NumRoutes</i> receives the actual number of routes received by <i>RouteHandles</i>.
     * @param {Pointer<Pointer>} RouteHandles On input, <i>DestInfo</i> is a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_dest_info">RTM_DEST_INFO</a> structures. 
     * 
     * 
     * 
     * 
     * On output, <i>DestInfo</i> is filled with the requested destination information.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value pointed to by <i>NumRoutes</i> is larger than the maximum number of routes a client is allowed to retrieve with one call. Check 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/ns-rtmv2-rtm_regn_profile">RTM_REGN_PROFILE</a> for the maximum number of routes that the client is allowed to retrieve with one call.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmgetlistenumroutes
     * @since windowsserver2000
     */
    static RtmGetListEnumRoutes(RtmRegHandle, EnumHandle, NumRoutes, RouteHandles) {
        NumRoutesMarshal := NumRoutes is VarRef ? "uint*" : "ptr"
        RouteHandlesMarshal := RouteHandles is VarRef ? "ptr*" : "ptr"

        result := DllCall("rtm.dll\RtmGetListEnumRoutes", "ptr", RtmRegHandle, "ptr", EnumHandle, NumRoutesMarshal, NumRoutes, RouteHandlesMarshal, RouteHandles, "uint")
        return result
    }

    /**
     * The RtmDeleteRouteList function removes all routes from a client-specific route list, then frees any resources allocated to the list.
     * @remarks
     * This function also releases the handle to the route list.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Pointer} RouteListHandle Handle to the route list to delete.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmdeleteroutelist
     * @since windowsserver2000
     */
    static RtmDeleteRouteList(RtmRegHandle, RouteListHandle) {
        result := DllCall("rtm.dll\RtmDeleteRouteList", "ptr", RtmRegHandle, "ptr", RouteListHandle, "uint")
        return result
    }

    /**
     * The RtmReferenceHandles function increases the reference count for objects pointed to by one or more handles that the routing manager used to access those objects.
     * @remarks
     * A client must always call this function when caching a handle returned by the routing table manager. This notifies the routing table manager that it should not destroy the object the handle refers to until the handle is released by the client.
     * 
     * When a client must release the handle, the client must call the appropriate release function, based on the type of handle. For example, to release a route, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmreleaseroutes">RtmReleaseRoutes</a>.
     * @param {Pointer} RtmRegHandle Handle to the client obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmregisterentity">RtmRegisterEntity</a>.
     * @param {Integer} NumHandles Specifies the number of handles in <i>RtmHandles</i>.
     * @param {Pointer<HANDLE>} RtmHandles Array of handles to increase the reference count for.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/rtmv2/nf-rtmv2-rtmreferencehandles
     * @since windowsserver2000
     */
    static RtmReferenceHandles(RtmRegHandle, NumHandles, RtmHandles) {
        result := DllCall("rtm.dll\RtmReferenceHandles", "ptr", RtmRegHandle, "uint", NumHandles, "ptr", RtmHandles, "uint")
        return result
    }

;@endregion Methods
}
