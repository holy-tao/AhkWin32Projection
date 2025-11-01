#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentcontaininggrid
     */
    get_CurrentContainingGrid(retVal) {
        result := ComCall(3, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentrow
     */
    get_CurrentRow(retVal) {
        result := ComCall(4, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentcolumn
     */
    get_CurrentColumn(retVal) {
        result := ComCall(5, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentrowspan
     */
    get_CurrentRowSpan(retVal) {
        result := ComCall(6, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentcolumnspan
     */
    get_CurrentColumnSpan(retVal) {
        result := ComCall(7, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedcontaininggrid
     */
    get_CachedContainingGrid(retVal) {
        result := ComCall(8, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedrow
     */
    get_CachedRow(retVal) {
        result := ComCall(9, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedcolumn
     */
    get_CachedColumn(retVal) {
        result := ComCall(10, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedrowspan
     */
    get_CachedRowSpan(retVal) {
        result := ComCall(11, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedcolumnspan
     */
    get_CachedColumnSpan(retVal) {
        result := ComCall(12, this, "int*", retVal, "HRESULT")
        return result
    }
}
