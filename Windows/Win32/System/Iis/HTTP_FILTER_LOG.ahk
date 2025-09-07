#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HTTP_FILTER_LOG extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszClientHostName{
        get {
            if(!this.HasProp("__pszClientHostName"))
                this.__pszClientHostName := PSTR(this.ptr + 0)
            return this.__pszClientHostName
        }
    }

    /**
     * @type {PSTR}
     */
    pszClientUserName{
        get {
            if(!this.HasProp("__pszClientUserName"))
                this.__pszClientUserName := PSTR(this.ptr + 8)
            return this.__pszClientUserName
        }
    }

    /**
     * @type {PSTR}
     */
    pszServerName{
        get {
            if(!this.HasProp("__pszServerName"))
                this.__pszServerName := PSTR(this.ptr + 16)
            return this.__pszServerName
        }
    }

    /**
     * @type {PSTR}
     */
    pszOperation{
        get {
            if(!this.HasProp("__pszOperation"))
                this.__pszOperation := PSTR(this.ptr + 24)
            return this.__pszOperation
        }
    }

    /**
     * @type {PSTR}
     */
    pszTarget{
        get {
            if(!this.HasProp("__pszTarget"))
                this.__pszTarget := PSTR(this.ptr + 32)
            return this.__pszTarget
        }
    }

    /**
     * @type {PSTR}
     */
    pszParameters{
        get {
            if(!this.HasProp("__pszParameters"))
                this.__pszParameters := PSTR(this.ptr + 40)
            return this.__pszParameters
        }
    }

    /**
     * @type {Integer}
     */
    dwHttpStatus {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    dwWin32Status {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    dwBytesSent {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwBytesRecvd {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    msTimeForProcessing {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
