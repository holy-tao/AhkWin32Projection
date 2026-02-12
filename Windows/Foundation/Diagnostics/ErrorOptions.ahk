#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of diagnostic error reporting for a thread.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.erroroptions
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ErrorOptions extends Win32BitflagEnum{

    /**
     * No error reporting occurs for the thread.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Exceptions are suppressed and not reported.
     * @type {Integer (UInt32)}
     */
    static SuppressExceptions => 1

    /**
     * Exceptions are reported.
     * @type {Integer (UInt32)}
     */
    static ForceExceptions => 2

    /**
     * Error information for [SetErrorInfo](/previous-versions/windows/desktop/api/oleauto/nf-oleauto-seterrorinfo) is used.
     * @type {Integer (UInt32)}
     */
    static UseSetErrorInfo => 4

    /**
     * Error information for [SetErrorInfo](/previous-versions/windows/desktop/api/oleauto/nf-oleauto-seterrorinfo) is suppressed and not reported.
     * @type {Integer (UInt32)}
     */
    static SuppressSetErrorInfo => 8
}
