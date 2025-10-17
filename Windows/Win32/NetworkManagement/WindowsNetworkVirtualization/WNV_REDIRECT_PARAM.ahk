#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\WNV_IP_ADDRESS.ahk

/**
 * Specifies the parameters of the event (receiving an incoming Internet Control Message Protocol redirect packet) that causes the Windows Network Virtualization (WNV) driver to generate a WnvRedirectType notification.
 * @remarks
 * 
  * Hyper-V Network Virtualization uses an Internet Control Message Protocol
  * (ICMP) redirect message to indicate a change in the virtual machine's provider address in the case of a live migration of a virtual machine.
  * 
  * For a detailed description of network virtualization concepts and terminology, refer to <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/jj134230(v=ws.11)">Hyper-V Network Virtualization Overview</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wnvapi/ns-wnvapi-wnv_redirect_param
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 * @version v4.0.30319
 */
class WNV_REDIRECT_PARAM extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b>ADDRESS_FAMILY</b>
     * 
     * The address family (<b>AF_INET</b> or <b>AF_INET6</b>) for the customer address.
     * @type {Integer}
     */
    CAFamily {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>ADDRESS_FAMILY</b>
     * 
     * The address family (<b>AF_INET</b> or <b>AF_INET6</b>) for the original provider address.
     * @type {Integer}
     */
    PAFamily {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>ADDRESS_FAMILY</b>
     * 
     * The address family (<b>AF_INET</b> or <b>AF_INET6</b>) for the new provider address.
     * @type {Integer}
     */
    NewPAFamily {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The identifier of a customer virtual subnet. This value ranges from 4096 (0x00001000) to 16777214 (0x00FFFFFE).
     * @type {Integer}
     */
    VirtualSubnetId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_ip_address">WNV_IP_ADDRESS</a></b>
     * 
     * The IP address object for the customer address, which is the IP address configured on the virtual machine for network virtualization.
     * @type {WNV_IP_ADDRESS}
     */
    CA{
        get {
            if(!this.HasProp("__CA"))
                this.__CA := WNV_IP_ADDRESS(16, this)
            return this.__CA
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_ip_address">WNV_IP_ADDRESS</a></b>
     * 
     * The IP address object for the provider address, which is the matching IP address used on the physical network for the customer address.
     * @type {WNV_IP_ADDRESS}
     */
    PA{
        get {
            if(!this.HasProp("__PA"))
                this.__PA := WNV_IP_ADDRESS(32, this)
            return this.__PA
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_ip_address">WNV_IP_ADDRESS</a></b>
     * 
     * The updated provider address when a virtual machine is migrated from one host to another.
     * @type {WNV_IP_ADDRESS}
     */
    NewPA{
        get {
            if(!this.HasProp("__NewPA"))
                this.__NewPA := WNV_IP_ADDRESS(48, this)
            return this.__NewPA
        }
    }
}
