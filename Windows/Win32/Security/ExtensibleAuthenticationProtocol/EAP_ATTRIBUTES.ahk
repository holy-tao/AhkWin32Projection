#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_ATTRIBUTE.ahk" { EAP_ATTRIBUTE }

/**
 * Contains an array of EAP attributes.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_attributes
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_ATTRIBUTES {
    #StructPack 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> structures in <b>pAttribs</b>.
     */
    dwNumberOfAttributes : UInt32

    /**
     * Pointer to the address of the first element in an array of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attribute">EAP_ATTRIBUTE</a> structures. The total number of elements is specified in <b>dwNumberOfAttributes</b>.
     */
    pAttribs : EAP_ATTRIBUTE.Ptr

}
