#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVBSystemType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DVB_Cable => 0

    /**
     * @type {Integer (Int32)}
     */
    static DVB_Terrestrial => 1

    /**
     * @type {Integer (Int32)}
     */
    static DVB_Satellite => 2

    /**
     * @type {Integer (Int32)}
     */
    static ISDB_Terrestrial => 3

    /**
     * @type {Integer (Int32)}
     */
    static ISDB_Satellite => 4
}
