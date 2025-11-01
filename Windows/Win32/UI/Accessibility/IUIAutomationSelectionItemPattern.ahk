#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the selectable child items of a container control that supports IUIAutomationSelectionPattern.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationselectionitempattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationSelectionItemPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationSelectionItemPattern
     * @type {Guid}
     */
    static IID => Guid("{a8efa66a-0fda-421a-9194-38021f3578ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Select", "AddToSelection", "RemoveFromSelection", "get_CurrentIsSelected", "get_CurrentSelectionContainer", "get_CachedIsSelected", "get_CachedSelectionContainer"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-select
     */
    Select() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-addtoselection
     */
    AddToSelection() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_currentisselected
     */
    get_CurrentIsSelected(retVal) {
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_currentselectioncontainer
     */
    get_CurrentSelectionContainer(retVal) {
        result := ComCall(7, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_cachedisselected
     */
    get_CachedIsSelected(retVal) {
        result := ComCall(8, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_cachedselectioncontainer
     */
    get_CachedSelectionContainer(retVal) {
        result := ComCall(9, this, "ptr*", retVal, "HRESULT")
        return result
    }
}
