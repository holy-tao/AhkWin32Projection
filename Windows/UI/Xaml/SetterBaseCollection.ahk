#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\SetterBase.ahk
#Include .\ISetterBaseCollection.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of objects that inherit from [SetterBase](setterbase.md).
 * @remarks
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class SetterBaseCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISetterBaseCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISetterBaseCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the collection is in a read-only state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.issealed
     * @type {Boolean} 
     */
    IsSealed {
        get => this.get_IsSealed()
    }

    /**
     * Gets the size (count) of the collection.
     * @remarks
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is [Count](/dotnet/api/system.collections.objectmodel.collection-1.count).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SetterBaseCollection](setterbasecollection.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.SetterBaseCollection")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSealed() {
        if (!this.HasProp("__ISetterBaseCollection")) {
            if ((queryResult := this.QueryInterface(ISetterBaseCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetterBaseCollection := ISetterBaseCollection(outPtr)
        }

        return this.__ISetterBaseCollection.get_IsSealed()
    }

    /**
     * Returns the [SetterBase](setterbase.md) located at the specified index.
     * @remarks
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is [Item](/dotnet/api/system.collections.objectmodel.collection-1.item) (the indexer).
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets an immutable view into the collection.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of the specified item.
     * @remarks
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is [IndexOf](/dotnet/api/system.collections.objectmodel.collection-1.indexof).
     * @param {Generic} value The value to find in the collection.
     * @param {Pointer<UInt32>} index The index of the item to find, if found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the value at the specified index to the [SetterBase](setterbase.md) value specified.
     * @remarks
     * [InsertAt](setterbasecollection_insertat_634140918.md) expands the collection and moves all subsequent index items by one. In contrast, SetAt replaces the item at the index, and the collection count remains the same.
     * 
     * 
     * 
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is [Item](/dotnet/api/system.collections.objectmodel.collection-1.item) (the indexer).
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts the specified item at the specified index.
     * @remarks
     * InsertAt expands the collection and moves all subsequent index items by one. In contrast, [SetAt](setterbasecollection_setat_1418942598.md) replaces the item at the index, and the collection count remains the same.
     * 
     * 
     * 
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is [Insert](/dotnet/api/system.collections.objectmodel.collection-1.insert).
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the item at the specified index.
     * @remarks
     * If successful, calling this method reduces the collection size by one. Items with index values greater than the called index have their index values reduced by one.
     * 
     * 
     * 
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is [RemoveAt](/dotnet/api/system.collections.objectmodel.collection-1.removeat).
     * @param {Integer} index The index position of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the collection.
     * @remarks
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is [Add](/dotnet/api/system.collections.objectmodel.collection-1.add).
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the collection.
     * @remarks
     * If successful, calling this method reduces the collection size by one.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves multiple elements in a single pass through the iterator.
     * @remarks
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is [CopyTo](/dotnet/api/system.collections.objectmodel.collection-1.copyto).
     * @param {Integer} startIndex The index from which to start retrieval.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Provides the destination for the result. Size the initial array size as a *capacity* in order to specify how many results should be retrieved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Initially clears the collection, then inserts the provided array as new items.
     * @remarks
     * For implementations that track a *changed* event, the initial reset fires an event, but the items added do not fire discrete per-item events.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{bd55a7fd-7501-5519-9ffb-d0074240db61}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SetterBase, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns the iterator for iteration over the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbasecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{aafe70cb-90a8-5719-bd3e-f0b066ed1626}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(SetterBase, outPtr)
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
