#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An optional type description used with WS_UINT64_TYPE to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_uint64_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_UINT64_DESCRIPTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The minimum value.
     * @type {Integer}
     */
    minValue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum value.
     * @type {Integer}
     */
    maxValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
