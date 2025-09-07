#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUS_NETNAME_IP_INFO_ENTRY.ahk

/**
 * Represents IP information for a NetName resource that has Multichannel enabled.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_netname_ip_info_for_multichannel
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_NETNAME_IP_INFO_FOR_MULTICHANNEL extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * An array of wide characters that specifies the name of the resource.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 0, 63, "UTF-16")
        set => StrPut(value, this.ptr + 0, 63, "UTF-16")
    }

    /**
     * The number of channels that are specified by the <i>IpInfo</i> parameter.
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clus_netname_ip_info_entry">CLUS_NETNAME_IP_INFO_ENTRY</a> structures that specify the IP info for each channel.
     * @type {Array<CLUS_NETNAME_IP_INFO_ENTRY>}
     */
    IpInfo{
        get {
            if(!this.HasProp("__IpInfoProxyArray"))
                this.__IpInfoProxyArray := Win32FixedArray(this.ptr + 136, 8, CLUS_NETNAME_IP_INFO_ENTRY, "")
            return this.__IpInfoProxyArray
        }
    }
}
