#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getaddressline1
     */
    GetAddressLine1() {
        pbstrAddress1 := BSTR()
        result := ComCall(6, this, "ptr", pbstrAddress1, "HRESULT")
        return pbstrAddress1
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getaddressline2
     */
    GetAddressLine2() {
        pbstrAddress2 := BSTR()
        result := ComCall(7, this, "ptr", pbstrAddress2, "HRESULT")
        return pbstrAddress2
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getcity
     */
    GetCity() {
        pbstrCity := BSTR()
        result := ComCall(8, this, "ptr", pbstrCity, "HRESULT")
        return pbstrCity
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getstateprovince
     */
    GetStateProvince() {
        pbstrStateProvince := BSTR()
        result := ComCall(9, this, "ptr", pbstrStateProvince, "HRESULT")
        return pbstrStateProvince
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getpostalcode
     */
    GetPostalCode() {
        pbstrPostalCode := BSTR()
        result := ComCall(10, this, "ptr", pbstrPostalCode, "HRESULT")
        return pbstrPostalCode
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getcountryregion
     */
    GetCountryRegion() {
        pbstrCountryRegion := BSTR()
        result := ComCall(11, this, "ptr", pbstrCountryRegion, "HRESULT")
        return pbstrCountryRegion
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getdetaillevel
     */
    GetDetailLevel() {
        result := ComCall(12, this, "uint*", &pDetailLevel := 0, "HRESULT")
        return pDetailLevel
    }
}
