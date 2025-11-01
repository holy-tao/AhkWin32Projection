#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationSelectionPattern.ahk

/**
 * Extends the IUIAutomationSelectionPattern interface to provide information about selected items.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationselectionpattern2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationSelectionPattern2 extends IUIAutomationSelectionPattern{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationSelectionPattern2
     * @type {Guid}
     */
    static IID => Guid("{0532bfae-c011-4e32-a343-6d642d798555}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentFirstSelectedItem", "get_CurrentLastSelectedItem", "get_CurrentCurrentSelectedItem", "get_CurrentItemCount", "get_CachedFirstSelectedItem", "get_CachedLastSelectedItem", "get_CachedCurrentSelectedItem", "get_CachedItemCount"]

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentfirstselecteditem
     */
    get_CurrentFirstSelectedItem(retVal) {
        result := ComCall(9, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentlastselecteditem
     */
    get_CurrentLastSelectedItem(retVal) {
        result := ComCall(10, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentcurrentselecteditem
     */
    get_CurrentCurrentSelectedItem(retVal) {
        result := ComCall(11, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentitemcount
     */
    get_CurrentItemCount(retVal) {
        result := ComCall(12, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cachedfirstselecteditem
     */
    get_CachedFirstSelectedItem(retVal) {
        result := ComCall(13, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cachedlastselecteditem
     */
    get_CachedLastSelectedItem(retVal) {
        result := ComCall(14, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cachedcurrentselecteditem
     */
    get_CachedCurrentSelectedItem(retVal) {
        result := ComCall(15, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cacheditemcount
     */
    get_CachedItemCount(retVal) {
        result := ComCall(16, this, "int*", retVal, "HRESULT")
        return result
    }
}
