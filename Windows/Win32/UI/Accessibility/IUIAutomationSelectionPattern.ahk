#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElementArray.ahk
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
     * @type {BOOL} 
     */
    CurrentCanSelectMultiple {
        get => this.get_CurrentCanSelectMultiple()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsSelectionRequired {
        get => this.get_CurrentIsSelectionRequired()
    }

    /**
     * @type {BOOL} 
     */
    CachedCanSelectMultiple {
        get => this.get_CachedCanSelectMultiple()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsSelectionRequired {
        get => this.get_CachedIsSelectionRequired()
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-getcurrentselection
     */
    GetCurrentSelection() {
        result := ComCall(3, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_currentcanselectmultiple
     */
    get_CurrentCanSelectMultiple() {
        result := ComCall(4, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_currentisselectionrequired
     */
    get_CurrentIsSelectionRequired() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-getcachedselection
     */
    GetCachedSelection() {
        result := ComCall(6, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_cachedcanselectmultiple
     */
    get_CachedCanSelectMultiple() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationselectionpattern-get_cachedisselectionrequired
     */
    get_CachedIsSelectionRequired() {
        result := ComCall(8, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
