#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IObservableVector.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include .\IDependencyObjectCollectionFactory.ahk
#Include ..\..\Foundation\Collections\VectorChangedEventHandler.ahk
#Include ..\..\Foundation\Collections\IObservableVector.ahk
#Include ..\..\Foundation\Collections\IVectorChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Implements a practical collection class that can contain [DependencyObject](dependencyobject.md) items.
 * @remarks
 * The purpose of the DependencyObjectCollection class is mainly to support the tooling and portability of behaviors. Behaviors are a technique for defining certain basic interactions of a UI element entirely in XAML, without requiring an event handler and code-behind.
 * 
 * If you're interested in implementing a business object class that supports collection-changed notifications you should use **ObservableCollection** or one of the interface patterns that supports changed events. For more info see [Data binding in depth](/windows/uwp/data-binding/data-binding-in-depth).
 * 
 * 
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DependencyObjectCollection extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IObservableVector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IObservableVector.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyObjectCollection} 
     */
    static CreateInstance() {
        if (!DependencyObjectCollection.HasProp("__IDependencyObjectCollectionFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DependencyObjectCollection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDependencyObjectCollectionFactory.IID)
            DependencyObjectCollection.__IDependencyObjectCollectionFactory := IDependencyObjectCollectionFactory(factoryPtr)
        }

        return DependencyObjectCollection.__IDependencyObjectCollectionFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the size (count) of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }

    /**
     * Occurs when the contents of the collection changes.
     * @remarks
     * This event is named **VectorChanged** for all languages, but for C# and Microsoft Visual Basic the implemented collection type is [IList<T>](/dotnet/api/system.collections.generic.ilist-1?view=dotnet-uwp-10.0&preserve-view=true).
     * 
     * The type of change that was applied to the collection is communicated as a [CollectionChange](../windows.foundation.collections/collectionchange.md) value in the event data, with a collection index for where in the collection the change occurred. Because it reports per-index, multiple **VectorChanged** events can originate from the same collection at the same time.
     * @type {VectorChangedEventHandler<DependencyObject>}
    */
    OnVectorChanged {
        get {
            if(!this.HasProp("__OnVectorChanged")){
                this.__OnVectorChanged := WinRTEventHandler(
                    VectorChangedEventHandler,
                    Guid("{b62dec93-a7a5-5ff5-b2d2-6bd20ca0bd4d}"),
                    IObservableVector.Call.Bind(IObservableVector, DependencyObject),
                    IVectorChangedEventArgs
                )
                this.__OnVectorChangedToken := this.add_VectorChanged(this.__OnVectorChanged.iface)
            }
            return this.__OnVectorChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnVectorChangedToken")) {
            this.remove_VectorChanged(this.__OnVectorChangedToken)
            this.__OnVectorChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {VectorChangedEventHandler<Generic>} vhnd 
     * @returns {EventRegistrationToken} 
     */
    add_VectorChanged(vhnd) {
        if (!this.HasProp("__IObservableVector")) {
            piid := Guid("{fac6f4d2-96fd-5ceb-80bf-46ac6529fc65}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObservableVector := IObservableVector(DependencyObject, outPtr)
        }

        return this.__IObservableVector.add_VectorChanged(vhnd)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VectorChanged(token) {
        if (!this.HasProp("__IObservableVector")) {
            piid := Guid("{fac6f4d2-96fd-5ceb-80bf-46ac6529fc65}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObservableVector := IObservableVector(DependencyObject, outPtr)
        }

        return this.__IObservableVector.remove_VectorChanged(token)
    }

    /**
     * Returns the [DependencyObject](dependencyobject.md) located at the specified index.
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets an immutable view into the collection.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of the specified item.
     * @param {Generic} value The value to find in the collection.
     * @param {Pointer<UInt32>} index The index of the item to find, if found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the value at the specified index to the [DependencyObject](dependencyobject.md) value specified.
     * @remarks
     * [InsertAt](dependencyobjectcollection_insertat_1364321154.md) expands the collection and moves all subsequent index items by one. In contrast, SetAt replaces the item at the index, and the collection count remains the same.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts the specified item at the specified index.
     * @remarks
     * InsertAt expands the collection and moves all subsequent index items by one. In contrast, [SetAt](dependencyobjectcollection_setat_537822194.md) replaces the item at the index, and the collection count remains the same.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the item at the specified index.
     * @remarks
     * If successful, calling this method reduces the collection size by one. Items with index values greater than the called index have their index values reduced by one.
     * @param {Integer} index The index position of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the collection.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the collection.
     * @remarks
     * If successful, calling this method reduces the collection size by one.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves multiple elements in a single pass through the iterator.
     * @param {Integer} startIndex The index from which to start retrieval.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Provides the destination for the result. Size the initial array size as a *capacity* in order to specify how many results should be retrieved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Initially clears the collection, then inserts the provided array as new items.
     * @remarks
     * For implementations that track a *changed* event, which this collection does do with **VectorChanged**, the initial reset fires an event, but the items added do not fire discrete per-item events.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{771b857e-ab5c-5db8-a021-397c92cdc44c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(DependencyObject, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns the iterator for iteration over the items in the collection.
     * @remarks
     * <!--Begin NET note for IEnumerable support-->
     * You can iterate through a [DependencyObjectCollection](dependencyobjectcollection.md) in C# or Microsoft Visual Basic. In many cases, such as using **foreach** syntax, the compiler does this casting for you and you won't need to cast to `IEnumerable<DependencyObject>` explicitly. If you do need to cast explicitly, for example if you want to call [GetEnumerator](/dotnet/api/system.collections.ienumerable.getenumerator?view=dotnet-uwp-10.0&preserve-view=true), cast to [IEnumerable<T>](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true) with a [DependencyObject](dependencyobject.md) constraint.
     * 
     * 
     * <!--End NET note for IEnumerable support-->
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobjectcollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{f66c6bd3-55b4-5bbb-b82a-6d9ce383091a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(DependencyObject, outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
