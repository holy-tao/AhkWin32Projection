#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FD_FLAGS {
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
    static FD_CLSID => 1

    /**
     * @type {Integer (Int32)}
     */
    static FD_SIZEPOINT => 2

    /**
     * @type {Integer (Int32)}
     */
    static FD_ATTRIBUTES => 4

    /**
     * @type {Integer (Int32)}
     */
    static FD_CREATETIME => 8

    /**
     * @type {Integer (Int32)}
     */
    static FD_ACCESSTIME => 16

    /**
     * @type {Integer (Int32)}
     */
    static FD_WRITESTIME => 32

    /**
     * @type {Integer (Int32)}
     */
    static FD_FILESIZE => 64

    /**
     * @type {Integer (Int32)}
     */
    static FD_PROGRESSUI => 16384

    /**
     * @type {Integer (Int32)}
     */
    static FD_LINKUI => 32768

    /**
     * @type {Integer (Int32)}
     */
    static FD_UNICODE => -2147483648
}
