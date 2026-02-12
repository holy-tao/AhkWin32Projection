#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\ICollectionViewSource.ahk
#Include .\ICollectionViewSourceStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a data source that adds grouping and current-item support to collection classes.
 * @remarks
 * Use CollectionViewSource when you want to bind list controls to collections, but you want to display those collections in groups and maintain a current item independent from the list control. This is particularly useful when you want to bind multiple controls to the same collection and you want the current item in one control to change the current item in the other bound controls. You typically define a CollectionViewSource as a XAML resource and bind to it using the [{StaticResource} markup extension](/windows/uwp/xaml-platform/staticresource-markup-extension). You can then set its [Source](collectionviewsource_source.md) property in code-behind to a supported collection type.
 * 
 * Any controls that you bind to the same CollectionViewSource will always have the same current item. You can access the current item programmatically through the [ICollectionView.CurrentItem](icollectionview_currentitem.md) property of the [CollectionViewSource.View](collectionviewsource_view.md) property value.
 * 
 * If the items in the collection are collections themselves, or are objects that contain collections, you can display the collections as groups within the larger collection. To do this, set the [IsSourceGrouped](collectionviewsource_issourcegrouped.md) property to **true**. If the items contain collections but are not collections themselves, you must also set the [ItemsPath](collectionviewsource_itemspath.md) property to the name of the collection property.
 * 
 * > [!NOTE]
 * > Setting the [Source](collectionviewsource_source.md) property to another CollectionViewSource instance is not supported.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.collectionviewsource
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class CollectionViewSource extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICollectionViewSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICollectionViewSource.IID

    /**
     * Identifies the [Source](collectionviewsource_source.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.collectionviewsource.sourceproperty
     * @type {DependencyProperty} 
     */
    static SourceProperty {
        get => CollectionViewSource.get_SourceProperty()
    }

    /**
     * Identifies the [View](collectionviewsource_view.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.collectionviewsource.viewproperty
     * @type {DependencyProperty} 
     */
    static ViewProperty {
        get => CollectionViewSource.get_ViewProperty()
    }

    /**
     * Identifies the [IsSourceGrouped](collectionviewsource_issourcegrouped.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.collectionviewsource.issourcegroupedproperty
     * @type {DependencyProperty} 
     */
    static IsSourceGroupedProperty {
        get => CollectionViewSource.get_IsSourceGroupedProperty()
    }

    /**
     * Identifies the [ItemsPath](collectionviewsource_itemspath.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.collectionviewsource.itemspathproperty
     * @type {DependencyProperty} 
     */
    static ItemsPathProperty {
        get => CollectionViewSource.get_ItemsPathProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SourceProperty() {
        if (!CollectionViewSource.HasProp("__ICollectionViewSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.CollectionViewSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICollectionViewSourceStatics.IID)
            CollectionViewSource.__ICollectionViewSourceStatics := ICollectionViewSourceStatics(factoryPtr)
        }

        return CollectionViewSource.__ICollectionViewSourceStatics.get_SourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ViewProperty() {
        if (!CollectionViewSource.HasProp("__ICollectionViewSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.CollectionViewSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICollectionViewSourceStatics.IID)
            CollectionViewSource.__ICollectionViewSourceStatics := ICollectionViewSourceStatics(factoryPtr)
        }

        return CollectionViewSource.__ICollectionViewSourceStatics.get_ViewProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSourceGroupedProperty() {
        if (!CollectionViewSource.HasProp("__ICollectionViewSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.CollectionViewSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICollectionViewSourceStatics.IID)
            CollectionViewSource.__ICollectionViewSourceStatics := ICollectionViewSourceStatics(factoryPtr)
        }

        return CollectionViewSource.__ICollectionViewSourceStatics.get_IsSourceGroupedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemsPathProperty() {
        if (!CollectionViewSource.HasProp("__ICollectionViewSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.CollectionViewSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICollectionViewSourceStatics.IID)
            CollectionViewSource.__ICollectionViewSourceStatics := ICollectionViewSourceStatics(factoryPtr)
        }

        return CollectionViewSource.__ICollectionViewSourceStatics.get_ItemsPathProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the collection object from which to create this view.
     * @remarks
     * When you set this property, a view is generated automatically unless the source collection implements [ICollectionViewFactory](icollectionviewfactory.md). Otherwise, the view is retrieved through the [CreateView](icollectionviewfactory_createview_164792513.md) method. You can retrieve the view through the [View](collectionviewsource_view.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.collectionviewsource.source
     * @type {IInspectable} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets the view object that is currently associated with this instance of [CollectionViewSource](collectionviewsource.md).
     * @remarks
     * This property is initialized when you set the [Source](collectionviewsource_source.md) property. At that time, a view is generated automatically unless the source collection implements [ICollectionViewFactory](icollectionviewfactory.md). Otherwise, the view is retrieved through the [CreateView](icollectionviewfactory_createview_164792513.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.collectionviewsource.view
     * @type {ICollectionView} 
     */
    View {
        get => this.get_View()
    }

    /**
     * Gets or sets a value that indicates whether source data is grouped.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.collectionviewsource.issourcegrouped
     * @type {Boolean} 
     */
    IsSourceGrouped {
        get => this.get_IsSourceGrouped()
        set => this.put_IsSourceGrouped(value)
    }

    /**
     * Gets or sets the property path to follow from the top level item to find groups within the [CollectionViewSource](collectionviewsource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.collectionviewsource.itemspath
     * @type {PropertyPath} 
     */
    ItemsPath {
        get => this.get_ItemsPath()
        set => this.put_ItemsPath(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [CollectionViewSource](collectionviewsource.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.CollectionViewSource")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Source() {
        if (!this.HasProp("__ICollectionViewSource")) {
            if ((queryResult := this.QueryInterface(ICollectionViewSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICollectionViewSource := ICollectionViewSource(outPtr)
        }

        return this.__ICollectionViewSource.get_Source()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__ICollectionViewSource")) {
            if ((queryResult := this.QueryInterface(ICollectionViewSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICollectionViewSource := ICollectionViewSource(outPtr)
        }

        return this.__ICollectionViewSource.put_Source(value)
    }

    /**
     * 
     * @returns {ICollectionView} 
     */
    get_View() {
        if (!this.HasProp("__ICollectionViewSource")) {
            if ((queryResult := this.QueryInterface(ICollectionViewSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICollectionViewSource := ICollectionViewSource(outPtr)
        }

        return this.__ICollectionViewSource.get_View()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSourceGrouped() {
        if (!this.HasProp("__ICollectionViewSource")) {
            if ((queryResult := this.QueryInterface(ICollectionViewSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICollectionViewSource := ICollectionViewSource(outPtr)
        }

        return this.__ICollectionViewSource.get_IsSourceGrouped()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSourceGrouped(value) {
        if (!this.HasProp("__ICollectionViewSource")) {
            if ((queryResult := this.QueryInterface(ICollectionViewSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICollectionViewSource := ICollectionViewSource(outPtr)
        }

        return this.__ICollectionViewSource.put_IsSourceGrouped(value)
    }

    /**
     * 
     * @returns {PropertyPath} 
     */
    get_ItemsPath() {
        if (!this.HasProp("__ICollectionViewSource")) {
            if ((queryResult := this.QueryInterface(ICollectionViewSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICollectionViewSource := ICollectionViewSource(outPtr)
        }

        return this.__ICollectionViewSource.get_ItemsPath()
    }

    /**
     * 
     * @param {PropertyPath} value 
     * @returns {HRESULT} 
     */
    put_ItemsPath(value) {
        if (!this.HasProp("__ICollectionViewSource")) {
            if ((queryResult := this.QueryInterface(ICollectionViewSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICollectionViewSource := ICollectionViewSource(outPtr)
        }

        return this.__ICollectionViewSource.put_ItemsPath(value)
    }

;@endregion Instance Methods
}
