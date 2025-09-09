#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_SELFTESTCONFIG extends Win32Struct
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
     * @type {Integer}
     */
    TestType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 12, 512, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    InBufLen {
        get => NumGet(this, 524, "uint")
        set => NumPut("uint", value, this, 524)
    }

    /**
     * @type {Array<Byte>}
     */
    InBuffer{
        get {
            if(!this.HasProp("__InBufferProxyArray"))
                this.__InBufferProxyArray := Win32FixedArray(this.ptr + 528, 1, Primitive, "char")
            return this.__InBufferProxyArray
        }
    }
}
