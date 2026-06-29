#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechStreamSeekPositionType {
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
    static SSSPTRelativeToStart => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SSSPTRelativeToCurrentPosition => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSSPTRelativeToEnd => 2
}
