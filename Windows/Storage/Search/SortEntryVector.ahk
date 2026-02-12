#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\SortEntry.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the sorting criteria of the query results as a collection of SortEntry objects.
 * @remarks
 * > [!NOTE]
 * > Although it's not attributed with `marshalling_behavior(agile)`, this class can be treated as agile. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * <!--W8B 988884 v2-->
 * 
 * You can retrieve this object using [QueryOptions.SortOrder](queryoptions_sortorder.md).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class SortEntryVector extends IInspectable {
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
     * Gets the number of sort entries in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.size
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
     * Retrieves the sort entry at the specified index in the collection.
     * @param {Integer} index The zero-based index of the sort entry to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Retrieves an immutable view of the collection of sort entries.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of a specified sort entry in the collection.
     * @param {Generic} value The sort entry to find in the collection.
     * @param {Pointer<UInt32>} index The zero-based index of the sort entry, if found. This parameter is set to zero if the sort entry is not found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the sort entry at the specified index of the collection.
     * @param {Integer} index The zero-based index of the location at which to set the sort entry.
     * @param {Generic} value The sort entry.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts a sort entry into the collection at a specified index.
     * @param {Integer} index The zero-based index of the location to insert the sort entry.
     * @param {Generic} value The sort entry to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the sort entry at the specified index in the collection.
     * @param {Integer} index The zero-based index of the sort entry to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Appends a sort entry to the end of the collection.
     * @param {Generic} value The sort entry to append to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last sort entry from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all sort entries from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the sort entries that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the sort entries in the collection to retrieve.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The sort entries in the collection that start at *startIndex*.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all sort entries in the collection with the specified sort entries.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The collection of sort entries to put in the vector.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{d8ea401b-47b3-5254-84f4-eea10c4cf068}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator that iterates through the sort entries in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.sortentryvector.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{35aff6f9-ef75-5280-bb84-a2bf8317cf35}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable((ptr) => IPropertyValue(ptr).GetSortEntry(), outPtr)
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
