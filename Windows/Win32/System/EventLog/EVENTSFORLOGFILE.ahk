#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EVENTLOGRECORD.ahk

/**
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVENTSFORLOGFILE extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    szLogicalLogFile {
        get => StrGet(this.ptr + 4, 255, "UTF-16")
        set => StrPut(value, this.ptr + 4, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    ulNumRecords {
        get => NumGet(this, 516, "uint")
        set => NumPut("uint", value, this, 516)
    }

    /**
     * @type {Array<EVENTLOGRECORD>}
     */
    pEventLogRecords{
        get {
            if(!this.HasProp("__pEventLogRecordsProxyArray"))
                this.__pEventLogRecordsProxyArray := Win32FixedArray(this.ptr + 520, 8, EVENTLOGRECORD, "")
            return this.__pEventLogRecordsProxyArray
        }
    }
}
