#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct QUEUE_STATE {
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
    static MQ_QUEUE_STATE_LOCAL_CONNECTION => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQ_QUEUE_STATE_DISCONNECTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQ_QUEUE_STATE_WAITING => 2

    /**
     * @type {Integer (Int32)}
     */
    static MQ_QUEUE_STATE_NEEDVALIDATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static MQ_QUEUE_STATE_ONHOLD => 4

    /**
     * @type {Integer (Int32)}
     */
    static MQ_QUEUE_STATE_NONACTIVE => 5

    /**
     * @type {Integer (Int32)}
     */
    static MQ_QUEUE_STATE_CONNECTED => 6

    /**
     * @type {Integer (Int32)}
     */
    static MQ_QUEUE_STATE_DISCONNECTING => 7

    /**
     * @type {Integer (Int32)}
     */
    static MQ_QUEUE_STATE_LOCKED => 8
}
