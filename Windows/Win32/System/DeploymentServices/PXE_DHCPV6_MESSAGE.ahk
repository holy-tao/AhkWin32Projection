#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PXE_DHCPV6_OPTION.ahk

/**
 * A DHCPV6 message.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcpv6_message
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PXE_DHCPV6_MESSAGE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * The DHCPv6 message type.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Byte 1  of the transaction-id in the DHCPv6 message.
     * @type {Integer}
     */
    TransactionIDByte1 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Byte 2  of the transaction-id  the DHCPv6 message.
     * @type {Integer}
     */
    TransactionIDByte2 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Byte 3  of the transaction-id DHCPv6 message.
     * @type {Integer}
     */
    TransactionIDByte3 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_dhcpv6_option">PXE_DHCPV6_OPTION</a> structure that specifies the DHCPV6 option.
     * @type {Array<PXE_DHCPV6_OPTION>}
     */
    Options{
        get {
            if(!this.HasProp("__OptionsProxyArray"))
                this.__OptionsProxyArray := Win32FixedArray(this.ptr + 4, 8, PXE_DHCPV6_OPTION, "")
            return this.__OptionsProxyArray
        }
    }
}
