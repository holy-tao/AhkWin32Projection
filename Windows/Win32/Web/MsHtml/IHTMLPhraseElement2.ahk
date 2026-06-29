#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLPhraseElement2 extends IDispatch {
    /**
     * The interface identifier for IHTMLPhraseElement2
     * @type {Guid}
     */
    static IID := Guid("{3050f824-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLPhraseElement2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_cite     : IntPtr
        get_cite     : IntPtr
        put_dateTime : IntPtr
        get_dateTime : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLPhraseElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    cite {
        get => this.get_cite()
        set => this.put_cite(value)
    }

    /**
     * @type {BSTR} 
     */
    dateTime {
        get => this.get_dateTime()
        set => this.put_dateTime(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cite(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cite() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dateTime(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dateTime() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLPhraseElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_cite := CallbackCreate(GetMethod(implObj, "put_cite"), flags, 2)
        this.vtbl.get_cite := CallbackCreate(GetMethod(implObj, "get_cite"), flags, 2)
        this.vtbl.put_dateTime := CallbackCreate(GetMethod(implObj, "put_dateTime"), flags, 2)
        this.vtbl.get_dateTime := CallbackCreate(GetMethod(implObj, "get_dateTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_cite)
        CallbackFree(this.vtbl.get_cite)
        CallbackFree(this.vtbl.put_dateTime)
        CallbackFree(this.vtbl.get_dateTime)
    }
}
