#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTableCaption extends IDispatch {
    /**
     * The interface identifier for IHTMLTableCaption
     * @type {Guid}
     */
    static IID := Guid("{3050f2eb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLTableCaption
     * @type {Guid}
     */
    static CLSID := Guid("{3050f2ec-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTableCaption interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_align  : IntPtr
        get_align  : IntPtr
        put_vAlign : IntPtr
        get_vAlign : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTableCaption.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    align {
        get => this.get_align()
        set => this.put_align(value)
    }

    /**
     * @type {BSTR} 
     */
    vAlign {
        get => this.get_vAlign()
        set => this.put_vAlign(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_align() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_vAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_vAlign() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLTableCaption.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_align := CallbackCreate(GetMethod(implObj, "put_align"), flags, 2)
        this.vtbl.get_align := CallbackCreate(GetMethod(implObj, "get_align"), flags, 2)
        this.vtbl.put_vAlign := CallbackCreate(GetMethod(implObj, "put_vAlign"), flags, 2)
        this.vtbl.get_vAlign := CallbackCreate(GetMethod(implObj, "get_vAlign"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_align)
        CallbackFree(this.vtbl.get_align)
        CallbackFree(this.vtbl.put_vAlign)
        CallbackFree(this.vtbl.get_vAlign)
    }
}
