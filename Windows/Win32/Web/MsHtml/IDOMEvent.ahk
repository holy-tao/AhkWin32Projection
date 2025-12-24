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
class IDOMEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMEvent
     * @type {Guid}
     */
    static IID => Guid("{305104ba-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305104bb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_bubbles", "get_cancelable", "get_currentTarget", "get_defaultPrevented", "get_eventPhase", "get_target", "get_timeStamp", "get_type", "initEvent", "preventDefault", "stopPropagation", "stopImmediatePropagation", "get_isTrusted", "put_cancelBubble", "get_cancelBubble", "get_srcElement"]

    /**
     * @type {VARIANT_BOOL} 
     */
    bubbles {
        get => this.get_bubbles()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    cancelable {
        get => this.get_cancelable()
    }

    /**
     * @type {IEventTarget} 
     */
    currentTarget {
        get => this.get_currentTarget()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    defaultPrevented {
        get => this.get_defaultPrevented()
    }

    /**
     * @type {Integer} 
     */
    eventPhase {
        get => this.get_eventPhase()
    }

    /**
     * @type {IEventTarget} 
     */
    target {
        get => this.get_target()
    }

    /**
     * @type {Integer} 
     */
    timeStamp {
        get => this.get_timeStamp()
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isTrusted {
        get => this.get_isTrusted()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    cancelBubble {
        get => this.get_cancelBubble()
        set => this.put_cancelBubble(value)
    }

    /**
     * @type {IHTMLElement} 
     */
    srcElement {
        get => this.get_srcElement()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_bubbles() {
        result := ComCall(7, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_cancelable() {
        result := ComCall(8, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IEventTarget} 
     */
    get_currentTarget() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IEventTarget(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_defaultPrevented() {
        result := ComCall(10, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_eventPhase() {
        result := ComCall(11, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IEventTarget} 
     */
    get_target() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IEventTarget(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_timeStamp() {
        result := ComCall(13, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @returns {HRESULT} 
     */
    initEvent(eventType, canBubble, cancelable) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(15, this, "ptr", eventType, "short", canBubble, "short", cancelable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    preventDefault() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stopPropagation() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stopImmediatePropagation() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isTrusted() {
        result := ComCall(19, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_cancelBubble(v) {
        result := ComCall(20, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_cancelBubble() {
        result := ComCall(21, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_srcElement() {
        result := ComCall(22, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }
}
