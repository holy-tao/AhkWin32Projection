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
export default struct IHTMLCurrentStyle3 extends IDispatch {
    /**
     * The interface identifier for IHTMLCurrentStyle3
     * @type {Guid}
     */
    static IID := Guid("{3050f818-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCurrentStyle3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_textOverflow : IntPtr
        get_minHeight    : IntPtr
        get_wordSpacing  : IntPtr
        get_whiteSpace   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCurrentStyle3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    textOverflow {
        get => this.get_textOverflow()
    }

    /**
     * @type {VARIANT} 
     */
    minHeight {
        get => this.get_minHeight()
    }

    /**
     * @type {VARIANT} 
     */
    wordSpacing {
        get => this.get_wordSpacing()
    }

    /**
     * @type {BSTR} 
     */
    whiteSpace {
        get => this.get_whiteSpace()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textOverflow() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_minHeight() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_wordSpacing() {
        p := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_whiteSpace() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLCurrentStyle3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_textOverflow := CallbackCreate(GetMethod(implObj, "get_textOverflow"), flags, 2)
        this.vtbl.get_minHeight := CallbackCreate(GetMethod(implObj, "get_minHeight"), flags, 2)
        this.vtbl.get_wordSpacing := CallbackCreate(GetMethod(implObj, "get_wordSpacing"), flags, 2)
        this.vtbl.get_whiteSpace := CallbackCreate(GetMethod(implObj, "get_whiteSpace"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_textOverflow)
        CallbackFree(this.vtbl.get_minHeight)
        CallbackFree(this.vtbl.get_wordSpacing)
        CallbackFree(this.vtbl.get_whiteSpace)
    }
}
