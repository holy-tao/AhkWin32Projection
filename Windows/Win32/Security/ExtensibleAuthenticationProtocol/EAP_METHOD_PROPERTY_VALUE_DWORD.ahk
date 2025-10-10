#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the DWORD value of an EAP method property.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ns-eaptypes-eap_method_property_value_dword
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_METHOD_PROPERTY_VALUE_DWORD extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size, in bytes, of <b>value</b>.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A DWORD value of the method property.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
