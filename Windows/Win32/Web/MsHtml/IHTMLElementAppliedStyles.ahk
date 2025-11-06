#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRulesAppliedCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElementAppliedStyles extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElementAppliedStyles
     * @type {Guid}
     */
    static IID => Guid("{305104bd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["msGetRulesApplied", "msGetRulesAppliedWithAncestor"]

    /**
     * 
     * @returns {IRulesAppliedCollection} 
     */
    msGetRulesApplied() {
        result := ComCall(7, this, "ptr*", &ppRulesAppliedCollection := 0, "HRESULT")
        return IRulesAppliedCollection(ppRulesAppliedCollection)
    }

    /**
     * 
     * @param {VARIANT} varContext 
     * @returns {IRulesAppliedCollection} 
     */
    msGetRulesAppliedWithAncestor(varContext) {
        result := ComCall(8, this, "ptr", varContext, "ptr*", &ppRulesAppliedCollection := 0, "HRESULT")
        return IRulesAppliedCollection(ppRulesAppliedCollection)
    }
}
