#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class FILE_OPENMODE extends Win32Enum {

    /**
     * Native name: OPENMODE_FAIL_IF_NOT_EXIST
     * @type {Integer (Int32)}
     */
    static FAIL_IF_NOT_EXIST => 0

    /**
     * Native name: OPENMODE_FAIL_IF_EXIST
     * @type {Integer (Int32)}
     */
    static FAIL_IF_EXIST => 1

    /**
     * Native name: OPENMODE_RESET_IF_EXIST
     * @type {Integer (Int32)}
     */
    static RESET_IF_EXIST => 2

    /**
     * Native name: OPENMODE_APPEND_IF_EXIST
     * @type {Integer (Int32)}
     */
    static APPEND_IF_EXIST => 3

    /**
     * Native name: OPENMODE_DELETE_IF_EXIST
     * @type {Integer (Int32)}
     */
    static DELETE_IF_EXIST => 4
}
