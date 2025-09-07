#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DebugPropertyInfo extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    m_dwValidFields {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BSTR}
     */
    m_bstrName{
        get {
            if(!this.HasProp("__m_bstrName"))
                this.__m_bstrName := BSTR(this.ptr + 8)
            return this.__m_bstrName
        }
    }

    /**
     * @type {BSTR}
     */
    m_bstrType{
        get {
            if(!this.HasProp("__m_bstrType"))
                this.__m_bstrType := BSTR(this.ptr + 16)
            return this.__m_bstrType
        }
    }

    /**
     * @type {BSTR}
     */
    m_bstrValue{
        get {
            if(!this.HasProp("__m_bstrValue"))
                this.__m_bstrValue := BSTR(this.ptr + 24)
            return this.__m_bstrValue
        }
    }

    /**
     * @type {BSTR}
     */
    m_bstrFullName{
        get {
            if(!this.HasProp("__m_bstrFullName"))
                this.__m_bstrFullName := BSTR(this.ptr + 32)
            return this.__m_bstrFullName
        }
    }

    /**
     * @type {Integer}
     */
    m_dwAttrib {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<IDebugProperty>}
     */
    m_pDebugProp {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
