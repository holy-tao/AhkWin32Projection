#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ILocationReport.ahk" { ILocationReport }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * ICivicAddressReport represents a location report that contains information in the form of a street address.
 * @remarks
 * Note that any property value can be <b>NULL</b> if the value is not available.
 * @see https://learn.microsoft.com/windows/win32/api/locationapi/nn-locationapi-icivicaddressreport
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct ICivicAddressReport extends ILocationReport {
    /**
     * The interface identifier for ICivicAddressReport
     * @type {Guid}
     */
    static IID := Guid("{c0b19f70-4adf-445d-87f2-cad8fd711792}")

    /**
     * The class identifier for CivicAddressReport
     * @type {Guid}
     */
    static CLSID := Guid("{d39e7bdd-7d05-46b8-8721-80cf035f57d7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICivicAddressReport interfaces
    */
    struct Vtbl extends ILocationReport.Vtbl {
        GetAddressLine1  : IntPtr
        GetAddressLine2  : IntPtr
        GetCity          : IntPtr
        GetStateProvince : IntPtr
        GetPostalCode    : IntPtr
        GetCountryRegion : IntPtr
        GetDetailLevel   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICivicAddressReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the first line of a street address.
     * @returns {BSTR} Address of a <b>BSTR</b> that receives the first line of a street address.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getaddressline1
     */
    GetAddressLine1() {
        pbstrAddress1 := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, pbstrAddress1, "HRESULT")
        return pbstrAddress1
    }

    /**
     * Retrieves the second line of a street address.
     * @returns {BSTR} Address of a <b>BSTR</b> that receives the second line of a street address.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getaddressline2
     */
    GetAddressLine2() {
        pbstrAddress2 := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrAddress2, "HRESULT")
        return pbstrAddress2
    }

    /**
     * Retrieves the city name.
     * @returns {BSTR} Address of a <b>BSTR</b> that receives the city name.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getcity
     */
    GetCity() {
        pbstrCity := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrCity, "HRESULT")
        return pbstrCity
    }

    /**
     * Retrieves the state or province name.
     * @returns {BSTR} Address of a <b>BSTR</b> that receives the state or province name.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getstateprovince
     */
    GetStateProvince() {
        pbstrStateProvince := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrStateProvince, "HRESULT")
        return pbstrStateProvince
    }

    /**
     * Retrieves the postal code.
     * @returns {BSTR} Address of a <b>BSTR</b> that receives the postal code.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getpostalcode
     */
    GetPostalCode() {
        pbstrPostalCode := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrPostalCode, "HRESULT")
        return pbstrPostalCode
    }

    /**
     * Retrieves the two-letter country or region code.
     * @remarks
     * The two-letter country or region code is in ISO 3166 format.
     * @returns {BSTR} Address of a <b>BSTR</b> that receives the country or region code.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getcountryregion
     */
    GetCountryRegion() {
        pbstrCountryRegion := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrCountryRegion, "HRESULT")
        return pbstrCountryRegion
    }

    /**
     * Reserved. (ICivicAddressReport.GetDetailLevel)
     * @remarks
     * To determine whether a civic address report contains valid data for a particular field, simply inspect the field's contents. If the field contains a value,  you can assume that the field contains the most accurate information available.
     * @returns {Integer} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-icivicaddressreport-getdetaillevel
     */
    GetDetailLevel() {
        result := ComCall(12, this, "uint*", &pDetailLevel := 0, "HRESULT")
        return pDetailLevel
    }

    Query(iid) {
        if (ICivicAddressReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAddressLine1 := CallbackCreate(GetMethod(implObj, "GetAddressLine1"), flags, 2)
        this.vtbl.GetAddressLine2 := CallbackCreate(GetMethod(implObj, "GetAddressLine2"), flags, 2)
        this.vtbl.GetCity := CallbackCreate(GetMethod(implObj, "GetCity"), flags, 2)
        this.vtbl.GetStateProvince := CallbackCreate(GetMethod(implObj, "GetStateProvince"), flags, 2)
        this.vtbl.GetPostalCode := CallbackCreate(GetMethod(implObj, "GetPostalCode"), flags, 2)
        this.vtbl.GetCountryRegion := CallbackCreate(GetMethod(implObj, "GetCountryRegion"), flags, 2)
        this.vtbl.GetDetailLevel := CallbackCreate(GetMethod(implObj, "GetDetailLevel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAddressLine1)
        CallbackFree(this.vtbl.GetAddressLine2)
        CallbackFree(this.vtbl.GetCity)
        CallbackFree(this.vtbl.GetStateProvince)
        CallbackFree(this.vtbl.GetPostalCode)
        CallbackFree(this.vtbl.GetCountryRegion)
        CallbackFree(this.vtbl.GetDetailLevel)
    }
}
