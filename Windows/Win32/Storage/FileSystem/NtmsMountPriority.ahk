#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsMountPriority extends Win32Enum {

    /**
     * Native name: NTMS_PRIORITY_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: NTMS_PRIORITY_HIGHEST
     * @type {Integer (Int32)}
     */
    static HIGHEST => 15

    /**
     * Native name: NTMS_PRIORITY_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 7

    /**
     * Native name: NTMS_PRIORITY_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: NTMS_PRIORITY_LOW
     * @type {Integer (Int32)}
     */
    static LOW => -7

    /**
     * Native name: NTMS_PRIORITY_LOWEST
     * @type {Integer (Int32)}
     */
    static LOWEST => -15
}
