#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct CONVINFO_CONVERSATION_STATE {
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
    static XST_ADVACKRCVD => 13

    /**
     * @type {Integer (UInt32)}
     */
    static XST_ADVDATAACKRCVD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static XST_ADVDATASENT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static XST_ADVSENT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static XST_CONNECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XST_DATARCVD => 6

    /**
     * @type {Integer (UInt32)}
     */
    static XST_EXECACKRCVD => 10

    /**
     * @type {Integer (UInt32)}
     */
    static XST_EXECSENT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static XST_INCOMPLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XST_INIT1 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static XST_INIT2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XST_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XST_POKEACKRCVD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XST_POKESENT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static XST_REQSENT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XST_UNADVACKRCVD => 14

    /**
     * @type {Integer (UInt32)}
     */
    static XST_UNADVSENT => 12
}
