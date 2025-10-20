#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Not implemented.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchviewchangedsink
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchViewChangedSink extends IUnknown{
    /**
     * The interface identifier for ISearchViewChangedSink
     * @type {Guid}
     */
    static IID => Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pdwDocID 
     * @param {Pointer<SEARCH_ITEM_CHANGE>} pChange 
     * @param {Pointer<BOOL>} pfInView 
     * @returns {HRESULT} 
     */
    OnChange(pdwDocID, pChange, pfInView) {
        result := ComCall(3, this, "int*", pdwDocID, "ptr", pChange, "ptr", pfInView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
