#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides methods that let an [ItemsControl](itemscontrol.md) map data items to UI containers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iitemcontainermapping
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemContainerMapping extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemContainerMapping
     * @type {Guid}
     */
    static IID => Guid("{53c9f23a-f25d-446a-99b8-c7aeb839050f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ItemFromContainer", "ContainerFromItem", "IndexFromContainer", "ContainerFromIndex"]

    /**
     * Returns the item that corresponds to the specified, generated container.
     * @param {DependencyObject} container The [DependencyObject](../windows.ui.xaml/dependencyobject.md) that corresponds to the item to be returned.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iitemcontainermapping.itemfromcontainer
     */
    ItemFromContainer(container) {
        result := ComCall(6, this, "ptr", container, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * Returns the container corresponding to the specified item.
     * @param {IInspectable} item The item to retrieve the container for.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iitemcontainermapping.containerfromitem
     */
    ContainerFromItem(item) {
        result := ComCall(7, this, "ptr", item, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * Returns the index to the item that has the specified, generated container.
     * @param {DependencyObject} container The generated container to retrieve the item index for.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iitemcontainermapping.indexfromcontainer
     */
    IndexFromContainer(container) {
        result := ComCall(8, this, "ptr", container, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Returns the container for the item at the specified index within the [ItemCollection](itemcollection.md).
     * @param {Integer} index The index of the item to retrieve.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iitemcontainermapping.containerfromindex
     */
    ContainerFromIndex(index) {
        result := ComCall(9, this, "int", index, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }
}
