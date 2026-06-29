#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLNamespace extends IDispatch {
    /**
     * The interface identifier for IHTMLNamespace
     * @type {Guid}
     */
    static IID := Guid("{3050f6bb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLNamespace
     * @type {Guid}
     */
    static CLSID := Guid("{3050f6bc-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLNamespace interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_name               : IntPtr
        get_urn                : IntPtr
        get_tagNames           : IntPtr
        get_readyState         : IntPtr
        put_onreadystatechange : IntPtr
        get_onreadystatechange : IntPtr
        doImport               : IntPtr
        attachEvent            : IntPtr
        detachEvent            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLNamespace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * @type {BSTR} 
     */
    urn {
        get => this.get_urn()
    }

    /**
     * @type {IDispatch} 
     */
    tagNames {
        get => this.get_tagNames()
    }

    /**
     * @type {VARIANT} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {VARIANT} 
     */
    onreadystatechange {
        get => this.get_onreadystatechange()
        set => this.put_onreadystatechange(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_urn() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_tagNames() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_readyState() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrImplementationUrl 
     * @returns {HRESULT} 
     */
    doImport(bstrImplementationUrl) {
        bstrImplementationUrl := bstrImplementationUrl is String ? BSTR.Alloc(bstrImplementationUrl).Value : bstrImplementationUrl

        result := ComCall(13, this, BSTR, bstrImplementationUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {VARIANT_BOOL} 
     */
    attachEvent(event, pDisp) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(14, this, BSTR, event, "ptr", pDisp, VARIANT_BOOL.Ptr, &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {HRESULT} 
     */
    detachEvent(event, pDisp) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(15, this, BSTR, event, "ptr", pDisp, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLNamespace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.get_urn := CallbackCreate(GetMethod(implObj, "get_urn"), flags, 2)
        this.vtbl.get_tagNames := CallbackCreate(GetMethod(implObj, "get_tagNames"), flags, 2)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.put_onreadystatechange := CallbackCreate(GetMethod(implObj, "put_onreadystatechange"), flags, 2)
        this.vtbl.get_onreadystatechange := CallbackCreate(GetMethod(implObj, "get_onreadystatechange"), flags, 2)
        this.vtbl.doImport := CallbackCreate(GetMethod(implObj, "doImport"), flags, 2)
        this.vtbl.attachEvent := CallbackCreate(GetMethod(implObj, "attachEvent"), flags, 4)
        this.vtbl.detachEvent := CallbackCreate(GetMethod(implObj, "detachEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.get_urn)
        CallbackFree(this.vtbl.get_tagNames)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.put_onreadystatechange)
        CallbackFree(this.vtbl.get_onreadystatechange)
        CallbackFree(this.vtbl.doImport)
        CallbackFree(this.vtbl.attachEvent)
        CallbackFree(this.vtbl.detachEvent)
    }
}
