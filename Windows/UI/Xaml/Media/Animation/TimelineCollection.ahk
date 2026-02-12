#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include .\Timeline.ahk
#Include ..\..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a collection of [Timeline](timeline.md) objects (specific type animations). A TimelineCollection is the value of the [Storyboard.Children](storyboard_children.md) property.
 * @remarks
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class TimelineCollection extends IInspectable {
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.size
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
     * Initializes a new instance of the [TimelineCollection](timelinecollection.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.TimelineCollection")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Returns the [Timeline](timeline.md) located at the specified index.
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets an immutable view into the collection.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of the specified item.
     * @param {Generic} value The value to find in the collection.
     * @param {Pointer<UInt32>} index The index of the item to find, if found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the value at the specified index to the [Timeline](timeline.md) value specified.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts the specified item at the specified index.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the item at the specified index.
     * @param {Integer} index The index position of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the collection.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves multiple elements in a single pass through the iterator.
     * @param {Integer} startIndex The index from which to start retrieval.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Provides the destination for the result. Size the initial array size as a *capacity* in order to specify how many results should be retrieved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Initially clears the collection, then inserts the provided array as new items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{2005c7f9-c7d7-521b-a81c-2c9dad77a9e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Timeline, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns the iterator for iteration over the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.timelinecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{a122a346-e6d5-5c54-857d-038e60f5d9c1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(Timeline, outPtr)
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
