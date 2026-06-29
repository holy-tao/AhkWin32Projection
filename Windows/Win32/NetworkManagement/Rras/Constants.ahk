#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global RASNAP_ProbationTime := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASTUNNELENDPOINT_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global RASTUNNELENDPOINT_IPv4 := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASTUNNELENDPOINT_IPv6 := 2

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxDeviceType := 16

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxPhoneNumber := 128

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxIpAddress := 15

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxIpxAddress := 21

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxEntryName := 256

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxDeviceName := 128

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxCallbackNumber := 128

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxAreaCode := 10

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxPadType := 32

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxX25Address := 200

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxFacilities := 200

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxUserData := 200

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxReplyMessage := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxDnsSuffix := 256

/**
 * @type {Integer (UInt32)}
 */
export global RASCF_AllUsers := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASCF_GlobalCreds := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASCF_OwnerKnown := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASCF_OwnerMatch := 8

/**
 * @type {Integer (UInt32)}
 */
export global RAS_MaxIDSize := 256

/**
 * @type {Integer (UInt32)}
 */
export global RASCS_PAUSED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global RASCS_DONE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global RASCSS_DONE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_UsePrefixSuffix := 1

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_PausedStates := 2

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_IgnoreModemSpeaker := 4

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_SetModemSpeaker := 8

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_IgnoreSoftwareCompression := 16

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_SetSoftwareCompression := 32

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_DisableConnectedUI := 64

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_DisableReconnectUI := 128

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_DisableReconnect := 256

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_NoUser := 512

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_PauseOnScript := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_Router := 2048

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_CustomDial := 4096

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_UseCustomScripting := 8192

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_InvokeAutoTriggerCredentialUI := 16384

/**
 * @type {Integer (UInt32)}
 */
export global RDEOPT_EapInfoCryptInCapable := 32768

/**
 * @type {Integer (UInt32)}
 */
export global REN_User := 0

/**
 * @type {Integer (UInt32)}
 */
export global REN_AllUsers := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASIPO_VJ := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASLCPO_PFC := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASLCPO_ACFC := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASLCPO_SSHF := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASLCPO_DES_56 := 8

/**
 * @type {Integer (UInt32)}
 */
export global RASLCPO_3_DES := 16

/**
 * @type {Integer (UInt32)}
 */
export global RASLCPO_AES_128 := 32

/**
 * @type {Integer (UInt32)}
 */
export global RASLCPO_AES_256 := 64

/**
 * @type {Integer (UInt32)}
 */
export global RASLCPO_AES_192 := 128

/**
 * @type {Integer (UInt32)}
 */
export global RASLCPO_GCM_AES_128 := 256

/**
 * @type {Integer (UInt32)}
 */
export global RASLCPO_GCM_AES_192 := 512

/**
 * @type {Integer (UInt32)}
 */
export global RASLCPO_GCM_AES_256 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RASCCPCA_MPPC := 6

/**
 * @type {Integer (UInt32)}
 */
export global RASCCPCA_STAC := 5

/**
 * @type {Integer (UInt32)}
 */
export global RASCCPO_Compression := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASCCPO_HistoryLess := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASCCPO_Encryption56bit := 16

/**
 * @type {Integer (UInt32)}
 */
export global RASCCPO_Encryption40bit := 32

/**
 * @type {Integer (UInt32)}
 */
export global RASCCPO_Encryption128bit := 64

/**
 * @type {Integer (UInt32)}
 */
export global RASIKEv2_AUTH_MACHINECERTIFICATES := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASIKEv2_AUTH_EAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASIKEv2_AUTH_PSK := 3

/**
 * @type {String}
 */
export global RASDIALEVENT := "RasDialEvent"

/**
 * @type {Integer (UInt32)}
 */
export global WM_RASDIALEVENT := 52429

/**
 * @type {Integer (UInt32)}
 */
export global ET_None := 0

/**
 * @type {Integer (UInt32)}
 */
export global ET_Require := 1

/**
 * @type {Integer (UInt32)}
 */
export global ET_RequireMax := 2

/**
 * @type {Integer (UInt32)}
 */
export global ET_Optional := 3

/**
 * @type {Integer (UInt32)}
 */
export global VS_Default := 0

/**
 * @type {Integer (UInt32)}
 */
export global VS_PptpOnly := 1

/**
 * @type {Integer (UInt32)}
 */
export global VS_PptpFirst := 2

/**
 * @type {Integer (UInt32)}
 */
export global VS_L2tpOnly := 3

/**
 * @type {Integer (UInt32)}
 */
export global VS_L2tpFirst := 4

/**
 * @type {Integer (UInt32)}
 */
export global VS_SstpOnly := 5

/**
 * @type {Integer (UInt32)}
 */
export global VS_SstpFirst := 6

/**
 * @type {Integer (UInt32)}
 */
export global VS_Ikev2Only := 7

/**
 * @type {Integer (UInt32)}
 */
export global VS_Ikev2First := 8

/**
 * @type {Integer (UInt32)}
 */
export global VS_GREOnly := 9

/**
 * @type {Integer (UInt32)}
 */
export global VS_PptpSstp := 12

/**
 * @type {Integer (UInt32)}
 */
export global VS_L2tpSstp := 13

/**
 * @type {Integer (UInt32)}
 */
export global VS_Ikev2Sstp := 14

/**
 * @type {Integer (UInt32)}
 */
export global VS_ProtocolList := 15

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_UseCountryAndAreaCodes := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_SpecificIpAddr := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_SpecificNameServers := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_IpHeaderCompression := 8

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_RemoteDefaultGateway := 16

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_DisableLcpExtensions := 32

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_TerminalBeforeDial := 64

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_TerminalAfterDial := 128

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_ModemLights := 256

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_SwCompression := 512

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_RequireEncryptedPw := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_RequireMsEncryptedPw := 2048

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_RequireDataEncryption := 4096

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_NetworkLogon := 8192

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_UseLogonCredentials := 16384

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_PromoteAlternates := 32768

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_SecureLocalFiles := 65536

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_RequireEAP := 131072

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_RequirePAP := 262144

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_RequireSPAP := 524288

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_Custom := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_PreviewPhoneNumber := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_SharedPhoneNumbers := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_PreviewUserPw := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_PreviewDomain := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_ShowDialingProgress := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_RequireCHAP := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_RequireMsCHAP := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_RequireMsCHAP2 := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_RequireW95MSCHAP := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global RASEO_CustomScript := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_SecureFileAndPrint := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_SecureClientForMSNet := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_DontNegotiateMultilink := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_DontUseRasCredentials := 8

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_UsePreSharedKey := 16

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_Internet := 32

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_DisableNbtOverIP := 64

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_UseGlobalDeviceSettings := 128

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_ReconnectIfDropped := 256

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_SharePhoneNumbers := 512

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_SecureRoutingCompartment := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_UseTypicalSettings := 2048

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_IPv6SpecificNameServers := 4096

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_IPv6RemoteDefaultGateway := 8192

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_RegisterIpWithDNS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_UseDNSSuffixForRegistration := 32768

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_IPv4ExplicitMetric := 65536

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_IPv6ExplicitMetric := 131072

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_DisableIKENameEkuCheck := 262144

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_DisableClassBasedStaticRoute := 524288

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_SpecificIPv6Addr := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_DisableMobility := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_RequireMachineCertificates := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_UsePreSharedKeyForIkev2Initiator := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_UsePreSharedKeyForIkev2Responder := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_CacheCredentials := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_AutoTriggerCapable := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_IsThirdPartyProfile := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_AuthTypeIsOtp := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_IsAlwaysOn := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_IsPrivateNetwork := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global RASEO2_PlumbIKEv2TSAsRoutes := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global RASNP_NetBEUI := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASNP_Ipx := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASNP_Ip := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASNP_Ipv6 := 8

/**
 * @type {Integer (UInt32)}
 */
export global RASFP_Ppp := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASFP_Slip := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASFP_Ras := 4

/**
 * @type {String}
 */
export global RASDT_Modem := "modem"

/**
 * @type {String}
 */
export global RASDT_Isdn := "isdn"

/**
 * @type {String}
 */
export global RASDT_X25 := "x25"

/**
 * @type {String}
 */
export global RASDT_Vpn := "vpn"

/**
 * @type {String}
 */
export global RASDT_Pad := "pad"

/**
 * @type {String}
 */
export global RASDT_Generic := "GENERIC"

/**
 * @type {String}
 */
export global RASDT_Serial := "SERIAL"

/**
 * @type {String}
 */
export global RASDT_FrameRelay := "FRAMERELAY"

/**
 * @type {String}
 */
export global RASDT_Atm := "ATM"

/**
 * @type {String}
 */
export global RASDT_Sonet := "SONET"

/**
 * @type {String}
 */
export global RASDT_SW56 := "SW56"

/**
 * @type {String}
 */
export global RASDT_Irda := "IRDA"

/**
 * @type {String}
 */
export global RASDT_Parallel := "PARALLEL"

/**
 * @type {String}
 */
export global RASDT_PPPoE := "PPPoE"

/**
 * @type {Integer (UInt32)}
 */
export global RASET_Phone := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASET_Vpn := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASET_Direct := 3

/**
 * @type {Integer (UInt32)}
 */
export global RASET_Internet := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASET_Broadband := 5

/**
 * @type {Integer (UInt32)}
 */
export global RASCN_Connection := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASCN_Disconnection := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASCN_BandwidthAdded := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASCN_BandwidthRemoved := 8

/**
 * @type {Integer (UInt32)}
 */
export global RASCN_Dormant := 16

/**
 * @type {Integer (UInt32)}
 */
export global RASCN_ReConnection := 32

/**
 * @type {Integer (UInt32)}
 */
export global RASCN_EPDGPacketArrival := 64

/**
 * @type {Integer (UInt32)}
 */
export global RASIDS_Disabled := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global RASIDS_UseGlobalValue := 0

/**
 * @type {Integer (UInt32)}
 */
export global RASADFLG_PositionDlg := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASCM_UserName := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASCM_Password := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASCM_Domain := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASCM_DefaultCreds := 8

/**
 * @type {Integer (UInt32)}
 */
export global RASCM_PreSharedKey := 16

/**
 * @type {Integer (UInt32)}
 */
export global RASCM_ServerPreSharedKey := 32

/**
 * @type {Integer (UInt32)}
 */
export global RASCM_DDMPreSharedKey := 64

/**
 * @type {Integer (UInt32)}
 */
export global RASADP_DisableConnectionQuery := 0

/**
 * @type {Integer (UInt32)}
 */
export global RASADP_LoginSessionDisable := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASADP_SavedAddressesLimit := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASADP_FailedConnectionTimeout := 3

/**
 * @type {Integer (UInt32)}
 */
export global RASADP_ConnectionQueryTimeout := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASEAPF_NonInteractive := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASEAPF_Logon := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASEAPF_Preview := 8

/**
 * @type {Integer (UInt32)}
 */
export global RCD_SingleUser := 0

/**
 * @type {Integer (UInt32)}
 */
export global RCD_AllUsers := 1

/**
 * @type {Integer (UInt32)}
 */
export global RCD_Eap := 2

/**
 * @type {Integer (UInt32)}
 */
export global RCD_Logon := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASPBDEVENT_AddEntry := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASPBDEVENT_EditEntry := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASPBDEVENT_RemoveEntry := 3

/**
 * @type {Integer (UInt32)}
 */
export global RASPBDEVENT_DialEntry := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASPBDEVENT_EditGlobals := 5

/**
 * @type {Integer (UInt32)}
 */
export global RASPBDEVENT_NoUser := 6

/**
 * @type {Integer (UInt32)}
 */
export global RASPBDEVENT_NoUserEdit := 7

/**
 * @type {Integer (UInt32)}
 */
export global RASNOUSER_SmartCard := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASPBDFLAG_PositionDlg := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASPBDFLAG_ForceCloseOnDial := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASPBDFLAG_NoUser := 16

/**
 * @type {Integer (UInt32)}
 */
export global RASPBDFLAG_UpdateDefaults := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_PositionDlg := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_NewEntry := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_CloneEntry := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_NoRename := 8

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_ShellOwned := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_NewPhoneEntry := 16

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_NewTunnelEntry := 32

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_NewDirectEntry := 64

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_NewBroadbandEntry := 128

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_InternetEntry := 256

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_NAT := 512

/**
 * @type {Integer (UInt32)}
 */
export global RASEDFLAG_IncomingConnection := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RASDDFLAG_PositionDlg := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASDDFLAG_NoPrompt := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASDDFLAG_AoacRedial := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASDDFLAG_LinkFailure := 2147483648

/**
 * @type {String}
 */
export global RRAS_SERVICE_NAME := "RemoteAccess"

/**
 * @type {Integer (UInt32)}
 */
export global PID_IPX := 43

/**
 * @type {Integer (UInt32)}
 */
export global PID_IP := 33

/**
 * @type {Integer (UInt32)}
 */
export global PID_IPV6 := 87

/**
 * @type {Integer (UInt32)}
 */
export global PID_NBF := 63

/**
 * @type {Integer (UInt32)}
 */
export global PID_ATALK := 41

/**
 * @type {Integer (UInt32)}
 */
export global MPR_INTERFACE_OUT_OF_RESOURCES := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPR_INTERFACE_ADMIN_DISABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPR_INTERFACE_CONNECTION_FAILURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MPR_INTERFACE_SERVICE_PAUSED := 8

/**
 * @type {Integer (UInt32)}
 */
export global MPR_INTERFACE_DIALOUT_HOURS_RESTRICTION := 16

/**
 * @type {Integer (UInt32)}
 */
export global MPR_INTERFACE_NO_MEDIA_SENSE := 32

/**
 * @type {Integer (UInt32)}
 */
export global MPR_INTERFACE_NO_DEVICE := 64

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxDeviceType := 16

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxPhoneNumber := 128

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxIpAddress := 15

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxIpxAddress := 21

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxEntryName := 256

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxDeviceName := 128

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxCallbackNumber := 128

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxAreaCode := 10

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxPadType := 32

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxX25Address := 200

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxFacilities := 200

/**
 * @type {Integer (UInt32)}
 */
export global MPR_MaxUserData := 200

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_SpecificIpAddr := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_SpecificNameServers := 4

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_IpHeaderCompression := 8

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_RemoteDefaultGateway := 16

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_DisableLcpExtensions := 32

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_SwCompression := 512

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_RequireEncryptedPw := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_RequireMsEncryptedPw := 2048

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_RequireDataEncryption := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_NetworkLogon := 8192

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_PromoteAlternates := 32768

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_SecureLocalFiles := 65536

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_RequireEAP := 131072

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_RequirePAP := 262144

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_RequireSPAP := 524288

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_SharedPhoneNumbers := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_RequireCHAP := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_RequireMsCHAP := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_RequireMsCHAP2 := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_IpSecPreSharedKey := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_RequireMachineCertificates := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_UsePreSharedKeyForIkev2Initiator := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global MPRIO_UsePreSharedKeyForIkev2Responder := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global MPRNP_Ipx := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPRNP_Ip := 4

/**
 * @type {Integer (UInt32)}
 */
export global MPRNP_Ipv6 := 8

/**
 * @type {String}
 */
export global MPRDT_Modem := "modem"

/**
 * @type {String}
 */
export global MPRDT_Isdn := "isdn"

/**
 * @type {String}
 */
export global MPRDT_X25 := "x25"

/**
 * @type {String}
 */
export global MPRDT_Vpn := "vpn"

/**
 * @type {String}
 */
export global MPRDT_Pad := "pad"

/**
 * @type {String}
 */
export global MPRDT_Generic := "GENERIC"

/**
 * @type {String}
 */
export global MPRDT_Serial := "SERIAL"

/**
 * @type {String}
 */
export global MPRDT_FrameRelay := "FRAMERELAY"

/**
 * @type {String}
 */
export global MPRDT_Atm := "ATM"

/**
 * @type {String}
 */
export global MPRDT_Sonet := "SONET"

/**
 * @type {String}
 */
export global MPRDT_SW56 := "SW56"

/**
 * @type {String}
 */
export global MPRDT_Irda := "IRDA"

/**
 * @type {String}
 */
export global MPRDT_Parallel := "PARALLEL"

/**
 * @type {Integer (UInt32)}
 */
export global MPRET_Phone := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRET_Vpn := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPRET_Direct := 3

/**
 * @type {Integer (UInt32)}
 */
export global MPRIDS_Disabled := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global MPRIDS_UseGlobalValue := 0

/**
 * @type {Integer (UInt32)}
 */
export global MPR_VS_Ikev2Only := 7

/**
 * @type {Integer (UInt32)}
 */
export global MPR_VS_Ikev2First := 8

/**
 * @type {Integer (UInt32)}
 */
export global MPR_ENABLE_RAS_ON_DEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPR_ENABLE_ROUTING_ON_DEVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IPADDRESSLEN := 15

/**
 * @type {Integer (UInt32)}
 */
export global IPXADDRESSLEN := 22

/**
 * @type {Integer (UInt32)}
 */
export global ATADDRESSLEN := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAXIPADRESSLEN := 64

/**
 * @type {Integer (UInt32)}
 */
export global PPP_IPCP_VJ := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPP_CCP_COMPRESSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPP_CCP_ENCRYPTION40BITOLD := 16

/**
 * @type {Integer (UInt32)}
 */
export global PPP_CCP_ENCRYPTION40BIT := 32

/**
 * @type {Integer (UInt32)}
 */
export global PPP_CCP_ENCRYPTION128BIT := 64

/**
 * @type {Integer (UInt32)}
 */
export global PPP_CCP_ENCRYPTION56BIT := 128

/**
 * @type {Integer (UInt32)}
 */
export global PPP_CCP_HISTORYLESS := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_MULTILINK_FRAMING := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_PFC := 2

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_ACFC := 4

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_SSHF := 8

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_DES_56 := 16

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_3_DES := 32

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_AES_128 := 64

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_AES_256 := 128

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_AES_192 := 256

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_GCM_AES_128 := 512

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_GCM_AES_192 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PPP_LCP_GCM_AES_256 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global RAS_FLAGS_RAS_CONNECTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASPRIV_NoCallback := 1

/**
 * @type {Integer (UInt32)}
 */
export global RASPRIV_AdminSetCallback := 2

/**
 * @type {Integer (UInt32)}
 */
export global RASPRIV_CallerSetCallback := 4

/**
 * @type {Integer (UInt32)}
 */
export global RASPRIV_DialinPrivilege := 8

/**
 * @type {Integer (UInt32)}
 */
export global RASPRIV2_DialinPolicy := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_IKEV2_AUTH_USING_CERT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_IKEV2_AUTH_USING_EAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_PPP_PROJECTION_INFO_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_IKEV2_PROJECTION_INFO_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_RAS_CONNECTION_OBJECT_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_IF_CUSTOM_CONFIG_FOR_IKEV2 := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_IKEV2_SET_TUNNEL_CONFIG_PARAMS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_L2TP_SET_TUNNEL_CONFIG_PARAMS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SSTP_HASH_SIZE := 32

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_SERVER_OBJECT_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_SERVER_OBJECT_REVISION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_SERVER_OBJECT_REVISION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_SERVER_OBJECT_REVISION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_SERVER_OBJECT_REVISION_5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_SET_CONFIG_PROTOCOL_FOR_PPTP := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_SET_CONFIG_PROTOCOL_FOR_L2TP := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_SET_CONFIG_PROTOCOL_FOR_SSTP := 4

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_SET_CONFIG_PROTOCOL_FOR_IKEV2 := 8

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_SET_CONFIG_PROTOCOL_FOR_GRE := 16

/**
 * @type {Integer (UInt32)}
 */
export global ALLOW_NO_AUTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global DO_NOT_ALLOW_NO_AUTH := 0

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_RAS_UPDATE_CONNECTION_OBJECT_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_ADMIN_DLL_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPRAPI_ADMIN_DLL_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global MGM_JOIN_STATE_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global MGM_FORWARD_STATE_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global MGM_MFE_STATS_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global MGM_MFE_STATS_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTM_MAX_ADDRESS_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global RTM_MAX_VIEWS := 32

/**
 * @type {Integer (UInt32)}
 */
export global RTM_VIEW_ID_UCAST := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTM_VIEW_ID_MCAST := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_VIEW_MASK_SIZE := 32

/**
 * @type {Integer (UInt32)}
 */
export global RTM_VIEW_MASK_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTM_VIEW_MASK_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTM_VIEW_MASK_UCAST := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_VIEW_MASK_MCAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTM_VIEW_MASK_ALL := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global IPV6_ADDRESS_LEN_IN_BYTES := 16

/**
 * @type {Integer (UInt32)}
 */
export global RTM_DEST_FLAG_NATURAL_NET := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_DEST_FLAG_FWD_ENGIN_ADD := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTM_DEST_FLAG_DONT_FORWARD := 4

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_STATE_CREATED := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_STATE_DELETING := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_STATE_DELETED := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_MARTIAN := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_BLACKHOLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_DISCARD := 4

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_INACTIVE := 8

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_LOCAL := 16

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_REMOTE := 32

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_MYSELF := 64

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_LOOPBACK := 128

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_MCAST := 256

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_LOCAL_MCAST := 512

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_LIMITED_BC := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_ZEROS_NETBC := 4096

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_ZEROS_SUBNETBC := 8192

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_ONES_NETBC := 16384

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_FLAGS_ONES_SUBNETBC := 32768

/**
 * @type {Integer (UInt32)}
 */
export global RTM_NEXTHOP_STATE_CREATED := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTM_NEXTHOP_STATE_DELETED := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_NEXTHOP_FLAGS_REMOTE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_NEXTHOP_FLAGS_DOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global METHOD_TYPE_ALL_METHODS := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global METHOD_RIP2_NEIGHBOUR_ADDR := 1

/**
 * @type {Integer (UInt32)}
 */
export global METHOD_RIP2_OUTBOUND_INTF := 2

/**
 * @type {Integer (UInt32)}
 */
export global METHOD_RIP2_ROUTE_TAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global METHOD_RIP2_ROUTE_TIMESTAMP := 8

/**
 * @type {Integer (UInt32)}
 */
export global METHOD_BGP4_AS_PATH := 1

/**
 * @type {Integer (UInt32)}
 */
export global METHOD_BGP4_PEER_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global METHOD_BGP4_PA_ORIGIN := 4

/**
 * @type {Integer (UInt32)}
 */
export global METHOD_BGP4_NEXTHOP_ATTR := 8

/**
 * @type {Integer (UInt32)}
 */
export global RTM_RESUME_METHODS := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTM_BLOCK_METHODS := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_CHANGE_FIRST := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_CHANGE_NEW := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ROUTE_CHANGE_BEST := 65536

/**
 * @type {Integer (UInt32)}
 */
export global RTM_NEXTHOP_CHANGE_NEW := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_MATCH_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTM_MATCH_OWNER := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_MATCH_NEIGHBOUR := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTM_MATCH_PREF := 4

/**
 * @type {Integer (UInt32)}
 */
export global RTM_MATCH_NEXTHOP := 8

/**
 * @type {Integer (UInt32)}
 */
export global RTM_MATCH_INTERFACE := 16

/**
 * @type {Integer (UInt32)}
 */
export global RTM_MATCH_FULL := 65535

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ENUM_START := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ENUM_NEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ENUM_RANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ENUM_ALL_DESTS := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ENUM_OWN_DESTS := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ENUM_ALL_ROUTES := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTM_ENUM_OWN_ROUTES := 65536

/**
 * @type {Integer (UInt32)}
 */
export global RTM_NUM_CHANGE_TYPES := 3

/**
 * @type {Integer (UInt32)}
 */
export global RTM_CHANGE_TYPE_ALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTM_CHANGE_TYPE_BEST := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTM_CHANGE_TYPE_FORWARDING := 4

/**
 * @type {Integer (UInt32)}
 */
export global RTM_NOTIFY_ONLY_MARKED_DESTS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global RASBASE := 600

/**
 * @type {Integer (UInt32)}
 */
export global PENDING := 600

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_PORT_HANDLE := 601

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PORT_ALREADY_OPEN := 602

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BUFFER_TOO_SMALL := 603

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRONG_INFO_SPECIFIED := 604

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_SET_PORT_INFO := 605

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PORT_NOT_CONNECTED := 606

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EVENT_INVALID := 607

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DEVICE_DOES_NOT_EXIST := 608

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DEVICETYPE_DOES_NOT_EXIST := 609

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BUFFER_INVALID := 610

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ROUTE_NOT_AVAILABLE := 611

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ROUTE_NOT_ALLOCATED := 612

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_COMPRESSION_SPECIFIED := 613

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OUT_OF_BUFFERS := 614

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PORT_NOT_FOUND := 615

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ASYNC_REQUEST_PENDING := 616

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ALREADY_DISCONNECTING := 617

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PORT_NOT_OPEN := 618

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PORT_DISCONNECTED := 619

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_ENDPOINTS := 620

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_OPEN_PHONEBOOK := 621

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_LOAD_PHONEBOOK := 622

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_FIND_PHONEBOOK_ENTRY := 623

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_WRITE_PHONEBOOK := 624

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CORRUPT_PHONEBOOK := 625

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_LOAD_STRING := 626

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_KEY_NOT_FOUND := 627

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DISCONNECTION := 628

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_REMOTE_DISCONNECTION := 629

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HARDWARE_FAILURE := 630

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_USER_DISCONNECTION := 631

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_SIZE := 632

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PORT_NOT_AVAILABLE := 633

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_PROJECT_CLIENT := 634

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_UNKNOWN := 635

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRONG_DEVICE_ATTACHED := 636

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BAD_STRING := 637

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_REQUEST_TIMEOUT := 638

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_GET_LANA := 639

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NETBIOS_ERROR := 640

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SERVER_OUT_OF_RESOURCES := 641

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NAME_EXISTS_ON_NET := 642

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SERVER_GENERAL_NET_FAILURE := 643

/**
 * @type {Integer (UInt32)}
 */
export global WARNING_MSG_ALIAS_NOT_ADDED := 644

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_AUTH_INTERNAL := 645

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_RESTRICTED_LOGON_HOURS := 646

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ACCT_DISABLED := 647

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PASSWD_EXPIRED := 648

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_DIALIN_PERMISSION := 649

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SERVER_NOT_RESPONDING := 650

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_FROM_DEVICE := 651

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_UNRECOGNIZED_RESPONSE := 652

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_MACRO_NOT_FOUND := 653

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_MACRO_NOT_DEFINED := 654

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_MESSAGE_MACRO_NOT_FOUND := 655

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DEFAULTOFF_MACRO_NOT_FOUND := 656

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_FILE_COULD_NOT_BE_OPENED := 657

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DEVICENAME_TOO_LONG := 658

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DEVICENAME_NOT_FOUND := 659

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_RESPONSES := 660

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_COMMAND_FOUND := 661

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRONG_KEY_SPECIFIED := 662

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_UNKNOWN_DEVICE_TYPE := 663

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ALLOCATING_MEMORY := 664

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PORT_NOT_CONFIGURED := 665

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DEVICE_NOT_READY := 666

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_READING_INI_FILE := 667

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_CONNECTION := 668

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BAD_USAGE_IN_INI_FILE := 669

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_READING_SECTIONNAME := 670

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_READING_DEVICETYPE := 671

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_READING_DEVICENAME := 672

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_READING_USAGE := 673

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_READING_MAXCONNECTBPS := 674

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_READING_MAXCARRIERBPS := 675

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_LINE_BUSY := 676

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_VOICE_ANSWER := 677

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_ANSWER := 678

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_CARRIER := 679

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_DIALTONE := 680

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_IN_COMMAND := 681

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRITING_SECTIONNAME := 682

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRITING_DEVICETYPE := 683

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRITING_DEVICENAME := 684

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRITING_MAXCONNECTBPS := 685

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRITING_MAXCARRIERBPS := 686

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRITING_USAGE := 687

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRITING_DEFAULTOFF := 688

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_READING_DEFAULTOFF := 689

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EMPTY_INI_FILE := 690

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_AUTHENTICATION_FAILURE := 691

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PORT_OR_DEVICE := 692

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NOT_BINARY_MACRO := 693

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DCB_NOT_FOUND := 694

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_STATE_MACHINES_NOT_STARTED := 695

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_STATE_MACHINES_ALREADY_STARTED := 696

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PARTIAL_RESPONSE_LOOPING := 697

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_UNKNOWN_RESPONSE_KEY := 698

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_RECV_BUF_FULL := 699

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CMD_TOO_LONG := 700

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_UNSUPPORTED_BPS := 701

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_UNEXPECTED_RESPONSE := 702

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERACTIVE_MODE := 703

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BAD_CALLBACK_NUMBER := 704

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_AUTH_STATE := 705

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRITING_INITBPS := 706

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_X25_DIAGNOSTIC := 707

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ACCT_EXPIRED := 708

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CHANGING_PASSWORD := 709

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OVERRUN := 710

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_RASMAN_CANNOT_INITIALIZE := 711

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIPLEX_PORT_NOT_AVAILABLE := 712

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_ACTIVE_ISDN_LINES := 713

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_ISDN_CHANNELS_AVAILABLE := 714

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_TOO_MANY_LINE_ERRORS := 715

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_IP_CONFIGURATION := 716

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_IP_ADDRESSES := 717

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_TIMEOUT := 718

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_REMOTE_TERMINATED := 719

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_NO_PROTOCOLS_CONFIGURED := 720

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_NO_RESPONSE := 721

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_INVALID_PACKET := 722

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PHONE_NUMBER_TOO_LONG := 723

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_IPXCP_NO_DIALOUT_CONFIGURED := 724

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_IPXCP_NO_DIALIN_CONFIGURED := 725

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_IPXCP_DIALOUT_ALREADY_ACTIVE := 726

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ACCESSING_TCPCFGDLL := 727

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_IP_RAS_ADAPTER := 728

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SLIP_REQUIRES_IP := 729

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROJECTION_NOT_COMPLETE := 730

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROTOCOL_NOT_CONFIGURED := 731

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_NOT_CONVERGING := 732

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_CP_REJECTED := 733

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_LCP_TERMINATED := 734

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_REQUIRED_ADDRESS_REJECTED := 735

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_NCP_TERMINATED := 736

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_LOOPBACK_DETECTED := 737

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PPP_NO_ADDRESS_ASSIGNED := 738

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_USE_LOGON_CREDENTIALS := 739

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_TAPI_CONFIGURATION := 740

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_LOCAL_ENCRYPTION := 741

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_REMOTE_ENCRYPTION := 742

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_REMOTE_REQUIRES_ENCRYPTION := 743

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_IPXCP_NET_NUMBER_CONFLICT := 744

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_SMM := 745

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SMM_UNINITIALIZED := 746

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_MAC_FOR_PORT := 747

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SMM_TIMEOUT := 748

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BAD_PHONE_NUMBER := 749

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRONG_MODULE := 750

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_CALLBACK_NUMBER := 751

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SCRIPT_SYNTAX := 752

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HANGUP_FAILED := 753

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BUNDLE_NOT_FOUND := 754

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_DO_CUSTOMDIAL := 755

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DIAL_ALREADY_IN_PROGRESS := 756

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_RASAUTO_CANNOT_INITIALIZE := 757

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CONNECTION_ALREADY_SHARED := 758

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SHARING_CHANGE_FAILED := 759

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SHARING_ROUTER_INSTALL := 760

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SHARE_CONNECTION_FAILED := 761

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SHARING_PRIVATE_INSTALL := 762

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_SHARE_CONNECTION := 763

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_SMART_CARD_READER := 764

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SHARING_ADDRESS_EXISTS := 765

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_CERTIFICATE := 766

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SHARING_MULTIPLE_ADDRESSES := 767

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_FAILED_TO_ENCRYPT := 768

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BAD_ADDRESS_SPECIFIED := 769

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CONNECTION_REJECT := 770

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CONGESTION := 771

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INCOMPATIBLE := 772

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NUMBERCHANGED := 773

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_TEMPFAILURE := 774

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BLOCKED := 775

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DONOTDISTURB := 776

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OUTOFORDER := 777

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_UNABLE_TO_AUTHENTICATE_SERVER := 778

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SMART_CARD_REQUIRED := 779

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_FUNCTION_FOR_ENTRY := 780

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CERT_FOR_ENCRYPTION_NOT_FOUND := 781

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SHARING_RRAS_CONFLICT := 782

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SHARING_NO_PRIVATE_LAN := 783

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_DIFF_USER_AT_LOGON := 784

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_REG_CERT_AT_LOGON := 785

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OAKLEY_NO_CERT := 786

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OAKLEY_AUTH_FAIL := 787

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OAKLEY_ATTRIB_FAIL := 788

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OAKLEY_GENERAL_PROCESSING := 789

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OAKLEY_NO_PEER_CERT := 790

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OAKLEY_NO_POLICY := 791

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OAKLEY_TIMED_OUT := 792

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OAKLEY_ERROR := 793

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_UNKNOWN_FRAMED_PROTOCOL := 794

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WRONG_TUNNEL_TYPE := 795

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_UNKNOWN_SERVICE_TYPE := 796

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CONNECTING_DEVICE_NOT_FOUND := 797

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_EAPTLS_CERTIFICATE := 798

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SHARING_HOST_ADDRESS_CONFLICT := 799

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_AUTOMATIC_VPN_FAILED := 800

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_VALIDATING_SERVER_CERT := 801

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_READING_SCARD := 802

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_PEAP_COOKIE_CONFIG := 803

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_PEAP_COOKIE_USER := 804

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_MSCHAPV2_CONFIG := 805

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_VPN_GRE_BLOCKED := 806

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_VPN_DISCONNECT := 807

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_VPN_REFUSED := 808

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_VPN_TIMEOUT := 809

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_VPN_BAD_CERT := 810

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_VPN_BAD_PSK := 811

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SERVER_POLICY := 812

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BROADBAND_ACTIVE := 813

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BROADBAND_NO_NIC := 814

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BROADBAND_TIMEOUT := 815

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_FEATURE_DEPRECATED := 816

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_DELETE := 817

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_RASQEC_RESOURCE_CREATION_FAILED := 818

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_RASQEC_NAPAGENT_NOT_ENABLED := 819

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_RASQEC_NAPAGENT_NOT_CONNECTED := 820

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_RASQEC_CONN_DOESNOTEXIST := 821

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_RASQEC_TIMEOUT := 822

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PEAP_CRYPTOBINDING_INVALID := 823

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PEAP_CRYPTOBINDING_NOTRECEIVED := 824

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_VPNSTRATEGY := 825

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAPTLS_CACHE_CREDENTIALS_INVALID := 826

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_IPSEC_SERVICE_STOPPED := 827

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_IDLE_TIMEOUT := 828

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_LINK_FAILURE := 829

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_USER_LOGOFF := 830

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_FAST_USER_SWITCH := 831

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HIBERNATION := 832

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SYSTEM_SUSPENDED := 833

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_RASMAN_SERVICE_STOPPED := 834

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_SERVER_CERT := 835

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NOT_NAP_CAPABLE := 836

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_TUNNELID := 837

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_UPDATECONNECTION_REQUEST_IN_PROCESS := 838

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROTOCOL_ENGINE_DISABLED := 839

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNAL_ADDRESS_FAILURE := 840

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_FAILED_CP_REQUIRED := 841

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_TS_UNACCEPTABLE := 842

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_MOBIKE_DISABLED := 843

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CANNOT_INITIATE_MOBIKE_UPDATE := 844

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PEAP_SERVER_REJECTED_CLIENT_TLV := 845

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_PREFERENCES := 846

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAPTLS_SCARD_CACHE_CREDENTIALS_INVALID := 847

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SSTP_COOKIE_SET_FAILURE := 848

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_PEAP_COOKIE_ATTRIBUTES := 849

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_METHOD_NOT_INSTALLED := 850

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_METHOD_DOES_NOT_SUPPORT_SSO := 851

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_METHOD_OPERATION_NOT_SUPPORTED := 852

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_USER_CERT_INVALID := 853

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_USER_CERT_EXPIRED := 854

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_USER_CERT_REVOKED := 855

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_USER_CERT_OTHER_ERROR := 856

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_SERVER_CERT_INVALID := 857

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_SERVER_CERT_EXPIRED := 858

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_SERVER_CERT_REVOKED := 859

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_SERVER_CERT_OTHER_ERROR := 860

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_USER_ROOT_CERT_NOT_FOUND := 861

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_USER_ROOT_CERT_INVALID := 862

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_USER_ROOT_CERT_EXPIRED := 863

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_SERVER_ROOT_CERT_NOT_FOUND := 864

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_SERVER_ROOT_CERT_INVALID := 865

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAP_SERVER_ROOT_CERT_NAME_REQUIRED := 866

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PEAP_IDENTITY_MISMATCH := 867

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DNSNAME_NOT_RESOLVABLE := 868

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_EAPTLS_PASSWD_INVALID := 869

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_IKEV2_PSK_INTERFACE_ALREADY_EXISTS := 870

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_DESTINATION_IP := 871

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_INTERFACE_CONFIG := 872

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_VPN_PLUGIN_GENERIC := 873

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SSO_CERT_MISSING := 874

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DEVICE_COMPLIANCE := 875

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PLUGIN_NOT_INSTALLED := 876

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ACTION_REQUIRED := 877

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_AUTO_PROXY_SERVICE := 878

/**
 * @type {Integer (UInt32)}
 */
export global RASBASEEND := 878
;@endregion Constants
