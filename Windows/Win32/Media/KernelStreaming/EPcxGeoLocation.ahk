#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class EPcxGeoLocation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocRear => 1

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocFront => 2

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocLeft => 3

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocRight => 4

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocTop => 5

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocBottom => 6

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocRearPanel => 7

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocRiser => 8

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocInsideMobileLid => 9

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocDrivebay => 10

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocHDMI => 11

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocOutsideMobileLid => 12

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocATAPI => 13

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocNotApplicable => 14

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocReserved6 => 15

    /**
     * @type {Integer (Int32)}
     */
    static EPcxGeoLocation_enum_count => 16
}
