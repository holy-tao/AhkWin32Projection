#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\EAP_ATTRIBUTES.ahk" { EAP_ATTRIBUTES }

/**
 * Contains authentication results returned by an EAP authenticator method.
 * @see https://learn.microsoft.com/windows/win32/api/eapauthenticatoractiondefine/ns-eapauthenticatoractiondefine-eap_method_authenticator_result
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_AUTHENTICATOR_RESULT {
    #StructPack 8

    /**
     * If <b>TRUE</b>, the supplicant was successfully authenticated; if <b>FALSE</b>, it was not.
     */
    fIsSuccess : BOOL

    /**
     * Contains a reason code if the supplicant could not be authenticated. Reason codes are generally expected to originate from winerror.h.
     */
    dwFailureReason : UInt32

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attributes">EAP_ATTRIBUTES</a> structure that contains the EAP attributes  returned by the authentication session.
     */
    pAuthAttribs : EAP_ATTRIBUTES.Ptr

}
