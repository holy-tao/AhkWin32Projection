#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISelectionProvider.ahk

/**
 * Extends the ISelectionItemProvider interface to provide information about selected items.
 * @remarks
 * 
  * This interface is implemented by a Microsoft UI Automation provider.
  * 
  * Providers should raise an event of type <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_Selection_InvalidatedEventId</a> when a selection in a container has changed significantly.
  * 
  * 
  * When selecting from a list or 2D grid there are primary pieces of information that ATs would like to better read to their end users.  Using Excel as a primary example, there are 4 main pieces of information necessary for the AT to provide a good experience:  
  * 
  * <ul>
  * <li>The first cell in the selection</li>
  * <li>The last cell in the selection</li>
  * <li>The current item as you select</li>
  * <li>The total count</li>
  * </ul>
  * <img alt="Image of an Excel spreadsheet showing multiple cells selected. Selection starts in the upper right on cell F5 and ends in the lower left on cell D7." src="./images/ISelectionPattern2.png"/>
  * The above image illustrates the end state of a 2D selection:
  * 
  * 
  * <ul>
  * <li>The user started in cell F5 (note this is where focus input stays because if you type that is where data lands)</li>
  * <li>The user selects down the column to cell F7</li>
  * <li>The user then selects left to cell D7</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iselectionprovider2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ISelectionProvider2 extends ISelectionProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectionProvider2
     * @type {Guid}
     */
    static IID => Guid("{14f68475-ee1c-44f6-a869-d239381f0fe7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FirstSelectedItem", "get_LastSelectedItem", "get_CurrentSelectedItem", "get_ItemCount"]

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider2-get_firstselecteditem
     */
    get_FirstSelectedItem(retVal) {
        result := ComCall(6, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider2-get_lastselecteditem
     */
    get_LastSelectedItem(retVal) {
        result := ComCall(7, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider2-get_currentselecteditem
     */
    get_CurrentSelectedItem(retVal) {
        result := ComCall(8, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider2-get_itemcount
     */
    get_ItemCount(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, retValMarshal, retVal, "HRESULT")
        return result
    }
}
