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
     * 
     * @param {Pointer<Int32>} plLocationID 
     * @returns {HRESULT} 
     */
    get_PermanentLocationID(plLocationID) {
        result := ComCall(7, this, "int*", plLocationID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCountryCode 
     * @returns {HRESULT} 
     */
    get_CountryCode(plCountryCode) {
        result := ComCall(8, this, "int*", plCountryCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCountryID 
     * @returns {HRESULT} 
     */
    get_CountryID(plCountryID) {
        result := ComCall(9, this, "int*", plCountryID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plOptions 
     * @returns {HRESULT} 
     */
    get_Options(plOptions) {
        result := ComCall(10, this, "int*", plOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCardID 
     * @returns {HRESULT} 
     */
    get_PreferredCardID(plCardID) {
        result := ComCall(11, this, "int*", plCardID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppLocationName 
     * @returns {HRESULT} 
     */
    get_LocationName(ppLocationName) {
        result := ComCall(12, this, "ptr", ppLocationName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppCode 
     * @returns {HRESULT} 
     */
    get_CityCode(ppCode) {
        result := ComCall(13, this, "ptr", ppCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppCode 
     * @returns {HRESULT} 
     */
    get_LocalAccessCode(ppCode) {
        result := ComCall(14, this, "ptr", ppCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppCode 
     * @returns {HRESULT} 
     */
    get_LongDistanceAccessCode(ppCode) {
        result := ComCall(15, this, "ptr", ppCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppTollList 
     * @returns {HRESULT} 
     */
    get_TollPrefixList(ppTollList) {
        result := ComCall(16, this, "ptr", ppTollList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppCode 
     * @returns {HRESULT} 
     */
    get_CancelCallWaitingCode(ppCode) {
        result := ComCall(17, this, "ptr", ppCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
