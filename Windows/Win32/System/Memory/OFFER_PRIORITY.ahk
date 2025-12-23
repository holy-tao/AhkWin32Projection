#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class OFFER_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VmOfferPriorityVeryLow => 1

    /**
     * @type {Integer (Int32)}
     */
    static VmOfferPriorityLow => 2

    /**
     * @type {Integer (Int32)}
     */
    static VmOfferPriorityBelowNormal => 3

    /**
     * @type {Integer (Int32)}
     */
    static VmOfferPriorityNormal => 4
}
