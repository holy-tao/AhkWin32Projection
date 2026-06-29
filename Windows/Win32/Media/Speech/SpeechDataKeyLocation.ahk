#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechDataKeyLocation {
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
    static SDKLDefaultLocation => 0

    /**
     * @type {Integer (Int32)}
     */
    static SDKLCurrentUser => 1

    /**
     * @type {Integer (Int32)}
     */
    static SDKLLocalMachine => 2

    /**
     * @type {Integer (Int32)}
     */
    static SDKLCurrentConfig => 5
}
