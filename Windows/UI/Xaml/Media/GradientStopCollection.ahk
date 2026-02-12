#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\GradientStop.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a collection of [GradientStop](gradientstop.md) objects that can be individually accessed by index.
 * @remarks
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class GradientStopCollection extends IInspectable {
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.size
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
     * Initializes a new instance of the [GradientStopCollection](gradientstopcollection.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.GradientStopCollection")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Returns the item located at the specified index.
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets an immutable view into the collection.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of the specified item.
     * @param {Generic} value The value to find in the collection.
     * @param {Pointer<UInt32>} index The index of the item to find, if found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the value at the specified index to the **GradientStop** value specified.
     * @remarks
     * [InsertAt](gradientstopcollection_insertat_861089598.md) expands the collection and moves all subsequent index items by one.
     * 
     * In contrast, SetAt replaces the item at the index, and the collection count remains the same.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts the specified item at the specified index.
     * @remarks
     * InsertAt expands the collection and moves all subsequent index items by one.
     * 
     * In contrast, [SetAt](gradientstopcollection_setat_1108102990.md) replaces the item at the index, and the collection count remains the same.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the item at the specified index.
     * @remarks
     * If successful, calling this method reduces the collection size by one. Items with index values greater than the called index have their index values reduced by one.
     * @param {Integer} index The index position of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the collection.
     * @param {Generic} value The item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the collection.
     * @remarks
     * If successful, calling this method reduces the collection size by one.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves multiple elements in a single pass through the iterator.
     * @remarks
     * The GetMany method operates identically as if calling  and  for each element in the supplied array. This means that the first element returned by the GetMany method is the same element as returned by retrieving the  property prior to calling GetMany. After the GetMany call returns, the  property will retrieve the element following the last element returned by the GetMany call, or produce an error if no more elements exist in the sequences.
     * 
     * The GetMany method returns the actual number of elements returned. It must be the minimum of a) the number of elements remaining in the collection, or b) the number of elements requested, that is, "capacity". Therefore, whenever GetMany returns less than the number of elements requested, the end of the sequence has been reached. It returns the number of elements retrieved in the "actual" output parameter. When the caller specifies a capacity of 0, the position of the iterator is unchanged. Elements in the array following the values returned are unchanged.
     * @param {Integer} startIndex The index from which to start retrieval.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Provides the destination for the result. Size the initial array size as a "capacity" in order to specify how many results should be retrieved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Initially clears the collection, then inserts the provided array as new items.
     * @remarks
     * For implementations that track a "changed" event, the initial reset fires an event, but the items added do not fire discrete events.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{33422da4-24f3-5b52-9e8d-11dd71f08bb1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(GradientStop, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns an iterator for the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstopcollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{9105bb93-ac26-5bae-8c1e-df8ecf00dee6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(GradientStop, outPtr)
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
