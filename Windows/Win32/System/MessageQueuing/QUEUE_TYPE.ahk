#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class QUEUE_TYPE{

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
