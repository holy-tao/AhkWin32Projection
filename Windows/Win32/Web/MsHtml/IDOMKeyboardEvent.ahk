#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLWindow2.ahk" { IHTMLWindow2 }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMKeyboardEvent extends IDispatch {
    /**
     * The interface identifier for IDOMKeyboardEvent
     * @type {Guid}
     */
    static IID := Guid("{305106d6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMKeyboardEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305106d7-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMKeyboardEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_key           : IntPtr
        get_location      : IntPtr
        get_ctrlKey       : IntPtr
        get_shiftKey      : IntPtr
        get_altKey        : IntPtr
        get_metaKey       : IntPtr
        get_repeat        : IntPtr
        getModifierState  : IntPtr
        initKeyboardEvent : IntPtr
        get_keyCode       : IntPtr
        get_charCode      : IntPtr
        get_which         : IntPtr
        get_ie9_char      : IntPtr
        get_locale        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMKeyboardEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    key {
        get => this.get_key()
    }

    /**
     * @type {Integer} 
     */
    location {
        get => this.get_location()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ctrlKey {
        get => this.get_ctrlKey()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    shiftKey {
        get => this.get_shiftKey()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    altKey {
        get => this.get_altKey()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    metaKey {
        get => this.get_metaKey()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    repeat {
        get => this.get_repeat()
    }

    /**
     * @type {Integer} 
     */
    keyCode {
        get => this.get_keyCode()
    }

    /**
     * @type {Integer} 
     */
    charCode {
        get => this.get_charCode()
    }

    /**
     * @type {Integer} 
     */
    which {
        get => this.get_which()
    }

    /**
     * @type {VARIANT} 
     */
    ie9_char {
        get => this.get_ie9_char()
    }

    /**
     * @type {BSTR} 
     */
    locale {
        get => this.get_locale()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_key() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_location() {
        result := ComCall(8, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ctrlKey() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shiftKey() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_altKey() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_metaKey() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_repeat() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} keyArg 
     * @returns {VARIANT_BOOL} 
     */
    getModifierState(keyArg) {
        keyArg := keyArg is String ? BSTR.Alloc(keyArg).Value : keyArg

        result := ComCall(14, this, BSTR, keyArg, VARIANT_BOOL.Ptr, &state := 0, "HRESULT")
        return state
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} viewArg 
     * @param {BSTR} keyArg 
     * @param {Integer} locationArg 
     * @param {BSTR} modifiersListArg 
     * @param {VARIANT_BOOL} repeat 
     * @param {BSTR} locale 
     * @returns {HRESULT} 
     */
    initKeyboardEvent(eventType, canBubble, cancelable, viewArg, keyArg, locationArg, modifiersListArg, repeat, locale) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        keyArg := keyArg is String ? BSTR.Alloc(keyArg).Value : keyArg
        modifiersListArg := modifiersListArg is String ? BSTR.Alloc(modifiersListArg).Value : modifiersListArg
        locale := locale is String ? BSTR.Alloc(locale).Value : locale

        result := ComCall(15, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, "ptr", viewArg, BSTR, keyArg, "uint", locationArg, BSTR, modifiersListArg, VARIANT_BOOL, repeat, BSTR, locale, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_keyCode() {
        result := ComCall(16, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_charCode() {
        result := ComCall(17, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_which() {
        result := ComCall(18, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ie9_char() {
        p := VARIANT()
        result := ComCall(19, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_locale() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IDOMKeyboardEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_key := CallbackCreate(GetMethod(implObj, "get_key"), flags, 2)
        this.vtbl.get_location := CallbackCreate(GetMethod(implObj, "get_location"), flags, 2)
        this.vtbl.get_ctrlKey := CallbackCreate(GetMethod(implObj, "get_ctrlKey"), flags, 2)
        this.vtbl.get_shiftKey := CallbackCreate(GetMethod(implObj, "get_shiftKey"), flags, 2)
        this.vtbl.get_altKey := CallbackCreate(GetMethod(implObj, "get_altKey"), flags, 2)
        this.vtbl.get_metaKey := CallbackCreate(GetMethod(implObj, "get_metaKey"), flags, 2)
        this.vtbl.get_repeat := CallbackCreate(GetMethod(implObj, "get_repeat"), flags, 2)
        this.vtbl.getModifierState := CallbackCreate(GetMethod(implObj, "getModifierState"), flags, 3)
        this.vtbl.initKeyboardEvent := CallbackCreate(GetMethod(implObj, "initKeyboardEvent"), flags, 10)
        this.vtbl.get_keyCode := CallbackCreate(GetMethod(implObj, "get_keyCode"), flags, 2)
        this.vtbl.get_charCode := CallbackCreate(GetMethod(implObj, "get_charCode"), flags, 2)
        this.vtbl.get_which := CallbackCreate(GetMethod(implObj, "get_which"), flags, 2)
        this.vtbl.get_ie9_char := CallbackCreate(GetMethod(implObj, "get_ie9_char"), flags, 2)
        this.vtbl.get_locale := CallbackCreate(GetMethod(implObj, "get_locale"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_key)
        CallbackFree(this.vtbl.get_location)
        CallbackFree(this.vtbl.get_ctrlKey)
        CallbackFree(this.vtbl.get_shiftKey)
        CallbackFree(this.vtbl.get_altKey)
        CallbackFree(this.vtbl.get_metaKey)
        CallbackFree(this.vtbl.get_repeat)
        CallbackFree(this.vtbl.getModifierState)
        CallbackFree(this.vtbl.initKeyboardEvent)
        CallbackFree(this.vtbl.get_keyCode)
        CallbackFree(this.vtbl.get_charCode)
        CallbackFree(this.vtbl.get_which)
        CallbackFree(this.vtbl.get_ie9_char)
        CallbackFree(this.vtbl.get_locale)
    }
}
