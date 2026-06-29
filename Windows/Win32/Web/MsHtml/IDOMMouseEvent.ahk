#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLWindow2.ahk" { IHTMLWindow2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IEventTarget.ahk" { IEventTarget }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMMouseEvent extends IDispatch {
    /**
     * The interface identifier for IDOMMouseEvent
     * @type {Guid}
     */
    static IID := Guid("{305106ce-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMouseEvent
     * @type {Guid}
     */
    static CLSID := Guid("{305106cf-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMMouseEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_screenX       : IntPtr
        get_screenY       : IntPtr
        get_clientX       : IntPtr
        get_clientY       : IntPtr
        get_ctrlKey       : IntPtr
        get_shiftKey      : IntPtr
        get_altKey        : IntPtr
        get_metaKey       : IntPtr
        get_button        : IntPtr
        get_relatedTarget : IntPtr
        initMouseEvent    : IntPtr
        getModifierState  : IntPtr
        get_buttons       : IntPtr
        get_fromElement   : IntPtr
        get_toElement     : IntPtr
        get_x             : IntPtr
        get_y             : IntPtr
        get_offsetX       : IntPtr
        get_offsetY       : IntPtr
        get_pageX         : IntPtr
        get_pageY         : IntPtr
        get_layerX        : IntPtr
        get_layerY        : IntPtr
        get_which         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMMouseEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    screenX {
        get => this.get_screenX()
    }

    /**
     * @type {Integer} 
     */
    screenY {
        get => this.get_screenY()
    }

    /**
     * @type {Integer} 
     */
    clientX {
        get => this.get_clientX()
    }

    /**
     * @type {Integer} 
     */
    clientY {
        get => this.get_clientY()
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
     * @type {Integer} 
     */
    button {
        get => this.get_button()
    }

    /**
     * @type {IEventTarget} 
     */
    relatedTarget {
        get => this.get_relatedTarget()
    }

    /**
     * @type {Integer} 
     */
    buttons {
        get => this.get_buttons()
    }

    /**
     * @type {IHTMLElement} 
     */
    fromElement {
        get => this.get_fromElement()
    }

    /**
     * @type {IHTMLElement} 
     */
    toElement {
        get => this.get_toElement()
    }

    /**
     * @type {Integer} 
     */
    x {
        get => this.get_x()
    }

    /**
     * @type {Integer} 
     */
    y {
        get => this.get_y()
    }

    /**
     * @type {Integer} 
     */
    offsetX {
        get => this.get_offsetX()
    }

    /**
     * @type {Integer} 
     */
    offsetY {
        get => this.get_offsetY()
    }

    /**
     * @type {Integer} 
     */
    pageX {
        get => this.get_pageX()
    }

    /**
     * @type {Integer} 
     */
    pageY {
        get => this.get_pageY()
    }

    /**
     * @type {Integer} 
     */
    layerX {
        get => this.get_layerX()
    }

    /**
     * @type {Integer} 
     */
    layerY {
        get => this.get_layerY()
    }

    /**
     * @type {Integer} 
     */
    which {
        get => this.get_which()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenX() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenY() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientX() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientY() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ctrlKey() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shiftKey() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_altKey() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_metaKey() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_button() {
        result := ComCall(15, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IEventTarget} 
     */
    get_relatedTarget() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return IEventTarget(p)
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} viewArg 
     * @param {Integer} detailArg 
     * @param {Integer} screenXArg 
     * @param {Integer} screenYArg 
     * @param {Integer} clientXArg 
     * @param {Integer} clientYArg 
     * @param {VARIANT_BOOL} ctrlKeyArg 
     * @param {VARIANT_BOOL} altKeyArg 
     * @param {VARIANT_BOOL} shiftKeyArg 
     * @param {VARIANT_BOOL} metaKeyArg 
     * @param {Integer} buttonArg 
     * @param {IEventTarget} relatedTargetArg 
     * @returns {HRESULT} 
     */
    initMouseEvent(eventType, canBubble, cancelable, viewArg, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, relatedTargetArg) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(17, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, "ptr", viewArg, "int", detailArg, "int", screenXArg, "int", screenYArg, "int", clientXArg, "int", clientYArg, VARIANT_BOOL, ctrlKeyArg, VARIANT_BOOL, altKeyArg, VARIANT_BOOL, shiftKeyArg, VARIANT_BOOL, metaKeyArg, "ushort", buttonArg, "ptr", relatedTargetArg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} keyArg 
     * @returns {VARIANT_BOOL} 
     */
    getModifierState(keyArg) {
        keyArg := keyArg is String ? BSTR.Alloc(keyArg).Value : keyArg

        result := ComCall(18, this, BSTR, keyArg, VARIANT_BOOL.Ptr, &activated := 0, "HRESULT")
        return activated
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_buttons() {
        result := ComCall(19, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_fromElement() {
        result := ComCall(20, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_toElement() {
        result := ComCall(21, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_x() {
        result := ComCall(22, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_y() {
        result := ComCall(23, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetX() {
        result := ComCall(24, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetY() {
        result := ComCall(25, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pageX() {
        result := ComCall(26, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pageY() {
        result := ComCall(27, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_layerX() {
        result := ComCall(28, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_layerY() {
        result := ComCall(29, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_which() {
        result := ComCall(30, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IDOMMouseEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_screenX := CallbackCreate(GetMethod(implObj, "get_screenX"), flags, 2)
        this.vtbl.get_screenY := CallbackCreate(GetMethod(implObj, "get_screenY"), flags, 2)
        this.vtbl.get_clientX := CallbackCreate(GetMethod(implObj, "get_clientX"), flags, 2)
        this.vtbl.get_clientY := CallbackCreate(GetMethod(implObj, "get_clientY"), flags, 2)
        this.vtbl.get_ctrlKey := CallbackCreate(GetMethod(implObj, "get_ctrlKey"), flags, 2)
        this.vtbl.get_shiftKey := CallbackCreate(GetMethod(implObj, "get_shiftKey"), flags, 2)
        this.vtbl.get_altKey := CallbackCreate(GetMethod(implObj, "get_altKey"), flags, 2)
        this.vtbl.get_metaKey := CallbackCreate(GetMethod(implObj, "get_metaKey"), flags, 2)
        this.vtbl.get_button := CallbackCreate(GetMethod(implObj, "get_button"), flags, 2)
        this.vtbl.get_relatedTarget := CallbackCreate(GetMethod(implObj, "get_relatedTarget"), flags, 2)
        this.vtbl.initMouseEvent := CallbackCreate(GetMethod(implObj, "initMouseEvent"), flags, 16)
        this.vtbl.getModifierState := CallbackCreate(GetMethod(implObj, "getModifierState"), flags, 3)
        this.vtbl.get_buttons := CallbackCreate(GetMethod(implObj, "get_buttons"), flags, 2)
        this.vtbl.get_fromElement := CallbackCreate(GetMethod(implObj, "get_fromElement"), flags, 2)
        this.vtbl.get_toElement := CallbackCreate(GetMethod(implObj, "get_toElement"), flags, 2)
        this.vtbl.get_x := CallbackCreate(GetMethod(implObj, "get_x"), flags, 2)
        this.vtbl.get_y := CallbackCreate(GetMethod(implObj, "get_y"), flags, 2)
        this.vtbl.get_offsetX := CallbackCreate(GetMethod(implObj, "get_offsetX"), flags, 2)
        this.vtbl.get_offsetY := CallbackCreate(GetMethod(implObj, "get_offsetY"), flags, 2)
        this.vtbl.get_pageX := CallbackCreate(GetMethod(implObj, "get_pageX"), flags, 2)
        this.vtbl.get_pageY := CallbackCreate(GetMethod(implObj, "get_pageY"), flags, 2)
        this.vtbl.get_layerX := CallbackCreate(GetMethod(implObj, "get_layerX"), flags, 2)
        this.vtbl.get_layerY := CallbackCreate(GetMethod(implObj, "get_layerY"), flags, 2)
        this.vtbl.get_which := CallbackCreate(GetMethod(implObj, "get_which"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_screenX)
        CallbackFree(this.vtbl.get_screenY)
        CallbackFree(this.vtbl.get_clientX)
        CallbackFree(this.vtbl.get_clientY)
        CallbackFree(this.vtbl.get_ctrlKey)
        CallbackFree(this.vtbl.get_shiftKey)
        CallbackFree(this.vtbl.get_altKey)
        CallbackFree(this.vtbl.get_metaKey)
        CallbackFree(this.vtbl.get_button)
        CallbackFree(this.vtbl.get_relatedTarget)
        CallbackFree(this.vtbl.initMouseEvent)
        CallbackFree(this.vtbl.getModifierState)
        CallbackFree(this.vtbl.get_buttons)
        CallbackFree(this.vtbl.get_fromElement)
        CallbackFree(this.vtbl.get_toElement)
        CallbackFree(this.vtbl.get_x)
        CallbackFree(this.vtbl.get_y)
        CallbackFree(this.vtbl.get_offsetX)
        CallbackFree(this.vtbl.get_offsetY)
        CallbackFree(this.vtbl.get_pageX)
        CallbackFree(this.vtbl.get_pageY)
        CallbackFree(this.vtbl.get_layerX)
        CallbackFree(this.vtbl.get_layerY)
        CallbackFree(this.vtbl.get_which)
    }
}
