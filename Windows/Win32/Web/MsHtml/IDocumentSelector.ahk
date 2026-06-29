#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import ".\IHTMLDOMChildrenCollection.ahk" { IHTMLDOMChildrenCollection }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDocumentSelector extends IDispatch {
    /**
     * The interface identifier for IDocumentSelector
     * @type {Guid}
     */
    static IID := Guid("{30510462-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDocumentSelector interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        querySelector    : IntPtr
        querySelectorAll : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDocumentSelector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElement} 
     */
    querySelector(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "ptr*", &pel := 0, "HRESULT")
        return IHTMLElement(pel)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLDOMChildrenCollection} 
     */
    querySelectorAll(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, BSTR, v, "ptr*", &pel := 0, "HRESULT")
        return IHTMLDOMChildrenCollection(pel)
    }

    Query(iid) {
        if (IDocumentSelector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.querySelector := CallbackCreate(GetMethod(implObj, "querySelector"), flags, 3)
        this.vtbl.querySelectorAll := CallbackCreate(GetMethod(implObj, "querySelectorAll"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.querySelector)
        CallbackFree(this.vtbl.querySelectorAll)
    }
}
