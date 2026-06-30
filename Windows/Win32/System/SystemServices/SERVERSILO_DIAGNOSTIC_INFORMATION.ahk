#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class SERVERSILO_DIAGNOSTIC_INFORMATION extends Win32Struct {
    static sizeof => 52

    static packingSize => 4

    /**
     * @type {Guid}
     */
    ReportId {
        get {
            if(!this.HasProp("__ReportId"))
                this.__ReportId := Guid(0, this)
            return this.__ReportId
        }
    }

    /**
     * @type {Integer}
     */
    ExitStatus {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    CriticalProcessName {
        get => StrGet(this.ptr + 20, 14, "UTF-16")
        set => StrPut(value, this.ptr + 20, 14, "UTF-16")
    }
}
