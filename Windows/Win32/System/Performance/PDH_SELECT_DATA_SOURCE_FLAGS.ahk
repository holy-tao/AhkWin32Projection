#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct PDH_SELECT_DATA_SOURCE_FLAGS {
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
    static PDH_FLAGS_FILE_BROWSER_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FLAGS_NONE => 0
}
