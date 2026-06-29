#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_KEY_AGREE_OPTION {
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
    static CMSG_KEY_AGREE_EPHEMERAL_KEY_CHOICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_KEY_AGREE_STATIC_KEY_CHOICE => 2
}
