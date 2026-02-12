#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\ItemIndexRange.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Manages whether items and ranges of items in the data source are selected in the list control.
 * @remarks
 * The ISelectionInfo interface supports virtualization of large data sources for efficient presentation by XAML list controls. The other classes and interfaces that support data source virtualization are the following.
 * 
 * + [IItemsRangeInfo](iitemsrangeinfo.md) interface
 * + [ItemIndexRange](itemindexrange.md) class
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.iselectioninfo
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class ISelectionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectionInfo
     * @type {Guid}
     */
    static IID => Guid("{2e12ca86-e1ed-4245-be49-207e42aec524}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectRange", "DeselectRange", "IsSelected", "GetSelectedRanges"]

    /**
     * Marks the items in the data source specified by *itemIndexRange* as selected in the list control.
     * @param {ItemIndexRange} itemIndexRange_ A range of items in the data source.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.iselectioninfo.selectrange
     */
    SelectRange(itemIndexRange_) {
        result := ComCall(6, this, "ptr", itemIndexRange_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Marks the items in the data source specified by *itemIndexRange* as not selected in the list control.
     * @param {ItemIndexRange} itemIndexRange_ A range of items in the data source.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.iselectioninfo.deselectrange
     */
    DeselectRange(itemIndexRange_) {
        result := ComCall(7, this, "ptr", itemIndexRange_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Provides info about whether the item in the data source at the specified *index* is selected in the list control.
     * @param {Integer} index The index of an item in the data source.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.iselectioninfo.isselected
     */
    IsSelected(index) {
        result := ComCall(8, this, "int", index, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Returns the collection of ranges of items in the data source that are selected in the list control.
     * @returns {IVectorView<ItemIndexRange>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.iselectioninfo.getselectedranges
     */
    GetSelectedRanges() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ItemIndexRange, result_)
    }
}
