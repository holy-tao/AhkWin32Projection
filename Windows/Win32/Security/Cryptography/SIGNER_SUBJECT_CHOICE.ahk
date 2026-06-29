#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_SUBJECT_CHOICE {
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
    static SIGNER_SUBJECT_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_SUBJECT_BLOB => 2
}
