#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLLabelElement extends IDispatch {
    /**
     * The interface identifier for IHTMLLabelElement
     * @type {Guid}
     */
    static IID := Guid("{3050f32a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLLabelElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f32b-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLLabelElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_htmlFor   : IntPtr
        get_htmlFor   : IntPtr
        put_accessKey : IntPtr
        get_accessKey : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLLabelElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    htmlFor {
        get => this.get_htmlFor()
        set => this.put_htmlFor(value)
    }

    /**
     * @type {BSTR} 
     */
    accessKey {
        get => this.get_accessKey()
        set => this.put_accessKey(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_htmlFor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_htmlFor() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_accessKey(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_accessKey() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLLabelElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_htmlFor := CallbackCreate(GetMethod(implObj, "put_htmlFor"), flags, 2)
        this.vtbl.get_htmlFor := CallbackCreate(GetMethod(implObj, "get_htmlFor"), flags, 2)
        this.vtbl.put_accessKey := CallbackCreate(GetMethod(implObj, "put_accessKey"), flags, 2)
        this.vtbl.get_accessKey := CallbackCreate(GetMethod(implObj, "get_accessKey"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_htmlFor)
        CallbackFree(this.vtbl.get_htmlFor)
        CallbackFree(this.vtbl.put_accessKey)
        CallbackFree(this.vtbl.get_accessKey)
    }
}
