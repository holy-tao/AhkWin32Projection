#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ECustomDumpFlavor {
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
    static DUMP_FLAVOR_Mini => 0

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_FLAVOR_CriticalCLRState => 1

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_FLAVOR_NonHeapCLRState => 2

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_FLAVOR_Default => 0
}
