#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_EVENT_ID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_SIGNAL_LOSS => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_SIGNAL_LOCK => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_DATA_START => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_DATA_STOP => 3

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_CHANNEL_ACQUIRED => 4

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_CHANNEL_LOST => 5

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_CHANNEL_SOURCE_CHANGED => 6

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_CHANNEL_ACTIVATED => 7

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_CHANNEL_DEACTIVATED => 8

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_SUBCHANNEL_ACQUIRED => 9

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_SUBCHANNEL_LOST => 10

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_SUBCHANNEL_SOURCE_CHANGED => 11

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_SUBCHANNEL_ACTIVATED => 12

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_SUBCHANNEL_DEACTIVATED => 13

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_ACCESS_GRANTED => 14

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_ACCESS_DENIED => 15

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_OFFER_EXTENDED => 16

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_PURCHASE_COMPLETED => 17

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_SMART_CARD_INSERTED => 18

    /**
     * @type {Integer (Int32)}
     */
    static BDA_EVENT_SMART_CARD_REMOVED => 19
}
