#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COMPLUS_APPTYPE.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class CLSIDDATA2 extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Guid}
     */
    m_clsid {
        get {
            if(!this.HasProp("__m_clsid"))
                this.__m_clsid := Guid(0, this)
            return this.__m_clsid
        }
    }

    /**
     * @type {Guid}
     */
    m_appid {
        get {
            if(!this.HasProp("__m_appid"))
                this.__m_appid := Guid(16, this)
            return this.__m_appid
        }
    }

    /**
     * @type {Guid}
     */
    m_partid {
        get {
            if(!this.HasProp("__m_partid"))
                this.__m_partid := Guid(32, this)
            return this.__m_partid
        }
    }

    /**
     * @type {PWSTR}
     */
    m_pwszAppName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {PWSTR}
     */
    m_pwszCtxName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {COMPLUS_APPTYPE}
     */
    m_eAppType {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    m_cReferences {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    m_cBound {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    m_cPooled {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    m_cInCall {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    m_dwRespTime {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    m_cCallsCompleted {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    m_cCallsFailed {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }
}
