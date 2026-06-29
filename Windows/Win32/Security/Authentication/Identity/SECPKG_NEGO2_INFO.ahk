#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains extended package information used for NEGO2 negotiations.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_nego2_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_NEGO2_INFO {
    #StructPack 4

    /**
     * The authentication identifier.
     */
    AuthScheme : Int8[16]

    /**
     * The flags associated with the authentication package.
     */
    PackageFlags : UInt32

}
