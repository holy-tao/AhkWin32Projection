#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElementArray.ahk
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
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentoptimizeforvisualcontent
     */
    get_CurrentOptimizeForVisualContent() {
        result := ComCall(85, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedoptimizeforvisualcontent
     */
    get_CachedOptimizeForVisualContent() {
        result := ComCall(86, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentlivesetting
     */
    get_CurrentLiveSetting() {
        result := ComCall(87, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedlivesetting
     */
    get_CachedLiveSetting() {
        result := ComCall(88, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentflowsfrom
     */
    get_CurrentFlowsFrom() {
        result := ComCall(89, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedflowsfrom
     */
    get_CachedFlowsFrom() {
        result := ComCall(90, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }
}
