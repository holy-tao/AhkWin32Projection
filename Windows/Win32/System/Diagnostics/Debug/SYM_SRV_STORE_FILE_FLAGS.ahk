#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct SYM_SRV_STORE_FILE_FLAGS {
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
    static SYMSTOREOPT_COMPRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSTOREOPT_OVERWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSTOREOPT_PASS_IF_EXISTS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSTOREOPT_POINTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSTOREOPT_RETURNINDEX => 4
}
