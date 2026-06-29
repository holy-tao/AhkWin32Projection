#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_TYPE.ahk" { EAP_TYPE }

/**
 * Contains type, identification, and author information about an EAP method.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_TYPE {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_type">EAP_TYPE</a> structure that contains the ID for the EAP method as well as specific vendor information.
     */
    eapType : EAP_TYPE

    /**
     * The numeric ID for the author of the EAP method.
     */
    dwAuthorId : UInt32

}
