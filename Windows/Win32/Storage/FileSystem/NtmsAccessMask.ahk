#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsAccessMask extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_USE_ACCESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MODIFY_ACCESS => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_CONTROL_ACCESS => 4
}
