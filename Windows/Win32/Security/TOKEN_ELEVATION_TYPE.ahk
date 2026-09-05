#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the elevation type of token being queried by the GetTokenInformation function or set by the SetTokenInformation function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-token_elevation_type
 * @namespace Windows.Win32.Security
 */
class TOKEN_ELEVATION_TYPE extends Win32Enum {

    /**
     * The token does not have a linked token.
     * Native name: TokenElevationTypeDefault
     * @type {Integer (Int32)}
     */
    static Default => 1

    /**
     * The token is an elevated token.
     * Native name: TokenElevationTypeFull
     * @type {Integer (Int32)}
     */
    static Full => 2

    /**
     * The token is a limited token.
     * Native name: TokenElevationTypeLimited
     * @type {Integer (Int32)}
     */
    static Limited => 3
}
