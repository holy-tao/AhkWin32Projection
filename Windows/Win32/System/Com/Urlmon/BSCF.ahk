#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class BSCF extends Win32Enum {

    /**
     * Native name: BSCF_FIRSTDATANOTIFICATION
     * @type {Integer (Int32)}
     */
    static FIRSTDATANOTIFICATION => 1

    /**
     * Native name: BSCF_INTERMEDIATEDATANOTIFICATION
     * @type {Integer (Int32)}
     */
    static INTERMEDIATEDATANOTIFICATION => 2

    /**
     * Native name: BSCF_LASTDATANOTIFICATION
     * @type {Integer (Int32)}
     */
    static LASTDATANOTIFICATION => 4

    /**
     * Native name: BSCF_DATAFULLYAVAILABLE
     * @type {Integer (Int32)}
     */
    static DATAFULLYAVAILABLE => 8

    /**
     * Native name: BSCF_AVAILABLEDATASIZEUNKNOWN
     * @type {Integer (Int32)}
     */
    static AVAILABLEDATASIZEUNKNOWN => 16

    /**
     * Native name: BSCF_SKIPDRAINDATAFORFILEURLS
     * @type {Integer (Int32)}
     */
    static SKIPDRAINDATAFORFILEURLS => 32

    /**
     * Native name: BSCF_64BITLENGTHDOWNLOAD
     * @type {Integer (Int32)}
     */
    static 64BITLENGTHDOWNLOAD => 64
}
