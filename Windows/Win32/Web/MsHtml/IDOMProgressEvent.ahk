#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMProgressEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMProgressEvent
     * @type {Guid}
     */
    static IID => Guid("{3051071e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMProgressEvent
     * @type {Guid}
     */
    static CLSID => Guid("{3051071f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_lengthComputable", "get_loaded", "get_total", "initProgressEvent"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_lengthComputable(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_loaded(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_total(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {VARIANT_BOOL} lengthComputableArg 
     * @param {Integer} loadedArg 
     * @param {Integer} totalArg 
     * @returns {HRESULT} 
     */
    initProgressEvent(eventType, canBubble, cancelable, lengthComputableArg, loadedArg, totalArg) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(10, this, "ptr", eventType, "short", canBubble, "short", cancelable, "short", lengthComputableArg, "uint", loadedArg, "uint", totalArg, "HRESULT")
        return result
    }
}
