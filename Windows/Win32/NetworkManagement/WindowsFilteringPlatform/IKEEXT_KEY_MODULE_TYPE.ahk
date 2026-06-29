#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of keying module.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_key_module_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_KEY_MODULE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies Internet Key Exchange (IKE) keying module.
     * @type {Integer (Int32)}
     */
    static IKEEXT_KEY_MODULE_IKE => 0

    /**
     * Specifies Authenticated Internet Protocol (AuthIP) keying module.
     * @type {Integer (Int32)}
     */
    static IKEEXT_KEY_MODULE_AUTHIP => 1

    /**
     * Specifies Internet Key Exchange version 2 (IKEv2) keying module.
     * 
     * Available only on Windows 7, Windows Server 2008 R2, and later.
     * @type {Integer (Int32)}
     */
    static IKEEXT_KEY_MODULE_IKEV2 => 2

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_KEY_MODULE_MAX => 3
}
