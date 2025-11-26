#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUIAutomationElementArray.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a client application to retrieve information about an item (cell) in a spreadsheet.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationspreadsheetitempattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationSpreadsheetItemPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationSpreadsheetItemPattern
     * @type {Guid}
     */
    static IID => Guid("{7d4fb86c-8d34-40e1-8e83-62c15204e335}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentFormula", "GetCurrentAnnotationObjects", "GetCurrentAnnotationTypes", "get_CachedFormula", "GetCachedAnnotationObjects", "GetCachedAnnotationTypes"]

    /**
     * @type {BSTR} 
     */
    CurrentFormula {
        get => this.get_CurrentFormula()
    }

    /**
     * @type {BSTR} 
     */
    CachedFormula {
        get => this.get_CachedFormula()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-get_currentformula
     */
    get_CurrentFormula() {
        retVal := BSTR()
        result := ComCall(3, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcurrentannotationobjects
     */
    GetCurrentAnnotationObjects() {
        result := ComCall(4, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcurrentannotationtypes
     */
    GetCurrentAnnotationTypes() {
        result := ComCall(5, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-get_cachedformula
     */
    get_CachedFormula() {
        retVal := BSTR()
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcachedannotationobjects
     */
    GetCachedAnnotationObjects() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcachedannotationtypes
     */
    GetCachedAnnotationTypes() {
        result := ComCall(8, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }
}
