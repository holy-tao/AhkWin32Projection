#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that act as containers for a collection of child elements organized in a two-dimensional logical coordinate system that can be traversed (that is, a Microsoft UI Automation client can move to adjacent controls) by using the keyboard.
 * @remarks
 * 
  * The <b>IGridProvider</b> interface exposes methods and properties to support UI Automation client access to controls 
  * 		that act as containers for a collection of child elements. The children of this element must implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-igriditemprovider">IGridItemProvider</a>and be organized in a two-dimensional logical coordinate system that can be traversed (that is, a UI Automation client can move to adjacent controls) by using the keyboard.
  * 		
  * 
  * Implemented on a UI Automation provider that must support 
  *         the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinggrid">Grid</a> control pattern.
  * 
  * <b>IGridProvider</b> does not enable active manipulation of a grid; 
  *         <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itransformprovider">ITransformProvider</a> must be implemented for this.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-igridprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IGridProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridProvider
     * @type {Guid}
     */
    static IID => Guid("{b17d6187-0907-464b-a168-0ef17a1572b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItem", "get_RowCount", "get_ColumnCount"]

    /**
     * 
     * @param {Integer} row 
     * @param {Integer} column 
     * @param {Pointer<IRawElementProviderSimple>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igridprovider-getitem
     */
    GetItem(row, column, pRetVal) {
        result := ComCall(3, this, "int", row, "int", column, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igridprovider-get_rowcount
     */
    get_RowCount(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igridprovider-get_columncount
     */
    get_ColumnCount(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }
}
