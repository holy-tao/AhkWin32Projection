#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechObjectToken {
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
    static DISPID_SOTId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTDataKey => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTCategory => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTGetDescription => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTSetId => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTGetAttribute => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTCreateInstance => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTRemove => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTGetStorageFileName => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTRemoveStorageFileName => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTIsUISupported => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTDisplayUI => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTMatchesAttributes => 13
}
