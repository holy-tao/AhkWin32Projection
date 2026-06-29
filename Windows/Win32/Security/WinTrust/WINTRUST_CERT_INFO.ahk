#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\Cryptography\HCERTSTORE.ahk" { HCERTSTORE }

/**
 * Used when calling WinVerifyTrust to verify a CERT_CONTEXT.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_cert_info
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_CERT_INFO {
    #StructPack 8

    /**
     * Count of bytes in this structure.
     */
    cbStruct : UInt32

    /**
     * String with the name of the memory object pointed to by the <b>pbMem</b> member of the 
     * [WINTRUST_BLOB_INFO](/windows/desktop/api/wintrust/ns-wintrust-wintrust_blob_info) structure.
     */
    pcwszDisplayName : PWSTR

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> to be verified.
     */
    psCertContext : CERT_CONTEXT.Ptr

    /**
     * The number of store handles in <b>pahStores</b>.
     */
    chStores : UInt32

    /**
     * An array of open <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate stores</a> to add to the list of stores that the policy provider looks in to find certificates while building a trust chain.
     */
    pahStores : HCERTSTORE.Ptr

    dwFlags : UInt32

    psftVerifyAsOf : FILETIME.Ptr

}
