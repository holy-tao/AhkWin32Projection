#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVBSystemType extends Win32Enum {

    /**
     * Native name: DVB_Cable
     * @type {Integer (Int32)}
     */
    static Cable => 0

    /**
     * Native name: DVB_Terrestrial
     * @type {Integer (Int32)}
     */
    static Terrestrial => 1

    /**
     * Native name: DVB_Satellite
     * @type {Integer (Int32)}
     */
    static Satellite => 2

    /**
     * @type {Integer (Int32)}
     */
    static ISDB_Terrestrial => 3

    /**
     * @type {Integer (Int32)}
     */
    static ISDB_Satellite => 4
}
