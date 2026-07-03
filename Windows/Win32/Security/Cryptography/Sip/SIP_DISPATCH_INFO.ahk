#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Contains a set of function pointers assigned by the CryptSIPLoad function that your application uses to perform subject interface package (SIP) operations.
 * @remarks
 * Your application must initialize this structure to binary zeros and set <b>cbSize</b> to <c>sizeof(SIP_DISPATCH_INFO)</c> by calling the <a href="https://docs.microsoft.com/cpp/c-runtime-library/reference/memset-wmemset">memset</a> function before calling the <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipload">CryptSIPLoad</a> function. Your application can use the function pointers in the returned <b>SIP_DISPATCH_INFO</b> structure to perform the necessary SIP operations.   The function pointers can point to functions exported by third party SIPs.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-sip_dispatch_info
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct SIP_DISPATCH_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * This member is reserved and must be set to <b>NULL</b>.
     */
    hSIP : HANDLE

    /**
     * A pointer to the function that retrieves the signed data for the subject. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipgetsigneddatamsg">CryptSIPGetSignedDataMsg</a>.
     */
    pfGet : IntPtr

    /**
     * A pointer to the function that stores the signed data for the subject. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipputsigneddatamsg">CryptSIPPutSignedDataMsg</a>.
     */
    pfPut : IntPtr

    /**
     * A pointer to the function that returns a [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data)  structure that contains the subject data. This structure contains the hash of the target. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipcreateindirectdata">CryptSIPCreateIndirectData</a>.
     */
    pfCreate : IntPtr

    /**
     * A pointer to the function that verifies the [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data)  structure that contains the subject data. This structure contains the hash of the target. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipverifyindirectdata">CryptSIPVerifyIndirectData</a>.
     */
    pfVerify : IntPtr

    /**
     * A pointer to the function that removes the signed data for the subject. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipremovesigneddatamsg">CryptSIPRemoveSignedDataMsg</a>.
     */
    pfRemove : IntPtr

}
