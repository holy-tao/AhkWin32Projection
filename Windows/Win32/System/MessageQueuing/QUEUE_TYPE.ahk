#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct QUEUE_TYPE {
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
    static MQ_TYPE_PUBLIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQ_TYPE_PRIVATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQ_TYPE_MACHINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MQ_TYPE_CONNECTOR => 3

    /**
     * @type {Integer (Int32)}
     */
    static MQ_TYPE_MULTICAST => 4
}
