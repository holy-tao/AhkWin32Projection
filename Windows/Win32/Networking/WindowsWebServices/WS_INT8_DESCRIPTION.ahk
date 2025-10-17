#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An optional type description used with WS_INT8_TYPE to specify constraints on the set of values which can be deserialized.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_int8_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_INT8_DESCRIPTION extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * The minimum value.
     * @type {CHAR}
     */
    minValue {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The maximum value.
     * @type {CHAR}
     */
    maxValue {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
