#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SECPKG_MUTUAL_AUTH_LEVEL structure contains the authentication level used by a security package.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_mutual_auth_level
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_MUTUAL_AUTH_LEVEL {
    #StructPack 4

    /**
     * The mutual authentication level.
     */
    MutualAuthLevel : UInt32

}
