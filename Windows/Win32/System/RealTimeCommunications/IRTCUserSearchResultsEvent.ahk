#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCUserSearchResultsEvent extends IDispatch{
    /**
     * The interface identifier for IRTCUserSearchResultsEvent
     * @type {Guid}
     */
    static IID => Guid("{d8c8c3cd-7fac-4088-81c5-c24cbc0938e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IRTCEnumUserSearchResults>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumerateResults(ppEnum) {
        result := ComCall(7, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    get_Results(ppCollection) {
        result := ComCall(8, this, "ptr", ppCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCProfile2>} ppProfile 
     * @returns {HRESULT} 
     */
    get_Profile(ppProfile) {
        result := ComCall(9, this, "ptr", ppProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCUserSearchQuery>} ppQuery 
     * @returns {HRESULT} 
     */
    get_Query(ppQuery) {
        result := ComCall(10, this, "ptr", ppQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} plCookie 
     * @returns {HRESULT} 
     */
    get_Cookie(plCookie) {
        result := ComCall(11, this, "ptr*", plCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plStatusCode 
     * @returns {HRESULT} 
     */
    get_StatusCode(plStatusCode) {
        result := ComCall(12, this, "int*", plStatusCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfMoreAvailable 
     * @returns {HRESULT} 
     */
    get_MoreAvailable(pfMoreAvailable) {
        result := ComCall(13, this, "ptr", pfMoreAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
