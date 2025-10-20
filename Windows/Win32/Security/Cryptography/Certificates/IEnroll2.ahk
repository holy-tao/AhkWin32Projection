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
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 
     * @returns {HRESULT} 
     */
    InstallPKCS7Blob(pBlobPKCS7) {
        result := ComCall(73, this, "ptr", pBlobPKCS7, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(74, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdwKeySpec 
     * @returns {HRESULT} 
     */
    GetSupportedKeySpec(pdwKeySpec) {
        result := ComCall(75, this, "int*", pdwKeySpec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fMin 
     * @param {BOOL} fExchange 
     * @param {Pointer<Int32>} pdwKeySize 
     * @returns {HRESULT} 
     */
    GetKeyLen(fMin, fExchange, pdwKeySize) {
        result := ComCall(76, this, "int", fMin, "int", fExchange, "int*", pdwKeySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Integer} algClass 
     * @param {Pointer<Int32>} pdwAlgID 
     * @returns {HRESULT} 
     */
    EnumAlgs(dwIndex, algClass, pdwAlgID) {
        result := ComCall(77, this, "int", dwIndex, "int", algClass, "int*", pdwAlgID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} algID 
     * @param {Pointer<PWSTR>} ppwsz 
     * @returns {HRESULT} 
     */
    GetAlgNameWStr(algID, ppwsz) {
        result := ComCall(78, this, "int", algID, "ptr", ppwsz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fReuseHardwareKeyIfUnableToGenNew 
     * @returns {HRESULT} 
     */
    put_ReuseHardwareKeyIfUnableToGenNew(fReuseHardwareKeyIfUnableToGenNew) {
        result := ComCall(79, this, "int", fReuseHardwareKeyIfUnableToGenNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fReuseHardwareKeyIfUnableToGenNew 
     * @returns {HRESULT} 
     */
    get_ReuseHardwareKeyIfUnableToGenNew(fReuseHardwareKeyIfUnableToGenNew) {
        result := ComCall(80, this, "ptr", fReuseHardwareKeyIfUnableToGenNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hashAlgID 
     * @returns {HRESULT} 
     */
    put_HashAlgID(hashAlgID) {
        result := ComCall(81, this, "int", hashAlgID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} hashAlgID 
     * @returns {HRESULT} 
     */
    get_HashAlgID(hashAlgID) {
        result := ComCall(82, this, "int*", hashAlgID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCERTSTORE} hStore 
     * @returns {HRESULT} 
     */
    SetHStoreMy(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(83, this, "ptr", hStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCERTSTORE} hStore 
     * @returns {HRESULT} 
     */
    SetHStoreCA(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(84, this, "ptr", hStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCERTSTORE} hStore 
     * @returns {HRESULT} 
     */
    SetHStoreROOT(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(85, this, "ptr", hStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCERTSTORE} hStore 
     * @returns {HRESULT} 
     */
    SetHStoreRequest(hStore) {
        hStore := hStore is Win32Handle ? NumGet(hStore, "ptr") : hStore

        result := ComCall(86, this, "ptr", hStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fLimitExchangeKeyToEncipherment 
     * @returns {HRESULT} 
     */
    put_LimitExchangeKeyToEncipherment(fLimitExchangeKeyToEncipherment) {
        result := ComCall(87, this, "int", fLimitExchangeKeyToEncipherment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fLimitExchangeKeyToEncipherment 
     * @returns {HRESULT} 
     */
    get_LimitExchangeKeyToEncipherment(fLimitExchangeKeyToEncipherment) {
        result := ComCall(88, this, "ptr", fLimitExchangeKeyToEncipherment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnableSMIMECapabilities 
     * @returns {HRESULT} 
     */
    put_EnableSMIMECapabilities(fEnableSMIMECapabilities) {
        result := ComCall(89, this, "int", fEnableSMIMECapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fEnableSMIMECapabilities 
     * @returns {HRESULT} 
     */
    get_EnableSMIMECapabilities(fEnableSMIMECapabilities) {
        result := ComCall(90, this, "ptr", fEnableSMIMECapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
