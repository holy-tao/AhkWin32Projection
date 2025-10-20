#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptSiteUIControl extends IUnknown{
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
     * 
     * @param {Integer} UicItem 
     * @param {Pointer<Int32>} pUicHandling 
     * @returns {HRESULT} 
     */
    GetUIBehavior(UicItem, pUicHandling) {
        result := ComCall(3, this, "int", UicItem, "int*", pUicHandling, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
