#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFP_EVENT_HEADER.ahk

/**
 * Event structure for the MFP_EVENT_TYPE_ACQUIRE_USER_CREDENTIAL event.
 * @remarks
 * 
  * To get a pointer to this structure, cast the <i>pEventHeader</i>parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a>  callback method.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_acquire_user_credential_event">MFP_GET_ACQUIRE_USER_CREDENTIAL_EVENT</a> macro for this purpose.
  * 
  * If the <b>flags</b> member contains the <b>MFP_CREDENTIAL_PROMPT</b> flag, the application should do the following:
  * 
  * <ol>
  * <li>Prompt the user to enter a user name and password.</li>
  * <li>Store the user name in the credentials object by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfnetcredential-setuser">IMFNetCredential::SetUser</a> on the <b>pCredential</b> pointer.</li>
  * <li>Store the password by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfnetcredential-setpassword">IMFNetCredential::SetPassword</a> on the <b>pCredential</b> pointer.</li>
  * </ol>
  * To cancel authentication, set <b>fProceedWithAuthentication</b> equal to <b>FALSE</b>.
  * 
  * By default, MFPlay uses the network source's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredentialmanager">IMFNetCredentialManager</a> to manage credentials. An application can provide its own implementation of this interface as follows:
  * 
  * <ol>
  * <li>Call <b>QueryInterface</b> on the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> pointer to get the <b>IPropertyStore</b> interface.</li>
  * <li>Call <b>IPropertyStore::SetValue</b> to set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfnetsource-credential-manager-property">MFNETSOURCE_CREDENTIAL_MANAGER</a> property.</li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/ns-mfplay-mfp_acquire_user_credential_event
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFP_ACQUIRE_USER_CREDENTIAL_EVENT extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure that contains data common to all <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> events.
     * @type {MFP_EVENT_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := MFP_EVENT_HEADER(0, this)
            return this.__header
        }
    }

    /**
     * Application-defined user data for the media item. This value is specified when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl">IMFPMediaPlayer::CreateMediaItemFromURL</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject">IMFPMediaPlayer::CreateMediaItemFromObject</a> to create the media item.
     * 
     * This event is sent (if at all) before the media item is created and before the application receives the <b>MFP_EVENT_TYPE_MEDIAITEM_CREATED</b> event. You can use the value of <b>dwUserData</b> to identify which media item requires authentication.
     * @type {Pointer}
     */
    dwUserData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The application should set this member to either <b>TRUE</b> or <b>FALSE</b> before returning from the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> event callback. 
     * 
     * If the value is <b>TRUE</b> when the callback returns, MFPlay continues the authentication attempt. Otherwise, authentication fails.
     * @type {BOOL}
     */
    fProceedWithAuthentication {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * The response code of the authentication challenge.
     * @type {HRESULT}
     */
    hrAuthenticationStatus {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * The original URL that requires authentication.
     * @type {PWSTR}
     */
    pwszURL {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The name of the site or proxy that requires authentication.
     * @type {PWSTR}
     */
    pwszSite {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The name of the realm for this authentication.
     * @type {PWSTR}
     */
    pwszRealm {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The name of the authentication package, such as "Digest" or "MBS_BASIC".
     * @type {PWSTR}
     */
    pwszPackage {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The number of retries. This member is set to zero on the first attempt, and incremented once for each subsequent attempt.
     * @type {Integer}
     */
    nRetries {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfplay/ne-mfplay-_mfp_credential_flags">_MFP_CREDENTIAL_FLAGS</a> enumeration.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredential">IMFNetCredential</a> interface. The application uses this interface to set the user's credentials.
     * @type {IMFNetCredential}
     */
    pCredential {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
