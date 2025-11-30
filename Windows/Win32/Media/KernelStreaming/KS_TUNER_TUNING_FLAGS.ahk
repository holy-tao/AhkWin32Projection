#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_TUNER_TUNING_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KS_TUNER_TUNING_EXACT => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_TUNER_TUNING_FINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_TUNER_TUNING_COARSE => 3
}
