#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_TokenBinding {
    #StructPack 8

    MajorVersion : Int8

    MinorVersion : Int8

    KeyParametersSize : UInt16

    KeyParameters : IntPtr

}
