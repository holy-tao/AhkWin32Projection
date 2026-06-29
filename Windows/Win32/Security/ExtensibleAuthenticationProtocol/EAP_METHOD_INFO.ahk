#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_METHOD_TYPE.ahk" { EAP_METHOD_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\EAP_TYPE.ahk" { EAP_TYPE }

/**
 * Contains information about an EAP method. (EAP_METHOD_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_info
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_INFO {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that identifies the EAP method.
     */
    eaptype : EAP_METHOD_TYPE

    /**
     * Pointer to a zero-terminated Unicode string that contains the name of the EAP method's author.
     */
    pwszAuthorName : PWSTR

    /**
     * Pointer to a zero-terminated Unicode string that contains the display name of the EAP method.
     */
    pwszFriendlyName : PWSTR

    /**
     * Set of flags that describe specific properties of the EAP method. For flag descriptions, see [EAP Method Properties](/windows/win32/eaphost/eap-method-properties).
     */
    eapProperties : UInt32

    /**
     * Pointer to an <b>EAP_METHOD_INFO</b> structure that contains information about the inner method.
     */
    pInnerMethodInfo : EAP_METHOD_INFO.Ptr

}
