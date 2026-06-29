#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLScreen extends IDispatch {
    /**
     * The interface identifier for IHTMLScreen
     * @type {Guid}
     */
    static IID := Guid("{3050f35c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLScreen
     * @type {Guid}
     */
    static CLSID := Guid("{3050f35d-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLScreen interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_colorDepth           : IntPtr
        put_bufferDepth          : IntPtr
        get_bufferDepth          : IntPtr
        get_width                : IntPtr
        get_height               : IntPtr
        put_updateInterval       : IntPtr
        get_updateInterval       : IntPtr
        get_availHeight          : IntPtr
        get_availWidth           : IntPtr
        get_fontSmoothingEnabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLScreen.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    colorDepth {
        get => this.get_colorDepth()
    }

    /**
     * @type {Integer} 
     */
    bufferDepth {
        get => this.get_bufferDepth()
        set => this.put_bufferDepth(value)
    }

    /**
     * @type {Integer} 
     */
    width {
        get => this.get_width()
    }

    /**
     * @type {Integer} 
     */
    height {
        get => this.get_height()
    }

    /**
     * @type {Integer} 
     */
    updateInterval {
        get => this.get_updateInterval()
        set => this.put_updateInterval(value)
    }

    /**
     * @type {Integer} 
     */
    availHeight {
        get => this.get_availHeight()
    }

    /**
     * @type {Integer} 
     */
    availWidth {
        get => this.get_availWidth()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    fontSmoothingEnabled {
        get => this.get_fontSmoothingEnabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_colorDepth() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_bufferDepth(v) {
        result := ComCall(8, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_bufferDepth() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_width() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_height() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_updateInterval(v) {
        result := ComCall(12, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_updateInterval() {
        result := ComCall(13, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_availHeight() {
        result := ComCall(14, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_availWidth() {
        result := ComCall(15, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_fontSmoothingEnabled() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLScreen.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_colorDepth := CallbackCreate(GetMethod(implObj, "get_colorDepth"), flags, 2)
        this.vtbl.put_bufferDepth := CallbackCreate(GetMethod(implObj, "put_bufferDepth"), flags, 2)
        this.vtbl.get_bufferDepth := CallbackCreate(GetMethod(implObj, "get_bufferDepth"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.put_updateInterval := CallbackCreate(GetMethod(implObj, "put_updateInterval"), flags, 2)
        this.vtbl.get_updateInterval := CallbackCreate(GetMethod(implObj, "get_updateInterval"), flags, 2)
        this.vtbl.get_availHeight := CallbackCreate(GetMethod(implObj, "get_availHeight"), flags, 2)
        this.vtbl.get_availWidth := CallbackCreate(GetMethod(implObj, "get_availWidth"), flags, 2)
        this.vtbl.get_fontSmoothingEnabled := CallbackCreate(GetMethod(implObj, "get_fontSmoothingEnabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_colorDepth)
        CallbackFree(this.vtbl.put_bufferDepth)
        CallbackFree(this.vtbl.get_bufferDepth)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.put_updateInterval)
        CallbackFree(this.vtbl.get_updateInterval)
        CallbackFree(this.vtbl.get_availHeight)
        CallbackFree(this.vtbl.get_availWidth)
        CallbackFree(this.vtbl.get_fontSmoothingEnabled)
    }
}
