#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a child control in a grid-style container that supports the IUIAutomationGridPattern interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationgriditempattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationGridItemPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationGridItemPattern
     * @type {Guid}
     */
    static IID => Guid("{78f8ef57-66c3-4e09-bd7c-e79b2004894d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentContainingGrid", "get_CurrentRow", "get_CurrentColumn", "get_CurrentRowSpan", "get_CurrentColumnSpan", "get_CachedContainingGrid", "get_CachedRow", "get_CachedColumn", "get_CachedRowSpan", "get_CachedColumnSpan"]

    /**
     * @type {IUIAutomationElement} 
     */
    CurrentContainingGrid {
        get => this.get_CurrentContainingGrid()
    }

    /**
     * @type {Integer} 
     */
    CurrentRow {
        get => this.get_CurrentRow()
    }

    /**
     * @type {Integer} 
     */
    CurrentColumn {
        get => this.get_CurrentColumn()
    }

    /**
     * @type {Integer} 
     */
    CurrentRowSpan {
        get => this.get_CurrentRowSpan()
    }

    /**
     * @type {Integer} 
     */
    CurrentColumnSpan {
        get => this.get_CurrentColumnSpan()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedContainingGrid {
        get => this.get_CachedContainingGrid()
    }

    /**
     * @type {Integer} 
     */
    CachedRow {
        get => this.get_CachedRow()
    }

    /**
     * @type {Integer} 
     */
    CachedColumn {
        get => this.get_CachedColumn()
    }

    /**
     * @type {Integer} 
     */
    CachedRowSpan {
        get => this.get_CachedRowSpan()
    }

    /**
     * @type {Integer} 
     */
    CachedColumnSpan {
        get => this.get_CachedColumnSpan()
    }

    /**
     * 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentcontaininggrid
     */
    get_CurrentContainingGrid() {
        result := ComCall(3, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentrow
     */
    get_CurrentRow() {
        result := ComCall(4, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentcolumn
     */
    get_CurrentColumn() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentrowspan
     */
    get_CurrentRowSpan() {
        result := ComCall(6, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentcolumnspan
     */
    get_CurrentColumnSpan() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedcontaininggrid
     */
    get_CachedContainingGrid() {
        result := ComCall(8, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedrow
     */
    get_CachedRow() {
        result := ComCall(9, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedcolumn
     */
    get_CachedColumn() {
        result := ComCall(10, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedrowspan
     */
    get_CachedRowSpan() {
        result := ComCall(11, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedcolumnspan
     */
    get_CachedColumnSpan() {
        result := ComCall(12, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
