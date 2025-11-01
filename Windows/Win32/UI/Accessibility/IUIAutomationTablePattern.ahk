#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that acts as a container for a collection of child elements.
 * @remarks
 * 
  * This control pattern is analogous to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationgridpattern">IUIAutomationGridPattern</a> with the distinction that any control that supports <b>IUIAutomationTablePattern</b> also exposes a column or row header relationship, or both, for each child element. Controls that support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtableitem">Table</a> control pattern also support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinggrid">Grid</a> control pattern in order to provide access to the inherent grid functionality of a table.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtablepattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTablePattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTablePattern
     * @type {Guid}
     */
    static IID => Guid("{620e691c-ea96-4710-a850-754b24ce2417}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentRowHeaders", "GetCurrentColumnHeaders", "get_CurrentRowOrColumnMajor", "GetCachedRowHeaders", "GetCachedColumnHeaders", "get_CachedRowOrColumnMajor"]

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-getcurrentrowheaders
     */
    GetCurrentRowHeaders(retVal) {
        result := ComCall(3, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-getcurrentcolumnheaders
     */
    GetCurrentColumnHeaders(retVal) {
        result := ComCall(4, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-get_currentroworcolumnmajor
     */
    get_CurrentRowOrColumnMajor(retVal) {
        result := ComCall(5, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-getcachedrowheaders
     */
    GetCachedRowHeaders(retVal) {
        result := ComCall(6, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-getcachedcolumnheaders
     */
    GetCachedColumnHeaders(retVal) {
        result := ComCall(7, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-get_cachedroworcolumnmajor
     */
    get_CachedRowOrColumnMajor(retVal) {
        result := ComCall(8, this, "int*", retVal, "HRESULT")
        return result
    }
}
