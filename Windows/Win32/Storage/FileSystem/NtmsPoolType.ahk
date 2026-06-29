#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsPoolType {
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
    static NTMS_POOLTYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_POOLTYPE_SCRATCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_POOLTYPE_FOREIGN => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_POOLTYPE_IMPORT => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_POOLTYPE_APPLICATION => 1000
}
