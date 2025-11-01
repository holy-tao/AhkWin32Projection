#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement.ahk

/**
 * Extends the IUIAutomationElement interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement2 extends IUIAutomationElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationElement2
     * @type {Guid}
     */
    static IID => Guid("{6749c683-f70d-4487-a698-5f79d55290d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 85

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentOptimizeForVisualContent", "get_CachedOptimizeForVisualContent", "get_CurrentLiveSetting", "get_CachedLiveSetting", "get_CurrentFlowsFrom", "get_CachedFlowsFrom"]

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentoptimizeforvisualcontent
     */
    get_CurrentOptimizeForVisualContent(retVal) {
        result := ComCall(85, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedoptimizeforvisualcontent
     */
    get_CachedOptimizeForVisualContent(retVal) {
        result := ComCall(86, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentlivesetting
     */
    get_CurrentLiveSetting(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(87, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedlivesetting
     */
    get_CachedLiveSetting(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(88, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentflowsfrom
     */
    get_CurrentFlowsFrom(retVal) {
        result := ComCall(89, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedflowsfrom
     */
    get_CachedFlowsFrom(retVal) {
        result := ComCall(90, this, "ptr*", retVal, "HRESULT")
        return result
    }
}
