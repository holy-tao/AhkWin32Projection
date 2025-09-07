#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class LIGATURE3 extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

    /**
     * @type {Integer}
     */
    VirtualKey {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ModificationNumber {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {String}
     */
    wch {
        get => StrGet(this.ptr + 4, 2, "UTF-16")
        set => StrPut(value, this.ptr + 4, 2, "UTF-16")
    }
}
