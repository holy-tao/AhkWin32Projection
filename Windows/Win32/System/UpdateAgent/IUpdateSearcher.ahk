#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Searches for updates on a server.
 * @remarks
 * 
  * You can create an instance of this interface by using the UpdateSearcher coclass. Use the Microsoft.Update.Searcher program identifier to create the object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatesearcher
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateSearcher extends IDispatch{
    /**
     * The interface identifier for IUpdateSearcher
     * @type {Guid}
     */
    static IID => Guid("{8f45abf1-f9ae-4b95-a933-f0f66e5056ea}")

    /**
     * The class identifier for UpdateSearcher
     * @type {Guid}
     */
    static CLSID => Guid("{b699e5e8-67ff-4177-88b0-3684a3388bfb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_CanAutomaticallyUpgradeService(retval) {
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_CanAutomaticallyUpgradeService(value) {
        result := ComCall(8, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ClientApplicationID(retval) {
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_IncludePotentiallySupersededUpdates(retval) {
        result := ComCall(11, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_IncludePotentiallySupersededUpdates(value) {
        result := ComCall(12, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_ServerSelection(retval) {
        result := ComCall(13, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ServerSelection(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} criteria 
     * @param {Pointer<IUnknown>} onCompleted 
     * @param {VARIANT} state 
     * @param {Pointer<ISearchJob>} retval 
     * @returns {HRESULT} 
     */
    BeginSearch(criteria, onCompleted, state, retval) {
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(15, this, "ptr", criteria, "ptr", onCompleted, "ptr", state, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISearchJob>} searchJob 
     * @param {Pointer<ISearchResult>} retval 
     * @returns {HRESULT} 
     */
    EndSearch(searchJob, retval) {
        result := ComCall(16, this, "ptr", searchJob, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} unescaped 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    EscapeString(unescaped, retval) {
        unescaped := unescaped is String ? BSTR.Alloc(unescaped).Value : unescaped

        result := ComCall(17, this, "ptr", unescaped, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} count 
     * @param {Pointer<IUpdateHistoryEntryCollection>} retval 
     * @returns {HRESULT} 
     */
    QueryHistory(startIndex, count, retval) {
        result := ComCall(18, this, "int", startIndex, "int", count, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} criteria 
     * @param {Pointer<ISearchResult>} retval 
     * @returns {HRESULT} 
     */
    Search(criteria, retval) {
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(19, this, "ptr", criteria, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_Online(retval) {
        result := ComCall(20, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_Online(value) {
        result := ComCall(21, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    GetTotalHistoryCount(retval) {
        result := ComCall(22, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ServiceID(retval) {
        result := ComCall(23, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_ServiceID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
