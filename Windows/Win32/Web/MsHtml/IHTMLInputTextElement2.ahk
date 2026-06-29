#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLInputTextElement2 extends IDispatch {
    /**
     * The interface identifier for IHTMLInputTextElement2
     * @type {Guid}
     */
    static IID := Guid("{3050f2d2-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLInputTextElement2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_selectionStart : IntPtr
        get_selectionStart : IntPtr
        put_selectionEnd   : IntPtr
        get_selectionEnd   : IntPtr
        setSelectionRange  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLInputTextElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    selectionStart {
        get => this.get_selectionStart()
        set => this.put_selectionStart(value)
    }

    /**
     * @type {Integer} 
     */
    selectionEnd {
        get => this.get_selectionEnd()
        set => this.put_selectionEnd(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_selectionStart(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_selectionStart() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_selectionEnd(v) {
        result := ComCall(9, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_selectionEnd() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} start 
     * @param {Integer} end 
     * @returns {HRESULT} 
     */
    setSelectionRange(start, end) {
        result := ComCall(11, this, "int", start, "int", end, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLInputTextElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_selectionStart := CallbackCreate(GetMethod(implObj, "put_selectionStart"), flags, 2)
        this.vtbl.get_selectionStart := CallbackCreate(GetMethod(implObj, "get_selectionStart"), flags, 2)
        this.vtbl.put_selectionEnd := CallbackCreate(GetMethod(implObj, "put_selectionEnd"), flags, 2)
        this.vtbl.get_selectionEnd := CallbackCreate(GetMethod(implObj, "get_selectionEnd"), flags, 2)
        this.vtbl.setSelectionRange := CallbackCreate(GetMethod(implObj, "setSelectionRange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_selectionStart)
        CallbackFree(this.vtbl.get_selectionStart)
        CallbackFree(this.vtbl.put_selectionEnd)
        CallbackFree(this.vtbl.get_selectionEnd)
        CallbackFree(this.vtbl.setSelectionRange)
    }
}
