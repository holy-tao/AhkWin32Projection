#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_SANITIZE_METHOD {
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
    static StorageSanitizeMethodDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageSanitizeMethodBlockErase => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageSanitizeMethodCryptoErase => 2
}
