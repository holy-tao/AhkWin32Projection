#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the fields in common between the PXE_DHCPV6_MESSAGE and PXE_DHCPV6_RELAY_MESSAGE structures.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcpv6_message_header
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PXE_DHCPV6_MESSAGE_HEADER extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * The DHCPv6 Message Type.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The remainder of the packet which must be interpreted differently based on the <b>MessageType</b>.
     * @type {Array<Byte>}
     */
    Message{
        get {
            if(!this.HasProp("__MessageProxyArray"))
                this.__MessageProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__MessageProxyArray
        }
    }
}
