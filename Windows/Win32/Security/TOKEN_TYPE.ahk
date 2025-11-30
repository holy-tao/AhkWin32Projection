#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that differentiate between a primary token and an impersonation token.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-token_type
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_TYPE extends Win32Enum{

    /**
     * Indicates a primary token.
     * @type {Integer (Int32)}
     */
    static TokenPrimary => 1

    /**
     * Indicates an impersonation token.
     * @type {Integer (Int32)}
     */
    static TokenImpersonation => 2
}
