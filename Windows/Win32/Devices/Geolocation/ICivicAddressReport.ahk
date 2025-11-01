#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ILocationReport.ahk

/**
 * ICivicAddressReport represents a location report that contains information in the form of a street address.
 * @remarks
 * 
  * Note that any property value can be <b>NULL</b> if the value is not available.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//locationapi/nn-locationapi-icivicaddressreport
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ICivicAddressReport extends ILocationReport{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICivicAddressReport
     * @type {Guid}
     */
    static IID => Guid("{c0b19f70-4adf-445d-87f2-cad8fd711792}")

    /**
     * The class identifier for CivicAddressReport
     * @type {Guid}
     */
    static CLSID => Guid("{d39e7bdd-7d05-46b8-8721-80cf035f57d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAddressLine1", "GetAddressLine2", "GetCity", "GetStateProvince", "GetPostalCode", "GetCountryRegion", "GetDetailLevel"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrAddress1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getaddressline1
     */
    GetAddressLine1(pbstrAddress1) {
        result := ComCall(6, this, "ptr", pbstrAddress1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrAddress2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getaddressline2
     */
    GetAddressLine2(pbstrAddress2) {
        result := ComCall(7, this, "ptr", pbstrAddress2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getcity
     */
    GetCity(pbstrCity) {
        result := ComCall(8, this, "ptr", pbstrCity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrStateProvince 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getstateprovince
     */
    GetStateProvince(pbstrStateProvince) {
        result := ComCall(9, this, "ptr", pbstrStateProvince, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPostalCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getpostalcode
     */
    GetPostalCode(pbstrPostalCode) {
        result := ComCall(10, this, "ptr", pbstrPostalCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCountryRegion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getcountryregion
     */
    GetCountryRegion(pbstrCountryRegion) {
        result := ComCall(11, this, "ptr", pbstrCountryRegion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDetailLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getdetaillevel
     */
    GetDetailLevel(pDetailLevel) {
        pDetailLevelMarshal := pDetailLevel is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pDetailLevelMarshal, pDetailLevel, "HRESULT")
        return result
    }
}
