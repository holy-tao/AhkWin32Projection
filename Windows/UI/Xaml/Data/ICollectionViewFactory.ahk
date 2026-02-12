#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICollectionView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Supports creation of the relevant [ICollectionView](icollectionview.md) implementation.
 * @remarks
 * The [CreateView](icollectionviewfactory_createview_164792513.md) method is called when you set the [CollectionViewSource.Source](collectionviewsource_source.md) property to an ICollectionViewFactory implementation. The returned [ICollectionView](icollectionview.md) implementation is used to manage sorting, filtering, grouping, and currency for the bound collection. When using the [CollectionViewSource](collectionviewsource.md) class, you can access the [View](collectionviewsource_view.md) property to retrieve the [ICollectionView](icollectionview.md) implementation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionviewfactory
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class ICollectionViewFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICollectionViewFactory
     * @type {Guid}
     */
    static IID => Guid("{34d4aaf4-8e72-4950-9192-ecd07d399d0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateView"]

    /**
     * Creates an [ICollectionView](icollectionview.md) instance using default settings.
     * @remarks
     * This method is called when you set the [CollectionViewSource.Source](collectionviewsource_source.md) property to an [ICollectionViewFactory](icollectionviewfactory.md) implementation. The returned [ICollectionView](icollectionview.md) implementation is used to manage sorting, filtering, grouping, and currency for the bound collection. When using the [CollectionViewSource](collectionviewsource.md) class, you can access the [View](collectionviewsource_view.md) property to retrieve the [ICollectionView](icollectionview.md) implementation.
     * @returns {ICollectionView} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icollectionviewfactory.createview
     */
    CreateView() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICollectionView(result_)
    }
}
