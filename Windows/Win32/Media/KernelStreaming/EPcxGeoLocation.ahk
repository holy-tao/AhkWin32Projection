#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class EPcxGeoLocation extends Win32Enum {

    /**
     * Native name: eGeoLocRear
     * @type {Integer (Int32)}
     */
    static LocRear => 1

    /**
     * Native name: eGeoLocFront
     * @type {Integer (Int32)}
     */
    static LocFront => 2

    /**
     * Native name: eGeoLocLeft
     * @type {Integer (Int32)}
     */
    static LocLeft => 3

    /**
     * Native name: eGeoLocRight
     * @type {Integer (Int32)}
     */
    static LocRight => 4

    /**
     * Native name: eGeoLocTop
     * @type {Integer (Int32)}
     */
    static LocTop => 5

    /**
     * Native name: eGeoLocBottom
     * @type {Integer (Int32)}
     */
    static LocBottom => 6

    /**
     * Native name: eGeoLocRearPanel
     * @type {Integer (Int32)}
     */
    static LocRearPanel => 7

    /**
     * Native name: eGeoLocRiser
     * @type {Integer (Int32)}
     */
    static LocRiser => 8

    /**
     * Native name: eGeoLocInsideMobileLid
     * @type {Integer (Int32)}
     */
    static LocInsideMobileLid => 9

    /**
     * Native name: eGeoLocDrivebay
     * @type {Integer (Int32)}
     */
    static LocDrivebay => 10

    /**
     * Native name: eGeoLocHDMI
     * @type {Integer (Int32)}
     */
    static LocHDMI => 11

    /**
     * Native name: eGeoLocOutsideMobileLid
     * @type {Integer (Int32)}
     */
    static LocOutsideMobileLid => 12

    /**
     * Native name: eGeoLocATAPI
     * @type {Integer (Int32)}
     */
    static LocATAPI => 13

    /**
     * Native name: eGeoLocNotApplicable
     * @type {Integer (Int32)}
     */
    static LocNotApplicable => 14

    /**
     * Native name: eGeoLocReserved6
     * @type {Integer (Int32)}
     */
    static LocReserved6 => 15

    /**
     * Native name: EPcxGeoLocation_enum_count
     * @type {Integer (Int32)}
     */
    static enum_count => 16
}
