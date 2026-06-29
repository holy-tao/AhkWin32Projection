#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_CONTROL_STORE_FLAGS {
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
    static CERT_STORE_CTRL_COMMIT_FORCE_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_CTRL_COMMIT_CLEAR_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_CTRL_INHIBIT_DUPLICATE_HANDLE_FLAG => 1
}
