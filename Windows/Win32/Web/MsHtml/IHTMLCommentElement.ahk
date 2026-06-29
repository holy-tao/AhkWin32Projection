#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLCommentElement extends IDispatch {
    /**
     * The interface identifier for IHTMLCommentElement
     * @type {Guid}
     */
    static IID := Guid("{3050f20c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCommentElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f317-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCommentElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_text   : IntPtr
        get_text   : IntPtr
        put_atomic : IntPtr
        get_atomic : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCommentElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    text {
        get => this.get_text()
        set => this.put_text(value)
    }

    /**
     * @type {Integer} 
     */
    atomic {
        get => this.get_atomic()
        set => this.put_atomic(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_text(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_text() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_atomic(v) {
        result := ComCall(9, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_atomic() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLCommentElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_text := CallbackCreate(GetMethod(implObj, "put_text"), flags, 2)
        this.vtbl.get_text := CallbackCreate(GetMethod(implObj, "get_text"), flags, 2)
        this.vtbl.put_atomic := CallbackCreate(GetMethod(implObj, "put_atomic"), flags, 2)
        this.vtbl.get_atomic := CallbackCreate(GetMethod(implObj, "get_atomic"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_text)
        CallbackFree(this.vtbl.get_text)
        CallbackFree(this.vtbl.put_atomic)
        CallbackFree(this.vtbl.get_atomic)
    }
}
