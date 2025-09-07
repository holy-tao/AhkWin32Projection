#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 * @charset Unicode
 */
class PERUSERSECTIONW extends Win32Struct
{
    static sizeof => 2804

    static packingSize => 4

    /**
     * @type {String}
     */
    szGUID {
        get => StrGet(this.ptr + 0, 58, "UTF-16")
        set => StrPut(value, this.ptr + 0, 58, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDispName {
        get => StrGet(this.ptr + 118, 127, "UTF-16")
        set => StrPut(value, this.ptr + 118, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    szLocale {
        get => StrGet(this.ptr + 374, 9, "UTF-16")
        set => StrPut(value, this.ptr + 374, 9, "UTF-16")
    }

    /**
     * @type {String}
     */
    szStub {
        get => StrGet(this.ptr + 394, 1039, "UTF-16")
        set => StrPut(value, this.ptr + 394, 1039, "UTF-16")
    }

    /**
     * @type {String}
     */
    szVersion {
        get => StrGet(this.ptr + 2474, 31, "UTF-16")
        set => StrPut(value, this.ptr + 2474, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    szCompID {
        get => StrGet(this.ptr + 2538, 127, "UTF-16")
        set => StrPut(value, this.ptr + 2538, 127, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwIsInstalled {
        get => NumGet(this, 2796, "uint")
        set => NumPut("uint", value, this, 2796)
    }

    /**
     * @type {Integer}
     */
    bRollback {
        get => NumGet(this, 2800, "int")
        set => NumPut("int", value, this, 2800)
    }
}
