#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class CPEventBitShift extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_RATINGS => 0

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_COPP => 1

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_LICENSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_ROLLBACK => 3

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_SAC => 4

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_DOWNRES => 5

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_STUBLIB => 6

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_UNTRUSTEDGRAPH => 7

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_PENDING_CERTIFICATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_NO_PLAYREADY => 9
}
