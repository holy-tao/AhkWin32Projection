#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLFormElement2 extends IDispatch {
    /**
     * The interface identifier for IHTMLFormElement2
     * @type {Guid}
     */
    static IID := Guid("{3050f4f6-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLFormElement2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_acceptCharset : IntPtr
        get_acceptCharset : IntPtr
        urns              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLFormElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    acceptCharset {
        get => this.get_acceptCharset()
        set => this.put_acceptCharset(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_acceptCharset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_acceptCharset() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} urn 
     * @returns {IDispatch} 
     */
    urns(urn) {
        result := ComCall(9, this, VARIANT, urn, "ptr*", &pdisp := 0, "HRESULT")
        return IDispatch(pdisp)
    }

    Query(iid) {
        if (IHTMLFormElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_acceptCharset := CallbackCreate(GetMethod(implObj, "put_acceptCharset"), flags, 2)
        this.vtbl.get_acceptCharset := CallbackCreate(GetMethod(implObj, "get_acceptCharset"), flags, 2)
        this.vtbl.urns := CallbackCreate(GetMethod(implObj, "urns"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_acceptCharset)
        CallbackFree(this.vtbl.get_acceptCharset)
        CallbackFree(this.vtbl.urns)
    }
}
