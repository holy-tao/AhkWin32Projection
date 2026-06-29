#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct EXPORT_SECURITY_CONTEXT_FLAGS {
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
    static SECPKG_CONTEXT_EXPORT_RESET_NEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CONTEXT_EXPORT_DELETE_OLD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECPKG_CONTEXT_EXPORT_TO_KERNEL => 4
}
