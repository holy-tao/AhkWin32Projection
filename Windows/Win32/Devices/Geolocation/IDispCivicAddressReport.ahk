#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class IDispCivicAddressReport extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AddressLine1", "get_AddressLine2", "get_City", "get_StateProvince", "get_PostalCode", "get_CountryRegion", "get_DetailLevel", "get_Timestamp"]

    /**
     * 
     * @param {Pointer<BSTR>} pAddress1 
     * @returns {HRESULT} 
     */
    get_AddressLine1(pAddress1) {
        result := ComCall(7, this, "ptr", pAddress1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAddress2 
     * @returns {HRESULT} 
     */
    get_AddressLine2(pAddress2) {
        result := ComCall(8, this, "ptr", pAddress2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pCity 
     * @returns {HRESULT} 
     */
    get_City(pCity) {
        result := ComCall(9, this, "ptr", pCity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pStateProvince 
     * @returns {HRESULT} 
     */
    get_StateProvince(pStateProvince) {
        result := ComCall(10, this, "ptr", pStateProvince, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPostalCode 
     * @returns {HRESULT} 
     */
    get_PostalCode(pPostalCode) {
        result := ComCall(11, this, "ptr", pPostalCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pCountryRegion 
     * @returns {HRESULT} 
     */
    get_CountryRegion(pCountryRegion) {
        result := ComCall(12, this, "ptr", pCountryRegion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDetailLevel 
     * @returns {HRESULT} 
     */
    get_DetailLevel(pDetailLevel) {
        result := ComCall(13, this, "uint*", pDetailLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     */
    get_Timestamp(pVal) {
        result := ComCall(14, this, "double*", pVal, "HRESULT")
        return result
    }
}
