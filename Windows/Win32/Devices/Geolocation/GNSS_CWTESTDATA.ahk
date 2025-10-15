#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\NTSTATUS.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_CWTESTDATA extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

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
     * @type {NTSTATUS}
     */
    TestResultStatus{
        get {
            if(!this.HasProp("__TestResultStatus"))
                this.__TestResultStatus := NTSTATUS(this.ptr + 8)
            return this.__TestResultStatus
        }
    }

    /**
     * @type {Float}
     */
    SignalToNoiseRatio {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * @type {Float}
     */
    Frequency {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 32, 512, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }
}
