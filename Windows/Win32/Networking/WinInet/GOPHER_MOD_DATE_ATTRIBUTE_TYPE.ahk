#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class GOPHER_MOD_DATE_ATTRIBUTE_TYPE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {FILETIME}
     */
    DateAndTime{
        get {
            if(!this.HasProp("__DateAndTime"))
                this.__DateAndTime := FILETIME(0, this)
            return this.__DateAndTime
        }
    }
}
