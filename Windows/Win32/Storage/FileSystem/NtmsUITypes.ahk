#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsUITypes {
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
    static NTMS_UITYPE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_UITYPE_INFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_UITYPE_REQ => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_UITYPE_ERR => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_UITYPE_MAX => 4
}
