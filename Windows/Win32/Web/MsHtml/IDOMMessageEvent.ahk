#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLWindow2.ahk
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
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
    }

    /**
     * @type {BSTR} 
     */
    origin {
        get => this.get_origin()
    }

    /**
     * @type {IHTMLWindow2} 
     */
    source {
        get => this.get_source()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_origin() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_source() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
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
