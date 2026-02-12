#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to controls that act as containers for a collection of child elements. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Grid](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [Grid Control Pattern](/windows/desktop/WinAuto/uiauto-implementinggrid).
 * 
 * IGridProvider isn't implemented by any existing Windows Runtime automation peers. Notably, IGridProvider doesn't exist for the [Grid](../windows.ui.xaml.controls/grid.md) layout container, or for [GridView](../windows.ui.xaml.controls/gridview.md). The interface exists so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same Windows Runtime managed or C++ API as they use to define control logic or other automation support.
 * 
 * Use [GridPatternIdentifiers](../windows.ui.xaml.automation/gridpatternidentifiers.md) if you want to reference the IGridProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.igridprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IGridProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridProvider
     * @type {Guid}
     */
    static IID => Guid("{8b62b7a0-932c-4490-9a13-02fdb39a8f5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ColumnCount", "get_RowCount", "GetItem"]

    /**
     * Gets the total number of columns in a grid.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.igridprovider.columncount
     * @type {Integer} 
     */
    ColumnCount {
        get => this.get_ColumnCount()
    }

    /**
     * Gets the total number of rows in a grid.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.igridprovider.rowcount
     * @type {Integer} 
     */
    RowCount {
        get => this.get_RowCount()
    }

    /**
     * Specifies the total number of columns in the grid.
     * @remarks
     * Hidden rows and columns, depending on the provider implementation, may be loaded 
     *             in the logical tree and will therefore be reflected in the 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-igridprovider-get_rowcount">IGridProvider::RowCount</a> and 
     *             <b>IGridProvider::ColumnCount</b> properties. 
     *             If the hidden rows and columns have not yet been loaded they will not be counted.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-igridprovider-get_columncount
     */
    get_ColumnCount() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the total number of rows in the grid.
     * @remarks
     * Hidden rows and columns, depending on the provider implementation, may be loaded 
     *             in the logical tree and will therefore be reflected in the 
     *             <b>IGridProvider::RowCount</b> and 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-igridprovider-get_columncount">IGridProvider::ColumnCount</a> properties. 
     *             If the hidden rows and columns have not yet been loaded they will not be counted.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-igridprovider-get_rowcount
     */
    get_RowCount() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves the Microsoft UI Automation provider for the specified cell.
     * @remarks
     * Grid coordinates are zero-based with the upper left (or upper right cell depending on locale) having coordinates (0,0).
     *             
     * 
     * If a cell is empty a UI Automation provider must still be 
     *             returned in order to support the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_containinggrid">ContainingGrid</a> property 
     *             for that cell. This is possible when the layout of child elements in the grid is similar to a ragged array.
     *             
     * 
     * Hidden rows and columns, depending on the provider implementation, may be loaded in the 
     *             UI Automation tree and will therefore be reflected in the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-igridprovider-get_rowcount">IGridProvider::RowCount</a> 
     *             and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-igridprovider-get_columncount">IGridProvider::ColumnCount</a> properties. 
     *             If the hidden rows and columns have not yet been loaded they should not be counted.
     * @param {Integer} row Type: <b>int</b>
     * 
     * The ordinal number of the row of interest.
     * @param {Integer} column_ Type: <b>int</b>
     * 
     * The ordinal number of the column of interest.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-igridprovider-getitem
     */
    GetItem(row, column_) {
        result := ComCall(8, this, "int", row, "int", column_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawElementProviderSimple(result_)
    }
}
