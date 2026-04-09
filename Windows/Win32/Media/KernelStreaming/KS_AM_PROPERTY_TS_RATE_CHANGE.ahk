#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_AM_PROPERTY_TS_RATE_CHANGE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KS_AM_RATE_SimpleRateChange => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_AM_RATE_ExactRateChange => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_AM_RATE_MaxFullDataRate => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_AM_RATE_Step => 4
}
