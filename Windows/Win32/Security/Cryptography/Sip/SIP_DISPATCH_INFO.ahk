#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains a set of function pointers assigned by the CryptSIPLoad function that your application uses to perform subject interface package (SIP) operations.
 * @remarks
 * 
  * Your application must initialize this structure to binary zeros and set <b>cbSize</b> to <c>sizeof(SIP_DISPATCH_INFO)</c> by calling the <a href="https://docs.microsoft.com/cpp/c-runtime-library/reference/memset-wmemset">memset</a> function before calling the <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipload">CryptSIPLoad</a> function. Your application can use the function pointers in the returned <b>SIP_DISPATCH_INFO</b> structure to perform the necessary SIP operations.   The function pointers can point to functions exported by third party SIPs.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mssip/ns-mssip-sip_dispatch_info
 * @namespace Windows.Win32.Security.Cryptography.Sip
 * @version v4.0.30319
 */
class SIP_DISPATCH_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is reserved and must be set to <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    hSIP {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the function that retrieves the signed data for the subject. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipgetsigneddatamsg">CryptSIPGetSignedDataMsg</a>.
     * @type {Pointer<pCryptSIPGetSignedDataMsg>}
     */
    pfGet {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the function that stores the signed data for the subject. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipputsigneddatamsg">CryptSIPPutSignedDataMsg</a>.
     * @type {Pointer<pCryptSIPPutSignedDataMsg>}
     */
    pfPut {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the function that returns a [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data)  structure that contains the subject data. This structure contains the hash of the target. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipcreateindirectdata">CryptSIPCreateIndirectData</a>.
     * @type {Pointer<pCryptSIPCreateIndirectData>}
     */
    pfCreate {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to the function that verifies the [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data)  structure that contains the subject data. This structure contains the hash of the target. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipverifyindirectdata">CryptSIPVerifyIndirectData</a>.
     * @type {Pointer<pCryptSIPVerifyIndirectData>}
     */
    pfVerify {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the function that removes the signed data for the subject. The signature for this function pointer is described in <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipremovesigneddatamsg">CryptSIPRemoveSignedDataMsg</a>.
     * @type {Pointer<pCryptSIPRemoveSignedDataMsg>}
     */
    pfRemove {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}
