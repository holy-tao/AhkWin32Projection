#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecPkgInfoA.ahk" { SecPkgInfoA }

/**
 * Holds application package information.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_packageinfoa
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct SecPkgContext_PackageInfoA {
    #StructPack 8

    /**
     * The package information.
     */
    PackageInfo : SecPkgInfoA.Ptr

}
