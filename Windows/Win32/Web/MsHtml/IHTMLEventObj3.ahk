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
export default struct IHTMLEventObj3 extends IDispatch {
    /**
     * The interface identifier for IHTMLEventObj3
     * @type {Guid}
     */
    static IID := Guid("{3050f680-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLEventObj3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_contentOverflow      : IntPtr
        put_shiftLeft            : IntPtr
        get_shiftLeft            : IntPtr
        put_altLeft              : IntPtr
        get_altLeft              : IntPtr
        put_ctrlLeft             : IntPtr
        get_ctrlLeft             : IntPtr
        get_imeCompositionChange : IntPtr
        get_imeNotifyCommand     : IntPtr
        get_imeNotifyData        : IntPtr
        get_imeRequest           : IntPtr
        get_imeRequestData       : IntPtr
        get_keyboardLayout       : IntPtr
        get_behaviorCookie       : IntPtr
        get_behaviorPart         : IntPtr
        get_nextPage             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLEventObj3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    contentOverflow {
        get => this.get_contentOverflow()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    shiftLeft {
        get => this.get_shiftLeft()
        set => this.put_shiftLeft(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    altLeft {
        get => this.get_altLeft()
        set => this.put_altLeft(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ctrlLeft {
        get => this.get_ctrlLeft()
        set => this.put_ctrlLeft(value)
    }

    /**
     * @type {Pointer} 
     */
    imeCompositionChange {
        get => this.get_imeCompositionChange()
    }

    /**
     * @type {Pointer} 
     */
    imeNotifyCommand {
        get => this.get_imeNotifyCommand()
    }

    /**
     * @type {Pointer} 
     */
    imeNotifyData {
        get => this.get_imeNotifyData()
    }

    /**
     * @type {Pointer} 
     */
    imeRequest {
        get => this.get_imeRequest()
    }

    /**
     * @type {Pointer} 
     */
    imeRequestData {
        get => this.get_imeRequestData()
    }

    /**
     * @type {Pointer} 
     */
    keyboardLayout {
        get => this.get_keyboardLayout()
    }

    /**
     * @type {Integer} 
     */
    behaviorCookie {
        get => this.get_behaviorCookie()
    }

    /**
     * @type {Integer} 
     */
    behaviorPart {
        get => this.get_behaviorPart()
    }

    /**
     * @type {BSTR} 
     */
    nextPage {
        get => this.get_nextPage()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_contentOverflow() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_shiftLeft(v) {
        result := ComCall(8, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shiftLeft() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_altLeft(v) {
        result := ComCall(10, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_altLeft() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_ctrlLeft(v) {
        result := ComCall(12, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ctrlLeft() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_imeCompositionChange() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_imeNotifyCommand() {
        result := ComCall(15, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_imeNotifyData() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_imeRequest() {
        result := ComCall(17, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_imeRequestData() {
        result := ComCall(18, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_keyboardLayout() {
        result := ComCall(19, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_behaviorCookie() {
        result := ComCall(20, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_behaviorPart() {
        result := ComCall(21, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nextPage() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLEventObj3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_contentOverflow := CallbackCreate(GetMethod(implObj, "get_contentOverflow"), flags, 2)
        this.vtbl.put_shiftLeft := CallbackCreate(GetMethod(implObj, "put_shiftLeft"), flags, 2)
        this.vtbl.get_shiftLeft := CallbackCreate(GetMethod(implObj, "get_shiftLeft"), flags, 2)
        this.vtbl.put_altLeft := CallbackCreate(GetMethod(implObj, "put_altLeft"), flags, 2)
        this.vtbl.get_altLeft := CallbackCreate(GetMethod(implObj, "get_altLeft"), flags, 2)
        this.vtbl.put_ctrlLeft := CallbackCreate(GetMethod(implObj, "put_ctrlLeft"), flags, 2)
        this.vtbl.get_ctrlLeft := CallbackCreate(GetMethod(implObj, "get_ctrlLeft"), flags, 2)
        this.vtbl.get_imeCompositionChange := CallbackCreate(GetMethod(implObj, "get_imeCompositionChange"), flags, 2)
        this.vtbl.get_imeNotifyCommand := CallbackCreate(GetMethod(implObj, "get_imeNotifyCommand"), flags, 2)
        this.vtbl.get_imeNotifyData := CallbackCreate(GetMethod(implObj, "get_imeNotifyData"), flags, 2)
        this.vtbl.get_imeRequest := CallbackCreate(GetMethod(implObj, "get_imeRequest"), flags, 2)
        this.vtbl.get_imeRequestData := CallbackCreate(GetMethod(implObj, "get_imeRequestData"), flags, 2)
        this.vtbl.get_keyboardLayout := CallbackCreate(GetMethod(implObj, "get_keyboardLayout"), flags, 2)
        this.vtbl.get_behaviorCookie := CallbackCreate(GetMethod(implObj, "get_behaviorCookie"), flags, 2)
        this.vtbl.get_behaviorPart := CallbackCreate(GetMethod(implObj, "get_behaviorPart"), flags, 2)
        this.vtbl.get_nextPage := CallbackCreate(GetMethod(implObj, "get_nextPage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_contentOverflow)
        CallbackFree(this.vtbl.put_shiftLeft)
        CallbackFree(this.vtbl.get_shiftLeft)
        CallbackFree(this.vtbl.put_altLeft)
        CallbackFree(this.vtbl.get_altLeft)
        CallbackFree(this.vtbl.put_ctrlLeft)
        CallbackFree(this.vtbl.get_ctrlLeft)
        CallbackFree(this.vtbl.get_imeCompositionChange)
        CallbackFree(this.vtbl.get_imeNotifyCommand)
        CallbackFree(this.vtbl.get_imeNotifyData)
        CallbackFree(this.vtbl.get_imeRequest)
        CallbackFree(this.vtbl.get_imeRequestData)
        CallbackFree(this.vtbl.get_keyboardLayout)
        CallbackFree(this.vtbl.get_behaviorCookie)
        CallbackFree(this.vtbl.get_behaviorPart)
        CallbackFree(this.vtbl.get_nextPage)
    }
}
