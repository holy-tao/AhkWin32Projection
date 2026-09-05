#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsUITypes extends Win32Enum {

    /**
     * Native name: NTMS_UITYPE_INVALID
     * @type {Integer (Int32)}
     */
    static UITYPE_INVALID => 0

    /**
     * Native name: NTMS_UITYPE_INFO
     * @type {Integer (Int32)}
     */
    static UITYPE_INFO => 1

    /**
     * Native name: NTMS_UITYPE_REQ
     * @type {Integer (Int32)}
     */
    static UITYPE_REQ => 2

    /**
     * Native name: NTMS_UITYPE_ERR
     * @type {Integer (Int32)}
     */
    static UITYPE_ERR => 3

    /**
     * Native name: NTMS_UITYPE_MAX
     * @type {Integer (Int32)}
     */
    static UITYPE_MAX => 4
}
