#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLElement.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorSite extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetElement", "RegisterNotification"]

    /**
     * 
     * @returns {IHTMLElement} 
     */
    GetElement() {
        result := ComCall(3, this, "ptr*", &ppElement := 0, "HRESULT")
        return IHTMLElement(ppElement)
    }

    /**
     * 
     * @param {Integer} lEvent 
     * @returns {HRESULT} 
     */
    RegisterNotification(lEvent) {
        result := ComCall(4, this, "int", lEvent, "HRESULT")
        return result
    }
}
