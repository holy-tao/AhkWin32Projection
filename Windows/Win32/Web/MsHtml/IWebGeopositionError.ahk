#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IWebGeopositionError extends IDispatch {
    /**
     * The interface identifier for IWebGeopositionError
     * @type {Guid}
     */
    static IID := Guid("{305107c9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for WebGeopositionError
     * @type {Guid}
     */
    static CLSID := Guid("{305107ca-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebGeopositionError interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_code    : IntPtr
        get_message : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebGeopositionError.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    code {
        get => this.get_code()
    }

    /**
     * @type {BSTR} 
     */
    message {
        get => this.get_message()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_code() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_message() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IWebGeopositionError.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_code := CallbackCreate(GetMethod(implObj, "get_code"), flags, 2)
        this.vtbl.get_message := CallbackCreate(GetMethod(implObj, "get_message"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_code)
        CallbackFree(this.vtbl.get_message)
    }
}
