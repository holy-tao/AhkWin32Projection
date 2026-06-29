#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITLocationInfo interface is used to get information related to the location of the calling party. This is the location information that is entered by using the Telephony applet under the Control Panel.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itlocationinfo
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITLocationInfo extends IDispatch {
    /**
     * The interface identifier for ITLocationInfo
     * @type {Guid}
     */
    static IID := Guid("{0c4d8eff-8ddb-11d1-a09e-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITLocationInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_PermanentLocationID    : IntPtr
        get_CountryCode            : IntPtr
        get_CountryID              : IntPtr
        get_Options                : IntPtr
        get_PreferredCardID        : IntPtr
        get_LocationName           : IntPtr
        get_CityCode               : IntPtr
        get_LocalAccessCode        : IntPtr
        get_LongDistanceAccessCode : IntPtr
        get_TollPrefixList         : IntPtr
        get_CancelCallWaitingCode  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITLocationInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    PermanentLocationID {
        get => this.get_PermanentLocationID()
    }

    /**
     * @type {Integer} 
     */
    CountryCode {
        get => this.get_CountryCode()
    }

    /**
     * @type {Integer} 
     */
    CountryID {
        get => this.get_CountryID()
    }

    /**
     * @type {Integer} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * @type {Integer} 
     */
    PreferredCardID {
        get => this.get_PreferredCardID()
    }

    /**
     * @type {BSTR} 
     */
    LocationName {
        get => this.get_LocationName()
    }

    /**
     * @type {BSTR} 
     */
    CityCode {
        get => this.get_CityCode()
    }

    /**
     * @type {BSTR} 
     */
    LocalAccessCode {
        get => this.get_LocalAccessCode()
    }

    /**
     * @type {BSTR} 
     */
    LongDistanceAccessCode {
        get => this.get_LongDistanceAccessCode()
    }

    /**
     * @type {BSTR} 
     */
    TollPrefixList {
        get => this.get_TollPrefixList()
    }

    /**
     * @type {BSTR} 
     */
    CancelCallWaitingCode {
        get => this.get_CancelCallWaitingCode()
    }

    /**
     * The get_PermanentLocationID method gets the permanent location identifier.
     * @remarks
     * The value that this method returns corresponds to the <b>dwPermanentLocationID</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {Integer} Pointer to the permanent location identifier.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_permanentlocationid
     */
    get_PermanentLocationID() {
        result := ComCall(7, this, "int*", &plLocationID := 0, "HRESULT")
        return plLocationID
    }

    /**
     * The get_CountryCode method gets the country/region code.
     * @remarks
     * The value that this method returns corresponds to the <b>dwCountryCode</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {Integer} Pointer to country/region code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(8, this, "int*", &plCountryCode := 0, "HRESULT")
        return plCountryCode
    }

    /**
     * The get_CountryID method gets the identifier for the country/region.
     * @remarks
     * The value that this method returns corresponds to the <b>dwCountryID</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {Integer} Country/region ID.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_countryid
     */
    get_CountryID() {
        result := ComCall(9, this, "int*", &plCountryID := 0, "HRESULT")
        return plCountryID
    }

    /**
     * The get_Options method gets an indicator of whether the current location supports pulse or tone dialing.
     * @remarks
     * The value that this method returns corresponds to the <b>dwOptions</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {Integer} Dialing options, as indicated by values from 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linelocationoption--constants">LINELOCATIONOPTION_ Constants</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_options
     */
    get_Options() {
        result := ComCall(10, this, "int*", &plOptions := 0, "HRESULT")
        return plOptions
    }

    /**
     * The get_PreferredCardID method gets the preferred calling card identifier for dialing from the current location.
     * @remarks
     * The value that this method returns corresponds to the <b>dwPreferredCardID</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {Integer} Calling card ID.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_preferredcardid
     */
    get_PreferredCardID() {
        result := ComCall(11, this, "int*", &plCardID := 0, "HRESULT")
        return plCardID
    }

    /**
     * The get_LocationName method gets the location name.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppLocationName</i> parameter.
     * 			
     * 
     * The value that this method returns corresponds to the <b>dwLocationNameSize</b> and <b>dwLocationNameOffset</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {BSTR} Pointer to the <b>BSTR</b> representation of the location name.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_locationname
     */
    get_LocationName() {
        ppLocationName := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, ppLocationName, "HRESULT")
        return ppLocationName
    }

    /**
     * The get_CityCode method gets the code for the city.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppCode</i> parameter.
     * 			
     * 
     * The value that this method returns corresponds to the <b>dwCityCodeSize</b> and <b>dwCityCodeOffset</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {BSTR} Pointer to the <b>BSTR</b> representation of the city code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_citycode
     */
    get_CityCode() {
        ppCode := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, ppCode, "HRESULT")
        return ppCode
    }

    /**
     * The get_LocalAccessCode method gets the local access code.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppCode</i> parameter.
     * 			
     * 
     * The value that this method returns corresponds to the <b>dwLocalAccessCodeSize</b> and <b>dwLocalAccessCodeOffset</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of local access code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_localaccesscode
     */
    get_LocalAccessCode() {
        ppCode := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, ppCode, "HRESULT")
        return ppCode
    }

    /**
     * The get_LongDistanceAccessCode method gets the code to access long distance.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppCode</i> parameter.
     * 			
     * 
     * The value that this method returns corresponds to the <b>dwLongDistanceAccessCodeSize</b> and <b>dwLongDistanceAccessCodeOffset</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of long distance access code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_longdistanceaccesscode
     */
    get_LongDistanceAccessCode() {
        ppCode := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, ppCode, "HRESULT")
        return ppCode
    }

    /**
     * The get_TollPrefixList method gets the toll prefix list.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppTollList</i> parameter.
     * 			
     * 
     * The value that this method returns corresponds to the <b>dwTollPrefixListSize</b> and <b>dwTollPrefixListOffset</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {BSTR} Pointer to the <b>BSTR</b> containing a list of toll prefixes.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_tollprefixlist
     */
    get_TollPrefixList() {
        ppTollList := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, ppTollList, "HRESULT")
        return ppTollList
    }

    /**
     * The get_CancelCallWaitingCode method gets the dial digits and modifier characters that must be prefixed to a dialable string to cancel call waiting.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppCode</i> parameter.
     * 			
     * 
     * The value that this method returns corresponds to the <b>dwCancelCallWaitingSize</b> and <b>dwCancelCallWaitingOffset</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of dial digits and modifier characters required to cancel call waiting.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_cancelcallwaitingcode
     */
    get_CancelCallWaitingCode() {
        ppCode := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, ppCode, "HRESULT")
        return ppCode
    }

    Query(iid) {
        if (ITLocationInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PermanentLocationID := CallbackCreate(GetMethod(implObj, "get_PermanentLocationID"), flags, 2)
        this.vtbl.get_CountryCode := CallbackCreate(GetMethod(implObj, "get_CountryCode"), flags, 2)
        this.vtbl.get_CountryID := CallbackCreate(GetMethod(implObj, "get_CountryID"), flags, 2)
        this.vtbl.get_Options := CallbackCreate(GetMethod(implObj, "get_Options"), flags, 2)
        this.vtbl.get_PreferredCardID := CallbackCreate(GetMethod(implObj, "get_PreferredCardID"), flags, 2)
        this.vtbl.get_LocationName := CallbackCreate(GetMethod(implObj, "get_LocationName"), flags, 2)
        this.vtbl.get_CityCode := CallbackCreate(GetMethod(implObj, "get_CityCode"), flags, 2)
        this.vtbl.get_LocalAccessCode := CallbackCreate(GetMethod(implObj, "get_LocalAccessCode"), flags, 2)
        this.vtbl.get_LongDistanceAccessCode := CallbackCreate(GetMethod(implObj, "get_LongDistanceAccessCode"), flags, 2)
        this.vtbl.get_TollPrefixList := CallbackCreate(GetMethod(implObj, "get_TollPrefixList"), flags, 2)
        this.vtbl.get_CancelCallWaitingCode := CallbackCreate(GetMethod(implObj, "get_CancelCallWaitingCode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PermanentLocationID)
        CallbackFree(this.vtbl.get_CountryCode)
        CallbackFree(this.vtbl.get_CountryID)
        CallbackFree(this.vtbl.get_Options)
        CallbackFree(this.vtbl.get_PreferredCardID)
        CallbackFree(this.vtbl.get_LocationName)
        CallbackFree(this.vtbl.get_CityCode)
        CallbackFree(this.vtbl.get_LocalAccessCode)
        CallbackFree(this.vtbl.get_LongDistanceAccessCode)
        CallbackFree(this.vtbl.get_TollPrefixList)
        CallbackFree(this.vtbl.get_CancelCallWaitingCode)
    }
}
