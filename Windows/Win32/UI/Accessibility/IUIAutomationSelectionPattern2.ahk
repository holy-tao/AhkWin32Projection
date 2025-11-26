#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement.ahk
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
     * @type {IUIAutomationElement} 
     */
    CurrentFirstSelectedItem {
        get => this.get_CurrentFirstSelectedItem()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CurrentLastSelectedItem {
        get => this.get_CurrentLastSelectedItem()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CurrentCurrentSelectedItem {
        get => this.get_CurrentCurrentSelectedItem()
    }

    /**
     * @type {Integer} 
     */
    CurrentItemCount {
        get => this.get_CurrentItemCount()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedFirstSelectedItem {
        get => this.get_CachedFirstSelectedItem()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedLastSelectedItem {
        get => this.get_CachedLastSelectedItem()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedCurrentSelectedItem {
        get => this.get_CachedCurrentSelectedItem()
    }

    /**
     * @type {Integer} 
     */
    CachedItemCount {
        get => this.get_CachedItemCount()
    }

    /**
     * Gets an IUIAutomationElement object representing the first item in a group of selected items.
     * @returns {IUIAutomationElement} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentfirstselecteditem
     */
    get_CurrentFirstSelectedItem() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets an IUIAutomationElement object representing the last item in a group of selected items.
     * @returns {IUIAutomationElement} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentlastselecteditem
     */
    get_CurrentLastSelectedItem() {
        result := ComCall(10, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets an IUIAutomationElement object representing the currently selected item.
     * @returns {IUIAutomationElement} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentcurrentselecteditem
     */
    get_CurrentCurrentSelectedItem() {
        result := ComCall(11, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets an integer value indicating the number of selected items.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_currentitemcount
     */
    get_CurrentItemCount() {
        result := ComCall(12, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Gets a cached IUIAutomationElement object representing the first item in a group of selected items.
     * @returns {IUIAutomationElement} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cachedfirstselecteditem
     */
    get_CachedFirstSelectedItem() {
        result := ComCall(13, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets a cached IUIAutomationElement object representing the last item in a group of selected items.
     * @returns {IUIAutomationElement} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cachedlastselecteditem
     */
    get_CachedLastSelectedItem() {
        result := ComCall(14, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets a cached IUIAutomationElement object representing the currently selected item.
     * @returns {IUIAutomationElement} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cachedcurrentselecteditem
     */
    get_CachedCurrentSelectedItem() {
        result := ComCall(15, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Gets a cached integer value indicating the number of selected items.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern2-get_cacheditemcount
     */
    get_CachedItemCount() {
        result := ComCall(16, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
