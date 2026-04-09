#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsDriveType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_UNKNOWN_DRIVE => 0
}
