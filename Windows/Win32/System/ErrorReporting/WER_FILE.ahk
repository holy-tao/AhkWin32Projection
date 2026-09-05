#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_FILE extends Win32BitflagEnum {

    /**
     * Native name: WER_FILE_ANONYMOUS_DATA
     * @type {Integer (UInt32)}
     */
    static ANONYMOUS_DATA => 2

    /**
     * Native name: WER_FILE_DELETE_WHEN_DONE
     * @type {Integer (UInt32)}
     */
    static DELETE_WHEN_DONE => 1
}
