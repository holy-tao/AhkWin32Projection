#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsUITypes extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_UITYPE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_UITYPE_INFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_UITYPE_REQ => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_UITYPE_ERR => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_UITYPE_MAX => 4
}
