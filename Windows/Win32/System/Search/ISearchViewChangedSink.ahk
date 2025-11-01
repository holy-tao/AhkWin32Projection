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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnChange"]

    /**
     * 
     * @param {Pointer<Integer>} pdwDocID 
     * @param {Pointer<SEARCH_ITEM_CHANGE>} pChange 
     * @param {Pointer<BOOL>} pfInView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchviewchangedsink-onchange
     */
    OnChange(pdwDocID, pChange, pfInView) {
        pdwDocIDMarshal := pdwDocID is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pdwDocIDMarshal, pdwDocID, "ptr", pChange, "ptr", pfInView, "HRESULT")
        return result
    }
}
