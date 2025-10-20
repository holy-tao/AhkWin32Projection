#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IElementBehaviorSiteOM.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorSiteOM2 extends IElementBehaviorSiteOM{
    /**
     * The interface identifier for IElementBehaviorSiteOM2
     * @type {Guid}
     */
    static IID => Guid("{3050f659-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<IHTMLElementDefaults>} ppDefaults 
     * @returns {HRESULT} 
     */
    GetDefaults(ppDefaults) {
        result := ComCall(9, this, "ptr", ppDefaults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
