#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechPhraseProperty {
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
    static DISPID_SPPName => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPPId => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPPValue => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPPFirstElement => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPPNumberOfElements => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPPEngineConfidence => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPPConfidence => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPPParent => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPPChildren => 9
}
