#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_PROPERTY_DVDCOPYPROT extends Win32Enum {

    /**
     * Native name: AM_PROPERTY_DVDCOPY_CHLG_KEY
     * @type {Integer (Int32)}
     */
    static DVDCOPY_CHLG_KEY => 1

    /**
     * Native name: AM_PROPERTY_DVDCOPY_DVD_KEY1
     * @type {Integer (Int32)}
     */
    static DVDCOPY_DVD_KEY1 => 2

    /**
     * Native name: AM_PROPERTY_DVDCOPY_DEC_KEY2
     * @type {Integer (Int32)}
     */
    static DVDCOPY_DEC_KEY2 => 3

    /**
     * Native name: AM_PROPERTY_DVDCOPY_TITLE_KEY
     * @type {Integer (Int32)}
     */
    static DVDCOPY_TITLE_KEY => 4

    /**
     * Native name: AM_PROPERTY_COPY_MACROVISION
     * @type {Integer (Int32)}
     */
    static COPY_MACROVISION => 5

    /**
     * Native name: AM_PROPERTY_DVDCOPY_REGION
     * @type {Integer (Int32)}
     */
    static DVDCOPY_REGION => 6

    /**
     * Native name: AM_PROPERTY_DVDCOPY_SET_COPY_STATE
     * @type {Integer (Int32)}
     */
    static DVDCOPY_SET_COPY_STATE => 7

    /**
     * Native name: AM_PROPERTY_COPY_ANALOG_COMPONENT
     * @type {Integer (Int32)}
     */
    static COPY_ANALOG_COMPONENT => 8

    /**
     * Native name: AM_PROPERTY_COPY_DIGITAL_CP
     * @type {Integer (Int32)}
     */
    static COPY_DIGITAL_CP => 9

    /**
     * Native name: AM_PROPERTY_COPY_DVD_SRM
     * @type {Integer (Int32)}
     */
    static COPY_DVD_SRM => 10

    /**
     * Native name: AM_PROPERTY_DVDCOPY_SUPPORTS_NEW_KEYCOUNT
     * @type {Integer (Int32)}
     */
    static DVDCOPY_SUPPORTS_NEW_KEYCOUNT => 11

    /**
     * Native name: AM_PROPERTY_DVDCOPY_DISC_KEY
     * @type {Integer (Int32)}
     */
    static DVDCOPY_DISC_KEY => 128
}
