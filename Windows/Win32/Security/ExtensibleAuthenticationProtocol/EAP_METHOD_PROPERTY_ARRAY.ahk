#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_METHOD_PROPERTY.ahk" { EAP_METHOD_PROPERTY }

/**
 * Contains an array of EAP method properties.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_property_array
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_PROPERTY_ARRAY {
    #StructPack 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property">EAP_METHOD_PROPERTY</a> structures in <b>pMethodProperty</b>.
     */
    dwNumberOfProperties : UInt32

    /**
     * Pointer to the address of the first element in an array of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property">EAP_METHOD_PROPERTY</a> structures. The total number of elements is specified in <b>dwNumberOfProperties</b>.
     */
    pMethodProperty : EAP_METHOD_PROPERTY.Ptr

}
