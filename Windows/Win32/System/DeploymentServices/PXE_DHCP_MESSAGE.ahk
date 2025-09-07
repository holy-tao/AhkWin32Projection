#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PXE_DHCP_OPTION.ahk

/**
 * The PXE_DHCP_MESSAGE structure can be used with the Windows Deployment Services PXE Server API.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcp_message
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PXE_DHCP_MESSAGE extends Win32Struct
{
    static sizeof => 243

    static packingSize => 1

    /**
     * Operation (op) field
     * @type {Integer}
     */
    Operation {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Hardware Address Type (htype) field
     * @type {Integer}
     */
    HardwareAddressType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Hardware Address Length (hlen) field
     * @type {Integer}
     */
    HardwareAddressLength {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * 
     * @type {Integer}
     */
    HopCount {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * 
     * @type {Integer}
     */
    TransactionID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Seconds Since Boot (secs) field
     * @type {Integer}
     */
    SecondsSinceBoot {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * This parameter is reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Client IP Address (ciaddr) field
     * @type {Integer}
     */
    ClientIpAddress {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    YourIpAddress {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    BootstrapServerAddress {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    RelayAgentIpAddress {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    HardwareAddress{
        get {
            if(!this.HasProp("__HardwareAddressProxyArray"))
                this.__HardwareAddressProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__HardwareAddressProxyArray
        }
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    HostName{
        get {
            if(!this.HasProp("__HostNameProxyArray"))
                this.__HostNameProxyArray := Win32FixedArray(this.ptr + 44, 1, Primitive, "char")
            return this.__HostNameProxyArray
        }
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    BootFileName{
        get {
            if(!this.HasProp("__BootFileNameProxyArray"))
                this.__BootFileNameProxyArray := Win32FixedArray(this.ptr + 108, 1, Primitive, "char")
            return this.__BootFileNameProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bMagicCookie{
        get {
            if(!this.HasProp("__bMagicCookieProxyArray"))
                this.__bMagicCookieProxyArray := Win32FixedArray(this.ptr + 236, 1, Primitive, "char")
            return this.__bMagicCookieProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    uMagicCookie {
        get => NumGet(this, 236, "uint")
        set => NumPut("uint", value, this, 236)
    }

    /**
     * 
     * @type {PXE_DHCP_OPTION}
     */
    Option{
        get {
            if(!this.HasProp("__Option"))
                this.__Option := PXE_DHCP_OPTION(this.ptr + 240)
            return this.__Option
        }
    }
}
