#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLIFrameElement2 extends IDispatch {
    /**
     * The interface identifier for IHTMLIFrameElement2
     * @type {Guid}
     */
    static IID := Guid("{3050f4e6-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLIFrameElement2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_height : IntPtr
        get_height : IntPtr
        put_width  : IntPtr
        get_width  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLIFrameElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    height {
        get => this.get_height()
        set => this.put_height(value)
    }

    /**
     * @type {VARIANT} 
     */
    width {
        get => this.get_width()
        set => this.put_width(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLIFrameElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_height := CallbackCreate(GetMethod(implObj, "put_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.put_width := CallbackCreate(GetMethod(implObj, "put_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_height)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.put_width)
        CallbackFree(this.vtbl.get_width)
    }
}
