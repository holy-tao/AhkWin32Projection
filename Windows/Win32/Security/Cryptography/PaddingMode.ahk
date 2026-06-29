#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PaddingMode {
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
    static None => 1

    /**
     * @type {Integer (Int32)}
     */
    static PKCS7 => 2

    /**
     * @type {Integer (Int32)}
     */
    static Zeros => 3

    /**
     * @type {Integer (Int32)}
     */
    static ANSIX923 => 4

    /**
     * @type {Integer (Int32)}
     */
    static ISO10126 => 5
}
