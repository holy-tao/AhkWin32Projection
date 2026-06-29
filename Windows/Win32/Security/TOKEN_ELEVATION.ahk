#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether a token has elevated privileges.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_elevation
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_ELEVATION {
    #StructPack 4

    /**
     * A nonzero value if the token has elevated privileges; otherwise, a zero value.
     */
    TokenIsElevated : UInt32

}
