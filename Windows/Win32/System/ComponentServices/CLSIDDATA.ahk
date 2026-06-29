#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class CLSIDDATA extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

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
     * @type {Integer}
     */
    m_cReferences {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    m_cBound {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    m_cPooled {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    m_cInCall {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    m_dwRespTime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    m_cCallsCompleted {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    m_cCallsFailed {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
