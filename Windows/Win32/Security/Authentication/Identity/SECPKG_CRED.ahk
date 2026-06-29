#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_CRED {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_INBOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CRED_OUTBOUND => 2
}
