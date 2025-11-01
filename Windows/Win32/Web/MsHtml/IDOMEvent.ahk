#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_bubbles(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_cancelable(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEventTarget>} p 
     * @returns {HRESULT} 
     */
    get_currentTarget(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_defaultPrevented(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_eventPhase(p) {
        pMarshal := p is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEventTarget>} p 
     * @returns {HRESULT} 
     */
    get_target(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_timeStamp(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_type(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_isTrusted(p) {
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_cancelBubble(p) {
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_srcElement(p) {
        result := ComCall(22, this, "ptr*", p, "HRESULT")
        return result
    }
}
