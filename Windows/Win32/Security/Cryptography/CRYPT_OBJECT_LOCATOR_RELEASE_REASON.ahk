#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_OBJECT_LOCATOR_RELEASE_REASON {
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
    static CRYPT_OBJECT_LOCATOR_RELEASE_SYSTEM_SHUTDOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_OBJECT_LOCATOR_RELEASE_SERVICE_STOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_OBJECT_LOCATOR_RELEASE_PROCESS_EXIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_OBJECT_LOCATOR_RELEASE_DLL_UNLOAD => 4
}
