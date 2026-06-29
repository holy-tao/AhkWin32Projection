#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct FTP_ACCESS {
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
    static FTP_ACCESS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FTP_ACCESS_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static FTP_ACCESS_WRITE => 2

    /**
     * @type {Integer (Int32)}
     */
    static FTP_ACCESS_READ_WRITE => 3
}
