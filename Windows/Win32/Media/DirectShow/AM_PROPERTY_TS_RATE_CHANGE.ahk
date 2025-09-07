#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_PROPERTY_TS_RATE_CHANGE{

    /**
     * @type {Integer (Int32)}
     */
    static AM_RATE_SimpleRateChange => 1

    /**
     * @type {Integer (Int32)}
     */
    static AM_RATE_ExactRateChange => 2

    /**
     * @type {Integer (Int32)}
     */
    static AM_RATE_MaxFullDataRate => 3

    /**
     * @type {Integer (Int32)}
     */
    static AM_RATE_Step => 4

    /**
     * @type {Integer (Int32)}
     */
    static AM_RATE_UseRateVersion => 5

    /**
     * @type {Integer (Int32)}
     */
    static AM_RATE_QueryFullFrameRate => 6

    /**
     * @type {Integer (Int32)}
     */
    static AM_RATE_QueryLastRateSegPTS => 7

    /**
     * @type {Integer (Int32)}
     */
    static AM_RATE_CorrectTS => 8

    /**
     * @type {Integer (Int32)}
     */
    static AM_RATE_ReverseMaxFullDataRate => 9

    /**
     * @type {Integer (Int32)}
     */
    static AM_RATE_ResetOnTimeDisc => 10

    /**
     * @type {Integer (Int32)}
     */
    static AM_RATE_QueryMapping => 11
}
