#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct GLOBALOPT_RO_FLAGS {
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
    static COMGLB_STA_MODALLOOP_REMOVE_TOUCH_MESSAGES => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_STA_MODALLOOP_SHARED_QUEUE_REMOVE_INPUT_MESSAGES => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_STA_MODALLOOP_SHARED_QUEUE_DONOT_REMOVE_INPUT_MESSAGES => 4

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_FAST_RUNDOWN => 8

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_RESERVED1 => 16

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_RESERVED2 => 32

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_RESERVED3 => 64

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_STA_MODALLOOP_SHARED_QUEUE_REORDER_POINTER_MESSAGES => 128

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_RESERVED4 => 256

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_RESERVED5 => 512

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_RESERVED6 => 1024
}
