#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECURITY_PACKAGE_OPTIONS_TYPE {
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
    static SECPKG_OPTIONS_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_OPTIONS_TYPE_LSA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_OPTIONS_TYPE_SSPI => 2
}
