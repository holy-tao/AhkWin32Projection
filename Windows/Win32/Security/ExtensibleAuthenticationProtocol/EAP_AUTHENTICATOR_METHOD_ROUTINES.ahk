#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class EAP_AUTHENTICATOR_METHOD_ROUTINES extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The implementer defined structure version.
     * 
     * <div class="alert"><b>Note</b>  Values for this field are not defined by Microsoft.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwSizeInBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that contains the vendor information on the implementer of the APIs pointed to by this structure's members.
     * @type {Pointer<EAP_METHOD_TYPE>}
     */
    pEapType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorinitialize">EapMethodAuthenticatorInitialize</a>.
     * @type {Pointer}
     */
    EapMethodAuthenticatorInitialize {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorbeginsession">EapMethodAuthenticatorBeginSession</a>.
     * @type {Pointer}
     */
    EapMethodAuthenticatorBeginSession {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorupdateinnermethodparams">EapMethodAuthenticatorUpdateInnerMethodParams</a>.
     * @type {Pointer}
     */
    EapMethodAuthenticatorUpdateInnerMethodParams {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorreceivepacket">EapMethodAuthenticatorReceivePacket</a>.
     * @type {Pointer}
     */
    EapMethodAuthenticatorReceivePacket {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorsendpacket">EapMethodAuthenticatorSendPacket</a>.
     * @type {Pointer}
     */
    EapMethodAuthenticatorSendPacket {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorgetattributes">EapMethodAuthenticatorGetAttributes</a>.
     * @type {Pointer}
     */
    EapMethodAuthenticatorGetAttributes {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorsetattributes">EapMethodAuthenticatorSetAttributes</a>.
     * @type {Pointer}
     */
    EapMethodAuthenticatorSetAttributes {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorgetresult">EapMethodAuthenticatorGetResult</a>.
     * @type {Pointer}
     */
    EapMethodAuthenticatorGetResult {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorendsession">EapMethodAuthenticatorEndSession</a>.
     * @type {Pointer}
     */
    EapMethodAuthenticatorEndSession {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Function pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodauthenticatorapis/nf-eapmethodauthenticatorapis-eapmethodauthenticatorshutdown">EapMethodAuthenticatorShutdown</a>.
     * @type {Pointer}
     */
    EapMethodAuthenticatorShutdown {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
