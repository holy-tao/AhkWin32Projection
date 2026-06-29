#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct NEGOTIATE_PACKAGE_PREFIX {
    #StructPack 8

    PackageId : IntPtr

    PackageDataA : IntPtr

    PackageDataW : IntPtr

    PrefixLen : IntPtr

    Prefix : Int8[32]

}
