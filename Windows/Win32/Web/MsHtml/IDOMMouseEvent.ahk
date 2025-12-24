#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEventTarget.ahk
#Include .\IHTMLElement.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMMouseEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMMouseEvent
     * @type {Guid}
     */
    static IID => Guid("{305106ce-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMouseEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305106cf-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_screenX", "get_screenY", "get_clientX", "get_clientY", "get_ctrlKey", "get_shiftKey", "get_altKey", "get_metaKey", "get_button", "get_relatedTarget", "initMouseEvent", "getModifierState", "get_buttons", "get_fromElement", "get_toElement", "get_x", "get_y", "get_offsetX", "get_offsetY", "get_pageX", "get_pageY", "get_layerX", "get_layerY", "get_which"]

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
        result := ComCall(11, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shiftKey() {
        result := ComCall(12, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_altKey() {
        result := ComCall(13, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_metaKey() {
        result := ComCall(14, this, "short*", &p := 0, "HRESULT")
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

        result := ComCall(17, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", viewArg, "int", detailArg, "int", screenXArg, "int", screenYArg, "int", clientXArg, "int", clientYArg, "short", ctrlKeyArg, "short", altKeyArg, "short", shiftKeyArg, "short", metaKeyArg, "ushort", buttonArg, "ptr", relatedTargetArg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} keyArg 
     * @returns {VARIANT_BOOL} 
     */
    getModifierState(keyArg) {
        keyArg := keyArg is String ? BSTR.Alloc(keyArg).Value : keyArg

        result := ComCall(18, this, "ptr", keyArg, "short*", &activated := 0, "HRESULT")
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
}
