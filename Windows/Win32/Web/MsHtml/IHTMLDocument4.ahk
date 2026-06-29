#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IHTMLDocument2.ahk" { IHTMLDocument2 }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IHTMLRenderStyle.ahk" { IHTMLRenderStyle }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLEventObj.ahk" { IHTMLEventObj }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDocument4 extends IDispatch {
    /**
     * The interface identifier for IHTMLDocument4
     * @type {Guid}
     */
    static IID := Guid("{3050f69a-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDocument4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        focus                 : IntPtr
        hasFocus              : IntPtr
        put_onselectionchange : IntPtr
        get_onselectionchange : IntPtr
        get_namespaces        : IntPtr
        createDocumentFromUrl : IntPtr
        put_media             : IntPtr
        get_media             : IntPtr
        createEventObject     : IntPtr
        fireEvent             : IntPtr
        createRenderStyle     : IntPtr
        put_oncontrolselect   : IntPtr
        get_oncontrolselect   : IntPtr
        get_URLUnencoded      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDocument4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    onselectionchange {
        get => this.get_onselectionchange()
        set => this.put_onselectionchange(value)
    }

    /**
     * @type {IDispatch} 
     */
    namespaces {
        get => this.get_namespaces()
    }

    /**
     * @type {BSTR} 
     */
    media {
        get => this.get_media()
        set => this.put_media(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncontrolselect {
        get => this.get_oncontrolselect()
        set => this.put_oncontrolselect(value)
    }

    /**
     * @type {BSTR} 
     */
    URLUnencoded {
        get => this.get_URLUnencoded()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    focus() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasFocus() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &pfFocus := 0, "HRESULT")
        return pfFocus
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselectionchange(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselectionchange() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_namespaces() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {BSTR} bstrOptions 
     * @returns {IHTMLDocument2} 
     */
    createDocumentFromUrl(bstrUrl, bstrOptions) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bstrOptions := bstrOptions is String ? BSTR.Alloc(bstrOptions).Value : bstrOptions

        result := ComCall(12, this, BSTR, bstrUrl, BSTR, bstrOptions, "ptr*", &newDoc := 0, "HRESULT")
        return IHTMLDocument2(newDoc)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_media(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_media() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarEventObject 
     * @returns {IHTMLEventObj} 
     */
    createEventObject(pvarEventObject) {
        result := ComCall(15, this, VARIANT.Ptr, pvarEventObject, "ptr*", &ppEventObj := 0, "HRESULT")
        return IHTMLEventObj(ppEventObj)
    }

    /**
     * 
     * @param {BSTR} bstrEventName 
     * @param {Pointer<VARIANT>} pvarEventObject 
     * @returns {VARIANT_BOOL} 
     */
    fireEvent(bstrEventName, pvarEventObject) {
        bstrEventName := bstrEventName is String ? BSTR.Alloc(bstrEventName).Value : bstrEventName

        result := ComCall(16, this, BSTR, bstrEventName, VARIANT.Ptr, pvarEventObject, VARIANT_BOOL.Ptr, &pfCancelled := 0, "HRESULT")
        return pfCancelled
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLRenderStyle} 
     */
    createRenderStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "ptr*", &ppIHTMLRenderStyle := 0, "HRESULT")
        return IHTMLRenderStyle(ppIHTMLRenderStyle)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncontrolselect(v) {
        result := ComCall(18, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncontrolselect() {
        p := VARIANT()
        result := ComCall(19, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_URLUnencoded() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLDocument4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.focus := CallbackCreate(GetMethod(implObj, "focus"), flags, 1)
        this.vtbl.hasFocus := CallbackCreate(GetMethod(implObj, "hasFocus"), flags, 2)
        this.vtbl.put_onselectionchange := CallbackCreate(GetMethod(implObj, "put_onselectionchange"), flags, 2)
        this.vtbl.get_onselectionchange := CallbackCreate(GetMethod(implObj, "get_onselectionchange"), flags, 2)
        this.vtbl.get_namespaces := CallbackCreate(GetMethod(implObj, "get_namespaces"), flags, 2)
        this.vtbl.createDocumentFromUrl := CallbackCreate(GetMethod(implObj, "createDocumentFromUrl"), flags, 4)
        this.vtbl.put_media := CallbackCreate(GetMethod(implObj, "put_media"), flags, 2)
        this.vtbl.get_media := CallbackCreate(GetMethod(implObj, "get_media"), flags, 2)
        this.vtbl.createEventObject := CallbackCreate(GetMethod(implObj, "createEventObject"), flags, 3)
        this.vtbl.fireEvent := CallbackCreate(GetMethod(implObj, "fireEvent"), flags, 4)
        this.vtbl.createRenderStyle := CallbackCreate(GetMethod(implObj, "createRenderStyle"), flags, 3)
        this.vtbl.put_oncontrolselect := CallbackCreate(GetMethod(implObj, "put_oncontrolselect"), flags, 2)
        this.vtbl.get_oncontrolselect := CallbackCreate(GetMethod(implObj, "get_oncontrolselect"), flags, 2)
        this.vtbl.get_URLUnencoded := CallbackCreate(GetMethod(implObj, "get_URLUnencoded"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.focus)
        CallbackFree(this.vtbl.hasFocus)
        CallbackFree(this.vtbl.put_onselectionchange)
        CallbackFree(this.vtbl.get_onselectionchange)
        CallbackFree(this.vtbl.get_namespaces)
        CallbackFree(this.vtbl.createDocumentFromUrl)
        CallbackFree(this.vtbl.put_media)
        CallbackFree(this.vtbl.get_media)
        CallbackFree(this.vtbl.createEventObject)
        CallbackFree(this.vtbl.fireEvent)
        CallbackFree(this.vtbl.createRenderStyle)
        CallbackFree(this.vtbl.put_oncontrolselect)
        CallbackFree(this.vtbl.get_oncontrolselect)
        CallbackFree(this.vtbl.get_URLUnencoded)
    }
}
