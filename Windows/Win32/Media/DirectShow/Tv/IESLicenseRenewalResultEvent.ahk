#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getcallersid
     */
    GetCallersId() {
        result := ComCall(8, this, "uint*", &pdwCallersId := 0, "HRESULT")
        return pdwCallersId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getfilename
     */
    GetFileName() {
        pbstrFilename := BSTR()
        result := ComCall(9, this, "ptr", pbstrFilename, "HRESULT")
        return pbstrFilename
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-isrenewalsuccessful
     */
    IsRenewalSuccessful() {
        result := ComCall(10, this, "int*", &pfRenewalSuccessful := 0, "HRESULT")
        return pfRenewalSuccessful
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-ischeckentitlementcallrequired
     */
    IsCheckEntitlementCallRequired() {
        result := ComCall(11, this, "int*", &pfCheckEntTokenCallNeeded := 0, "HRESULT")
        return pfCheckEntTokenCallNeeded
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getdescrambledstatus
     */
    GetDescrambledStatus() {
        result := ComCall(12, this, "uint*", &pDescrambledStatus := 0, "HRESULT")
        return pDescrambledStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getrenewalresultcode
     */
    GetRenewalResultCode() {
        result := ComCall(13, this, "uint*", &pdwRenewalResultCode := 0, "HRESULT")
        return pdwRenewalResultCode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getcasfailurecode
     */
    GetCASFailureCode() {
        result := ComCall(14, this, "uint*", &pdwCASFailureCode := 0, "HRESULT")
        return pdwCASFailureCode
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getrenewalhresult
     */
    GetRenewalHResult() {
        result := ComCall(15, this, "int*", &phr := 0, "HRESULT")
        return phr
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getentitlementtokenlength
     */
    GetEntitlementTokenLength() {
        result := ComCall(16, this, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getentitlementtoken
     */
    GetEntitlementToken() {
        result := ComCall(17, this, "ptr*", &pbData := 0, "HRESULT")
        return pbData
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieslicenserenewalresultevent-getexpirydate
     */
    GetExpiryDate() {
        result := ComCall(18, this, "uint*", &pqwExpiryDate := 0, "HRESULT")
        return pqwExpiryDate
    }
}
