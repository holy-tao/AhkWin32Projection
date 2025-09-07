#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_EXCEPTION_PERFORMANCE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 6

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Lba{
        get {
            if(!this.HasProp("__LbaProxyArray"))
                this.__LbaProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__LbaProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Time{
        get {
            if(!this.HasProp("__TimeProxyArray"))
                this.__TimeProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__TimeProxyArray
        }
    }
}
