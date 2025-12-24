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
     * Retrieves the formula for this cell.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-get_currentformula
     */
    get_CurrentFormula() {
        retVal := BSTR()
        result := ComCall(3, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves an array of elements representing the annotations associated with this spreadsheet cell.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives the array of annotation elements for this spreadsheet cell.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcurrentannotationobjects
     */
    GetCurrentAnnotationObjects() {
        result := ComCall(4, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves an array of annotation type identifiers indicating the types of annotations that are associated with this spreadsheet cell.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives the array of annotation type identifiers. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">Annotation Type Identifiers</a>.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcurrentannotationtypes
     */
    GetCurrentAnnotationTypes() {
        result := ComCall(5, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached formula for this cell.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-get_cachedformula
     */
    get_CachedFormula() {
        retVal := BSTR()
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached array of elements representing the annotations associated with this spreadsheet cell.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives the cached array of annotation elements for this spreadsheet cell.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcachedannotationobjects
     */
    GetCachedAnnotationObjects() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached array of annotation type identifiers indicating the types of annotations that are associated with this spreadsheet cell.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives the cached array of annotation type identifiers. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">Annotation Type Identifiers</a>.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationspreadsheetitempattern-getcachedannotationtypes
     */
    GetCachedAnnotationTypes() {
        result := ComCall(8, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }
}
