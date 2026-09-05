#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_PROPERTY_TS_RATE_CHANGE extends Win32Enum {

    /**
     * Native name: AM_RATE_SimpleRateChange
     * @type {Integer (Int32)}
     */
    static SimpleRateChange => 1

    /**
     * Native name: AM_RATE_ExactRateChange
     * @type {Integer (Int32)}
     */
    static ExactRateChange => 2

    /**
     * Native name: AM_RATE_MaxFullDataRate
     * @type {Integer (Int32)}
     */
    static MaxFullDataRate => 3

    /**
     * Native name: AM_RATE_Step
     * @type {Integer (Int32)}
     */
    static Step => 4

    /**
     * Native name: AM_RATE_UseRateVersion
     * @type {Integer (Int32)}
     */
    static UseRateVersion => 5

    /**
     * Native name: AM_RATE_QueryFullFrameRate
     * @type {Integer (Int32)}
     */
    static QueryFullFrameRate => 6

    /**
     * Native name: AM_RATE_QueryLastRateSegPTS
     * @type {Integer (Int32)}
     */
    static QueryLastRateSegPTS => 7

    /**
     * Native name: AM_RATE_CorrectTS
     * @type {Integer (Int32)}
     */
    static CorrectTS => 8

    /**
     * Native name: AM_RATE_ReverseMaxFullDataRate
     * @type {Integer (Int32)}
     */
    static ReverseMaxFullDataRate => 9

    /**
     * Native name: AM_RATE_ResetOnTimeDisc
     * @type {Integer (Int32)}
     */
    static ResetOnTimeDisc => 10

    /**
     * Native name: AM_RATE_QueryMapping
     * @type {Integer (Int32)}
     */
    static QueryMapping => 11
}
