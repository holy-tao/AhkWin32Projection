#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLDOMRange.ahk" { IHTMLDOMRange }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDocumentRange extends IDispatch {
    /**
     * The interface identifier for IDocumentRange
     * @type {Guid}
     */
    static IID := Guid("{305104af-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDocumentRange interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        createRange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDocumentRange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IHTMLDOMRange} 
     */
    createRange() {
        result := ComCall(7, this, "ptr*", &ppIHTMLDOMRange := 0, "HRESULT")
        return IHTMLDOMRange(ppIHTMLDOMRange)
    }

    Query(iid) {
        if (IDocumentRange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.createRange := CallbackCreate(GetMethod(implObj, "createRange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.createRange)
    }
}
