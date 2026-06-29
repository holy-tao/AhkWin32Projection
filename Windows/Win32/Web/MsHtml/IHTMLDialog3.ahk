#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDialog3 extends IDispatch {
    /**
     * The interface identifier for IHTMLDialog3
     * @type {Guid}
     */
    static IID := Guid("{3050f388-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDialog3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_unadorned  : IntPtr
        get_unadorned  : IntPtr
        put_dialogHide : IntPtr
        get_dialogHide : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDialog3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    unadorned {
        get => this.get_unadorned()
        set => this.put_unadorned(value)
    }

    /**
     * @type {BSTR} 
     */
    dialogHide {
        get => this.get_dialogHide()
        set => this.put_dialogHide(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_unadorned(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_unadorned() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dialogHide(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dialogHide() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLDialog3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_unadorned := CallbackCreate(GetMethod(implObj, "put_unadorned"), flags, 2)
        this.vtbl.get_unadorned := CallbackCreate(GetMethod(implObj, "get_unadorned"), flags, 2)
        this.vtbl.put_dialogHide := CallbackCreate(GetMethod(implObj, "put_dialogHide"), flags, 2)
        this.vtbl.get_dialogHide := CallbackCreate(GetMethod(implObj, "get_dialogHide"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_unadorned)
        CallbackFree(this.vtbl.get_unadorned)
        CallbackFree(this.vtbl.put_dialogHide)
        CallbackFree(this.vtbl.get_dialogHide)
    }
}
