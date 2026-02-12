#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IObservableVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents any grouped items within a view.
 * @remarks
 * ICollectionViewGroup is used like a view model to represent a group within a collection. When implementing a custom grouped data source, your data source should implement [ICollectionViewFactory](icollectionviewfactory.md). For more info, see [ICollectionViewFactory](icollectionviewfactory.md) and [ICollectionView](icollectionview.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionviewgroup
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class ICollectionViewGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICollectionViewGroup
     * @type {Guid}
     */
    static IID => Guid("{7e01b9d8-d7b5-48b6-b31c-5bb5bdf5f09b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Group", "get_GroupItems"]

    /**
     * Gets or sets the grouping context used for grouping the data, which sets the data context for the default [HeaderTemplate](../windows.ui.xaml.controls/groupstyle_headertemplate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionviewgroup.group
     * @type {IInspectable} 
     */
    Group {
        get => this.get_Group()
    }

    /**
     * Gets the collection of grouped items that this [ICollectionViewGroup](icollectionviewgroup.md) implementation represents.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionviewgroup.groupitems
     * @type {IObservableVector<IInspectable>} 
     */
    GroupItems {
        get => this.get_GroupItems()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Group() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {IObservableVector<IInspectable>} 
     */
    get_GroupItems() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObservableVector(IInspectable, value)
    }
}
