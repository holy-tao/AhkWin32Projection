#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct PIDMSI_STATUS_VALUE {
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
    static PIDMSI_STATUS_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_STATUS_NEW => 1

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_STATUS_PRELIM => 2

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_STATUS_DRAFT => 3

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_STATUS_INPROGRESS => 4

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_STATUS_EDIT => 5

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_STATUS_REVIEW => 6

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_STATUS_PROOF => 7

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_STATUS_FINAL => 8

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_STATUS_OTHER => 32767
}
