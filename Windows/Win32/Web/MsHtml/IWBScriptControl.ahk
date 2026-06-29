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
export default struct IWBScriptControl extends IDispatch {
    /**
     * The interface identifier for IWBScriptControl
     * @type {Guid}
     */
    static IID := Guid("{a5170870-0cf8-11d1-8b91-0080c744f389}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWBScriptControl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        raiseEvent             : IntPtr
        bubbleEvent            : IntPtr
        setContextMenu         : IntPtr
        put_selectableContent  : IntPtr
        get_selectableContent  : IntPtr
        get_frozen             : IntPtr
        put_scrollbar          : IntPtr
        get_scrollbar          : IntPtr
        get_version            : IntPtr
        get_visibility         : IntPtr
        put_onvisibilitychange : IntPtr
        get_onvisibilitychange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWBScriptControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    selectableContent {
        get => this.get_selectableContent()
        set => this.put_selectableContent(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    frozen {
        get => this.get_frozen()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    scrollbar {
        get => this.get_scrollbar()
        set => this.put_scrollbar(value)
    }

    /**
     * @type {BSTR} 
     */
    version {
        get => this.get_version()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    visibility {
        get => this.get_visibility()
    }

    /**
     * @type {VARIANT} 
     */
    onvisibilitychange {
        get => this.get_onvisibilitychange()
        set => this.put_onvisibilitychange(value)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} eventData 
     * @returns {HRESULT} 
     */
    raiseEvent(name, eventData) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, BSTR, name, VARIANT, eventData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    bubbleEvent() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} menuItemPairs 
     * @returns {HRESULT} 
     */
    setContextMenu(menuItemPairs) {
        result := ComCall(9, this, VARIANT, menuItemPairs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_selectableContent(v) {
        result := ComCall(10, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_selectableContent() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_frozen() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_scrollbar(v) {
        result := ComCall(13, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_scrollbar() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_version() {
        p := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_visibility() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onvisibilitychange(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onvisibilitychange() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IWBScriptControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.raiseEvent := CallbackCreate(GetMethod(implObj, "raiseEvent"), flags, 3)
        this.vtbl.bubbleEvent := CallbackCreate(GetMethod(implObj, "bubbleEvent"), flags, 1)
        this.vtbl.setContextMenu := CallbackCreate(GetMethod(implObj, "setContextMenu"), flags, 2)
        this.vtbl.put_selectableContent := CallbackCreate(GetMethod(implObj, "put_selectableContent"), flags, 2)
        this.vtbl.get_selectableContent := CallbackCreate(GetMethod(implObj, "get_selectableContent"), flags, 2)
        this.vtbl.get_frozen := CallbackCreate(GetMethod(implObj, "get_frozen"), flags, 2)
        this.vtbl.put_scrollbar := CallbackCreate(GetMethod(implObj, "put_scrollbar"), flags, 2)
        this.vtbl.get_scrollbar := CallbackCreate(GetMethod(implObj, "get_scrollbar"), flags, 2)
        this.vtbl.get_version := CallbackCreate(GetMethod(implObj, "get_version"), flags, 2)
        this.vtbl.get_visibility := CallbackCreate(GetMethod(implObj, "get_visibility"), flags, 2)
        this.vtbl.put_onvisibilitychange := CallbackCreate(GetMethod(implObj, "put_onvisibilitychange"), flags, 2)
        this.vtbl.get_onvisibilitychange := CallbackCreate(GetMethod(implObj, "get_onvisibilitychange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.raiseEvent)
        CallbackFree(this.vtbl.bubbleEvent)
        CallbackFree(this.vtbl.setContextMenu)
        CallbackFree(this.vtbl.put_selectableContent)
        CallbackFree(this.vtbl.get_selectableContent)
        CallbackFree(this.vtbl.get_frozen)
        CallbackFree(this.vtbl.put_scrollbar)
        CallbackFree(this.vtbl.get_scrollbar)
        CallbackFree(this.vtbl.get_version)
        CallbackFree(this.vtbl.get_visibility)
        CallbackFree(this.vtbl.put_onvisibilitychange)
        CallbackFree(this.vtbl.get_onvisibilitychange)
    }
}
