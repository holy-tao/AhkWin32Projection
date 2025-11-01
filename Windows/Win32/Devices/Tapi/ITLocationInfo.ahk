#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} plLocationID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_permanentlocationid
     */
    get_PermanentLocationID(plLocationID) {
        plLocationIDMarshal := plLocationID is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plLocationIDMarshal, plLocationID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCountryCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_countrycode
     */
    get_CountryCode(plCountryCode) {
        plCountryCodeMarshal := plCountryCode is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plCountryCodeMarshal, plCountryCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCountryID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_countryid
     */
    get_CountryID(plCountryID) {
        plCountryIDMarshal := plCountryID is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plCountryIDMarshal, plCountryID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_options
     */
    get_Options(plOptions) {
        plOptionsMarshal := plOptions is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plOptionsMarshal, plOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCardID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_preferredcardid
     */
    get_PreferredCardID(plCardID) {
        plCardIDMarshal := plCardID is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plCardIDMarshal, plCardID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppLocationName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_locationname
     */
    get_LocationName(ppLocationName) {
        result := ComCall(12, this, "ptr", ppLocationName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_citycode
     */
    get_CityCode(ppCode) {
        result := ComCall(13, this, "ptr", ppCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_localaccesscode
     */
    get_LocalAccessCode(ppCode) {
        result := ComCall(14, this, "ptr", ppCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_longdistanceaccesscode
     */
    get_LongDistanceAccessCode(ppCode) {
        result := ComCall(15, this, "ptr", ppCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppTollList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_tollprefixlist
     */
    get_TollPrefixList(ppTollList) {
        result := ComCall(16, this, "ptr", ppTollList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlocationinfo-get_cancelcallwaitingcode
     */
    get_CancelCallWaitingCode(ppCode) {
        result := ComCall(17, this, "ptr", ppCode, "HRESULT")
        return result
    }
}
