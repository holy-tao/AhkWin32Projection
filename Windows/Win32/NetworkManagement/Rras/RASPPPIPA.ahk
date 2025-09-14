#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASPPPIPA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<SByte>}
     */
    szIpAddress{
        get {
            if(!this.HasProp("__szIpAddressProxyArray"))
                this.__szIpAddressProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__szIpAddressProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szServerIpAddress{
        get {
            if(!this.HasProp("__szServerIpAddressProxyArray"))
                this.__szServerIpAddressProxyArray := Win32FixedArray(this.ptr + 24, 16, Primitive, "char")
            return this.__szServerIpAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwServerOptions {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
