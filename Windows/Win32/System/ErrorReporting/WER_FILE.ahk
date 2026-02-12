#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The file does not contain personal information that could be used to identify or contact the user.
 * @see https://learn.microsoft.com/windows/win32/api//content/werapi/nf-werapi-werregisterfile
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
