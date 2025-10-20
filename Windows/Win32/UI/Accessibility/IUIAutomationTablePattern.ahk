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
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    GetCurrentRowHeaders(retVal) {
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
    GetCurrentColumnHeaders(retVal) {
        result := ComCall(4, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentRowOrColumnMajor(retVal) {
        result := ComCall(5, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    GetCachedRowHeaders(retVal) {
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
    GetCachedColumnHeaders(retVal) {
        result := ComCall(7, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedRowOrColumnMajor(retVal) {
        result := ComCall(8, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
