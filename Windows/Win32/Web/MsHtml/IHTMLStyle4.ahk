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
export default struct IHTMLStyle4 extends IDispatch {
    /**
     * The interface identifier for IHTMLStyle4
     * @type {Guid}
     */
    static IID := Guid("{3050f816-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyle4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_textOverflow : IntPtr
        get_textOverflow : IntPtr
        put_minHeight    : IntPtr
        get_minHeight    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyle4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    textOverflow {
        get => this.get_textOverflow()
        set => this.put_textOverflow(value)
    }

    /**
     * @type {VARIANT} 
     */
    minHeight {
        get => this.get_minHeight()
        set => this.put_minHeight(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textOverflow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textOverflow() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_minHeight(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_minHeight() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLStyle4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_textOverflow := CallbackCreate(GetMethod(implObj, "put_textOverflow"), flags, 2)
        this.vtbl.get_textOverflow := CallbackCreate(GetMethod(implObj, "get_textOverflow"), flags, 2)
        this.vtbl.put_minHeight := CallbackCreate(GetMethod(implObj, "put_minHeight"), flags, 2)
        this.vtbl.get_minHeight := CallbackCreate(GetMethod(implObj, "get_minHeight"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_textOverflow)
        CallbackFree(this.vtbl.get_textOverflow)
        CallbackFree(this.vtbl.put_minHeight)
        CallbackFree(this.vtbl.get_minHeight)
    }
}
