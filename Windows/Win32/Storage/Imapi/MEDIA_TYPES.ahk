#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class MEDIA_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_CDDA_CDROM => 1

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_CD_ROM_XA => 2

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_CD_I => 3

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_CD_EXTRA => 4

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_CD_OTHER => 5

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_SPECIAL => 6
}
