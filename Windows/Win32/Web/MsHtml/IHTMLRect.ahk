#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLRect extends IDispatch {
    /**
     * The interface identifier for IHTMLRect
     * @type {Guid}
     */
    static IID := Guid("{3050f4a3-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLRect interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_left   : IntPtr
        get_left   : IntPtr
        put_top    : IntPtr
        get_top    : IntPtr
        put_right  : IntPtr
        get_right  : IntPtr
        put_bottom : IntPtr
        get_bottom : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLRect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    left {
        get => this.get_left()
        set => this.put_left(value)
    }

    /**
     * @type {Integer} 
     */
    top {
        get => this.get_top()
        set => this.put_top(value)
    }

    /**
     * @type {Integer} 
     */
    right {
        get => this.get_right()
        set => this.put_right(value)
    }

    /**
     * @type {Integer} 
     */
    bottom {
        get => this.get_bottom()
        set => this.put_bottom(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_left(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_left() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_top(v) {
        result := ComCall(9, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_top() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_right(v) {
        result := ComCall(11, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_right() {
        result := ComCall(12, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_bottom(v) {
        result := ComCall(13, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_bottom() {
        result := ComCall(14, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLRect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_left := CallbackCreate(GetMethod(implObj, "put_left"), flags, 2)
        this.vtbl.get_left := CallbackCreate(GetMethod(implObj, "get_left"), flags, 2)
        this.vtbl.put_top := CallbackCreate(GetMethod(implObj, "put_top"), flags, 2)
        this.vtbl.get_top := CallbackCreate(GetMethod(implObj, "get_top"), flags, 2)
        this.vtbl.put_right := CallbackCreate(GetMethod(implObj, "put_right"), flags, 2)
        this.vtbl.get_right := CallbackCreate(GetMethod(implObj, "get_right"), flags, 2)
        this.vtbl.put_bottom := CallbackCreate(GetMethod(implObj, "put_bottom"), flags, 2)
        this.vtbl.get_bottom := CallbackCreate(GetMethod(implObj, "get_bottom"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_left)
        CallbackFree(this.vtbl.get_left)
        CallbackFree(this.vtbl.put_top)
        CallbackFree(this.vtbl.get_top)
        CallbackFree(this.vtbl.put_right)
        CallbackFree(this.vtbl.get_right)
        CallbackFree(this.vtbl.put_bottom)
        CallbackFree(this.vtbl.get_bottom)
    }
}
