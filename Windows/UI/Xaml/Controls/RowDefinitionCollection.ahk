#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\RowDefinition.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides access to an ordered, strongly typed collection of [RowDefinition](rowdefinition.md) objects.
 * @remarks
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RowDefinitionCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVector.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the size (count) of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.size
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
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns the [RowDefinition](rowdefinition.md) located at the specified index.
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets an immutable view into the collection.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of the specified item.
     * @param {Generic} value The value to find in the collection.
     * @param {Pointer<UInt32>} index The index of the item to find, if found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the value at the specified index to the [RowDefinition](rowdefinition.md) value specified.
     * @remarks
     * [InsertAt](rowdefinitioncollection_insertat_1515930834.md) expands the collection and moves all subsequent index items by one. In contrast, SetAt replaces the item at the index, and the collection count remains the same.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts the specified item at the specified index.
     * @remarks
     * InsertAt expands the collection and moves all subsequent index items by one. In contrast, [SetAt](rowdefinitioncollection_setat_721691810.md) replaces the item at the index, and the collection count remains the same.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the item at the specified index.
     * @remarks
     * If successful, calling this method reduces the collection size by one. Items with index values greater than the called index have their index values reduced by one.
     * @param {Integer} index The index position of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the collection.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the collection.
     * @remarks
     * If successful, calling this method reduces the collection size by one.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves multiple elements in a single pass through the iterator.
     * @param {Integer} startIndex The index from which to start retrieval.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Provides the destination for the result. Size the initial array size as a "capacity" in order to specify how many results should be retrieved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Initially clears the collection, then inserts the provided array as new items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{62225981-7a0d-5d38-8088-7c6bb6d959be}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(RowDefinition, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns the iterator for iteration over the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinitioncollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{abef522a-7378-504f-9406-97d9f42643a7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(RowDefinition, outPtr)
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
