#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the user claims for the token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_user_claims
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_USER_CLAIMS {
    #StructPack 8

    /**
     * The user claims for the token.
     */
    UserClaims : IntPtr

}
