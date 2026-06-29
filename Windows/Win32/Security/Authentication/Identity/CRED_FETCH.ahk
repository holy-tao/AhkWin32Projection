#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that determine how to fetch the credential of a Group Managed Service Account (gMSA).
 * @see https://learn.microsoft.com/windows/win32/SecMgmt/cred-fetch
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct CRED_FETCH {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static CredFetchDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static CredFetchDPAPI => 1

    /**
     * @type {Integer (Int32)}
     */
    static CredFetchForced => 2
}
