#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechStreamFileMode {
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
    static SSFMOpenForRead => 0

    /**
     * @type {Integer (Int32)}
     */
    static SSFMOpenReadWrite => 1

    /**
     * @type {Integer (Int32)}
     */
    static SSFMCreate => 2

    /**
     * @type {Integer (Int32)}
     */
    static SSFMCreateForWrite => 3
}
