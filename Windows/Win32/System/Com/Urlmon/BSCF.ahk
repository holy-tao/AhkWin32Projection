#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class BSCF extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_FIRSTDATANOTIFICATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_INTERMEDIATEDATANOTIFICATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_LASTDATANOTIFICATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_DATAFULLYAVAILABLE => 8

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_AVAILABLEDATASIZEUNKNOWN => 16

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_SKIPDRAINDATAFORFILEURLS => 32

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_64BITLENGTHDOWNLOAD => 64
}
