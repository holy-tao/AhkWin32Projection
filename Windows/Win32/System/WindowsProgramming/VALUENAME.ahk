#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct VALUENAME {
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
    static VALUENAME_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static VALUENAME_ENTERPRISE_DEFINED_CLASS_ID => 1

    /**
     * @type {Integer (Int32)}
     */
    static VALUENAME_BUILT_IN_LIST => 2
}
