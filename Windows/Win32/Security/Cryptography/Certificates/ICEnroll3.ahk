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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallPKCS7", "Reset", "GetSupportedKeySpec", "GetKeyLen", "EnumAlgs", "GetAlgName", "put_ReuseHardwareKeyIfUnableToGenNew", "get_ReuseHardwareKeyIfUnableToGenNew", "put_HashAlgID", "get_HashAlgID", "put_LimitExchangeKeyToEncipherment", "get_LimitExchangeKeyToEncipherment", "put_EnableSMIMECapabilities", "get_EnableSMIMECapabilities"]

    /**
     * 
     * @param {BSTR} PKCS7 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-installpkcs7
     */
    InstallPKCS7(PKCS7) {
        PKCS7 := PKCS7 is String ? BSTR.Alloc(PKCS7).Value : PKCS7

        result := ComCall(69, this, "ptr", PKCS7, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-reset
     */
    Reset() {
        result := ComCall(70, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-getsupportedkeyspec
     */
    GetSupportedKeySpec() {
        result := ComCall(71, this, "int*", &pdwKeySpec := 0, "HRESULT")
        return pdwKeySpec
    }

    /**
     * 
     * @param {BOOL} fMin 
     * @param {BOOL} fExchange 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-getkeylen
     */
    GetKeyLen(fMin, fExchange) {
        result := ComCall(72, this, "int", fMin, "int", fExchange, "int*", &pdwKeySize := 0, "HRESULT")
        return pdwKeySize
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Integer} algClass 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-enumalgs
     */
    EnumAlgs(dwIndex, algClass) {
        result := ComCall(73, this, "int", dwIndex, "int", algClass, "int*", &pdwAlgID := 0, "HRESULT")
        return pdwAlgID
    }

    /**
     * 
     * @param {Integer} algID 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-getalgname
     */
    GetAlgName(algID) {
        pbstr := BSTR()
        result := ComCall(74, this, "int", algID, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {BOOL} fReuseHardwareKeyIfUnableToGenNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-put_reusehardwarekeyifunabletogennew
     */
    put_ReuseHardwareKeyIfUnableToGenNew(fReuseHardwareKeyIfUnableToGenNew) {
        result := ComCall(75, this, "int", fReuseHardwareKeyIfUnableToGenNew, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-get_reusehardwarekeyifunabletogennew
     */
    get_ReuseHardwareKeyIfUnableToGenNew() {
        result := ComCall(76, this, "int*", &fReuseHardwareKeyIfUnableToGenNew := 0, "HRESULT")
        return fReuseHardwareKeyIfUnableToGenNew
    }

    /**
     * 
     * @param {Integer} hashAlgID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-put_hashalgid
     */
    put_HashAlgID(hashAlgID) {
        result := ComCall(77, this, "int", hashAlgID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-get_hashalgid
     */
    get_HashAlgID() {
        result := ComCall(78, this, "int*", &hashAlgID := 0, "HRESULT")
        return hashAlgID
    }

    /**
     * 
     * @param {BOOL} fLimitExchangeKeyToEncipherment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-put_limitexchangekeytoencipherment
     */
    put_LimitExchangeKeyToEncipherment(fLimitExchangeKeyToEncipherment) {
        result := ComCall(79, this, "int", fLimitExchangeKeyToEncipherment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-get_limitexchangekeytoencipherment
     */
    get_LimitExchangeKeyToEncipherment() {
        result := ComCall(80, this, "int*", &fLimitExchangeKeyToEncipherment := 0, "HRESULT")
        return fLimitExchangeKeyToEncipherment
    }

    /**
     * 
     * @param {BOOL} fEnableSMIMECapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-put_enablesmimecapabilities
     */
    put_EnableSMIMECapabilities(fEnableSMIMECapabilities) {
        result := ComCall(81, this, "int", fEnableSMIMECapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll3-get_enablesmimecapabilities
     */
    get_EnableSMIMECapabilities() {
        result := ComCall(82, this, "int*", &fEnableSMIMECapabilities := 0, "HRESULT")
        return fEnableSMIMECapabilities
    }
}
