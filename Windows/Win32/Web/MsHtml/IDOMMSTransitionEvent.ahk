#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMMSTransitionEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMMSTransitionEvent
     * @type {Guid}
     */
    static IID => Guid("{305107b5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMSTransitionEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305107b6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_propertyName", "get_elapsedTime", "initMSTransitionEvent"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_propertyName() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_elapsedTime() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {BSTR} propertyName 
     * @param {Float} elapsedTime 
     * @returns {HRESULT} 
     */
    initMSTransitionEvent(eventType, canBubble, cancelable, propertyName, elapsedTime) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(9, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", propertyName, "float", elapsedTime, "HRESULT")
        return result
    }
}
