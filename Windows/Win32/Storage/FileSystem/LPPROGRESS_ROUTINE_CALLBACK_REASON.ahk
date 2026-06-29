#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct LPPROGRESS_ROUTINE_CALLBACK_REASON {
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
    static CALLBACK_CHUNK_FINISHED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CALLBACK_STREAM_SWITCH => 1
}
