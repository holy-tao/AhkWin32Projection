#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITLocationInfo interface is used to get information related to the location of the calling party. This is the location information that is entered by using the Telephony applet under the Control Panel.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nn-tapi3if-itlocationinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITLocationInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITLocationInfo
     * @type {Guid}
     */
    static IID => Guid("{0c4d8eff-8ddb-11d1-a09e-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PermanentLocationID", "get_CountryCode", "get_CountryID", "get_Options", "get_PreferredCardID", "get_LocationName", "get_CityCode", "get_LocalAccessCode", "get_LongDistanceAccessCode", "get_TollPrefixList", "get_CancelCallWaitingCode"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlocationinfo-get_permanentlocationid
     */
    get_PermanentLocationID() {
        result := ComCall(7, this, "int*", &plLocationID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plLocationID
    }

    /**
     * The get_CountryCode method gets the country/region code.
     * @remarks
     * The value that this method returns corresponds to the <b>dwCountryCode</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {Integer} Pointer to country/region code.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlocationinfo-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(8, this, "int*", &plCountryCode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCountryCode
    }

    /**
     * The get_CountryID method gets the identifier for the country/region.
     * @remarks
     * The value that this method returns corresponds to the <b>dwCountryID</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {Integer} Country/region ID.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlocationinfo-get_countryid
     */
    get_CountryID() {
        result := ComCall(9, this, "int*", &plCountryID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCountryID
    }

    /**
     * The get_Options method gets an indicator of whether the current location supports pulse or tone dialing.
     * @remarks
     * The value that this method returns corresponds to the <b>dwOptions</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {Integer} Dialing options, as indicated by values from 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linelocationoption--constants">LINELOCATIONOPTION_ Constants</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlocationinfo-get_options
     */
    get_Options() {
        result := ComCall(10, this, "int*", &plOptions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plOptions
    }

    /**
     * The get_PreferredCardID method gets the preferred calling card identifier for dialing from the current location.
     * @remarks
     * The value that this method returns corresponds to the <b>dwPreferredCardID</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @returns {Integer} Calling card ID.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlocationinfo-get_preferredcardid
     */
    get_PreferredCardID() {
        result := ComCall(11, this, "int*", &plCardID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlocationinfo-get_locationname
     */
    get_LocationName() {
        ppLocationName := BSTR()
        result := ComCall(12, this, "ptr", ppLocationName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlocationinfo-get_citycode
     */
    get_CityCode() {
        ppCode := BSTR()
        result := ComCall(13, this, "ptr", ppCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlocationinfo-get_localaccesscode
     */
    get_LocalAccessCode() {
        ppCode := BSTR()
        result := ComCall(14, this, "ptr", ppCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlocationinfo-get_longdistanceaccesscode
     */
    get_LongDistanceAccessCode() {
        ppCode := BSTR()
        result := ComCall(15, this, "ptr", ppCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlocationinfo-get_tollprefixlist
     */
    get_TollPrefixList() {
        ppTollList := BSTR()
        result := ComCall(16, this, "ptr", ppTollList, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlocationinfo-get_cancelcallwaitingcode
     */
    get_CancelCallWaitingCode() {
        ppCode := BSTR()
        result := ComCall(17, this, "ptr", ppCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppCode
    }
}
