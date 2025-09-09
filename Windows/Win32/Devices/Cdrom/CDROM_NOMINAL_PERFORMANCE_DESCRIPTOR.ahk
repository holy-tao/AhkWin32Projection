#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_NOMINAL_PERFORMANCE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    StartLba{
        get {
            if(!this.HasProp("__StartLbaProxyArray"))
                this.__StartLbaProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__StartLbaProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    StartPerformance{
        get {
            if(!this.HasProp("__StartPerformanceProxyArray"))
                this.__StartPerformanceProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__StartPerformanceProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    EndLba{
        get {
            if(!this.HasProp("__EndLbaProxyArray"))
                this.__EndLbaProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "char")
            return this.__EndLbaProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    EndPerformance{
        get {
            if(!this.HasProp("__EndPerformanceProxyArray"))
                this.__EndPerformanceProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "char")
            return this.__EndPerformanceProxyArray
        }
    }
}
