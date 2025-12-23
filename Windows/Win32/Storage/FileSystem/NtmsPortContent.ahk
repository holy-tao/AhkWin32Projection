#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsPortContent extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PORTCONTENT_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PORTCONTENT_FULL => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PORTCONTENT_EMPTY => 2
}
