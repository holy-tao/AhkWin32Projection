#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents info about the aspects of search results returned in the ISearchResult object that were incomplete.
 * @remarks
 * 
  * The <b>IUpdateException</b> object is returned as part of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-isearchresult-get_warnings">ISearchResult::Warnings</a> property when a search succeeds but can't return complete results. For example, Windows Update might not have been able to retrieve all of the update metadata for a given update from the server. In this situation, the search results returned in the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchresult">ISearchResult</a> object are usable, but they aren't necessarily complete. The properties of the <b>IUpdateException</b> objects that are returned by the <b>ISearchResult::Warnings</b> property contain info about the  aspects of the search that were incomplete. This info is unlikely to be useful programmatically, but can sometimes be useful for debugging.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateexception
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateException extends IDispatch{
    /**
     * The interface identifier for IUpdateException
     * @type {Guid}
     */
    static IID => Guid("{a376dd5e-09d4-427f-af7c-fed5b6e1c1d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Message(retval) {
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_HResult(retval) {
        result := ComCall(8, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_Context(retval) {
        result := ComCall(9, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
