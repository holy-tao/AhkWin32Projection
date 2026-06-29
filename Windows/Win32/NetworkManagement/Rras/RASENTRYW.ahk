#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEV2_ID_PAYLOAD_TYPE.ahk" { IKEV2_ID_PAYLOAD_TYPE }
#Import ".\RASENTRY_DIAL_MODE.ahk" { RASENTRY_DIAL_MODE }
#Import ".\RASIPADDR.ahk" { RASIPADDR }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 */
export default struct RASENTRYW {
    #StructPack 4

    dwSize : UInt32

    dwfOptions : UInt32

    dwCountryID : UInt32

    dwCountryCode : UInt32

    szAreaCode : WCHAR[11]

    szLocalPhoneNumber : WCHAR[129]

    dwAlternateOffset : UInt32

    ipaddr : RASIPADDR

    ipaddrDns : RASIPADDR

    ipaddrDnsAlt : RASIPADDR

    ipaddrWins : RASIPADDR

    ipaddrWinsAlt : RASIPADDR

    dwFrameSize : UInt32

    dwfNetProtocols : UInt32

    dwFramingProtocol : UInt32

    szScript : WCHAR[260]

    szAutodialDll : WCHAR[260]

    szAutodialFunc : WCHAR[260]

    szDeviceType : WCHAR[17]

    szDeviceName : WCHAR[129]

    szX25PadType : WCHAR[33]

    szX25Address : WCHAR[201]

    szX25Facilities : WCHAR[201]

    szX25UserData : WCHAR[201]

    dwChannels : UInt32

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    dwSubEntries : UInt32

    dwDialMode : RASENTRY_DIAL_MODE

    dwDialExtraPercent : UInt32

    dwDialExtraSampleSeconds : UInt32

    dwHangUpExtraPercent : UInt32

    dwHangUpExtraSampleSeconds : UInt32

    dwIdleDisconnectSeconds : UInt32

    dwType : UInt32

    dwEncryptionType : UInt32

    dwCustomAuthKey : UInt32

    guidId : Guid

    szCustomDialDll : WCHAR[260]

    dwVpnStrategy : UInt32

    dwfOptions2 : UInt32

    dwfOptions3 : UInt32

    szDnsSuffix : WCHAR[256]

    dwTcpWindowSize : UInt32

    szPrerequisitePbk : WCHAR[260]

    szPrerequisiteEntry : WCHAR[257]

    dwRedialCount : UInt32

    dwRedialPause : UInt32

    ipv6addrDns : IN6_ADDR

    ipv6addrDnsAlt : IN6_ADDR

    dwIPv4InterfaceMetric : UInt32

    dwIPv6InterfaceMetric : UInt32

    ipv6addr : IN6_ADDR

    dwIPv6PrefixLength : UInt32

    dwNetworkOutageTime : UInt32

    szIDi : WCHAR[257]

    szIDr : WCHAR[257]

    fIsImsConfig : BOOL

    IdiType : IKEV2_ID_PAYLOAD_TYPE

    IdrType : IKEV2_ID_PAYLOAD_TYPE

    fDisableIKEv2Fragmentation : BOOL

}
