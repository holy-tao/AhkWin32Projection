#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IWebBridge extends IDispatch {
    /**
     * The interface identifier for IWebBridge
     * @type {Guid}
     */
    static IID := Guid("{ae24fdad-03c6-11d1-8b76-0080c744f389}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebBridge interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_URL        : IntPtr
        get_URL        : IntPtr
        put_Scrollbar  : IntPtr
        get_Scrollbar  : IntPtr
        put_embed      : IntPtr
        get_embed      : IntPtr
        get_event      : IntPtr
        get_readyState : IntPtr
        AboutBox       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebBridge.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    URL {
        get => this.get_URL()
        set => this.put_URL(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Scrollbar {
        get => this.get_Scrollbar()
        set => this.put_Scrollbar(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    embed {
        get => this.get_embed()
        set => this.put_embed(value)
    }

    /**
     * @type {IDispatch} 
     */
    event {
        get => this.get_event()
    }

    /**
     * @type {Integer} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_URL(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_URL() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_Scrollbar(v) {
        result := ComCall(9, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Scrollbar() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_embed(v) {
        result := ComCall(11, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_embed() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_event() {
        result := ComCall(13, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(14, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AboutBox() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebBridge.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_URL := CallbackCreate(GetMethod(implObj, "put_URL"), flags, 2)
        this.vtbl.get_URL := CallbackCreate(GetMethod(implObj, "get_URL"), flags, 2)
        this.vtbl.put_Scrollbar := CallbackCreate(GetMethod(implObj, "put_Scrollbar"), flags, 2)
        this.vtbl.get_Scrollbar := CallbackCreate(GetMethod(implObj, "get_Scrollbar"), flags, 2)
        this.vtbl.put_embed := CallbackCreate(GetMethod(implObj, "put_embed"), flags, 2)
        this.vtbl.get_embed := CallbackCreate(GetMethod(implObj, "get_embed"), flags, 2)
        this.vtbl.get_event := CallbackCreate(GetMethod(implObj, "get_event"), flags, 2)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.AboutBox := CallbackCreate(GetMethod(implObj, "AboutBox"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_URL)
        CallbackFree(this.vtbl.get_URL)
        CallbackFree(this.vtbl.put_Scrollbar)
        CallbackFree(this.vtbl.get_Scrollbar)
        CallbackFree(this.vtbl.put_embed)
        CallbackFree(this.vtbl.get_embed)
        CallbackFree(this.vtbl.get_event)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.AboutBox)
    }
}
