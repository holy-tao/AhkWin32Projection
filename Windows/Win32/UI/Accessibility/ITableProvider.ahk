#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that act as containers for a collection of child elements.
 * @remarks
 * 
  * This control pattern is analogous to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-igridprovider">IGridProvider</a> with the distinction that any control that implements <b>ITableProvider</b> must also expose a column and/or row header relationship for each child element.
  *             
  * 
  * Controls that implement <b>ITableProvider</b> are also required to  implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-igridprovider">IGridProvider</a> so as to expose the inherent grid functionality of a table control.
  *             
  * Implemented on a UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtable">Table</a> control pattern and <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinggrid">Grid</a> control pattern.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itableprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITableProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITableProvider
     * @type {Guid}
     */
    static IID => Guid("{9c860395-97b3-490a-b52a-858cc22af166}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRowHeaders", "GetColumnHeaders", "get_RowOrColumnMajor"]

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itableprovider-getrowheaders
     */
    GetRowHeaders() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itableprovider-getcolumnheaders
     */
    GetColumnHeaders() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itableprovider-get_roworcolumnmajor
     */
    get_RowOrColumnMajor() {
        result := ComCall(5, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
