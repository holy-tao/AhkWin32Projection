#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLEventObj.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorSiteOM extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementBehaviorSiteOM
     * @type {Guid}
     */
    static IID => Guid("{3050f489-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterEvent", "GetEventCookie", "FireEvent", "CreateEventObject", "RegisterName", "RegisterUrn"]

    /**
     * 
     * @param {PWSTR} pchEvent 
     * @param {Integer} lFlags 
     * @returns {Integer} 
     */
    RegisterEvent(pchEvent, lFlags) {
        pchEvent := pchEvent is String ? StrPtr(pchEvent) : pchEvent

        result := ComCall(3, this, "ptr", pchEvent, "int", lFlags, "int*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    /**
     * 
     * @param {PWSTR} pchEvent 
     * @returns {Integer} 
     */
    GetEventCookie(pchEvent) {
        pchEvent := pchEvent is String ? StrPtr(pchEvent) : pchEvent

        result := ComCall(4, this, "ptr", pchEvent, "int*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    /**
     * 
     * @param {Integer} lCookie 
     * @param {IHTMLEventObj} pEventObject 
     * @returns {HRESULT} 
     */
    FireEvent(lCookie, pEventObject) {
        result := ComCall(5, this, "int", lCookie, "ptr", pEventObject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLEventObj} 
     */
    CreateEventObject() {
        result := ComCall(6, this, "ptr*", &ppEventObject := 0, "HRESULT")
        return IHTMLEventObj(ppEventObject)
    }

    /**
     * 
     * @param {PWSTR} pchName 
     * @returns {HRESULT} 
     */
    RegisterName(pchName) {
        pchName := pchName is String ? StrPtr(pchName) : pchName

        result := ComCall(7, this, "ptr", pchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchUrn 
     * @returns {HRESULT} 
     */
    RegisterUrn(pchUrn) {
        pchUrn := pchUrn is String ? StrPtr(pchUrn) : pchUrn

        result := ComCall(8, this, "ptr", pchUrn, "HRESULT")
        return result
    }
}
