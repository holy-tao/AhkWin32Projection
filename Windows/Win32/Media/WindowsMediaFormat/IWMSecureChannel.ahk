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
     * The WMSC_AddCertificate method adds certificates that this object can present to other secure channel objects. If no certs are added, then this object can only connect to objects with no signatures.
     * @param {IWMAuthorizer} pCert A pointer to an authorizer object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_addcertificate
     */
    WMSC_AddCertificate(pCert) {
        result := ComCall(6, this, "ptr", pCert, "HRESULT")
        return result
    }

    /**
     * The WMSC_AddSignature method adds signatures that this object will look for when trying to connect. If no signatures are added, then this object will connect to any other object.
     * @param {Pointer<Integer>} pbCertSig 
     * @param {Integer} cbCertSig 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_addsignature
     */
    WMSC_AddSignature(pbCertSig, cbCertSig) {
        pbCertSigMarshal := pbCertSig is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, pbCertSigMarshal, pbCertSig, "uint", cbCertSig, "HRESULT")
        return result
    }

    /**
     * The WMSC_Connect method initializes the secure connection.
     * @param {IWMSecureChannel} pOtherSide Pointer to a secure channel object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_connect
     */
    WMSC_Connect(pOtherSide) {
        result := ComCall(8, this, "ptr", pOtherSide, "HRESULT")
        return result
    }

    /**
     * The WMSC_IsConnected method checks to see if the secure connection is valid.
     * @returns {BOOL} A pointer to value that indicates if the secure connection is valid.
     * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_isconnected
     */
    WMSC_IsConnected() {
        result := ComCall(9, this, "int*", &pfIsConnected := 0, "HRESULT")
        return pfIsConnected
    }

    /**
     * The WMSC_Disconnect method destroys the secure connection.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_disconnect
     */
    WMSC_Disconnect() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The WMSC_GetValidCertificate method returns a copy of the certificate that was used provided by the other side of the connection. Also returns the index of the signature that validated that certificate.
     * @param {Pointer<Pointer<Integer>>} ppbCertificate <i>ppbCertificate</i> must be released with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> by the user.
     *      <i>ppbCertificate</i> can be <b>NULL</b> if no certificate was provided. 
     *      If no connection was made, this function returns E_FAIL
     * @param {Pointer<Integer>} pdwSignature <i>pdwSignature</i>can be 0xFFFFFFFF if no signature was used to validate the cert.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_getvalidcertificate
     */
    WMSC_GetValidCertificate(ppbCertificate, pdwSignature) {
        ppbCertificateMarshal := ppbCertificate is VarRef ? "ptr*" : "ptr"
        pdwSignatureMarshal := pdwSignature is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, ppbCertificateMarshal, ppbCertificate, pdwSignatureMarshal, pdwSignature, "HRESULT")
        return result
    }

    /**
     * The WMSC_Encrypt method encrypts data across DLL boundaries.
     * @param {Pointer<Integer>} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_encrypt
     */
    WMSC_Encrypt(pbData, cbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(12, this, pbDataMarshal, pbData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * The WMSC_Decrypt method decrypts data across DLL boundaries.
     * @param {Pointer<Integer>} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_decrypt
     */
    WMSC_Decrypt(pbData, cbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, pbDataMarshal, pbData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * The WMSC_Lock method locks access to the secure connection.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_lock
     */
    WMSC_Lock() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The WMSC_Unlock method unlocks access to the secure connection.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_unlock
     */
    WMSC_Unlock() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The WMSC_SetSharedData method is used during the connection negotiation process.
     * @param {Integer} dwCertIndex 
     * @param {Pointer<Integer>} pbSharedData 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nf-wmsecure-iwmsecurechannel-wmsc_setshareddata
     */
    WMSC_SetSharedData(dwCertIndex, pbSharedData) {
        pbSharedDataMarshal := pbSharedData is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, "uint", dwCertIndex, pbSharedDataMarshal, pbSharedData, "HRESULT")
        return result
    }
}
