#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_SrtpParameters {
    #StructPack 8

    ProtectionProfile : UInt16

    MasterKeyIdentifierSize : Int8

    MasterKeyIdentifier : IntPtr

}
