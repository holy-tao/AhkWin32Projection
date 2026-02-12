#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEventTarget.ahk
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
     * @type {IEventTarget} 
     */
    relatedTarget {
        get => this.get_relatedTarget()
    }

    /**
     * 
     * @returns {IEventTarget} 
     */
    get_relatedTarget() {
        result := ComCall(7, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEventTarget(p)
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} view_ 
     * @param {Integer} detail 
     * @param {IEventTarget} relatedTargetArg 
     * @returns {HRESULT} 
     */
    initFocusEvent(eventType, canBubble, cancelable, view_, detail, relatedTargetArg) {
        if(eventType is String) {
            pin := BSTR.Alloc(eventType)
            eventType := pin.Value
        }

        result := ComCall(8, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", view_, "int", detail, "ptr", relatedTargetArg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
