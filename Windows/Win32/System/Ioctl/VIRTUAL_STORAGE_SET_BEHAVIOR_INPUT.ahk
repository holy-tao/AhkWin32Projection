#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VIRTUAL_STORAGE_BEHAVIOR_CODE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class VIRTUAL_STORAGE_SET_BEHAVIOR_INPUT extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {VIRTUAL_STORAGE_BEHAVIOR_CODE}
     */
    BehaviorCode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
