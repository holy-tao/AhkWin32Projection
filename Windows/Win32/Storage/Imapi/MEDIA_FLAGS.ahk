#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class MEDIA_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_BLANK => 1

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_RW => 2

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_WRITABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_FORMAT_UNUSABLE_BY_IMAPI => 8
}
