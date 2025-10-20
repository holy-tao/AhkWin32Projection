#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICEnroll2.ahk

/**
 * One of several interfaces that represent the Certificate Enrollment Control.
 * @see https://docs.microsoft.com/windows/win32/api//xenroll/nn-xenroll-icenroll3
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICEnroll3 extends ICEnroll2{
    /**
     * The interface identifier for ICEnroll3
     * @type {Guid}
     */
    static IID => Guid("{c28c2d95-b7de-11d2-a421-00c04f79fe8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 69

    /**
     * 
     * @param {BSTR} PKCS7 
     * @returns {HRESULT} 
     */
    InstallPKCS7(PKCS7) {
        PKCS7 := PKCS7 is String ? BSTR.Alloc(PKCS7).Value : PKCS7

        result := ComCall(69, this, "ptr", PKCS7, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(70, this, "int")
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
        result := ComCall(71, this, "int*", pdwKeySpec, "int")
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
        result := ComCall(72, this, "int", fMin, "int", fExchange, "int*", pdwKeySize, "int")
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
        result := ComCall(73, this, "int", dwIndex, "int", algClass, "int*", pdwAlgID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} algID 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetAlgName(algID, pbstr) {
        result := ComCall(74, this, "int", algID, "ptr", pbstr, "int")
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
        result := ComCall(75, this, "int", fReuseHardwareKeyIfUnableToGenNew, "int")
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
        result := ComCall(76, this, "ptr", fReuseHardwareKeyIfUnableToGenNew, "int")
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
        result := ComCall(77, this, "int", hashAlgID, "int")
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
        result := ComCall(78, this, "int*", hashAlgID, "int")
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
        result := ComCall(79, this, "int", fLimitExchangeKeyToEncipherment, "int")
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
        result := ComCall(80, this, "ptr", fLimitExchangeKeyToEncipherment, "int")
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
        result := ComCall(81, this, "int", fEnableSMIMECapabilities, "int")
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
        result := ComCall(82, this, "ptr", fEnableSMIMECapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
