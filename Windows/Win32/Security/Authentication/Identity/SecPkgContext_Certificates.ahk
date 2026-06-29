#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_Certificates {
    #StructPack 8

    cCertificates : UInt32

    cbCertificateChain : UInt32

    pbCertificateChain : IntPtr

}
