#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_PRIVATE_KEY_CHOICE {
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
    static PVK_TYPE_FILE_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PVK_TYPE_KEYCONTAINER => 2
}
