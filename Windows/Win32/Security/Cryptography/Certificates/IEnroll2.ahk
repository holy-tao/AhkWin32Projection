#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnroll.ahk

/**
 * Represents the Certificate Enrollment Control and is used primarily to generate certificate requests.
 * @see https://docs.microsoft.com/windows/win32/api//xenroll/nn-xenroll-ienroll2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnroll2 extends IEnroll{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnroll2
     * @type {Guid}
     */
    static IID => Guid("{c080e199-b7df-11d2-a421-00c04f79fe8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 73

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallPKCS7Blob", "Reset", "GetSupportedKeySpec", "GetKeyLen", "EnumAlgs", "GetAlgNameWStr", "put_ReuseHardwareKeyIfUnableToGenNew", "get_ReuseHardwareKeyIfUnableToGenNew", "put_HashAlgID", "get_HashAlgID", "SetHStoreMy", "SetHStoreCA", "SetHStoreROOT", "SetHStoreRequest", "put_LimitExchangeKeyToEncipherment", "get_LimitExchangeKeyToEncipherment", "put_EnableSMIMECapabilities", "get_EnableSMIMECapabilities"]

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-installpkcs7blob
     */
    InstallPKCS7Blob(pBlobPKCS7) {
        result := ComCall(73, this, "ptr", pBlobPKCS7, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-reset
     */
    Reset() {
        result := ComCall(74, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwKeySpec 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-getsupportedkeyspec
     */
    GetSupportedKeySpec(pdwKeySpec) {
        pdwKeySpecMarshal := pdwKeySpec is VarRef ? "int*" : "ptr"

        result := ComCall(75, this, pdwKeySpecMarshal, pdwKeySpec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fMin 
     * @param {BOOL} fExchange 
     * @param {Pointer<Integer>} pdwKeySize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-getkeylen
     */
    GetKeyLen(fMin, fExchange, pdwKeySize) {
        pdwKeySizeMarshal := pdwKeySize is VarRef ? "int*" : "ptr"

        result := ComCall(76, this, "int", fMin, "int", fExchange, pdwKeySizeMarshal, pdwKeySize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Integer} algClass 
     * @param {Pointer<Integer>} pdwAlgID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-enumalgs
     */
    EnumAlgs(dwIndex, algClass, pdwAlgID) {
        pdwAlgIDMarshal := pdwAlgID is VarRef ? "int*" : "ptr"

        result := ComCall(77, this, "int", dwIndex, "int", algClass, pdwAlgIDMarshal, pdwAlgID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} algID 
     * @param {Pointer<PWSTR>} ppwsz 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-getalgnamewstr
     */
    GetAlgNameWStr(algID, ppwsz) {
        ppwszMarshal := ppwsz is VarRef ? "ptr*" : "ptr"

        result := ComCall(78, this, "int", algID, ppwszMarshal, ppwsz, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fReuseHardwareKeyIfUnableToGenNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-put_reusehardwarekeyifunabletogennew
     */
    put_ReuseHardwareKeyIfUnableToGenNew(fReuseHardwareKeyIfUnableToGenNew) {
        result := ComCall(79, this, "int", fReuseHardwareKeyIfUnableToGenNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fReuseHardwareKeyIfUnableToGenNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-get_reusehardwarekeyifunabletogennew
     */
    get_ReuseHardwareKeyIfUnableToGenNew(fReuseHardwareKeyIfUnableToGenNew) {
        fReuseHardwareKeyIfUnableToGenNewMarshal := fReuseHardwareKeyIfUnableToGenNew is VarRef ? "int*" : "ptr"

        result := ComCall(80, this, fReuseHardwareKeyIfUnableToGenNewMarshal, fReuseHardwareKeyIfUnableToGenNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hashAlgID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-put_hashalgid
     */
    put_HashAlgID(hashAlgID) {
        result := ComCall(81, this, "int", hashAlgID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} hashAlgID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-get_hashalgid
     */
    get_HashAlgID(hashAlgID) {
        hashAlgIDMarshal := hashAlgID is VarRef ? "int*" : "ptr"

        result := ComCall(82, this, hashAlgIDMarshal, hashAlgID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HCERTSTORE} hStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-sethstoremy
     */
    SetHStoreMy(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(83, this, "ptr", hStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HCERTSTORE} hStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-sethstoreca
     */
    SetHStoreCA(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(84, this, "ptr", hStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HCERTSTORE} hStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-sethstoreroot
     */
    SetHStoreROOT(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(85, this, "ptr", hStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HCERTSTORE} hStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-sethstorerequest
     */
    SetHStoreRequest(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(86, this, "ptr", hStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fLimitExchangeKeyToEncipherment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-put_limitexchangekeytoencipherment
     */
    put_LimitExchangeKeyToEncipherment(fLimitExchangeKeyToEncipherment) {
        result := ComCall(87, this, "int", fLimitExchangeKeyToEncipherment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fLimitExchangeKeyToEncipherment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-get_limitexchangekeytoencipherment
     */
    get_LimitExchangeKeyToEncipherment(fLimitExchangeKeyToEncipherment) {
        fLimitExchangeKeyToEnciphermentMarshal := fLimitExchangeKeyToEncipherment is VarRef ? "int*" : "ptr"

        result := ComCall(88, this, fLimitExchangeKeyToEnciphermentMarshal, fLimitExchangeKeyToEncipherment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnableSMIMECapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-put_enablesmimecapabilities
     */
    put_EnableSMIMECapabilities(fEnableSMIMECapabilities) {
        result := ComCall(89, this, "int", fEnableSMIMECapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fEnableSMIMECapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll2-get_enablesmimecapabilities
     */
    get_EnableSMIMECapabilities(fEnableSMIMECapabilities) {
        fEnableSMIMECapabilitiesMarshal := fEnableSMIMECapabilities is VarRef ? "int*" : "ptr"

        result := ComCall(90, this, fEnableSMIMECapabilitiesMarshal, fEnableSMIMECapabilities, "HRESULT")
        return result
    }
}
