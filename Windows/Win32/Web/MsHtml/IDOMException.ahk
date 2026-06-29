#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMException extends IDispatch {
    /**
     * The interface identifier for IDOMException
     * @type {Guid}
     */
    static IID := Guid("{3051072b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMException
     * @type {Guid}
     */
    static CLSID := Guid("{3051072c-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMException interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_code    : IntPtr
        get_code    : IntPtr
        get_message : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMException.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    code {
        get => this.get_code()
        set => this.put_code(value)
    }

    /**
     * @type {BSTR} 
     */
    message {
        get => this.get_message()
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_code(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_code() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_message() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IDOMException.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_code := CallbackCreate(GetMethod(implObj, "put_code"), flags, 2)
        this.vtbl.get_code := CallbackCreate(GetMethod(implObj, "get_code"), flags, 2)
        this.vtbl.get_message := CallbackCreate(GetMethod(implObj, "get_message"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_code)
        CallbackFree(this.vtbl.get_code)
        CallbackFree(this.vtbl.get_message)
    }
}
