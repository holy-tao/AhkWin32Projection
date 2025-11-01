#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMWheelEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMWheelEvent
     * @type {Guid}
     */
    static IID => Guid("{305106d2-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMWheelEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305106d3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_deltaX", "get_deltaY", "get_deltaZ", "get_deltaMode", "initWheelEvent"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_deltaX(p) {
        result := ComCall(7, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_deltaY(p) {
        result := ComCall(8, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_deltaZ(p) {
        result := ComCall(9, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_deltaMode(p) {
        result := ComCall(10, this, "uint*", p, "HRESULT")
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
     * @param {Integer} buttonArg 
     * @param {IEventTarget} relatedTargetArg 
     * @param {BSTR} modifiersListArg 
     * @param {Integer} deltaX 
     * @param {Integer} deltaY 
     * @param {Integer} deltaZ 
     * @param {Integer} deltaMode 
     * @returns {HRESULT} 
     */
    initWheelEvent(eventType, canBubble, cancelable, viewArg, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, buttonArg, relatedTargetArg, modifiersListArg, deltaX, deltaY, deltaZ, deltaMode) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        modifiersListArg := modifiersListArg is String ? BSTR.Alloc(modifiersListArg).Value : modifiersListArg

        result := ComCall(11, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", viewArg, "int", detailArg, "int", screenXArg, "int", screenYArg, "int", clientXArg, "int", clientYArg, "ushort", buttonArg, "ptr", relatedTargetArg, "ptr", modifiersListArg, "int", deltaX, "int", deltaY, "int", deltaZ, "uint", deltaMode, "HRESULT")
        return result
    }
}
