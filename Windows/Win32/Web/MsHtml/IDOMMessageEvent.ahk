#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMMessageEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMMessageEvent
     * @type {Guid}
     */
    static IID => Guid("{30510720-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMessageEvent
     * @type {Guid}
     */
    static CLSID => Guid("{30510721-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_data", "get_origin", "get_source", "initMessageEvent"]

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_data(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_origin(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} p 
     * @returns {HRESULT} 
     */
    get_source(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {BSTR} data 
     * @param {BSTR} origin 
     * @param {BSTR} lastEventId 
     * @param {IHTMLWindow2} source 
     * @returns {HRESULT} 
     */
    initMessageEvent(eventType, canBubble, cancelable, data, origin, lastEventId, source) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        data := data is String ? BSTR.Alloc(data).Value : data
        origin := origin is String ? BSTR.Alloc(origin).Value : origin
        lastEventId := lastEventId is String ? BSTR.Alloc(lastEventId).Value : lastEventId

        result := ComCall(10, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", data, "ptr", origin, "ptr", lastEventId, "ptr", source, "HRESULT")
        return result
    }
}
