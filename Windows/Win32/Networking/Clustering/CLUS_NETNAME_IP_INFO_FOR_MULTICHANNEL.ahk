#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUS_NETNAME_IP_INFO_ENTRY.ahk" { CLUS_NETNAME_IP_INFO_ENTRY }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents IP information for a NetName resource that has Multichannel enabled.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_netname_ip_info_for_multichannel
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_NETNAME_IP_INFO_FOR_MULTICHANNEL {
    #StructPack 4

    /**
     * An array of wide characters that specifies the name of the resource.
     */
    szName : WCHAR[64]

    /**
     * The number of channels that are specified by the <i>IpInfo</i> parameter.
     */
    NumEntries : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clus_netname_ip_info_entry">CLUS_NETNAME_IP_INFO_ENTRY</a> structures that specify the IP info for each channel.
     */
    IpInfo : CLUS_NETNAME_IP_INFO_ENTRY[1]

}
