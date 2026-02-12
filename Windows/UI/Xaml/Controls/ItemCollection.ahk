#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IObservableVector.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\Collections\VectorChangedEventHandler.ahk
#Include ..\..\..\Foundation\Collections\IObservableVector.ahk
#Include ..\..\..\Foundation\Collections\IVectorChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Holds the list of items that represent the content of an [ItemsControl](itemscontrol.md).
 * @remarks
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ItemCollection extends IInspectable {
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

;@region Instance Properties
    /**
     * Gets the size (count) of the collection.
     * @remarks
     * When programming with .NET, this property is projected as Count.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.size
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
     * Occurs when the items list of the collection has changed, or the collection is reset.
     * @type {VectorChangedEventHandler<IInspectable>}
    */
    OnVectorChanged {
        get {
            if(!this.HasProp("__OnVectorChanged")){
                this.__OnVectorChanged := WinRTEventHandler(
                    VectorChangedEventHandler,
                    Guid("{b423a801-d35e-56b9-813b-00889536cb98}"),
                    IObservableVector.Call.Bind(IObservableVector, IInspectable),
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
            piid := Guid("{7b81c56a-0985-518d-baa9-0da9ae009f65}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObservableVector := IObservableVector(IInspectable, outPtr)
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
            piid := Guid("{7b81c56a-0985-518d-baa9-0da9ae009f65}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObservableVector := IObservableVector(IInspectable, outPtr)
        }

        return this.__IObservableVector.remove_VectorChanged(token)
    }

    /**
     * Returns the item located at the specified index.
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets an immutable view into the collection.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of the specified item.
     * @param {Generic} value The value to find in the collection.
     * @param {Pointer<UInt32>} index The index of the item, if it is found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the value at the specified index to the item value specified.
     * @remarks
     * **SetAt** replaces the item at the index, and the collection count remains the same.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts the specified item at the specified index.
     * @remarks
     * **InsertAt** expands the collection and moves all subsequent index items by one.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the item at the specified index.
     * @remarks
     * If successful, calling this method reduces the collection size by one. Items with index values greater than the called index have their index values reduced by one.
     * @param {Integer} index The index position of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the collection.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves multiple elements in a single pass through the iterator.
     * @param {Integer} startIndex The index from which to start retrieval.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Provides the destination for the result. Size the initial array size as a "capacity" in order to specify how many results should be retrieved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Initially clears the collection, then inserts the provided array as new items.
     * @remarks
     * For implementations that track a "changed" event, the initial reset fires an event, but the items added don't fire discrete per-item events.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b32bdca4-5e52-5b27-bc5d-d66a1a268c2a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(IInspectable, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns the iterator for iteration over the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemcollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{092b849b-60b1-52be-a44a-6fe8e933cbe4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IInspectable, outPtr)
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
