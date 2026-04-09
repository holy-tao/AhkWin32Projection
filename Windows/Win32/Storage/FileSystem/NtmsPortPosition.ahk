#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsPortPosition extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PORTPOSITION_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PORTPOSITION_EXTENDED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PORTPOSITION_RETRACTED => 2
}
