#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTSSBX_IP_ADDRESS.ahk

/**
 * Contains information about a computer that is accepting remote connections.
 * @see https://docs.microsoft.com/windows/win32/api//tssbx/ns-tssbx-wtssbx_machine_connect_info
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTSSBX_MACHINE_CONNECT_INFO extends Win32Struct
{
    static sizeof => 648

    static packingSize => 8

    /**
     * The fully qualified domain name (FQDN) of the computer.  The name cannot exceed 256 characters.
     * @type {String}
     */
    wczMachineFQDN {
        get => StrGet(this.ptr + 0, 256, "UTF-16")
        set => StrPut(value, this.ptr + 0, 256, "UTF-16")
    }

    /**
     * The NetBIOS name of the computer. The name cannot exceed 16 characters.
     * @type {String}
     */
    wczMachineNetBiosName {
        get => StrGet(this.ptr + 514, 16, "UTF-16")
        set => StrPut(value, this.ptr + 514, 16, "UTF-16")
    }

    /**
     * The number of IP addresses that are configured on the computer.
     * @type {Integer}
     */
    dwNumOfIPAddr {
        get => NumGet(this, 548, "uint")
        set => NumPut("uint", value, this, 548)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_ip_address">WTSSBX_IP_ADDRESS</a> structures that indicate the IP addresses on this computer that are visible to Remote Desktop Connection (RDC) clients. This array cannot exceed 12 elements.
     * @type {Array<WTSSBX_IP_ADDRESS>}
     */
    IPaddr{
        get {
            if(!this.HasProp("__IPaddrProxyArray"))
                this.__IPaddrProxyArray := Win32FixedArray(this.ptr + 552, 12, WTSSBX_IP_ADDRESS, "")
            return this.__IPaddrProxyArray
        }
    }
}
