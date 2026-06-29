#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_METHOD_TYPE.ahk" { EAP_METHOD_TYPE }

/**
 * Contains a set of function pointers to the EAPHost Authenticator Method APIs.
 * @remarks
 * Every EAP authenticator method DLL must have public implementations of the following APIs on it.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorinitialize">EapMethodAuthenticatorInitialize</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorbeginsession">EapMethodAuthenticatorBeginSession</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorupdateinnermethodparams">EapMethodAuthenticatorUpdateInnerMethodParams</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorreceivepacket">EapMethodAuthenticatorReceivePacket</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorsendpacket">EapMethodAuthenticatorSendPacket</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorgetattributes">EapMethodAuthenticatorGetAttributes</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorsetattributes">EapMethodAuthenticatorSetAttributes</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorgetresult">EapMethodAuthenticatorGetResult</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorendsession">EapMethodAuthenticatorEndSession</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorshutdown">EapMethodAuthenticatorShutdown</a>
 * </li>
 * </ul>
 * These APIs are called on an EAP authenticator method when an authenticator (server) EAPHost receives a specific corresponding remote procedure call from  a peer (client) EAP method.  Note that a complete one-to-one correspondence does not exist between EAP peer methods and EAP authenticator methods; the specific EAP authenticator method API calls must be made based on the requirements of your implementation of the EAP authenticator method API calls.
 * @see https://learn.microsoft.com/windows/win32/api/eapmethodauthenticatorapis/ns-eapmethodauthenticatorapis-eap_authenticator_method_routines
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_AUTHENTICATOR_METHOD_ROUTINES {
    #StructPack 8

    /**
     * The implementer defined structure version.
     * 
     * <div class="alert"><b>Note</b>  Values for this field are not defined by Microsoft.</div>
     * <div> </div>
     */
    dwSizeInBytes : UInt32

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that contains the vendor information on the implementer of the APIs pointed to by this structure's members.
     */
    pEapType : EAP_METHOD_TYPE.Ptr

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorinitialize">EapMethodAuthenticatorInitialize</a>.
     */
    EapMethodAuthenticatorInitialize : IntPtr

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorbeginsession">EapMethodAuthenticatorBeginSession</a>.
     */
    EapMethodAuthenticatorBeginSession : IntPtr

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorupdateinnermethodparams">EapMethodAuthenticatorUpdateInnerMethodParams</a>.
     */
    EapMethodAuthenticatorUpdateInnerMethodParams : IntPtr

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorreceivepacket">EapMethodAuthenticatorReceivePacket</a>.
     */
    EapMethodAuthenticatorReceivePacket : IntPtr

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorsendpacket">EapMethodAuthenticatorSendPacket</a>.
     */
    EapMethodAuthenticatorSendPacket : IntPtr

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorgetattributes">EapMethodAuthenticatorGetAttributes</a>.
     */
    EapMethodAuthenticatorGetAttributes : IntPtr

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorsetattributes">EapMethodAuthenticatorSetAttributes</a>.
     */
    EapMethodAuthenticatorSetAttributes : IntPtr

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorgetresult">EapMethodAuthenticatorGetResult</a>.
     */
    EapMethodAuthenticatorGetResult : IntPtr

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorendsession">EapMethodAuthenticatorEndSession</a>.
     */
    EapMethodAuthenticatorEndSession : IntPtr

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorshutdown">EapMethodAuthenticatorShutdown</a>.
     */
    EapMethodAuthenticatorShutdown : IntPtr

}
