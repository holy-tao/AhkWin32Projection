#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct RASCON_IPUI {
    #StructPack 4

    guidConnection : Guid

    fIPv6Cfg : BOOL

    dwFlags : UInt32

    pszwIpAddr : WCHAR[16]

    pszwDnsAddr : WCHAR[16]

    pszwDns2Addr : WCHAR[16]

    pszwWinsAddr : WCHAR[16]

    pszwWins2Addr : WCHAR[16]

    pszwDnsSuffix : WCHAR[256]

    pszwIpv6Addr : WCHAR[65]

    dwIpv6PrefixLength : UInt32

    pszwIpv6DnsAddr : WCHAR[65]

    pszwIpv6Dns2Addr : WCHAR[65]

    dwIPv4InfMetric : UInt32

    dwIPv6InfMetric : UInt32

}
