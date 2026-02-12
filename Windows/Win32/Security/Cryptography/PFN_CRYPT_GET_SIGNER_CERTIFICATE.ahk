#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The CryptGetSignerCertificateCallback user supplied callback function is used with the CRYPT_VERIFY_MESSAGE_PARA structure to get and verify a message signer's certificate.
 * @remarks
 * If the message does not contain content or signers, the function is called with <i>pSignerId</i> set to <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_get_signer_certificate
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_GET_SIGNER_CERTIFICATE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} pvGetArg 
     * @param {Integer} dwCertEncodingType 
     * @param {Pointer<CERT_INFO>} pSignerId 
     * @param {HCERTSTORE} hMsgCertStore 
     * @returns {Pointer<CERT_CONTEXT>} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pvGetArg, dwCertEncodingType, pSignerId, hMsgCertStore) {
        hMsgCertStore := hMsgCertStore is Win32Handle ? NumGet(hMsgCertStore, "ptr") : hMsgCertStore

        pvGetArgMarshal := pvGetArg is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvGetArgMarshal, pvGetArg, "uint", dwCertEncodingType, "ptr", pSignerId, "ptr", hMsgCertStore, "ptr")
        return result
    }
}
