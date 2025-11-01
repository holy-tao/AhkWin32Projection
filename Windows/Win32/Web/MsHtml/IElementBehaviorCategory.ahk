#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorCategory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementBehaviorCategory
     * @type {Guid}
     */
    static IID => Guid("{3050f4ed-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCategory"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppchCategory 
     * @returns {HRESULT} 
     */
    GetCategory(ppchCategory) {
        result := ComCall(3, this, "ptr", ppchCategory, "HRESULT")
        return result
    }
}
