#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DECIMAL.ahk

/**
 * An optional type description used with WS_DECIMAL_TYPE. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_decimal_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DECIMAL_DESCRIPTION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The minimum value.
     * @type {DECIMAL}
     */
    minValue{
        get {
            if(!this.HasProp("__minValue"))
                this.__minValue := DECIMAL(this.ptr + 0)
            return this.__minValue
        }
    }

    /**
     * The maximum value.
     * @type {DECIMAL}
     */
    maxValue{
        get {
            if(!this.HasProp("__maxValue"))
                this.__maxValue := DECIMAL(this.ptr + 16)
            return this.__maxValue
        }
    }
}
