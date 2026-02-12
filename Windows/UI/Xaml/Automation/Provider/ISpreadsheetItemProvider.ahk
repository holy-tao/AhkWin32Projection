#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to information about an item (cell) in a spreadsheet.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.ispreadsheetitemprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ISpreadsheetItemProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpreadsheetItemProvider
     * @type {Guid}
     */
    static IID => Guid("{ebde8f92-6015-4826-b719-47521a81c67e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Formula", "GetAnnotationObjects", "GetAnnotationTypes"]

    /**
     * Gets the formula for this spreadsheet cell, as a string.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.ispreadsheetitemprovider.formula
     * @type {HSTRING} 
     */
    Formula {
        get => this.get_Formula()
    }

    /**
     * Specifies the formula for this spreadsheet cell.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-ispreadsheetitemprovider-get_formula
     */
    get_Formula() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves an array of objects that represent the annotations associated with this spreadsheet cell.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-ispreadsheetitemprovider-getannotationobjects
     */
    GetAnnotationObjects(result_) {
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves an array of annotation type identifiers indicating the types of annotations that are associated with this spreadsheet cell. (ISpreadsheetItemProvider.GetAnnotationTypes)
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-ispreadsheetitemprovider-getannotationtypes
     */
    GetAnnotationTypes(result_) {
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
