#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_TUNER_STRATEGY extends Win32Enum {

    /**
     * Native name: KS_TUNER_STRATEGY_PLL
     * @type {Integer (Int32)}
     */
    static PLL => 1

    /**
     * Native name: KS_TUNER_STRATEGY_SIGNAL_STRENGTH
     * @type {Integer (Int32)}
     */
    static SIGNAL_STRENGTH => 2

    /**
     * Native name: KS_TUNER_STRATEGY_DRIVER_TUNES
     * @type {Integer (Int32)}
     */
    static DRIVER_TUNES => 4
}
