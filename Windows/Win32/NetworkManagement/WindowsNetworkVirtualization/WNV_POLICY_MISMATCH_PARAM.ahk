#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\WNV_IP_ADDRESS.ahk

/**
 * Specifies the parameters of an event (typically an incoming packet) that causes the Windows Network Virtualization (WNV) driver to generate a WnvPolicyMismatchType notification.
 * @remarks
 * For a detailed description of network virtualization concepts and terminology, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/jj134230(v=ws.11)">Hyper-V Network Virtualization Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wnvapi/ns-wnvapi-wnv_policy_mismatch_param
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 * @version v4.0.30319
 */
class WNV_POLICY_MISMATCH_PARAM extends Win32Struct
{
    static sizeof => 40

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
     * The address family (<b>AF_INET</b> or <b>AF_INET6</b>) for the provider address.
     * @type {Integer}
     */
    PAFamily {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The identifier of a customer virtual subnet. This value ranges from 4096 (0x00001000) to 16777214 (0x00FFFFFE).
     * @type {Integer}
     */
    VirtualSubnetId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
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
                this.__CA := WNV_IP_ADDRESS(8, this)
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
                this.__PA := WNV_IP_ADDRESS(24, this)
            return this.__PA
        }
    }
}
