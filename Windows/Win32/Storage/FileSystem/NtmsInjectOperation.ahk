#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsInjectOperation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_INJECT_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_INJECT_STOP => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_INJECT_RETRACT => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_INJECT_STARTMANY => 3
}
