#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\DATETIME.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 * @charset Unicode
 */
class IMEPROW extends Win32Struct
{
    static sizeof => 344

    static packingSize => 8

    /**
     * @type {HWND}
     */
    hWnd{
        get {
            if(!this.HasProp("__hWnd"))
                this.__hWnd := HWND(this.ptr + 0)
            return this.__hWnd
        }
    }

    /**
     * @type {DATETIME}
     */
    InstDate{
        get {
            if(!this.HasProp("__InstDate"))
                this.__InstDate := DATETIME(this.ptr + 8)
            return this.__InstDate
        }
    }

    /**
     * @type {Integer}
     */
    wVersion {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 24, 49, "UTF-16")
        set => StrPut(value, this.ptr + 24, 49, "UTF-16")
    }

    /**
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 124, 79, "UTF-16")
        set => StrPut(value, this.ptr + 124, 79, "UTF-16")
    }

    /**
     * @type {String}
     */
    szOptions {
        get => StrGet(this.ptr + 284, 29, "UTF-16")
        set => StrPut(value, this.ptr + 284, 29, "UTF-16")
    }
}
