#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Holds information about the negotiated application package.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_negopackageinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_NegoPackageInfo {
    #StructPack 4

    /**
     * The mask information for the package.
     */
    PackageMask : UInt32

}
