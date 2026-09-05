#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
class MEDIA_FLAGS extends Win32Enum {

    /**
     * Native name: MEDIA_BLANK
     * @type {Integer (Int32)}
     */
    static BLANK => 1

    /**
     * Native name: MEDIA_RW
     * @type {Integer (Int32)}
     */
    static RW => 2

    /**
     * Native name: MEDIA_WRITABLE
     * @type {Integer (Int32)}
     */
    static WRITABLE => 4

    /**
     * Native name: MEDIA_FORMAT_UNUSABLE_BY_IMAPI
     * @type {Integer (Int32)}
     */
    static FORMAT_UNUSABLE_BY_IMAPI => 8
}
