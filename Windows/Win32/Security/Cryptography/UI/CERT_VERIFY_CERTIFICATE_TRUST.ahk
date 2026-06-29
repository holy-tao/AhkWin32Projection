#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\HCERTSTORE.ahk" { HCERTSTORE }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CERT_VERIFY_CERTIFICATE_TRUST {
    #StructPack 8

    cbSize : UInt32 := this.Size

    pccert : CERT_CONTEXT.Ptr

    dwFlags : UInt32

    dwIgnoreErr : UInt32

    pdwErrors : IntPtr

    pszUsageOid : PSTR

    hprov : IntPtr

    cRootStores : UInt32

    rghstoreRoots : HCERTSTORE.Ptr

    cStores : UInt32

    rghstoreCAs : HCERTSTORE.Ptr

    cTrustStores : UInt32

    rghstoreTrust : HCERTSTORE.Ptr

    lCustData : LPARAM

    pfnTrustHelper : IntPtr

    pcChain : IntPtr

    prgChain : IntPtr

    prgdwErrors : IntPtr

    prgpbTrustInfo : IntPtr

}
