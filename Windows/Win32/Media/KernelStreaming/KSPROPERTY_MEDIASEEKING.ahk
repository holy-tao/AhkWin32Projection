#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_MEDIASEEKING extends Win32Enum {

    /**
     * Native name: KSPROPERTY_MEDIASEEKING_CAPABILITIES
     * @type {Integer (Int32)}
     */
    static CAPABILITIES => 0

    /**
     * Native name: KSPROPERTY_MEDIASEEKING_FORMATS
     * @type {Integer (Int32)}
     */
    static FORMATS => 1

    /**
     * Native name: KSPROPERTY_MEDIASEEKING_TIMEFORMAT
     * @type {Integer (Int32)}
     */
    static TIMEFORMAT => 2

    /**
     * Native name: KSPROPERTY_MEDIASEEKING_POSITION
     * @type {Integer (Int32)}
     */
    static POSITION => 3

    /**
     * Native name: KSPROPERTY_MEDIASEEKING_STOPPOSITION
     * @type {Integer (Int32)}
     */
    static STOPPOSITION => 4

    /**
     * Native name: KSPROPERTY_MEDIASEEKING_POSITIONS
     * @type {Integer (Int32)}
     */
    static POSITIONS => 5

    /**
     * Native name: KSPROPERTY_MEDIASEEKING_DURATION
     * @type {Integer (Int32)}
     */
    static DURATION => 6

    /**
     * Native name: KSPROPERTY_MEDIASEEKING_AVAILABLE
     * @type {Integer (Int32)}
     */
    static AVAILABLE => 7

    /**
     * Native name: KSPROPERTY_MEDIASEEKING_PREROLL
     * @type {Integer (Int32)}
     */
    static PREROLL => 8

    /**
     * Native name: KSPROPERTY_MEDIASEEKING_CONVERTTIMEFORMAT
     * @type {Integer (Int32)}
     */
    static CONVERTTIMEFORMAT => 9
}
