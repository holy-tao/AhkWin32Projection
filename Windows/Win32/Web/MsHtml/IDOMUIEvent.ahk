#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMUIEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMUIEvent
     * @type {Guid}
     */
    static IID => Guid("{305106ca-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMUIEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305106cb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_view", "get_detail", "initUIEvent"]

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} p 
     * @returns {HRESULT} 
     */
    get_view(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_detail(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} view 
     * @param {Integer} detail 
     * @returns {HRESULT} 
     */
    initUIEvent(eventType, canBubble, cancelable, view, detail) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(9, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", view, "int", detail, "HRESULT")
        return result
    }
}
