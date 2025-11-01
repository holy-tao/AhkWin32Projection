#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IESEvent.ahk

/**
 * Implements methods that get information from a LicenseRenewalResult event.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESLicenseRenewalResultEvent)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ieslicenserenewalresultevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESLicenseRenewalResultEvent extends IESEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESLicenseRenewalResultEvent
     * @type {Guid}
     */
    static IID => Guid("{d5a48ef5-a81b-4df0-acaa-5e35e7ea45d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCallersId", "GetFileName", "IsRenewalSuccessful", "IsCheckEntitlementCallRequired", "GetDescrambledStatus", "GetRenewalResultCode", "GetCASFailureCode", "GetRenewalHResult", "GetEntitlementTokenLength", "GetEntitlementToken", "GetExpiryDate"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCallersId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getcallersid
     */
    GetCallersId(pdwCallersId) {
        pdwCallersIdMarshal := pdwCallersId is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwCallersIdMarshal, pdwCallersId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getfilename
     */
    GetFileName(pbstrFilename) {
        result := ComCall(9, this, "ptr", pbstrFilename, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfRenewalSuccessful 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-isrenewalsuccessful
     */
    IsRenewalSuccessful(pfRenewalSuccessful) {
        result := ComCall(10, this, "ptr", pfRenewalSuccessful, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCheckEntTokenCallNeeded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-ischeckentitlementcallrequired
     */
    IsCheckEntitlementCallRequired(pfCheckEntTokenCallNeeded) {
        result := ComCall(11, this, "ptr", pfCheckEntTokenCallNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDescrambledStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getdescrambledstatus
     */
    GetDescrambledStatus(pDescrambledStatus) {
        pDescrambledStatusMarshal := pDescrambledStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pDescrambledStatusMarshal, pDescrambledStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRenewalResultCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getrenewalresultcode
     */
    GetRenewalResultCode(pdwRenewalResultCode) {
        pdwRenewalResultCodeMarshal := pdwRenewalResultCode is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pdwRenewalResultCodeMarshal, pdwRenewalResultCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCASFailureCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getcasfailurecode
     */
    GetCASFailureCode(pdwCASFailureCode) {
        pdwCASFailureCodeMarshal := pdwCASFailureCode is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pdwCASFailureCodeMarshal, pdwCASFailureCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getrenewalhresult
     */
    GetRenewalHResult(phr) {
        result := ComCall(15, this, "ptr", phr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getentitlementtokenlength
     */
    GetEntitlementTokenLength(pdwLength) {
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getentitlementtoken
     */
    GetEntitlementToken(pbData) {
        result := ComCall(17, this, "ptr*", pbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pqwExpiryDate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getexpirydate
     */
    GetExpiryDate(pqwExpiryDate) {
        pqwExpiryDateMarshal := pqwExpiryDate is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, pqwExpiryDateMarshal, pqwExpiryDate, "HRESULT")
        return result
    }
}
