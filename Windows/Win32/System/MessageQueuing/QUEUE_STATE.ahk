#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class QUEUE_STATE{

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
