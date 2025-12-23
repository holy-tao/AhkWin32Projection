#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMMSF_MS_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static AMMSF_ADDDEFAULTRENDERER => 1

    /**
     * @type {Integer (Int32)}
     */
    static AMMSF_CREATEPEER => 2

    /**
     * @type {Integer (Int32)}
     */
    static AMMSF_STOPIFNOSAMPLES => 4

    /**
     * @type {Integer (Int32)}
     */
    static AMMSF_NOSTALL => 8
}
