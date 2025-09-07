#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class SWbemRpnConst extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    m_pszStrVal{
        get {
            if(!this.HasProp("__m_pszStrVal"))
                this.__m_pszStrVal := PWSTR(this.ptr + 0)
            return this.__m_pszStrVal
        }
    }

    /**
     * @type {Integer}
     */
    m_bBoolVal {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    m_lLongVal {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    m_uLongVal {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Float}
     */
    m_dblVal {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    m_lVal64 {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    m_uVal64 {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
