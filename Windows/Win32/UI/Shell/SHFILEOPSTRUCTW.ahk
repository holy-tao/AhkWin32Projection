#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class SHFILEOPSTRUCTW extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    hwnd {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wFunc {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Char>}
     */
    pFrom {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Char>}
     */
    pTo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    fFlags {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    fAnyOperationsAborted {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Pointer<Void>}
     */
    hNameMappings {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Char>}
     */
    lpszProgressTitle {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
