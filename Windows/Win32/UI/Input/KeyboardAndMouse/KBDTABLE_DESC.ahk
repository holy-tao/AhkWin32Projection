#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class KBDTABLE_DESC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * @type {String}
     */
    wszDllName {
        get => StrGet(this.ptr + 0, 31, "UTF-16")
        set => StrPut(value, this.ptr + 0, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    dwSubType {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
