#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class BDA_DigitalSignalStandard extends Win32Enum {

    /**
     * Native name: Bda_DigitalStandard_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: Bda_DigitalStandard_DVB_T
     * @type {Integer (Int32)}
     */
    static DVB_T => 1

    /**
     * Native name: Bda_DigitalStandard_DVB_S
     * @type {Integer (Int32)}
     */
    static DVB_S => 2

    /**
     * Native name: Bda_DigitalStandard_DVB_C
     * @type {Integer (Int32)}
     */
    static DVB_C => 4

    /**
     * Native name: Bda_DigitalStandard_ATSC
     * @type {Integer (Int32)}
     */
    static ATSC => 8

    /**
     * Native name: Bda_DigitalStandard_ISDB_T
     * @type {Integer (Int32)}
     */
    static ISDB_T => 16

    /**
     * Native name: Bda_DigitalStandard_ISDB_S
     * @type {Integer (Int32)}
     */
    static ISDB_S => 32

    /**
     * Native name: Bda_DigitalStandard_ISDB_C
     * @type {Integer (Int32)}
     */
    static ISDB_C => 64
}
