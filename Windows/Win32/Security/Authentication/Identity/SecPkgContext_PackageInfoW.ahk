#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecPkgInfoW.ahk" { SecPkgInfoW }

/**
 * Holds package information.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_packageinfow
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset Unicode
 */
export default struct SecPkgContext_PackageInfoW {
    #StructPack 8

    /**
     * The package information.
     */
    PackageInfo : SecPkgInfoW.Ptr

}
