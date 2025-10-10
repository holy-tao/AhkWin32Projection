#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides serialization information about a single value that is part of an enumeration (WS_ENUM_DESCRIPTION).
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_enum_value
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ENUM_VALUE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The numeric enum value.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The serialized form of the value.
     * @type {Pointer<WS_XML_STRING>}
     */
    name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
