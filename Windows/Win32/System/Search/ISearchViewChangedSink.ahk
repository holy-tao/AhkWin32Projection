#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SEARCH_ITEM_CHANGE.ahk" { SEARCH_ITEM_CHANGE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Not implemented. (ISearchViewChangedSink)
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchviewchangedsink
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchViewChangedSink extends IUnknown {
    /**
     * The interface identifier for ISearchViewChangedSink
     * @type {Guid}
     */
    static IID := Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef65}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchViewChangedSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchViewChangedSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Not implemented. (ISearchViewChangedSink.OnChange)
     * @param {Pointer<Integer>} pdwDocID This parameter is unused.
     * @param {Pointer<SEARCH_ITEM_CHANGE>} pChange This parameter is unused.
     * @param {Pointer<BOOL>} pfInView This parameter is unused.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchviewchangedsink-onchange
     */
    OnChange(pdwDocID, pChange, pfInView) {
        pdwDocIDMarshal := pdwDocID is VarRef ? "int*" : "ptr"
        pfInViewMarshal := pfInView is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pdwDocIDMarshal, pdwDocID, SEARCH_ITEM_CHANGE.Ptr, pChange, pfInViewMarshal, pfInView, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISearchViewChangedSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnChange := CallbackCreate(GetMethod(implObj, "OnChange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnChange)
    }
}
