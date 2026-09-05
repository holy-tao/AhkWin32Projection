#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AMMSF_MS_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: AMMSF_ADDDEFAULTRENDERER
     * @type {Integer (Int32)}
     */
    static ADDDEFAULTRENDERER => 1

    /**
     * Native name: AMMSF_CREATEPEER
     * @type {Integer (Int32)}
     */
    static CREATEPEER => 2

    /**
     * Native name: AMMSF_STOPIFNOSAMPLES
     * @type {Integer (Int32)}
     */
    static STOPIFNOSAMPLES => 4

    /**
     * Native name: AMMSF_NOSTALL
     * @type {Integer (Int32)}
     */
    static NOSTALL => 8
}
