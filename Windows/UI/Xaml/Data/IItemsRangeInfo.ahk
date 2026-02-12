#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides info about a range of items in the data source.
 * @remarks
 * The IItemsRangeInfo interface supports virtualization of large data sources for efficient presentation by XAML list controls. The other classes and interfaces that support data source virtualization are the following.
 * 
 * + [ISelectionInfo](iselectioninfo.md) interface
 * + [ItemIndexRange](itemindexrange.md) class
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.iitemsrangeinfo
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class IItemsRangeInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsRangeInfo
     * @type {Guid}
     */
    static IID => Guid("{f05f5665-71fd-45a2-be13-a081d294a68d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RangesChanged"]

    /**
     * Updates the ranges of items in the data source that are visible in the list control and that are tracked in the instance of the object that implements the [IItemsRangeInfo](iitemsrangeinfo.md) interface.
     * @param {ItemIndexRange} visibleRange The updated range of items in the data source that are visible in the list control.
     * @param {IVectorView<ItemIndexRange>} trackedItems The updated collection of ranges of items in the data source that are tracked in the instance of the object that implements the [IItemsRangeInfo](iitemsrangeinfo.md) interface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.iitemsrangeinfo.rangeschanged
     */
    RangesChanged(visibleRange, trackedItems) {
        result := ComCall(6, this, "ptr", visibleRange, "ptr", trackedItems, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
