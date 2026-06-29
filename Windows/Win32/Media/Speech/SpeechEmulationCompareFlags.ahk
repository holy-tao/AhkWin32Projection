#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechEmulationCompareFlags {
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
    static SECFIgnoreCase => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECFIgnoreKanaType => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SECFIgnoreWidth => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SECFNoSpecialChars => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static SECFEmulateResult => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static SECFDefault => 196609
}
