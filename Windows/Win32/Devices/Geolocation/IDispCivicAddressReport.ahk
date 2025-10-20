#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class IDispCivicAddressReport extends IDispatch{
    /**
     * The interface identifier for IDispCivicAddressReport
     * @type {Guid}
     */
    static IID => Guid("{16ff1a34-9e30-42c3-b44d-e22513b5767a}")

    /**
     * The class identifier for DispCivicAddressReport
     * @type {Guid}
     */
    static CLSID => Guid("{4c596aec-8544-4082-ba9f-eb0a7d8e65c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pAddress1 
     * @returns {HRESULT} 
     */
    get_AddressLine1(pAddress1) {
        result := ComCall(7, this, "ptr", pAddress1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAddress2 
     * @returns {HRESULT} 
     */
    get_AddressLine2(pAddress2) {
        result := ComCall(8, this, "ptr", pAddress2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pCity 
     * @returns {HRESULT} 
     */
    get_City(pCity) {
        result := ComCall(9, this, "ptr", pCity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pStateProvince 
     * @returns {HRESULT} 
     */
    get_StateProvince(pStateProvince) {
        result := ComCall(10, this, "ptr", pStateProvince, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPostalCode 
     * @returns {HRESULT} 
     */
    get_PostalCode(pPostalCode) {
        result := ComCall(11, this, "ptr", pPostalCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pCountryRegion 
     * @returns {HRESULT} 
     */
    get_CountryRegion(pCountryRegion) {
        result := ComCall(12, this, "ptr", pCountryRegion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pDetailLevel 
     * @returns {HRESULT} 
     */
    get_DetailLevel(pDetailLevel) {
        result := ComCall(13, this, "uint*", pDetailLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pVal 
     * @returns {HRESULT} 
     */
    get_Timestamp(pVal) {
        result := ComCall(14, this, "double*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
