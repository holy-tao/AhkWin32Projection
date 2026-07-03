#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Cryptography\CMSG_SIGNER_INFO.ahk" { CMSG_SIGNER_INFO }
#Import "..\Cryptography\HCERTSTORE.ahk" { HCERTSTORE }

/**
 * Used when calling WinVerifyTrust to verify a CMSG_SIGNER_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_sgnr_info
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_SGNR_INFO {
    #StructPack 8

    /**
     * Count of bytes in this structure.
     */
    cbStruct : UInt32

    /**
     * String with the name representing the signer to be checked.
     */
    pcwszDisplayName : PWSTR

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signer_info">CMSG_SIGNER_INFO</a> structure that includes the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">signature</a> to be verified.
     */
    psSignerInfo : CMSG_SIGNER_INFO.Ptr

    /**
     * Number of store handles in <b>pahStores</b>.
     */
    chStores : UInt32

    /**
     * An array of open <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate stores</a> to be added to the list of stores that the policy provider uses to find certificates while building a trust chain.
     */
    pahStores : HCERTSTORE.Ptr

}
