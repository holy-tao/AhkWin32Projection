#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsPortPosition {
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
    static NTMS_PORTPOSITION_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PORTPOSITION_EXTENDED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PORTPOSITION_RETRACTED => 2
}
