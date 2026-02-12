#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to individual child controls of containers that implement [IGridProvider](igridprovider.md). Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.GridItem](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [GridItem Control Pattern](/windows/desktop/WinAuto/uiauto-implementinggriditem).
 * 
 * IGridItemProvider isn't implemented by any existing Windows Runtime automation peers. Notably, IGridItemProvider doesn't exist for the elements contained in a [Grid](../windows.ui.xaml.controls/grid.md) and using the [Grid](../windows.ui.xaml.controls/grid.md) as a layout container, or for [GridViewItem](../windows.ui.xaml.controls/gridviewitem.md). The interface exists so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same Windows Runtime managed or C++ API as they use to define control logic or other automation support.
 * 
 * Use [GridItemPatternIdentifiers](../windows.ui.xaml.automation/griditempatternidentifiers.md) if you want to reference the IGridItemProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.igriditemprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IGridItemProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridItemProvider
     * @type {Guid}
     */
    static IID => Guid("{fff3683c-7407-45bb-a936-df3ed6d3837d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Column", "get_ColumnSpan", "get_ContainingGrid", "get_Row", "get_RowSpan"]

    /**
     * Gets the ordinal number of the column that contains the cell or item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.igriditemprovider.column
     * @type {Integer} 
     */
    Column {
        get => this.get_Column()
    }

    /**
     * Gets the number of columns that are spanned by a cell or item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.igriditemprovider.columnspan
     * @type {Integer} 
     */
    ColumnSpan {
        get => this.get_ColumnSpan()
    }

    /**
     * Gets a UI Automation provider that implements [IGridProvider](igridprovider.md) and that represents the container of the cell or item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.igriditemprovider.containinggrid
     * @type {IRawElementProviderSimple} 
     */
    ContainingGrid {
        get => this.get_ContainingGrid()
    }

    /**
     * Gets the ordinal number of the row that contains the cell or item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.igriditemprovider.row
     * @type {Integer} 
     */
    Row {
        get => this.get_Row()
    }

    /**
     * Gets the number of rows spanned by a cell or item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.igriditemprovider.rowspan
     * @type {Integer} 
     */
    RowSpan {
        get => this.get_RowSpan()
    }

    /**
     * Specifies the ordinal number of the column that contains this cell or item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_column
     */
    get_Column() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the number of columns spanned by this cell or item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_columnspan
     */
    get_ColumnSpan() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the UI Automation provider that implements IGridProvider and represents the container of this cell or item.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_containinggrid
     */
    get_ContainingGrid() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawElementProviderSimple(value)
    }

    /**
     * Specifies the ordinal number of the row that contains this cell or item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_row
     */
    get_Row() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the number of rows spanned by this cell or item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_rowspan
     */
    get_RowSpan() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
