#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechTokenShellFolder {
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
    static STSF_AppData => 26

    /**
     * @type {Integer (Int32)}
     */
    static STSF_LocalAppData => 28

    /**
     * @type {Integer (Int32)}
     */
    static STSF_CommonAppData => 35

    /**
     * @type {Integer (Int32)}
     */
    static STSF_FlagCreate => 32768
}
