#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_TIMESPAN.ahk

/**
 * This type description is used with WS_TIMESPAN_TYPE and is optional. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_timespan_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TIMESPAN_DESCRIPTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The minimum value.
     * @type {WS_TIMESPAN}
     */
    minValue{
        get {
            if(!this.HasProp("__minValue"))
                this.__minValue := WS_TIMESPAN(0, this)
            return this.__minValue
        }
    }

    /**
     * The maximum value.
     * @type {WS_TIMESPAN}
     */
    maxValue{
        get {
            if(!this.HasProp("__maxValue"))
                this.__maxValue := WS_TIMESPAN(8, this)
            return this.__maxValue
        }
    }
}
