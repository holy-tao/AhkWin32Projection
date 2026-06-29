#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_SINK_WRITER_CONSTANTS {
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
    static MF_SINK_WRITER_INVALID_STREAM_INDEX => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MF_SINK_WRITER_ALL_STREAMS => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static MF_SINK_WRITER_MEDIASINK => 4294967295
}
