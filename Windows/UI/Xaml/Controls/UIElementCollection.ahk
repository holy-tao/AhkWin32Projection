#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\UIElement.ahk
#Include .\IUIElementCollection.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an ordered collection of [UIElement](../windows.ui.xaml/uielement.md) objects.
 * @remarks
 * A UIElementCollection is the type of object that you get from the [Children](panel_children.md) property of a [Panel](panel.md). For example, if you get a value from Grid.Children, that value is a UIElementCollection instance. All the properties that use a UIElementCollection in the Windows Runtime  API are read-only properties, where the property is initialized with zero items when an object is first instantiated. But you can then add, remove or query items in the collection at run time, using the UIElementCollection properties and methods.
 * 
 * The type of the items in the UIElementCollection is constrained as [UIElement](../windows.ui.xaml/uielement.md). But [UIElement](../windows.ui.xaml/uielement.md) is a base element class in Windows Runtime using XAML, so there are hundreds of element types that can be treated as a [UIElement](../windows.ui.xaml/uielement.md) and can thus be one of the items in a UIElementCollection.
 * 
 * 
 * 
 * 
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class UIElementCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUIElementCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUIElementCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the size (count) of the collection.
     * @remarks
     * The Size value returns the true number of items. API that use the index, such as [GetAt](uielementcollection_getat_496709656.md), use a zero-based index, so you would subtract one from Size in order to specify that you want the last item in the collection.
     * 
     * If you are programming using C# or Microsoft Visual Basic, see [Count](/dotnet/api/system.collections.generic.icollection-1.count?view=dotnet-uwp-10.0&preserve-view=true).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.size
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
     * Moves the item at the specified index to a new location in the collection.
     * @remarks
     * Calling this method offers advantages over removing an item and adding it to a new location. Specifically, not as much tree rebuilding is required internally, and panels or controls that use [UIElementCollection](uielementcollection.md) for items can be more responsive.
     * 
     * An example of a scenario where using Move may be useful is if you have a collection view or a specialized panel that supports a user experience where items wrap around. In this case you might want to move an item from the start of the collection to the end or vice versa, without forcing the entire visual tree under the panel or view to be rebuilt.
     * @param {Integer} oldIndex The zero-based index specifying the location of the item to be moved.
     * @param {Integer} newIndex The zero-based index specifying the new location of the item.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.move
     */
    Move(oldIndex, newIndex) {
        if (!this.HasProp("__IUIElementCollection")) {
            if ((queryResult := this.QueryInterface(IUIElementCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElementCollection := IUIElementCollection(outPtr)
        }

        return this.__IUIElementCollection.Move(oldIndex, newIndex)
    }

    /**
     * Returns the item located at the specified index.
     * @remarks
     * If you are programming using C# or Microsoft Visual Basic, see [Item (indexer)](/office/vba/Language/Reference/User-Interface-Help/item-method-visual-basic-for-applications).
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets an immutable view into the collection.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of the specified item.
     * @remarks
     * If you are programming using C# or Microsoft Visual Basic, see [IndexOf](/dotnet/api/system.collections.generic.ilist-1.indexof?view=dotnet-uwp-10.0&preserve-view=true).
     * @param {Generic} value The value to find in the collection.
     * @param {Pointer<UInt32>} index The index of the item to find, if found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the value at the specified index to the [UIElement](../windows.ui.xaml/uielement.md) value specified.
     * @remarks
     * If you are programming using C# or Microsoft Visual Basic, see [Item (indexer)](/office/vba/Language/Reference/User-Interface-Help/item-method-visual-basic-for-applications).
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts the specified item at the specified index.
     * @remarks
     * InsertAt expands the collection and moves all subsequent index items by one. In contrast, [SetAt](uielementcollection_setat_941845868.md) replaces the item at the index, and the collection count remains the same.
     * 
     * If you are programming using C# or Microsoft Visual Basic, see [Insert](/dotnet/csharp/programming-guide/indexers).
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the item at the specified index.
     * @remarks
     * If successful, calling this method reduces the collection size by one. Items with index values greater than the called index have their index values reduced by one.
     * 
     * If you are programming using C# or Microsoft Visual Basic, see [RemoveAt](/uwp/api/windows.ui.xaml.controls.uielementcollection.removeat). The behavior of each language's **RemoveAt** is basically the same.
     * @param {Integer} index The index position of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the collection.
     * @remarks
     * Append adds the item to the end of the collection. If you want to insert an item into the beginning or middle of a collection, use [InsertAt](uielementcollection_insertat_1232866588.md).
     * 
     * > [!IMPORTANT]
     * > If you are programming in C# or Microsoft Visual Basic, don't use this method; use the .NET [Add](/dotnet/api/system.collections.generic.icollection-1.add?view=dotnet-uwp-10.0&preserve-view=true) method instead. The `System.Linq.Enumerable.Append<>` method may appear in IntelliSense, but this method is not supported for XAML and will not have any effect.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the collection.
     * @remarks
     * If successful, calling this method reduces the collection size by one.
     * 
     * If you are programming using C# or Microsoft Visual Basic, see [RemoveAt](/uwp/api/windows.ui.xaml.controls.uielementcollection.removeat) (pass an *index* value of [Count](/dotnet/api/system.collections.generic.icollection-1.count?view=dotnet-uwp-10.0&preserve-view=true) minus one).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * @remarks
     * The Clear method can be used when programming in C#, Microsoft Visual Basic or Visual C++ component extensions (C++/CX). The method signature is the same in each of these languages, and the behavior is the same.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves multiple elements in a single pass through the iterator.
     * @remarks
     * If you are programming using C# or Microsoft Visual Basic, see [CopyTo](/dotnet/api/system.collections.generic.icollection-1.copyto?view=dotnet-uwp-10.0&preserve-view=true).
     * @param {Integer} startIndex The index from which to start retrieval.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Provides the destination for the result. Size the initial array size as a "capacity" in order to specify how many results should be retrieved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Initially clears the collection, then inserts the provided array as new items.
     * @remarks
     * For implementations that track a "changed" event, the initial reset fires an event, but the items added do not fire discrete per-item events.
     * 
     * If you are programming using C# or Microsoft Visual Basic, there is no single-call equivalent to ReplaceAll. Use [Clear](uielementcollection_clear_556466.md) and then successive calls to [Add](/dotnet/api/system.collections.generic.icollection-1.add?view=dotnet-uwp-10.0&preserve-view=true).
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{b4c1e3ac-8768-5b9d-a661-f63330b8507b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(UIElement, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns the iterator object that can iterate over the items in the [UIElementCollection](uielementcollection.md).
     * @remarks
     * A convenient way to hold the iterator returned by First is to assign the return value to a variable that is declared with the **auto** type deduction keyword. Then use [IIterator](../windows.foundation.collections/iiterator_1.md)  API as part of a **while** loop. For example:
     * 
     * ```cppwinrt
     * auto iterator1{ uieCollection.First() };
     * while (iterator1.HasCurrent())
     * {
     *     Windows::UI::Xaml::UIElement currentItem{ iterator1.Current() };
     *     // Your logic here that does something with currentItem.
     *     iterator1.MoveNext();
     * }
     * ```
     * 
     * ```cppcx
     * auto iterator1 = uieCollection->First();
     * while (iterator1->HasCurrent)
     * {
     *     auto currentItem = iterator1->Current;
     *     //your logic here that does something with currentItem
     *     iterator1->MoveNext();
     * }
     * ```
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.uielementcollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{42e26ae1-d357-57e8-bb48-f75c9ff69d91}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(UIElement, outPtr)
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
