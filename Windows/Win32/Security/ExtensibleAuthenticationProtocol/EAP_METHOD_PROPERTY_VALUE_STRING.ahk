#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the string value of an EAP method property.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_property_value_string
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_PROPERTY_VALUE_STRING {
    #StructPack 8

    /**
     * The size, in bytes, of <b>value</b>.
     */
    length : UInt32

    /**
     * Pointer to a byte buffer than contains the data value of an EAP method property.
     */
    value : IntPtr

}
