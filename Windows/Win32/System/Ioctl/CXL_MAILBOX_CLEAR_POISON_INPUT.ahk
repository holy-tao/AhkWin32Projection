#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_CLEAR_POISON_INPUT extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ClearPoisonPhysicalAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    ClearPoisonWriteData {
        get {
            if(!this.HasProp("__ClearPoisonWriteDataProxyArray"))
                this.__ClearPoisonWriteDataProxyArray := Win32FixedArray(this.ptr + 8, 64, Primitive, "char")
            return this.__ClearPoisonWriteDataProxyArray
        }
    }
}
