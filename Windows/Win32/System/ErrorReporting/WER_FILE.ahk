#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_FILE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FILE_ANONYMOUS_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FILE_DELETE_WHEN_DONE => 1
}
