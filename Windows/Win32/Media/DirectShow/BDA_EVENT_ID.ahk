#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_EVENT_ID extends Win32Enum {

    /**
     * Native name: BDA_EVENT_SIGNAL_LOSS
     * @type {Integer (Int32)}
     */
    static SIGNAL_LOSS => 0

    /**
     * Native name: BDA_EVENT_SIGNAL_LOCK
     * @type {Integer (Int32)}
     */
    static SIGNAL_LOCK => 1

    /**
     * Native name: BDA_EVENT_DATA_START
     * @type {Integer (Int32)}
     */
    static DATA_START => 2

    /**
     * Native name: BDA_EVENT_DATA_STOP
     * @type {Integer (Int32)}
     */
    static DATA_STOP => 3

    /**
     * Native name: BDA_EVENT_CHANNEL_ACQUIRED
     * @type {Integer (Int32)}
     */
    static CHANNEL_ACQUIRED => 4

    /**
     * Native name: BDA_EVENT_CHANNEL_LOST
     * @type {Integer (Int32)}
     */
    static CHANNEL_LOST => 5

    /**
     * Native name: BDA_EVENT_CHANNEL_SOURCE_CHANGED
     * @type {Integer (Int32)}
     */
    static CHANNEL_SOURCE_CHANGED => 6

    /**
     * Native name: BDA_EVENT_CHANNEL_ACTIVATED
     * @type {Integer (Int32)}
     */
    static CHANNEL_ACTIVATED => 7

    /**
     * Native name: BDA_EVENT_CHANNEL_DEACTIVATED
     * @type {Integer (Int32)}
     */
    static CHANNEL_DEACTIVATED => 8

    /**
     * Native name: BDA_EVENT_SUBCHANNEL_ACQUIRED
     * @type {Integer (Int32)}
     */
    static SUBCHANNEL_ACQUIRED => 9

    /**
     * Native name: BDA_EVENT_SUBCHANNEL_LOST
     * @type {Integer (Int32)}
     */
    static SUBCHANNEL_LOST => 10

    /**
     * Native name: BDA_EVENT_SUBCHANNEL_SOURCE_CHANGED
     * @type {Integer (Int32)}
     */
    static SUBCHANNEL_SOURCE_CHANGED => 11

    /**
     * Native name: BDA_EVENT_SUBCHANNEL_ACTIVATED
     * @type {Integer (Int32)}
     */
    static SUBCHANNEL_ACTIVATED => 12

    /**
     * Native name: BDA_EVENT_SUBCHANNEL_DEACTIVATED
     * @type {Integer (Int32)}
     */
    static SUBCHANNEL_DEACTIVATED => 13

    /**
     * Native name: BDA_EVENT_ACCESS_GRANTED
     * @type {Integer (Int32)}
     */
    static ACCESS_GRANTED => 14

    /**
     * Native name: BDA_EVENT_ACCESS_DENIED
     * @type {Integer (Int32)}
     */
    static ACCESS_DENIED => 15

    /**
     * Native name: BDA_EVENT_OFFER_EXTENDED
     * @type {Integer (Int32)}
     */
    static OFFER_EXTENDED => 16

    /**
     * Native name: BDA_EVENT_PURCHASE_COMPLETED
     * @type {Integer (Int32)}
     */
    static PURCHASE_COMPLETED => 17

    /**
     * Native name: BDA_EVENT_SMART_CARD_INSERTED
     * @type {Integer (Int32)}
     */
    static SMART_CARD_INSERTED => 18

    /**
     * Native name: BDA_EVENT_SMART_CARD_REMOVED
     * @type {Integer (Int32)}
     */
    static SMART_CARD_REMOVED => 19
}
