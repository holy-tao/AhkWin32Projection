#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PXE_DHCPV6_OPTION.ahk

/**
 * Provides the DHCPV6 relay message.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcpv6_relay_message
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PXE_DHCPV6_RELAY_MESSAGE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The message type
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The hop count
     * @type {Integer}
     */
    HopCount {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The link address
     * @type {Array<Byte>}
     */
    LinkAddress{
        get {
            if(!this.HasProp("__LinkAddressProxyArray"))
                this.__LinkAddressProxyArray := Win32FixedArray(this.ptr + 2, 16, Primitive, "char")
            return this.__LinkAddressProxyArray
        }
    }

    /**
     * The peer address
     * @type {Array<Byte>}
     */
    PeerAddress{
        get {
            if(!this.HasProp("__PeerAddressProxyArray"))
                this.__PeerAddressProxyArray := Win32FixedArray(this.ptr + 18, 16, Primitive, "char")
            return this.__PeerAddressProxyArray
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_dhcpv6_option">PXE_DHCPV6_OPTION</a> structure and see RFC 3315 section 7.
     * @type {Array<PXE_DHCPV6_OPTION>}
     */
    Options{
        get {
            if(!this.HasProp("__OptionsProxyArray"))
                this.__OptionsProxyArray := Win32FixedArray(this.ptr + 40, 1, PXE_DHCPV6_OPTION, "")
            return this.__OptionsProxyArray
        }
    }
}
