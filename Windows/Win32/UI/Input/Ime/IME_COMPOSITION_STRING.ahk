#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IME_COMPOSITION_STRING {
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
    static GCS_COMPREADSTR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GCS_COMPREADATTR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GCS_COMPREADCLAUSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GCS_COMPSTR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GCS_COMPATTR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GCS_COMPCLAUSE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GCS_CURSORPOS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GCS_DELTASTART => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GCS_RESULTREADSTR => 512

    /**
     * @type {Integer (UInt32)}
     */
    static GCS_RESULTREADCLAUSE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static GCS_RESULTSTR => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static GCS_RESULTCLAUSE => 4096
}
