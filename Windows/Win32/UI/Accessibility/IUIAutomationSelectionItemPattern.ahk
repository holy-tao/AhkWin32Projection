#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement.ahk
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
     * @type {BOOL} 
     */
    CurrentIsSelected {
        get => this.get_CurrentIsSelected()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CurrentSelectionContainer {
        get => this.get_CurrentSelectionContainer()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsSelected {
        get => this.get_CachedIsSelected()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedSelectionContainer {
        get => this.get_CachedSelectionContainer()
    }

    /**
     * Clears any selected items and then selects the current element.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-select
     */
    Select() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Adds the current element to the collection of selected items.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-addtoselection
     */
    AddToSelection() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Removes this element from the selection.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Indicates whether this item is selected.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_currentisselected
     */
    get_CurrentIsSelected() {
        result := ComCall(6, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the element that supports IUIAutomationSelectionPattern and acts as the container for this item.
     * @returns {IUIAutomationElement} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_currentselectioncontainer
     */
    get_CurrentSelectionContainer() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * A cached value that indicates whether this item is selected.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_cachedisselected
     */
    get_CachedIsSelected() {
        result := ComCall(8, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached element that supports IUIAutomationSelectionPattern and acts as the container for this item.
     * @returns {IUIAutomationElement} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationselectionitempattern-get_cachedselectioncontainer
     */
    get_CachedSelectionContainer() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }
}
