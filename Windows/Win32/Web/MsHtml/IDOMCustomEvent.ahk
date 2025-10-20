#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMCustomEvent extends IDispatch{
    /**
     * The interface identifier for IDOMCustomEvent
     * @type {Guid}
     */
    static IID => Guid("{305106de-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMCustomEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305106df-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_detail(p) {
        result := ComCall(7, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {Pointer<VARIANT>} detail 
     * @returns {HRESULT} 
     */
    initCustomEvent(eventType, canBubble, cancelable, detail) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(8, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", detail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
