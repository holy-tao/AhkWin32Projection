#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_THREAD_INFO_DUMP_FLAGS {
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
    static MINIDUMP_THREAD_INFO_ERROR_THREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_THREAD_INFO_EXITED_THREAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_THREAD_INFO_INVALID_CONTEXT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_THREAD_INFO_INVALID_INFO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_THREAD_INFO_INVALID_TEB => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_THREAD_INFO_WRITING_THREAD => 2
}
