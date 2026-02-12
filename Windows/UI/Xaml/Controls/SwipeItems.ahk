#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\SwipeItem.ahk
#Include .\ISwipeItems.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include .\ISwipeItemsFactory.ahk
#Include .\ISwipeItemsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a collection of [SwipeItem](swipeitem.md) objects.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SwipeItems extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISwipeItems

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISwipeItems.IID

    /**
     * Identifies the Mode dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.ModeProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.modeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.modeproperty
     * @type {DependencyProperty} 
     */
    static ModeProperty {
        get => SwipeItems.get_ModeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SwipeItems} 
     */
    static CreateInstance() {
        if (!SwipeItems.HasProp("__ISwipeItemsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeItems")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeItemsFactory.IID)
            SwipeItems.__ISwipeItemsFactory := ISwipeItemsFactory(factoryPtr)
        }

        return SwipeItems.__ISwipeItemsFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ModeProperty() {
        if (!SwipeItems.HasProp("__ISwipeItemsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeItems")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeItemsStatics.IID)
            SwipeItems.__ISwipeItemsStatics := ISwipeItemsStatics(factoryPtr)
        }

        return SwipeItems.__ISwipeItemsStatics.get_ModeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates the effect of a swipe interaction.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.Mode](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.mode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * Gets the size (count) of the collection.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.Size](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.size) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.size
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
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__ISwipeItems")) {
            if ((queryResult := this.QueryInterface(ISwipeItems.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItems := ISwipeItems(outPtr)
        }

        return this.__ISwipeItems.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__ISwipeItems")) {
            if ((queryResult := this.QueryInterface(ISwipeItems.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItems := ISwipeItems(outPtr)
        }

        return this.__ISwipeItems.put_Mode(value)
    }

    /**
     * Returns the item located at the specified index.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.GetAt(UInt32)](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.getat) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets an immutable view into the collection.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.GetView](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.getview) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of the specified item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.IndexOf](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.indexof) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {Generic} value The value to find in the collection.
     * @param {Pointer<UInt32>} index The index of the item to find, if found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the value at the specified index to the value specified.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.SetAt](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.setat) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts the specified item at the specified index.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.InsertAt](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.insertat) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the item at the specified index.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.RemoveAt(UInt32)](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.removeat) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {Integer} index The index position of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the collection.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.Append](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.append) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the collection.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.RemoveAtEnd](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.removeatend) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * If successful, calling this method reduces the collection size by one.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.Clear](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.clear) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves multiple elements in a single pass through the iterator.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.GetMany](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.getmany) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {Integer} startIndex The index from which to start retrieval.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Provides the destination for the result. Size the initial array size as a "capacity" in order to specify how many results should be retrieved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Initially clears the collection, then inserts the provided array as new items.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.ReplaceAll](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.replaceall) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{9339604c-f98c-5c98-9976-97de8d2b7165}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(SwipeItem, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns an iterator for the items in the collection.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItems.First](/windows/winui/api/microsoft.ui.xaml.controls.swipeitems.first) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitems.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{f6b4ddb0-8671-5376-bac4-6e16bbfb56a7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(SwipeItem, outPtr)
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
