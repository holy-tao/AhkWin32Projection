#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CDROM_EXCLUSIVE_ACCESS.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_EXCLUSIVE_LOCK extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {CDROM_EXCLUSIVE_ACCESS}
     */
    Access{
        get {
            if(!this.HasProp("__Access"))
                this.__Access := CDROM_EXCLUSIVE_ACCESS(0, this)
            return this.__Access
        }
    }

    /**
     * @type {Array<Byte>}
     */
    CallerName{
        get {
            if(!this.HasProp("__CallerNameProxyArray"))
                this.__CallerNameProxyArray := Win32FixedArray(this.ptr + 8, 64, Primitive, "char")
            return this.__CallerNameProxyArray
        }
    }
}
