#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class XML_ERROR extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    _nLine {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BSTR}
     */
    _pchBuf{
        get {
            if(!this.HasProp("___pchBuf"))
                this.___pchBuf := BSTR(8, this)
            return this.___pchBuf
        }
    }

    /**
     * @type {Integer}
     */
    _cchBuf {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    _ich {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {BSTR}
     */
    _pszFound{
        get {
            if(!this.HasProp("___pszFound"))
                this.___pszFound := BSTR(24, this)
            return this.___pszFound
        }
    }

    /**
     * @type {BSTR}
     */
    _pszExpected{
        get {
            if(!this.HasProp("___pszExpected"))
                this.___pszExpected := BSTR(32, this)
            return this.___pszExpected
        }
    }

    /**
     * @type {Integer}
     */
    _reserved1 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    _reserved2 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
