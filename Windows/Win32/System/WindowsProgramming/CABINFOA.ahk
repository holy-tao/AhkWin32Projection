#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 * @charset ANSI
 */
class CABINFOA extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * @type {Pointer<PSTR>}
     */
    pszCab {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PSTR>}
     */
    pszInf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PSTR>}
     */
    pszSection {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {String}
     */
    szSrcPath {
        get => StrGet(this.ptr + 24, 259, "UTF-8")
        set => StrPut(value, this.ptr + 24, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }
}
