#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that differentiate between a primary token and an impersonation token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-token_type
 * @namespace Windows.Win32.Security
 */
class TOKEN_TYPE extends Win32Enum {

    /**
     * Indicates a primary token.
     * Native name: TokenPrimary
     * @type {Integer (Int32)}
     */
    static Primary => 1

    /**
     * Indicates an impersonation token.
     * Native name: TokenImpersonation
     * @type {Integer (Int32)}
     */
    static Impersonation => 2
}
