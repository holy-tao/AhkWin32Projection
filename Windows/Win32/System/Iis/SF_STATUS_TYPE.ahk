#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct SF_STATUS_TYPE {
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
    static SF_STATUS_REQ_FINISHED => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static SF_STATUS_REQ_FINISHED_KEEP_CONN => 134217729

    /**
     * @type {Integer (Int32)}
     */
    static SF_STATUS_REQ_NEXT_NOTIFICATION => 134217730

    /**
     * @type {Integer (Int32)}
     */
    static SF_STATUS_REQ_HANDLED_NOTIFICATION => 134217731

    /**
     * @type {Integer (Int32)}
     */
    static SF_STATUS_REQ_ERROR => 134217732

    /**
     * @type {Integer (Int32)}
     */
    static SF_STATUS_REQ_READ_NEXT => 134217733
}
