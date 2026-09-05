#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_AM_PROPERTY_TS_RATE_CHANGE extends Win32Enum {

    /**
     * Native name: KS_AM_RATE_SimpleRateChange
     * @type {Integer (Int32)}
     */
    static SimpleRateChange => 1

    /**
     * Native name: KS_AM_RATE_ExactRateChange
     * @type {Integer (Int32)}
     */
    static ExactRateChange => 2

    /**
     * Native name: KS_AM_RATE_MaxFullDataRate
     * @type {Integer (Int32)}
     */
    static MaxFullDataRate => 3

    /**
     * Native name: KS_AM_RATE_Step
     * @type {Integer (Int32)}
     */
    static Step => 4
}
