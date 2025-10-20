#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCUserSearchQuery extends IUnknown{
    /**
     * The interface identifier for IRTCUserSearchQuery
     * @type {Guid}
     */
    static IID => Guid("{288300f5-d23a-4365-9a73-9985c98c2881}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     */
    put_SearchTerm(bstrName, bstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(3, this, "ptr", bstrName, "ptr", bstrValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<BSTR>} pbstrValue 
     * @returns {HRESULT} 
     */
    get_SearchTerm(bstrName, pbstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(4, this, "ptr", bstrName, "ptr", pbstrValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNames 
     * @returns {HRESULT} 
     */
    get_SearchTerms(pbstrNames) {
        result := ComCall(5, this, "ptr", pbstrNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enPreference 
     * @param {Integer} lValue 
     * @returns {HRESULT} 
     */
    put_SearchPreference(enPreference, lValue) {
        result := ComCall(6, this, "int", enPreference, "int", lValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enPreference 
     * @param {Pointer<Int32>} plValue 
     * @returns {HRESULT} 
     */
    get_SearchPreference(enPreference, plValue) {
        result := ComCall(7, this, "int", enPreference, "int*", plValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDomain 
     * @returns {HRESULT} 
     */
    put_SearchDomain(bstrDomain) {
        bstrDomain := bstrDomain is String ? BSTR.Alloc(bstrDomain).Value : bstrDomain

        result := ComCall(8, this, "ptr", bstrDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDomain 
     * @returns {HRESULT} 
     */
    get_SearchDomain(pbstrDomain) {
        result := ComCall(9, this, "ptr", pbstrDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
