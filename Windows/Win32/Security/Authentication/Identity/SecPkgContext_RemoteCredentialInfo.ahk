#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_RemoteCredentialInfo {
    #StructPack 8

    cbCertificateChain : UInt32

    pbCertificateChain : IntPtr

    cCertificates : UInt32

    fFlags : UInt32

    dwBits : UInt32

}
