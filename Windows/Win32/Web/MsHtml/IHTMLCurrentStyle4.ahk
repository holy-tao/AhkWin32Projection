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
export default struct IHTMLCurrentStyle4 extends IDispatch {
    /**
     * The interface identifier for IHTMLCurrentStyle4
     * @type {Guid}
     */
    static IID := Guid("{3050f33b-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCurrentStyle4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_msInterpolationMode : IntPtr
        get_maxHeight           : IntPtr
        get_minWidth            : IntPtr
        get_maxWidth            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCurrentStyle4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    msInterpolationMode {
        get => this.get_msInterpolationMode()
    }

    /**
     * @type {VARIANT} 
     */
    maxHeight {
        get => this.get_maxHeight()
    }

    /**
     * @type {VARIANT} 
     */
    minWidth {
        get => this.get_minWidth()
    }

    /**
     * @type {VARIANT} 
     */
    maxWidth {
        get => this.get_maxWidth()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msInterpolationMode() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_maxHeight() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_minWidth() {
        p := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_maxWidth() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLCurrentStyle4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_msInterpolationMode := CallbackCreate(GetMethod(implObj, "get_msInterpolationMode"), flags, 2)
        this.vtbl.get_maxHeight := CallbackCreate(GetMethod(implObj, "get_maxHeight"), flags, 2)
        this.vtbl.get_minWidth := CallbackCreate(GetMethod(implObj, "get_minWidth"), flags, 2)
        this.vtbl.get_maxWidth := CallbackCreate(GetMethod(implObj, "get_maxWidth"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_msInterpolationMode)
        CallbackFree(this.vtbl.get_maxHeight)
        CallbackFree(this.vtbl.get_minWidth)
        CallbackFree(this.vtbl.get_maxWidth)
    }
}
