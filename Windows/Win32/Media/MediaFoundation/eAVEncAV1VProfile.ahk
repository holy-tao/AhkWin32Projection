#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncAV1VProfile extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Main_420_8 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Main_420_10 => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Main_400_8 => 3

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Main_400_10 => 4

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_High_444_8 => 5

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_High_444_10 => 6

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_420_12 => 7

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_400_12 => 8

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_444_12 => 9

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_422_8 => 10

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_422_10 => 11

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_422_12 => 12
}
