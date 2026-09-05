#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
class MEDIA_TYPES extends Win32Enum {

    /**
     * Native name: MEDIA_CDDA_CDROM
     * @type {Integer (Int32)}
     */
    static CDDA_CDROM => 1

    /**
     * Native name: MEDIA_CD_ROM_XA
     * @type {Integer (Int32)}
     */
    static CD_ROM_XA => 2

    /**
     * Native name: MEDIA_CD_I
     * @type {Integer (Int32)}
     */
    static CD_I => 3

    /**
     * Native name: MEDIA_CD_EXTRA
     * @type {Integer (Int32)}
     */
    static CD_EXTRA => 4

    /**
     * Native name: MEDIA_CD_OTHER
     * @type {Integer (Int32)}
     */
    static CD_OTHER => 5

    /**
     * Native name: MEDIA_SPECIAL
     * @type {Integer (Int32)}
     */
    static SPECIAL => 6
}
