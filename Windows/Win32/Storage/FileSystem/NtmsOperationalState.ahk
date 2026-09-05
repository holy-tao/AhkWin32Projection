#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsOperationalState extends Win32Enum {

    /**
     * Native name: NTMS_READY
     * @type {Integer (Int32)}
     */
    static READY => 0

    /**
     * Native name: NTMS_INITIALIZING
     * @type {Integer (Int32)}
     */
    static INITIALIZING => 10

    /**
     * Native name: NTMS_NEEDS_SERVICE
     * @type {Integer (Int32)}
     */
    static NEEDS_SERVICE => 20

    /**
     * Native name: NTMS_NOT_PRESENT
     * @type {Integer (Int32)}
     */
    static NOT_PRESENT => 21
}
