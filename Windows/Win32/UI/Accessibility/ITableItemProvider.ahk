#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to child controls of containers that implement ITableProvider.
 * @remarks
 * 
  * This control pattern is analogous to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-igriditemprovider">IGridItemProvider</a> with 
  *             the distinction that any control implementing <b>ITableItemProvider</b> 
  *             must expose the relationship between the individual cell and its row and column information.
  *             
  * 
  * Access to individual cell functionality is provided by the concurrent implementation 
  *             of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-igriditemprovider">IGridItemProvider</a>. 
  *             
  * 
  * Implemented on a UI Automation provider that must 
  *             support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtableitem">TableItem</a> control pattern.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itableitemprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITableItemProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITableItemProvider
     * @type {Guid}
     */
    static IID => Guid("{b9734fa6-771f-4d78-9c90-2517999349cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRowHeaderItems", "GetColumnHeaderItems"]

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itableitemprovider-getrowheaderitems
     */
    GetRowHeaderItems() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itableitemprovider-getcolumnheaderitems
     */
    GetColumnHeaderItems() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
