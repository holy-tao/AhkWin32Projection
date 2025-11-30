#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class FILE_OPENMODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OPENMODE_FAIL_IF_NOT_EXIST => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPENMODE_FAIL_IF_EXIST => 1

    /**
     * @type {Integer (Int32)}
     */
    static OPENMODE_RESET_IF_EXIST => 2

    /**
     * @type {Integer (Int32)}
     */
    static OPENMODE_APPEND_IF_EXIST => 3

    /**
     * @type {Integer (Int32)}
     */
    static OPENMODE_DELETE_IF_EXIST => 4
}
