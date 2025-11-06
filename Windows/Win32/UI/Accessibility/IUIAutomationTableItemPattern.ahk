#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElementArray.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a child element in a container that supports IUIAutomationTablePattern.
 * @remarks
 * 
  * Elements that support this interface must also support <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationgriditempattern">IUIAutomationGridItemPattern</a>, to provide properties that are not specific to tables.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtableitempattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTableItemPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTableItemPattern
     * @type {Guid}
     */
    static IID => Guid("{0b964eb3-ef2e-4464-9c79-61d61737a27e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentRowHeaderItems", "GetCurrentColumnHeaderItems", "GetCachedRowHeaderItems", "GetCachedColumnHeaderItems"]

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtableitempattern-getcurrentrowheaderitems
     */
    GetCurrentRowHeaderItems() {
        result := ComCall(3, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtableitempattern-getcurrentcolumnheaderitems
     */
    GetCurrentColumnHeaderItems() {
        result := ComCall(4, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtableitempattern-getcachedrowheaderitems
     */
    GetCachedRowHeaderItems() {
        result := ComCall(5, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtableitempattern-getcachedcolumnheaderitems
     */
    GetCachedColumnHeaderItems() {
        result := ComCall(6, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }
}
