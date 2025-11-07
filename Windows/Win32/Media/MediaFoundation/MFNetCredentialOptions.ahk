#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes options for the caching network credentials.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfnetcredentialoptions
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFNetCredentialOptions{

    /**
     * Allow the credential cache object to save  credentials in persistant storage.
     * @type {Integer (Int32)}
     */
    static MFNET_CREDENTIAL_SAVE => 1

    /**
     * Do not allow the credential cache object to cache the credentials in memory. This flag cannot be combined with the MFNET_CREDENTIAL_SAVE flag.
     * @type {Integer (Int32)}
     */
    static MFNET_CREDENTIAL_DONT_CACHE => 2

    /**
     * The user allows credentials to be sent over the network in clear text.
     * 
     *  By default, <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfnetcredentialcache-getcredential">IMFNetCredentialCache::GetCredential</a> always returns the REQUIRE_PROMPT flag when the authentication flags include MFNET_AUTHENTICATION_CLEAR_TEXT, even if cached credentials are available. If you set the MFNET_CREDENTIAL_ALLOW_CLEAR_TEXT option, the <b>GetCredential</b> method will not return  REQUIRE_PROMPT for clear text, if cached credentials are available.
     * 
     * Do not set this flag without notifying the user that credentials might be sent in clear text.
     * @type {Integer (Int32)}
     */
    static MFNET_CREDENTIAL_ALLOW_CLEAR_TEXT => 4
}
