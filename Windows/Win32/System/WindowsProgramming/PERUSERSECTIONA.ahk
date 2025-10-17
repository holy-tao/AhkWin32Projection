#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 * @charset ANSI
 */
class PERUSERSECTIONA extends Win32Struct
{
    static sizeof => 1408

    static packingSize => 4

    /**
     * @type {String}
     */
    szGUID {
        get => StrGet(this.ptr + 0, 58, "UTF-8")
        set => StrPut(value, this.ptr + 0, 58, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDispName {
        get => StrGet(this.ptr + 59, 127, "UTF-8")
        set => StrPut(value, this.ptr + 59, 127, "UTF-8")
    }

    /**
     * @type {String}
     */
    szLocale {
        get => StrGet(this.ptr + 187, 9, "UTF-8")
        set => StrPut(value, this.ptr + 187, 9, "UTF-8")
    }

    /**
     * @type {String}
     */
    szStub {
        get => StrGet(this.ptr + 197, 1039, "UTF-8")
        set => StrPut(value, this.ptr + 197, 1039, "UTF-8")
    }

    /**
     * @type {String}
     */
    szVersion {
        get => StrGet(this.ptr + 1237, 31, "UTF-8")
        set => StrPut(value, this.ptr + 1237, 31, "UTF-8")
    }

    /**
     * @type {String}
     */
    szCompID {
        get => StrGet(this.ptr + 1269, 127, "UTF-8")
        set => StrPut(value, this.ptr + 1269, 127, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwIsInstalled {
        get => NumGet(this, 1400, "uint")
        set => NumPut("uint", value, this, 1400)
    }

    /**
     * @type {BOOL}
     */
    bRollback {
        get => NumGet(this, 1404, "int")
        set => NumPut("int", value, this, 1404)
    }
}
