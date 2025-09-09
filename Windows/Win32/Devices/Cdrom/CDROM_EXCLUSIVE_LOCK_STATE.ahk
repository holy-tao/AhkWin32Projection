#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_EXCLUSIVE_LOCK_STATE extends Win32Struct
{
    static sizeof => 65

    static packingSize => 1

    /**
     * @type {Integer}
     */
    LockState {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    CallerName{
        get {
            if(!this.HasProp("__CallerNameProxyArray"))
                this.__CallerNameProxyArray := Win32FixedArray(this.ptr + 1, 64, Primitive, "char")
            return this.__CallerNameProxyArray
        }
    }
}
