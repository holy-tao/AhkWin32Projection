#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLRectCollection.ahk" { IHTMLRectCollection }
#Import ".\IHTMLRect.ahk" { IHTMLRect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTextRangeMetrics2 extends IDispatch {
    /**
     * The interface identifier for IHTMLTextRangeMetrics2
     * @type {Guid}
     */
    static IID := Guid("{3050f4a6-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTextRangeMetrics2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        getClientRects        : IntPtr
        getBoundingClientRect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTextRangeMetrics2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IHTMLRectCollection} 
     */
    getClientRects() {
        result := ComCall(7, this, "ptr*", &pRectCol := 0, "HRESULT")
        return IHTMLRectCollection(pRectCol)
    }

    /**
     * 
     * @returns {IHTMLRect} 
     */
    getBoundingClientRect() {
        result := ComCall(8, this, "ptr*", &pRect := 0, "HRESULT")
        return IHTMLRect(pRect)
    }

    Query(iid) {
        if (IHTMLTextRangeMetrics2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getClientRects := CallbackCreate(GetMethod(implObj, "getClientRects"), flags, 2)
        this.vtbl.getBoundingClientRect := CallbackCreate(GetMethod(implObj, "getBoundingClientRect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getClientRects)
        CallbackFree(this.vtbl.getBoundingClientRect)
    }
}
