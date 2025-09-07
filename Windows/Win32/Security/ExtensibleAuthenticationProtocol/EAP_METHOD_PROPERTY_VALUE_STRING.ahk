#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the string value of an EAP method property.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_property_value_string
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_METHOD_PROPERTY_VALUE_STRING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of <b>value</b>.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a byte buffer than contains the data value of an EAP method property.
     * @type {Pointer<Byte>}
     */
    value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
