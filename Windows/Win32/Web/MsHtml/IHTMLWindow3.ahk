#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLDataTransfer.ahk" { IHTMLDataTransfer }
#Import ".\IHTMLWindow2.ahk" { IHTMLWindow2 }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLWindow3 extends IDispatch {
    /**
     * The interface identifier for IHTMLWindow3
     * @type {Guid}
     */
    static IID := Guid("{3050f4ae-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLWindow3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_screenLeft     : IntPtr
        get_screenTop      : IntPtr
        attachEvent        : IntPtr
        detachEvent        : IntPtr
        setTimeout         : IntPtr
        setInterval        : IntPtr
        print              : IntPtr
        put_onbeforeprint  : IntPtr
        get_onbeforeprint  : IntPtr
        put_onafterprint   : IntPtr
        get_onafterprint   : IntPtr
        get_clipboardData  : IntPtr
        showModelessDialog : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLWindow3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    screenLeft {
        get => this.get_screenLeft()
    }

    /**
     * @type {Integer} 
     */
    screenTop {
        get => this.get_screenTop()
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeprint {
        get => this.get_onbeforeprint()
        set => this.put_onbeforeprint(value)
    }

    /**
     * @type {VARIANT} 
     */
    onafterprint {
        get => this.get_onafterprint()
        set => this.put_onafterprint(value)
    }

    /**
     * @type {IHTMLDataTransfer} 
     */
    clipboardData {
        get => this.get_clipboardData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenLeft() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenTop() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {VARIANT_BOOL} 
     */
    attachEvent(event, pDisp) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(9, this, BSTR, event, "ptr", pDisp, VARIANT_BOOL.Ptr, &pfResult := 0, "HRESULT")
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

        result := ComCall(10, this, BSTR, event, "ptr", pDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} expression 
     * @param {Integer} msec 
     * @param {Pointer<VARIANT>} language 
     * @returns {Integer} 
     */
    setTimeout(expression, msec, language) {
        result := ComCall(11, this, VARIANT.Ptr, expression, "int", msec, VARIANT.Ptr, language, "int*", &timerID := 0, "HRESULT")
        return timerID
    }

    /**
     * 
     * @param {Pointer<VARIANT>} expression 
     * @param {Integer} msec 
     * @param {Pointer<VARIANT>} language 
     * @returns {Integer} 
     */
    setInterval(expression, msec, language) {
        result := ComCall(12, this, VARIANT.Ptr, expression, "int", msec, VARIANT.Ptr, language, "int*", &timerID := 0, "HRESULT")
        return timerID
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    print() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeprint(v) {
        result := ComCall(14, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeprint() {
        p := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onafterprint(v) {
        result := ComCall(16, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onafterprint() {
        p := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDataTransfer} 
     */
    get_clipboardData() {
        result := ComCall(18, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDataTransfer(p)
    }

    /**
     * 
     * @param {BSTR} url 
     * @param {Pointer<VARIANT>} varArgIn 
     * @param {Pointer<VARIANT>} options 
     * @returns {IHTMLWindow2} 
     */
    showModelessDialog(url, varArgIn, options) {
        url := url is String ? BSTR.Alloc(url).Value : url

        result := ComCall(19, this, BSTR, url, VARIANT.Ptr, varArgIn, VARIANT.Ptr, options, "ptr*", &pDialog := 0, "HRESULT")
        return IHTMLWindow2(pDialog)
    }

    Query(iid) {
        if (IHTMLWindow3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_screenLeft := CallbackCreate(GetMethod(implObj, "get_screenLeft"), flags, 2)
        this.vtbl.get_screenTop := CallbackCreate(GetMethod(implObj, "get_screenTop"), flags, 2)
        this.vtbl.attachEvent := CallbackCreate(GetMethod(implObj, "attachEvent"), flags, 4)
        this.vtbl.detachEvent := CallbackCreate(GetMethod(implObj, "detachEvent"), flags, 3)
        this.vtbl.setTimeout := CallbackCreate(GetMethod(implObj, "setTimeout"), flags, 5)
        this.vtbl.setInterval := CallbackCreate(GetMethod(implObj, "setInterval"), flags, 5)
        this.vtbl.print := CallbackCreate(GetMethod(implObj, "print"), flags, 1)
        this.vtbl.put_onbeforeprint := CallbackCreate(GetMethod(implObj, "put_onbeforeprint"), flags, 2)
        this.vtbl.get_onbeforeprint := CallbackCreate(GetMethod(implObj, "get_onbeforeprint"), flags, 2)
        this.vtbl.put_onafterprint := CallbackCreate(GetMethod(implObj, "put_onafterprint"), flags, 2)
        this.vtbl.get_onafterprint := CallbackCreate(GetMethod(implObj, "get_onafterprint"), flags, 2)
        this.vtbl.get_clipboardData := CallbackCreate(GetMethod(implObj, "get_clipboardData"), flags, 2)
        this.vtbl.showModelessDialog := CallbackCreate(GetMethod(implObj, "showModelessDialog"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_screenLeft)
        CallbackFree(this.vtbl.get_screenTop)
        CallbackFree(this.vtbl.attachEvent)
        CallbackFree(this.vtbl.detachEvent)
        CallbackFree(this.vtbl.setTimeout)
        CallbackFree(this.vtbl.setInterval)
        CallbackFree(this.vtbl.print)
        CallbackFree(this.vtbl.put_onbeforeprint)
        CallbackFree(this.vtbl.get_onbeforeprint)
        CallbackFree(this.vtbl.put_onafterprint)
        CallbackFree(this.vtbl.get_onafterprint)
        CallbackFree(this.vtbl.get_clipboardData)
        CallbackFree(this.vtbl.showModelessDialog)
    }
}
