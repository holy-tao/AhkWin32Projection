#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_MEDIASEEKING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_CAPABILITIES => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_FORMATS => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_TIMEFORMAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_POSITION => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_STOPPOSITION => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_POSITIONS => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_DURATION => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_AVAILABLE => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_PREROLL => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_CONVERTTIMEFORMAT => 9
}
