#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMMouseWheelEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMMouseWheelEvent
     * @type {Guid}
     */
    static IID => Guid("{305106d0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMouseWheelEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305106d1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_wheelDelta", "initMouseWheelEvent"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_wheelDelta(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pMarshal, p, "HRESULT")
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
     * @param {Integer} wheelDeltaArg 
     * @returns {HRESULT} 
     */
    initMouseWheelEvent(eventType, canBubble, cancelable, viewArg, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, buttonArg, relatedTargetArg, modifiersListArg, wheelDeltaArg) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        modifiersListArg := modifiersListArg is String ? BSTR.Alloc(modifiersListArg).Value : modifiersListArg

        result := ComCall(8, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", viewArg, "int", detailArg, "int", screenXArg, "int", screenYArg, "int", clientXArg, "int", clientYArg, "ushort", buttonArg, "ptr", relatedTargetArg, "ptr", modifiersListArg, "int", wheelDeltaArg, "HRESULT")
        return result
    }
}
