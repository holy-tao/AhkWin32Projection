#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to information about an item (cell) in a spreadsheet.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-ispreadsheetitemprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ISpreadsheetItemProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpreadsheetItemProvider
     * @type {Guid}
     */
    static IID => Guid("{eaed4660-7b3d-4879-a2e6-365ce603f3d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Formula", "GetAnnotationObjects", "GetAnnotationTypes"]

    /**
     * 
     * @param {Pointer<BSTR>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ispreadsheetitemprovider-get_formula
     */
    get_Formula(pRetVal) {
        result := ComCall(3, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ispreadsheetitemprovider-getannotationobjects
     */
    GetAnnotationObjects(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ispreadsheetitemprovider-getannotationtypes
     */
    GetAnnotationTypes(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }
}
