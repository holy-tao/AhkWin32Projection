#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMMSManipulationEvent extends IDispatch{
    /**
     * The interface identifier for IDOMMSManipulationEvent
     * @type {Guid}
     */
    static IID => Guid("{30510816-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMSManipulationEvent
     * @type {Guid}
     */
    static CLSID => Guid("{30510817-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_lastState(p) {
        result := ComCall(7, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_currentState(p) {
        result := ComCall(8, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {Pointer<IHTMLWindow2>} viewArg 
     * @param {Integer} detailArg 
     * @param {Integer} lastState 
     * @param {Integer} currentState 
     * @returns {HRESULT} 
     */
    initMSManipulationEvent(eventType, canBubble, cancelable, viewArg, detailArg, lastState, currentState) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(9, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", viewArg, "int", detailArg, "int", lastState, "int", currentState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
