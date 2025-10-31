#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * X.509 Endorsement Key Interface
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509endorsementkey
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509EndorsementKey extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509EndorsementKey
     * @type {Guid}
     */
    static IID => Guid("{b11cd855-f4c4-4fc6-b710-4422237f09e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProviderName", "put_ProviderName", "get_Length", "get_Opened", "AddCertificate", "RemoveCertificate", "GetCertificateByIndex", "GetCertificateCount", "ExportPublicKey", "Open", "Close"]

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-get_providername
     */
    get_ProviderName(pValue) {
        result := ComCall(7, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-put_providername
     */
    put_ProviderName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(8, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-get_length
     */
    get_Length(pValue) {
        result := ComCall(9, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-get_opened
     */
    get_Opened(pValue) {
        result := ComCall(10, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strCertificate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-addcertificate
     */
    AddCertificate(Encoding, strCertificate) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(11, this, "int", Encoding, "ptr", strCertificate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strCertificate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-removecertificate
     */
    RemoveCertificate(Encoding, strCertificate) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(12, this, "int", Encoding, "ptr", strCertificate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} ManufacturerOnly 
     * @param {Integer} dwIndex 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-getcertificatebyindex
     */
    GetCertificateByIndex(ManufacturerOnly, dwIndex, Encoding, pValue) {
        result := ComCall(13, this, "short", ManufacturerOnly, "int", dwIndex, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} ManufacturerOnly 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-getcertificatecount
     */
    GetCertificateCount(ManufacturerOnly, pCount) {
        result := ComCall(14, this, "short", ManufacturerOnly, "int*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509PublicKey>} ppPublicKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-exportpublickey
     */
    ExportPublicKey(ppPublicKey) {
        result := ComCall(15, this, "ptr*", ppPublicKey, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-open
     */
    Open() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-close
     */
    Close() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
