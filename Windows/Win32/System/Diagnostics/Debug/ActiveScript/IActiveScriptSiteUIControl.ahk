#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class IActiveScriptSiteUIControl extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptSiteUIControl
     * @type {Guid}
     */
    static IID => Guid("{aedae97e-d7ee-4796-b960-7f092ae844ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUIBehavior"]

    /**
     * 
     * @param {SCRIPTUICITEM} UicItem 
     * @returns {SCRIPTUICHANDLING} 
     */
    GetUIBehavior(UicItem) {
        result := ComCall(3, this, "int", UicItem, "int*", &pUicHandling := 0, "HRESULT")
        return pUicHandling
    }
}
