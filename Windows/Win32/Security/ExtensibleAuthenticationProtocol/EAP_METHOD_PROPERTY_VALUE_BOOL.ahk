#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains a Boolean value of an EAP method property.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_property_value_bool
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_PROPERTY_VALUE_BOOL {
    #StructPack 4

    /**
     * The size, in bytes, of <b>value</b>.
     */
    length : UInt32

    /**
     * <b>BOOL</b> value of the method property.
     */
    value : BOOL

}
