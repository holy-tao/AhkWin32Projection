#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CLMD_PIV_CERT_DATA {
    #StructPack 8

    dwVersion : UInt32

    dwCertTag : UInt32

    pbCert : IntPtr

    cbCert : UInt32

}
