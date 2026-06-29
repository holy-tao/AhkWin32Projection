#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechRecognizerState {
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
    static SRSInactive => 0

    /**
     * @type {Integer (Int32)}
     */
    static SRSActive => 1

    /**
     * @type {Integer (Int32)}
     */
    static SRSActiveAlways => 2

    /**
     * @type {Integer (Int32)}
     */
    static SRSInactiveWithPurge => 3
}
