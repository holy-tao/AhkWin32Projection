#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_SNAPSHOT_INFO {
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
    static COR_PRF_SNAPSHOT_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SNAPSHOT_REGISTER_CONTEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SNAPSHOT_X86_OPTIMIZED => 2
}
