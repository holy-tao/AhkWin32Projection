#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechRuleAttributes {
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
    static SRATopLevel => 1

    /**
     * @type {Integer (Int32)}
     */
    static SRADefaultToActive => 2

    /**
     * @type {Integer (Int32)}
     */
    static SRAExport => 4

    /**
     * @type {Integer (Int32)}
     */
    static SRAImport => 8

    /**
     * @type {Integer (Int32)}
     */
    static SRAInterpreter => 16

    /**
     * @type {Integer (Int32)}
     */
    static SRADynamic => 32

    /**
     * @type {Integer (Int32)}
     */
    static SRARoot => 64
}
