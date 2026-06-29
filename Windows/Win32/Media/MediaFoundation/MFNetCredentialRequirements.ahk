#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how the credential manager should obtain user credentials.
 * @remarks
 * The application implements the credential manager, which must expose the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredentialmanager">IMFNetCredentialManager</a> interface. If the <b>REQUIRE_PROMPT</b> flag is set, the credential manager should prompt the user for his or her name and password.
 * 
 * The credential cache object sets the <b>REQUIRE_PROMPT</b> flag if the cache does not yet contain valid credentials. It also sets this flag if the credentials will be sent as plain text, unless the credential manager previously set the <b>MFNET_CREDENTIAL_ALLOW_CLEAR_TEXT</b> option. (See <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfnetcredentialcache-setuseroptions">IMFNetCredentialCache::SetUserOptions</a>.)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfnetcredentialrequirements
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFNetCredentialRequirements {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The credential manager should prompt the user to provide the credentials.
     * @type {Integer (Int32)}
     */
    static REQUIRE_PROMPT => 1

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * The credentials are saved to persistent storage. This flag acts as a hint for the application's UI. If the application prompts the user for credentials, the UI can indicate that the credentials have already been saved.
     * @type {Integer (Int32)}
     */
    static REQUIRE_SAVE_SELECTED => 2
}
