#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLObjectElement4 extends IDispatch {
    /**
     * The interface identifier for IHTMLObjectElement4
     * @type {Guid}
     */
    static IID := Guid("{3051043e-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLObjectElement4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_contentDocument : IntPtr
        put_codeBase        : IntPtr
        get_codeBase        : IntPtr
        put_data            : IntPtr
        get_data            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLObjectElement4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    contentDocument {
        get => this.get_contentDocument()
    }

    /**
     * @type {BSTR} 
     */
    codeBase {
        get => this.get_codeBase()
        set => this.put_codeBase(value)
    }

    /**
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
        set => this.put_data(value)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_contentDocument() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_codeBase(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_codeBase() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_data(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLObjectElement4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_contentDocument := CallbackCreate(GetMethod(implObj, "get_contentDocument"), flags, 2)
        this.vtbl.put_codeBase := CallbackCreate(GetMethod(implObj, "put_codeBase"), flags, 2)
        this.vtbl.get_codeBase := CallbackCreate(GetMethod(implObj, "get_codeBase"), flags, 2)
        this.vtbl.put_data := CallbackCreate(GetMethod(implObj, "put_data"), flags, 2)
        this.vtbl.get_data := CallbackCreate(GetMethod(implObj, "get_data"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_contentDocument)
        CallbackFree(this.vtbl.put_codeBase)
        CallbackFree(this.vtbl.get_codeBase)
        CallbackFree(this.vtbl.put_data)
        CallbackFree(this.vtbl.get_data)
    }
}
