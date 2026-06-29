#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct IDispCivicAddressReport extends IDispatch {
    /**
     * The interface identifier for IDispCivicAddressReport
     * @type {Guid}
     */
    static IID := Guid("{16ff1a34-9e30-42c3-b44d-e22513b5767a}")

    /**
     * The class identifier for DispCivicAddressReport
     * @type {Guid}
     */
    static CLSID := Guid("{4c596aec-8544-4082-ba9f-eb0a7d8e65c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDispCivicAddressReport interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AddressLine1  : IntPtr
        get_AddressLine2  : IntPtr
        get_City          : IntPtr
        get_StateProvince : IntPtr
        get_PostalCode    : IntPtr
        get_CountryRegion : IntPtr
        get_DetailLevel   : IntPtr
        get_Timestamp     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDispCivicAddressReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    AddressLine1 {
        get => this.get_AddressLine1()
    }

    /**
     * @type {BSTR} 
     */
    AddressLine2 {
        get => this.get_AddressLine2()
    }

    /**
     * @type {BSTR} 
     */
    City {
        get => this.get_City()
    }

    /**
     * @type {BSTR} 
     */
    StateProvince {
        get => this.get_StateProvince()
    }

    /**
     * @type {BSTR} 
     */
    PostalCode {
        get => this.get_PostalCode()
    }

    /**
     * @type {BSTR} 
     */
    CountryRegion {
        get => this.get_CountryRegion()
    }

    /**
     * @type {Integer} 
     */
    DetailLevel {
        get => this.get_DetailLevel()
    }

    /**
     * @type {Float} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_AddressLine1() {
        pAddress1 := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pAddress1, "HRESULT")
        return pAddress1
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_AddressLine2() {
        pAddress2 := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pAddress2, "HRESULT")
        return pAddress2
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_City() {
        pCity := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pCity, "HRESULT")
        return pCity
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StateProvince() {
        pStateProvince := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pStateProvince, "HRESULT")
        return pStateProvince
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PostalCode() {
        pPostalCode := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pPostalCode, "HRESULT")
        return pPostalCode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CountryRegion() {
        pCountryRegion := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pCountryRegion, "HRESULT")
        return pCountryRegion
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DetailLevel() {
        result := ComCall(13, this, "uint*", &pDetailLevel := 0, "HRESULT")
        return pDetailLevel
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Timestamp() {
        result := ComCall(14, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (IDispCivicAddressReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AddressLine1 := CallbackCreate(GetMethod(implObj, "get_AddressLine1"), flags, 2)
        this.vtbl.get_AddressLine2 := CallbackCreate(GetMethod(implObj, "get_AddressLine2"), flags, 2)
        this.vtbl.get_City := CallbackCreate(GetMethod(implObj, "get_City"), flags, 2)
        this.vtbl.get_StateProvince := CallbackCreate(GetMethod(implObj, "get_StateProvince"), flags, 2)
        this.vtbl.get_PostalCode := CallbackCreate(GetMethod(implObj, "get_PostalCode"), flags, 2)
        this.vtbl.get_CountryRegion := CallbackCreate(GetMethod(implObj, "get_CountryRegion"), flags, 2)
        this.vtbl.get_DetailLevel := CallbackCreate(GetMethod(implObj, "get_DetailLevel"), flags, 2)
        this.vtbl.get_Timestamp := CallbackCreate(GetMethod(implObj, "get_Timestamp"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AddressLine1)
        CallbackFree(this.vtbl.get_AddressLine2)
        CallbackFree(this.vtbl.get_City)
        CallbackFree(this.vtbl.get_StateProvince)
        CallbackFree(this.vtbl.get_PostalCode)
        CallbackFree(this.vtbl.get_CountryRegion)
        CallbackFree(this.vtbl.get_DetailLevel)
        CallbackFree(this.vtbl.get_Timestamp)
    }
}
