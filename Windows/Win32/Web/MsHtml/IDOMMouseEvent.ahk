#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_screenX(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_screenY(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_clientX(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_clientY(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_ctrlKey(p) {
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_shiftKey(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_altKey(p) {
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_metaKey(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_button(p) {
        pMarshal := p is VarRef ? "ushort*" : "ptr"

        result := ComCall(15, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEventTarget>} p 
     * @returns {HRESULT} 
     */
    get_relatedTarget(p) {
        result := ComCall(16, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} activated 
     * @returns {HRESULT} 
     */
    getModifierState(keyArg, activated) {
        keyArg := keyArg is String ? BSTR.Alloc(keyArg).Value : keyArg

        result := ComCall(18, this, "ptr", keyArg, "ptr", activated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_buttons(p) {
        pMarshal := p is VarRef ? "ushort*" : "ptr"

        result := ComCall(19, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_fromElement(p) {
        result := ComCall(20, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_toElement(p) {
        result := ComCall(21, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_x(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_y(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_offsetX(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_offsetY(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_pageX(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_pageY(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_layerX(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_layerY(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_which(p) {
        pMarshal := p is VarRef ? "ushort*" : "ptr"

        result := ComCall(30, this, pMarshal, p, "HRESULT")
        return result
    }
}
