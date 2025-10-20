#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorSiteOM extends IUnknown{
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
     * 
     * @param {PWSTR} pchEvent 
     * @param {Integer} lFlags 
     * @param {Pointer<Int32>} plCookie 
     * @returns {HRESULT} 
     */
    RegisterEvent(pchEvent, lFlags, plCookie) {
        pchEvent := pchEvent is String ? StrPtr(pchEvent) : pchEvent

        result := ComCall(3, this, "ptr", pchEvent, "int", lFlags, "int*", plCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pchEvent 
     * @param {Pointer<Int32>} plCookie 
     * @returns {HRESULT} 
     */
    GetEventCookie(pchEvent, plCookie) {
        pchEvent := pchEvent is String ? StrPtr(pchEvent) : pchEvent

        result := ComCall(4, this, "ptr", pchEvent, "int*", plCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lCookie 
     * @param {Pointer<IHTMLEventObj>} pEventObject 
     * @returns {HRESULT} 
     */
    FireEvent(lCookie, pEventObject) {
        result := ComCall(5, this, "int", lCookie, "ptr", pEventObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLEventObj>} ppEventObject 
     * @returns {HRESULT} 
     */
    CreateEventObject(ppEventObject) {
        result := ComCall(6, this, "ptr", ppEventObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pchName 
     * @returns {HRESULT} 
     */
    RegisterName(pchName) {
        pchName := pchName is String ? StrPtr(pchName) : pchName

        result := ComCall(7, this, "ptr", pchName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pchUrn 
     * @returns {HRESULT} 
     */
    RegisterUrn(pchUrn) {
        pchUrn := pchUrn is String ? StrPtr(pchUrn) : pchUrn

        result := ComCall(8, this, "ptr", pchUrn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
