#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BSTR>} pbstrAddress1 
     * @returns {HRESULT} 
     */
    GetAddressLine1(pbstrAddress1) {
        result := ComCall(6, this, "ptr", pbstrAddress1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrAddress2 
     * @returns {HRESULT} 
     */
    GetAddressLine2(pbstrAddress2) {
        result := ComCall(7, this, "ptr", pbstrAddress2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCity 
     * @returns {HRESULT} 
     */
    GetCity(pbstrCity) {
        result := ComCall(8, this, "ptr", pbstrCity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrStateProvince 
     * @returns {HRESULT} 
     */
    GetStateProvince(pbstrStateProvince) {
        result := ComCall(9, this, "ptr", pbstrStateProvince, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPostalCode 
     * @returns {HRESULT} 
     */
    GetPostalCode(pbstrPostalCode) {
        result := ComCall(10, this, "ptr", pbstrPostalCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCountryRegion 
     * @returns {HRESULT} 
     */
    GetCountryRegion(pbstrCountryRegion) {
        result := ComCall(11, this, "ptr", pbstrCountryRegion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pDetailLevel 
     * @returns {HRESULT} 
     */
    GetDetailLevel(pDetailLevel) {
        result := ComCall(12, this, "uint*", pDetailLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
