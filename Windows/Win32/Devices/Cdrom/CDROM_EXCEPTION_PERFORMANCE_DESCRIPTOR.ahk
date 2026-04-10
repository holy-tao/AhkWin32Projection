#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class CDROM_EXCEPTION_PERFORMANCE_DESCRIPTOR extends Win32Struct {
    static sizeof => 6

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    Lba {
        get {
            if(!this.HasProp("__LbaProxyArray"))
                this.__LbaProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__LbaProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Time {
        get {
            if(!this.HasProp("__TimeProxyArray"))
                this.__TimeProxyArray := Win32FixedArray(this.ptr + 4, 2, Primitive, "char")
            return this.__TimeProxyArray
        }
    }
}
