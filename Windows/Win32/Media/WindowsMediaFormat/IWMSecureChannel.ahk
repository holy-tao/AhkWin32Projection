#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMAuthorizer.ahk

/**
 * The IWMSecureChannel interface provides methods that allow two DLLs to validate each other and perform secure communication.
 * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nn-wmsecure-iwmsecurechannel
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMSecureChannel extends IWMAuthorizer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMSecureChannel
     * @type {Guid}
     */
    static IID => Guid("{2720598a-d0f2-4189-bd10-91c46ef0936f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WMSC_AddCertificate", "WMSC_AddSignature", "WMSC_Connect", "WMSC_IsConnected", "WMSC_Disconnect", "WMSC_GetValidCertificate", "WMSC_Encrypt", "WMSC_Decrypt", "WMSC_Lock", "WMSC_Unlock", "WMSC_SetSharedData"]

    /**
     * 
     * @param {IWMAuthorizer} pCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_addcertificate
     */
    WMSC_AddCertificate(pCert) {
        result := ComCall(6, this, "ptr", pCert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbCertSig 
     * @param {Integer} cbCertSig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_addsignature
     */
    WMSC_AddSignature(pbCertSig, cbCertSig) {
        pbCertSigMarshal := pbCertSig is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, pbCertSigMarshal, pbCertSig, "uint", cbCertSig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMSecureChannel} pOtherSide 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_connect
     */
    WMSC_Connect(pOtherSide) {
        result := ComCall(8, this, "ptr", pOtherSide, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsConnected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_isconnected
     */
    WMSC_IsConnected(pfIsConnected) {
        result := ComCall(9, this, "ptr", pfIsConnected, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_disconnect
     */
    WMSC_Disconnect() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbCertificate 
     * @param {Pointer<Integer>} pdwSignature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_getvalidcertificate
     */
    WMSC_GetValidCertificate(ppbCertificate, pdwSignature) {
        pdwSignatureMarshal := pdwSignature is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr*", ppbCertificate, pdwSignatureMarshal, pdwSignature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_encrypt
     */
    WMSC_Encrypt(pbData, cbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(12, this, pbDataMarshal, pbData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_decrypt
     */
    WMSC_Decrypt(pbData, cbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, pbDataMarshal, pbData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_lock
     */
    WMSC_Lock() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_unlock
     */
    WMSC_Unlock() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCertIndex 
     * @param {Pointer<Integer>} pbSharedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_setshareddata
     */
    WMSC_SetSharedData(dwCertIndex, pbSharedData) {
        pbSharedDataMarshal := pbSharedData is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, "uint", dwCertIndex, pbSharedDataMarshal, pbSharedData, "HRESULT")
        return result
    }
}
