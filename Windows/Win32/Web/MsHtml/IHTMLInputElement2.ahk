#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLInputElement2 extends IDispatch {
    /**
     * The interface identifier for IHTMLInputElement2
     * @type {Guid}
     */
    static IID := Guid("{3050f821-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLInputElement2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_accept : IntPtr
        get_accept : IntPtr
        put_useMap : IntPtr
        get_useMap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLInputElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    accept {
        get => this.get_accept()
        set => this.put_accept(value)
    }

    /**
     * @type {BSTR} 
     */
    useMap {
        get => this.get_useMap()
        set => this.put_useMap(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_accept(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_accept() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_useMap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_useMap() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLInputElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_accept := CallbackCreate(GetMethod(implObj, "put_accept"), flags, 2)
        this.vtbl.get_accept := CallbackCreate(GetMethod(implObj, "get_accept"), flags, 2)
        this.vtbl.put_useMap := CallbackCreate(GetMethod(implObj, "put_useMap"), flags, 2)
        this.vtbl.get_useMap := CallbackCreate(GetMethod(implObj, "get_useMap"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_accept)
        CallbackFree(this.vtbl.get_accept)
        CallbackFree(this.vtbl.put_useMap)
        CallbackFree(this.vtbl.get_useMap)
    }
}
