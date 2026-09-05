#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsAccessMask extends Win32Enum {

    /**
     * Native name: NTMS_USE_ACCESS
     * @type {Integer (Int32)}
     */
    static USE_ACCESS => 1

    /**
     * Native name: NTMS_MODIFY_ACCESS
     * @type {Integer (Int32)}
     */
    static MODIFY_ACCESS => 2

    /**
     * Native name: NTMS_CONTROL_ACCESS
     * @type {Integer (Int32)}
     */
    static CONTROL_ACCESS => 4
}
