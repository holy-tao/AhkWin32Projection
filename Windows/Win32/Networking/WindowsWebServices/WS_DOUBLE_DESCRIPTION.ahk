#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An optional type description used with WS_DOUBLE_TYPE. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_double_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DOUBLE_DESCRIPTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The minimum value.
     * @type {Float}
     */
    minValue {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The maximum value.
     * @type {Float}
     */
    maxValue {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }
}
