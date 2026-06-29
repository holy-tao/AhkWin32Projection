#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsCreateOptions {
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
    static NTMS_OPEN_EXISTING => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_CREATE_NEW => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPEN_ALWAYS => 3
}
