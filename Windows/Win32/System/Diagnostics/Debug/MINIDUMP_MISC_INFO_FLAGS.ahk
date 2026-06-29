#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_MISC_INFO_FLAGS {
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
    static MINIDUMP_MISC1_PROCESS_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_MISC1_PROCESS_TIMES => 2
}
