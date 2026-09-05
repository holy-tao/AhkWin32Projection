#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsPortContent extends Win32Enum {

    /**
     * Native name: NTMS_PORTCONTENT_UNKNOWN
     * @type {Integer (Int32)}
     */
    static PORTCONTENT_UNKNOWN => 0

    /**
     * Native name: NTMS_PORTCONTENT_FULL
     * @type {Integer (Int32)}
     */
    static PORTCONTENT_FULL => 1

    /**
     * Native name: NTMS_PORTCONTENT_EMPTY
     * @type {Integer (Int32)}
     */
    static PORTCONTENT_EMPTY => 2
}
