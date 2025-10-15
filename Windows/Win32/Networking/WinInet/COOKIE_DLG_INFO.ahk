#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class COOKIE_DLG_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszServer{
        get {
            if(!this.HasProp("__pszServer"))
                this.__pszServer := PWSTR(this.ptr + 0)
            return this.__pszServer
        }
    }

    /**
     * @type {Pointer<INTERNET_COOKIE>}
     */
    pic {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwStopWarning {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    cy {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    pszHeader{
        get {
            if(!this.HasProp("__pszHeader"))
                this.__pszHeader := PWSTR(this.ptr + 32)
            return this.__pszHeader
        }
    }

    /**
     * @type {Integer}
     */
    dwOperation {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
