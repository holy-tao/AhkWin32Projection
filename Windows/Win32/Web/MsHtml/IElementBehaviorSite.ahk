#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorSite extends IUnknown{
    /**
     * The interface identifier for IElementBehaviorSite
     * @type {Guid}
     */
    static IID => Guid("{3050f427-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IHTMLElement>} ppElement 
     * @returns {HRESULT} 
     */
    GetElement(ppElement) {
        result := ComCall(3, this, "ptr", ppElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lEvent 
     * @returns {HRESULT} 
     */
    RegisterNotification(lEvent) {
        result := ComCall(4, this, "int", lEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
