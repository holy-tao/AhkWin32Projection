#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\APPSTATISTICS.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class APPDATA extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    m_idApp {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    m_szAppGuid {
        get => StrGet(this.ptr + 4, 39, "UTF-16")
        set => StrPut(value, this.ptr + 4, 39, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    m_dwAppProcessId {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {APPSTATISTICS}
     */
    m_AppStatistics{
        get {
            if(!this.HasProp("__m_AppStatistics"))
                this.__m_AppStatistics := APPSTATISTICS(this.ptr + 88)
            return this.__m_AppStatistics
        }
    }
}
