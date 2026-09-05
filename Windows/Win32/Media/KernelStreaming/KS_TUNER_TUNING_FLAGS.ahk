#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_TUNER_TUNING_FLAGS extends Win32Enum {

    /**
     * Native name: KS_TUNER_TUNING_EXACT
     * @type {Integer (Int32)}
     */
    static EXACT => 1

    /**
     * Native name: KS_TUNER_TUNING_FINE
     * @type {Integer (Int32)}
     */
    static FINE => 2

    /**
     * Native name: KS_TUNER_TUNING_COARSE
     * @type {Integer (Int32)}
     */
    static COARSE => 3
}
