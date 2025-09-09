#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_SELFTESTRESULT extends Win32Struct
{
    static sizeof => 540

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
    TestResultStatus {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Result {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    PinFailedBitMask {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 20, 512, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    OutBufLen {
        get => NumGet(this, 532, "uint")
        set => NumPut("uint", value, this, 532)
    }

    /**
     * @type {Array<Byte>}
     */
    OutBuffer{
        get {
            if(!this.HasProp("__OutBufferProxyArray"))
                this.__OutBufferProxyArray := Win32FixedArray(this.ptr + 536, 1, Primitive, "char")
            return this.__OutBufferProxyArray
        }
    }
}
