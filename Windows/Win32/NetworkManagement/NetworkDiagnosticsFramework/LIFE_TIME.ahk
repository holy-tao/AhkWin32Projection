#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The LIFE_TIME structure contains a start time and an end time.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-life_time
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class LIFE_TIME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>FILETIME</b>
     * 
     * The time the problem instance began.
     * @type {FILETIME}
     */
    startTime{
        get {
            if(!this.HasProp("__startTime"))
                this.__startTime := FILETIME(0, this)
            return this.__startTime
        }
    }

    /**
     * Type: <b>FILETIME</b>
     * 
     * The time the problem instance ended.
     * @type {FILETIME}
     */
    endTime{
        get {
            if(!this.HasProp("__endTime"))
                this.__endTime := FILETIME(8, this)
            return this.__endTime
        }
    }
}
