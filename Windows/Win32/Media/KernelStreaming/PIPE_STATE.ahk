#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct PIPE_STATE {
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
    static PipeState_DontCare => 0

    /**
     * @type {Integer (Int32)}
     */
    static PipeState_RangeNotFixed => 1

    /**
     * @type {Integer (Int32)}
     */
    static PipeState_RangeFixed => 2

    /**
     * @type {Integer (Int32)}
     */
    static PipeState_CompressionUnknown => 3

    /**
     * @type {Integer (Int32)}
     */
    static PipeState_Finalized => 4
}
