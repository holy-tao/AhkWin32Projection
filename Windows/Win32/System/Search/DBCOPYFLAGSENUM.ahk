#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBCOPYFLAGSENUM {
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
    static DBCOPY_ASYNC => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBCOPY_REPLACE_EXISTING => 512

    /**
     * @type {Integer (Int32)}
     */
    static DBCOPY_ALLOW_EMULATION => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DBCOPY_NON_RECURSIVE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DBCOPY_ATOMIC => 4096
}
