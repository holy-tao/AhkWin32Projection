#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KINTERRUPT_POLARITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static InterruptPolarityUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static InterruptActiveHigh => 1

    /**
     * @type {Integer (Int32)}
     */
    static InterruptRisingEdge => 1

    /**
     * @type {Integer (Int32)}
     */
    static InterruptActiveLow => 2

    /**
     * @type {Integer (Int32)}
     */
    static InterruptFallingEdge => 2

    /**
     * @type {Integer (Int32)}
     */
    static InterruptActiveBoth => 3

    /**
     * @type {Integer (Int32)}
     */
    static InterruptActiveBothTriggerLow => 3

    /**
     * @type {Integer (Int32)}
     */
    static InterruptActiveBothTriggerHigh => 4
}
