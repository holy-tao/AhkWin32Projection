#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMCloseEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMCloseEvent
     * @type {Guid}
     */
    static IID => Guid("{305107ff-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMCloseEvent
     * @type {Guid}
     */
    static CLSID => Guid("{30510800-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_wasClean", "initCloseEvent"]

    /**
     * @type {VARIANT_BOOL} 
     */
    wasClean {
        get => this.get_wasClean()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_wasClean() {
        result := ComCall(7, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {VARIANT_BOOL} wasClean 
     * @param {Integer} code 
     * @param {BSTR} reason 
     * @returns {HRESULT} 
     */
    initCloseEvent(eventType, canBubble, cancelable, wasClean, code, reason) {
        if(eventType is String) {
            pin := BSTR.Alloc(eventType)
            eventType := pin.Value
        }
        if(reason is String) {
            pin := BSTR.Alloc(reason)
            reason := pin.Value
        }

        result := ComCall(8, this, "ptr", eventType, "short", canBubble, "short", cancelable, "short", wasClean, "int", code, "ptr", reason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
