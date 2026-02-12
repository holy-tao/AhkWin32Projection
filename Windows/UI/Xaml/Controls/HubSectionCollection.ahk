#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\HubSection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an ordered collection of [HubSection](hubsection.md) objects.
 * @remarks
 * <!--Hub.Sections doesn't seem to be using this type yet, so this needs to be confirmed.-->
 * A HubSectionCollection is the type of object that you get from the [Sections](hub_sections.md) property of a [Hub](hub.md). All the properties that use a HubSectionCollection in the Windows Runtime  API are read-only properties, where the property is initialized with zero items when an object is first instantiated. But you can then add, remove or query items in the collection at run time, using the HubSectionCollection properties and methods.
 * 
 * 
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class HubSectionCollection extends IInspectable {
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.size
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
     * Returns the item located at the specified index.
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets an immutable view into the collection.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of the specified item.
     * @param {Generic} value The value to find in the collection.
     * @param {Pointer<UInt32>} index The index of the item, if it is found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the item at the specified index.
     * @remarks
     * If successful, calling this method reduces the collection size by one. Items with index values greater than the called index have their index values reduced by one.
     * @param {Integer} index The index position of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the collection.
     * @remarks
     * To add an item to a position in the collection that's not at the collection end, use [InsertAt](hubsectioncollection_insertat_791846136.md).
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves multiple elements in a single pass through the iterator.
     * @param {Integer} startIndex The index from which to start retrieval.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Provides the destination for the result. Size the initial array size as a "capacity" in order to specify how many results should be retrieved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Initially clears the collection, then inserts the provided array as new items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{8e47087a-3ce3-57dc-a583-7db9bf188fc4}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(HubSection, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns the iterator for iteration over the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectioncollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{558c4082-463a-5c3d-b51e-10921b4a4d6c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(HubSection, outPtr)
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
