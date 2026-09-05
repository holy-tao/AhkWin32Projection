#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsPortPosition extends Win32Enum {

    /**
     * Native name: NTMS_PORTPOSITION_UNKNOWN
     * @type {Integer (Int32)}
     */
    static PORTPOSITION_UNKNOWN => 0

    /**
     * Native name: NTMS_PORTPOSITION_EXTENDED
     * @type {Integer (Int32)}
     */
    static PORTPOSITION_EXTENDED => 1

    /**
     * Native name: NTMS_PORTPOSITION_RETRACTED
     * @type {Integer (Int32)}
     */
    static PORTPOSITION_RETRACTED => 2
}
