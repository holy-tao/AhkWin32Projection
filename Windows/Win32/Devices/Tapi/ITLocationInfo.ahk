#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITLocationInfo interface is used to get information related to the location of the calling party. This is the location information that is entered by using the Telephony applet under the Control Panel.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itlocationinfo
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_permanentlocationid
     */
    get_PermanentLocationID() {
        result := ComCall(7, this, "int*", &plLocationID := 0, "HRESULT")
        return plLocationID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(8, this, "int*", &plCountryCode := 0, "HRESULT")
        return plCountryCode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_countryid
     */
    get_CountryID() {
        result := ComCall(9, this, "int*", &plCountryID := 0, "HRESULT")
        return plCountryID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_options
     */
    get_Options() {
        result := ComCall(10, this, "int*", &plOptions := 0, "HRESULT")
        return plOptions
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_preferredcardid
     */
    get_PreferredCardID() {
        result := ComCall(11, this, "int*", &plCardID := 0, "HRESULT")
        return plCardID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_locationname
     */
    get_LocationName() {
        ppLocationName := BSTR()
        result := ComCall(12, this, "ptr", ppLocationName, "HRESULT")
        return ppLocationName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_citycode
     */
    get_CityCode() {
        ppCode := BSTR()
        result := ComCall(13, this, "ptr", ppCode, "HRESULT")
        return ppCode
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_localaccesscode
     */
    get_LocalAccessCode() {
        ppCode := BSTR()
        result := ComCall(14, this, "ptr", ppCode, "HRESULT")
        return ppCode
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_longdistanceaccesscode
     */
    get_LongDistanceAccessCode() {
        ppCode := BSTR()
        result := ComCall(15, this, "ptr", ppCode, "HRESULT")
        return ppCode
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_tollprefixlist
     */
    get_TollPrefixList() {
        ppTollList := BSTR()
        result := ComCall(16, this, "ptr", ppTollList, "HRESULT")
        return ppTollList
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_cancelcallwaitingcode
     */
    get_CancelCallWaitingCode() {
        ppCode := BSTR()
        result := ComCall(17, this, "ptr", ppCode, "HRESULT")
        return ppCode
    }
}
