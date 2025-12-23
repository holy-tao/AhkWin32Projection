#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_PROPERTY_DVDCOPYPROT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_DVDCOPY_CHLG_KEY => 1

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_DVDCOPY_DVD_KEY1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_DVDCOPY_DEC_KEY2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_DVDCOPY_TITLE_KEY => 4

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_COPY_MACROVISION => 5

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_DVDCOPY_REGION => 6

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_DVDCOPY_SET_COPY_STATE => 7

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_COPY_ANALOG_COMPONENT => 8

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_COPY_DIGITAL_CP => 9

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_COPY_DVD_SRM => 10

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_DVDCOPY_SUPPORTS_NEW_KEYCOUNT => 11

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_DVDCOPY_DISC_KEY => 128
}
