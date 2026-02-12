#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\WindowTab.ahk
#Include .\IWindowTabCollection.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an ordered collection of [WindowTab](windowtab.md) values.
 * @remarks
 * > [!IMPORTANT]
 * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class WindowTabCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowTabCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowTabCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the size (count) of the collection.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.size
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
     * Moves the specified window tab to a new location in the collection.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @param {WindowTab} tab The window tab to move.
     * @param {Integer} index The zero-based index that specifies the new location of the item.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.movetab
     */
    MoveTab(tab, index) {
        if (!this.HasProp("__IWindowTabCollection")) {
            if ((queryResult := this.QueryInterface(IWindowTabCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabCollection := IWindowTabCollection(outPtr)
        }

        return this.__IWindowTabCollection.MoveTab(tab, index)
    }

    /**
     * Returns the item located at the specified index.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets an immutable view into the collection.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of the specified item.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @param {Generic} value The value to find in the collection.
     * @param {Pointer<UInt32>} index The index of the item to find, if found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the value at the specified index to the specified `WindowTab` value.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * [InsertAt](windowtabcollection_insertat_1626840122.md) expands the collection and moves all subsequent index items by one.
     * 
     * In contrast, `SetAt` replaces the item at the index, and the collection count remains the same.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts the specified item at the specified index.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * `InsertAt` expands the collection and moves all subsequent index items by one.
     * 
     * In contrast, [SetAt](windowtabcollection_setat_296287306.md) replaces the item at the index, and the collection count remains the same.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the item at the specified index.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * If successful, calling this method reduces the collection size by one. Items with index values greater than the called index have their index values reduced by one.
     * @param {Integer} index The index position of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the end of the collection.
     * @param {Generic} value > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * 
     * The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the collection.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * If successful, calling this method reduces the collection size by one.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves multiple elements in a single pass through the iterator.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @param {Integer} startIndex The index from which to start retrieval.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Provides the destination for the result. Size the initial array size as a "capacity" in order to specify how many results should be retrieved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Initially clears the collection, then inserts the provided array as new items.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d2ee7da1-079a-5571-ac1e-e0761baa92e7}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(WindowTab, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns an iterator for the items in the collection.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabcollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{cf5a6d72-cc50-51b6-b34d-fdd7e59d33eb}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(WindowTab, outPtr)
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
