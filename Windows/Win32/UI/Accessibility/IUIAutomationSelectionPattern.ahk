#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that contains selectable child items. The children of this element support IUIAutomationSelectionItemPattern.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationselectionpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationSelectionPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationSelectionPattern
     * @type {Guid}
     */
    static IID => Guid("{5ed5202e-b2ac-47a6-b638-4b0bf140d78e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentSelection", "get_CurrentCanSelectMultiple", "get_CurrentIsSelectionRequired", "GetCachedSelection", "get_CachedCanSelectMultiple", "get_CachedIsSelectionRequired"]

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-getcurrentselection
     */
    GetCurrentSelection(retVal) {
        result := ComCall(3, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_currentcanselectmultiple
     */
    get_CurrentCanSelectMultiple(retVal) {
        result := ComCall(4, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_currentisselectionrequired
     */
    get_CurrentIsSelectionRequired(retVal) {
        result := ComCall(5, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-getcachedselection
     */
    GetCachedSelection(retVal) {
        result := ComCall(6, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_cachedcanselectmultiple
     */
    get_CachedCanSelectMultiple(retVal) {
        result := ComCall(7, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_cachedisselectionrequired
     */
    get_CachedIsSelectionRequired(retVal) {
        result := ComCall(8, this, "ptr", retVal, "HRESULT")
        return result
    }
}
