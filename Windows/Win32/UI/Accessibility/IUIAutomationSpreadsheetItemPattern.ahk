#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a client application to retrieve information about an item (cell) in a spreadsheet.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationspreadsheetitempattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationSpreadsheetItemPattern extends IUnknown{
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
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentFormula(retVal) {
        result := ComCall(3, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    GetCurrentAnnotationObjects(retVal) {
        result := ComCall(4, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} retVal 
     * @returns {HRESULT} 
     */
    GetCurrentAnnotationTypes(retVal) {
        result := ComCall(5, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedFormula(retVal) {
        result := ComCall(6, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    GetCachedAnnotationObjects(retVal) {
        result := ComCall(7, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} retVal 
     * @returns {HRESULT} 
     */
    GetCachedAnnotationTypes(retVal) {
        result := ComCall(8, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
