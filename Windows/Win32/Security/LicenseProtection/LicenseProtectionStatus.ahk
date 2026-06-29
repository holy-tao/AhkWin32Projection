#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.LicenseProtection
 */
export default struct LicenseProtectionStatus {
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
    static Success => 0

    /**
     * @type {Integer (Int32)}
     */
    static LicenseKeyNotFound => 1

    /**
     * @type {Integer (Int32)}
     */
    static LicenseKeyUnprotected => 2

    /**
     * @type {Integer (Int32)}
     */
    static LicenseKeyCorrupted => 3

    /**
     * @type {Integer (Int32)}
     */
    static LicenseKeyAlreadyExists => 4
}
