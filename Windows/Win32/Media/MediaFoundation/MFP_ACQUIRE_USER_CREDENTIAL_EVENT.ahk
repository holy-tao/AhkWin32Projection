#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFPMediaPlayer.ahk" { IMFPMediaPlayer }
#Import ".\IMFNetCredential.ahk" { IMFNetCredential }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MFP_EVENT_TYPE.ahk" { MFP_EVENT_TYPE }
#Import ".\MFP_EVENT_HEADER.ahk" { MFP_EVENT_HEADER }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import ".\MFP_MEDIAPLAYER_STATE.ahk" { MFP_MEDIAPLAYER_STATE }

/**
 * Event structure for the MFP_EVENT_TYPE_ACQUIRE_USER_CREDENTIAL event.
 * @remarks
 * To get a pointer to this structure, cast the <i>pEventHeader</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a>  callback method.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_acquire_user_credential_event">MFP_GET_ACQUIRE_USER_CREDENTIAL_EVENT</a> macro for this purpose.
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
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/ns-mfplay-mfp_acquire_user_credential_event
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFP_ACQUIRE_USER_CREDENTIAL_EVENT {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure that contains data common to all <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> events.
     */
    header : MFP_EVENT_HEADER

    /**
     * Application-defined user data for the media item. This value is specified when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl">IMFPMediaPlayer::CreateMediaItemFromURL</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject">IMFPMediaPlayer::CreateMediaItemFromObject</a> to create the media item.
     * 
     * This event is sent (if at all) before the media item is created and before the application receives the <b>MFP_EVENT_TYPE_MEDIAITEM_CREATED</b> event. You can use the value of <b>dwUserData</b> to identify which media item requires authentication.
     */
    dwUserData : IntPtr

    /**
     * The application should set this member to either <b>TRUE</b> or <b>FALSE</b> before returning from the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> event callback. 
     * 
     * If the value is <b>TRUE</b> when the callback returns, MFPlay continues the authentication attempt. Otherwise, authentication fails.
     */
    fProceedWithAuthentication : BOOL

    /**
     * The response code of the authentication challenge.
     */
    hrAuthenticationStatus : HRESULT

    /**
     * The original URL that requires authentication.
     */
    pwszURL : PWSTR

    /**
     * The name of the site or proxy that requires authentication.
     */
    pwszSite : PWSTR

    /**
     * The name of the realm for this authentication.
     */
    pwszRealm : PWSTR

    /**
     * The name of the authentication package, such as "Digest" or "MBS_BASIC".
     */
    pwszPackage : PWSTR

    /**
     * The number of retries. This member is set to zero on the first attempt, and incremented once for each subsequent attempt.
     */
    nRetries : Int32

    /**
     * Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfplay/ne-mfplay-_mfp_credential_flags">_MFP_CREDENTIAL_FLAGS</a> enumeration.
     */
    flags : UInt32

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredential">IMFNetCredential</a> interface. The application uses this interface to set the user's credentials.
     */
    pCredential : IMFNetCredential

}
