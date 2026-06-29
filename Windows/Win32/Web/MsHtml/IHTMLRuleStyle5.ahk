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
export default struct IHTMLRuleStyle5 extends IDispatch {
    /**
     * The interface identifier for IHTMLRuleStyle5
     * @type {Guid}
     */
    static IID := Guid("{3050f335-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLRuleStyle5 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_msInterpolationMode : IntPtr
        get_msInterpolationMode : IntPtr
        put_maxHeight           : IntPtr
        get_maxHeight           : IntPtr
        put_minWidth            : IntPtr
        get_minWidth            : IntPtr
        put_maxWidth            : IntPtr
        get_maxWidth            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLRuleStyle5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    msInterpolationMode {
        get => this.get_msInterpolationMode()
        set => this.put_msInterpolationMode(value)
    }

    /**
     * @type {VARIANT} 
     */
    maxHeight {
        get => this.get_maxHeight()
        set => this.put_maxHeight(value)
    }

    /**
     * @type {VARIANT} 
     */
    minWidth {
        get => this.get_minWidth()
        set => this.put_minWidth(value)
    }

    /**
     * @type {VARIANT} 
     */
    maxWidth {
        get => this.get_maxWidth()
        set => this.put_maxWidth(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msInterpolationMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msInterpolationMode() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_maxHeight(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_maxHeight() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_minWidth(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_minWidth() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_maxWidth(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_maxWidth() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLRuleStyle5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_msInterpolationMode := CallbackCreate(GetMethod(implObj, "put_msInterpolationMode"), flags, 2)
        this.vtbl.get_msInterpolationMode := CallbackCreate(GetMethod(implObj, "get_msInterpolationMode"), flags, 2)
        this.vtbl.put_maxHeight := CallbackCreate(GetMethod(implObj, "put_maxHeight"), flags, 2)
        this.vtbl.get_maxHeight := CallbackCreate(GetMethod(implObj, "get_maxHeight"), flags, 2)
        this.vtbl.put_minWidth := CallbackCreate(GetMethod(implObj, "put_minWidth"), flags, 2)
        this.vtbl.get_minWidth := CallbackCreate(GetMethod(implObj, "get_minWidth"), flags, 2)
        this.vtbl.put_maxWidth := CallbackCreate(GetMethod(implObj, "put_maxWidth"), flags, 2)
        this.vtbl.get_maxWidth := CallbackCreate(GetMethod(implObj, "get_maxWidth"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_msInterpolationMode)
        CallbackFree(this.vtbl.get_msInterpolationMode)
        CallbackFree(this.vtbl.put_maxHeight)
        CallbackFree(this.vtbl.get_maxHeight)
        CallbackFree(this.vtbl.put_minWidth)
        CallbackFree(this.vtbl.get_minWidth)
        CallbackFree(this.vtbl.put_maxWidth)
        CallbackFree(this.vtbl.get_maxWidth)
    }
}
