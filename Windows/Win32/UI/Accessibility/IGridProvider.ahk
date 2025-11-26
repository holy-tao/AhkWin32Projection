#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
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
     * @type {Integer} 
     */
    RowCount {
        get => this.get_RowCount()
    }

    /**
     * @type {Integer} 
     */
    ColumnCount {
        get => this.get_ColumnCount()
    }

    /**
     * Retrieves the Microsoft UI Automation provider for the specified cell.
     * @param {Integer} row Type: <b>int</b>
     * 
     * The ordinal number of the row of interest.
     * @param {Integer} column Type: <b>int</b>
     * 
     * The ordinal number of the column of interest.
     * @returns {IRawElementProviderSimple} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
     * 
     * Receives a pointer to a UI Automation provider for the specified cell or a null reference 
     *                 (Nothing in Microsoft Visual Basic .NET) if the cell is empty.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-igridprovider-getitem
     */
    GetItem(row, column) {
        result := ComCall(3, this, "int", row, "int", column, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }

    /**
     * Specifies the total number of rows in the grid.
     * @remarks
     * 
     * Hidden rows and columns, depending on the provider implementation, may be loaded 
     *             in the logical tree and will therefore be reflected in the 
     *             <b>IGridProvider::RowCount</b> and 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-igridprovider-get_columncount">IGridProvider::ColumnCount</a> properties. 
     *             If the hidden rows and columns have not yet been loaded they will not be counted.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-igridprovider-get_rowcount
     */
    get_RowCount() {
        result := ComCall(4, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the total number of columns in the grid.
     * @remarks
     * 
     * Hidden rows and columns, depending on the provider implementation, may be loaded 
     *             in the logical tree and will therefore be reflected in the 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-igridprovider-get_rowcount">IGridProvider::RowCount</a> and 
     *             <b>IGridProvider::ColumnCount</b> properties. 
     *             If the hidden rows and columns have not yet been loaded they will not be counted.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-igridprovider-get_columncount
     */
    get_ColumnCount() {
        result := ComCall(5, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
