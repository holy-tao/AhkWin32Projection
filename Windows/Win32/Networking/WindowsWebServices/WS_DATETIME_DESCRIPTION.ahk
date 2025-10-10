#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_DATETIME.ahk

/**
 * This type description is used with WS_DATETIME_TYPE and is optional. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_datetime_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DATETIME_DESCRIPTION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The minimum value.
     * @type {WS_DATETIME}
     */
    minValue{
        get {
            if(!this.HasProp("__minValue"))
                this.__minValue := WS_DATETIME(this.ptr + 0)
            return this.__minValue
        }
    }

    /**
     * The maximum value.
     * @type {WS_DATETIME}
     */
    maxValue{
        get {
            if(!this.HasProp("__maxValue"))
                this.__maxValue := WS_DATETIME(this.ptr + 16)
            return this.__maxValue
        }
    }
}
