#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IObservableVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables collections to support current record management, grouping, and incremental loading (data virtualization).
 * @remarks
 * ICollectionView is an interface used to represent a collection. It serves to maintain currency for properties like item selection.
 * 
 * To implement custom behavior for selection currency in your data source, your data source should implement [ICollectionViewFactory](icollectionviewfactory.md) instead of implementing ICollectionView directly. You can set the [CollectionViewSource.Source](collectionviewsource_source.md) property to an [ICollectionViewFactory](icollectionviewfactory.md), but if you set it to an ICollectionView, it will throw an exception.
 * 
 * The [CollectionGroups](icollectionview_collectiongroups.md) property is of type [IObservableVector<object>](../windows.foundation.collections/iobservablevector_1.md), but these objects should implement [ICollectionViewGroup](icollectionviewgroup.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class ICollectionView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICollectionView
     * @type {Guid}
     */
    static IID => Guid("{8be8bfe4-dbef-44df-8126-a31a89121ddc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentItem", "get_CurrentPosition", "get_IsCurrentAfterLast", "get_IsCurrentBeforeFirst", "get_CollectionGroups", "get_HasMoreItems", "add_CurrentChanged", "remove_CurrentChanged", "add_CurrentChanging", "remove_CurrentChanging", "MoveCurrentTo", "MoveCurrentToPosition", "MoveCurrentToFirst", "MoveCurrentToLast", "MoveCurrentToNext", "MoveCurrentToPrevious", "LoadMoreItemsAsync"]

    /**
     * Gets the current item in the view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.currentitem
     * @type {IInspectable} 
     */
    CurrentItem {
        get => this.get_CurrentItem()
    }

    /**
     * Gets the ordinal position of the [CurrentItem](icollectionview_currentitem.md) within the view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.currentposition
     * @type {Integer} 
     */
    CurrentPosition {
        get => this.get_CurrentPosition()
    }

    /**
     * Gets a value that indicates whether the [CurrentItem](icollectionview_currentitem.md) of the view is beyond the end of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.iscurrentafterlast
     * @type {Boolean} 
     */
    IsCurrentAfterLast {
        get => this.get_IsCurrentAfterLast()
    }

    /**
     * Gets a value that indicates whether the [CurrentItem](icollectionview_currentitem.md) of the view is beyond the beginning of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.iscurrentbeforefirst
     * @type {Boolean} 
     */
    IsCurrentBeforeFirst {
        get => this.get_IsCurrentBeforeFirst()
    }

    /**
     * Returns any collection groups that are associated with the view.
     * @remarks
     * The CollectionGroups property is of type [IObservableVector<object>](../windows.foundation.collections/iobservablevector_1.md), but these objects should implement [ICollectionViewGroup](icollectionviewgroup.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.collectiongroups
     * @type {IObservableVector<IInspectable>} 
     */
    CollectionGroups {
        get => this.get_CollectionGroups()
    }

    /**
     * Gets a sentinel value that supports incremental loading implementations. See also [LoadMoreItemsAsync](icollectionview_loadmoreitemsasync_928705393.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.hasmoreitems
     * @type {Boolean} 
     */
    HasMoreItems {
        get => this.get_HasMoreItems()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_CurrentItem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentPosition() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCurrentAfterLast() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCurrentBeforeFirst() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IObservableVector<IInspectable>} 
     */
    get_CollectionGroups() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObservableVector(IInspectable, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasMoreItems() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CurrentChangingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentChanging(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentChanging(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the specified item to be the [CurrentItem](icollectionview_currentitem.md) in the view.
     * @param {IInspectable} item The item to set as the [CurrentItem](icollectionview_currentitem.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.movecurrentto
     */
    MoveCurrentTo(item) {
        result := ComCall(16, this, "ptr", item, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Sets the item at the specified index to be the [CurrentItem](icollectionview_currentitem.md) in the view.
     * @param {Integer} index The index of the item to move to.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.movecurrenttoposition
     */
    MoveCurrentToPosition(index) {
        result := ComCall(17, this, "int", index, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Sets the first item in the view as the [CurrentItem](icollectionview_currentitem.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.movecurrenttofirst
     */
    MoveCurrentToFirst() {
        result := ComCall(18, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Sets the last item in the view as the [CurrentItem](icollectionview_currentitem.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.movecurrenttolast
     */
    MoveCurrentToLast() {
        result := ComCall(19, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Sets the item after the [CurrentItem](icollectionview_currentitem.md) in the view as the [CurrentItem](icollectionview_currentitem.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.movecurrenttonext
     */
    MoveCurrentToNext() {
        result := ComCall(20, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Sets the item before the [CurrentItem](icollectionview_currentitem.md) in the view as the [CurrentItem](icollectionview_currentitem.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.movecurrenttoprevious
     */
    MoveCurrentToPrevious() {
        result := ComCall(21, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Initializes incremental loading from the view.
     * @param {Integer} count The number of items to load.
     * @returns {IAsyncOperation<LoadMoreItemsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionview.loadmoreitemsasync
     */
    LoadMoreItemsAsync(count) {
        result := ComCall(22, this, "uint", count, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetLoadMoreItemsResult(), operation)
    }
}
