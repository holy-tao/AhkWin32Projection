#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct XACT_STATUS {
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
    static MQ_XACT_STATUS_XACT => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQ_XACT_STATUS_NOT_XACT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQ_XACT_STATUS_UNKNOWN => 2
}
