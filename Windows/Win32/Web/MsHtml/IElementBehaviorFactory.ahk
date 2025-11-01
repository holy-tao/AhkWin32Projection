#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementBehaviorFactory
     * @type {Guid}
     */
    static IID => Guid("{3050f429-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindBehavior"]

    /**
     * 
     * @param {BSTR} bstrBehavior 
     * @param {BSTR} bstrBehaviorUrl 
     * @param {IElementBehaviorSite} pSite 
     * @param {Pointer<IElementBehavior>} ppBehavior 
     * @returns {HRESULT} 
     */
    FindBehavior(bstrBehavior, bstrBehaviorUrl, pSite, ppBehavior) {
        bstrBehavior := bstrBehavior is String ? BSTR.Alloc(bstrBehavior).Value : bstrBehavior
        bstrBehaviorUrl := bstrBehaviorUrl is String ? BSTR.Alloc(bstrBehaviorUrl).Value : bstrBehaviorUrl

        result := ComCall(3, this, "ptr", bstrBehavior, "ptr", bstrBehaviorUrl, "ptr", pSite, "ptr*", ppBehavior, "HRESULT")
        return result
    }
}
