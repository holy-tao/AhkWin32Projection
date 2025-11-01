#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMFocusEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMFocusEvent
     * @type {Guid}
     */
    static IID => Guid("{305106cc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMFocusEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305106cd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_relatedTarget", "initFocusEvent"]

    /**
     * 
     * @param {Pointer<IEventTarget>} p 
     * @returns {HRESULT} 
     */
    get_relatedTarget(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} view 
     * @param {Integer} detail 
     * @param {IEventTarget} relatedTargetArg 
     * @returns {HRESULT} 
     */
    initFocusEvent(eventType, canBubble, cancelable, view, detail, relatedTargetArg) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(8, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", view, "int", detail, "ptr", relatedTargetArg, "HRESULT")
        return result
    }
}
