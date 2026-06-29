#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLSelectionObject2 extends IDispatch {
    /**
     * The interface identifier for IHTMLSelectionObject2
     * @type {Guid}
     */
    static IID := Guid("{3050f7ec-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLSelectionObject2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        createRangeCollection : IntPtr
        get_typeDetail        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLSelectionObject2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    typeDetail {
        get => this.get_typeDetail()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    createRangeCollection() {
        result := ComCall(7, this, "ptr*", &rangeCollection := 0, "HRESULT")
        return IDispatch(rangeCollection)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_typeDetail() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLSelectionObject2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.createRangeCollection := CallbackCreate(GetMethod(implObj, "createRangeCollection"), flags, 2)
        this.vtbl.get_typeDetail := CallbackCreate(GetMethod(implObj, "get_typeDetail"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.createRangeCollection)
        CallbackFree(this.vtbl.get_typeDetail)
    }
}
