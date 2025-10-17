#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class LIFE_TIME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
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
