#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_PLATFORM_CAPABILITY extends Win32Struct
{
    static sizeof => 532

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    SupportAgnssInjection{
        get {
            if(!this.HasProp("__SupportAgnssInjection"))
                this.__SupportAgnssInjection := BOOL(this.ptr + 8)
            return this.__SupportAgnssInjection
        }
    }

    /**
     * @type {Integer}
     */
    AgnssFormatSupported {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 16, 516, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }
}
