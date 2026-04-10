#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\IO_PRIORITY_HINT.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class FILE_IO_PRIORITY_HINT_INFORMATION_EX extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {IO_PRIORITY_HINT}
     */
    PriorityHint {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    BoostOutstanding {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
