#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HSE_SEND_HEADER_EX_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszStatus{
        get {
            if(!this.HasProp("__pszStatus"))
                this.__pszStatus := PSTR(this.ptr + 0)
            return this.__pszStatus
        }
    }

    /**
     * @type {PSTR}
     */
    pszHeader{
        get {
            if(!this.HasProp("__pszHeader"))
                this.__pszHeader := PSTR(this.ptr + 8)
            return this.__pszHeader
        }
    }

    /**
     * @type {Integer}
     */
    cchStatus {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cchHeader {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {BOOL}
     */
    fKeepConn{
        get {
            if(!this.HasProp("__fKeepConn"))
                this.__fKeepConn := BOOL(this.ptr + 24)
            return this.__fKeepConn
        }
    }
}
