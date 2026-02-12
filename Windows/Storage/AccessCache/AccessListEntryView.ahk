#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\AccessListEntry.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * A list of the entries that are in your app's most recently used list (MRU) (obtained from the static [StorageApplicationPermissions.MostRecentlyUsedList](storageapplicationpermissions_mostrecentlyusedlist.md) property) and in your app's future-access list (obtained from the static [StorageApplicationPermissions.FutureAccessList](storageapplicationpermissions_futureaccesslist.md) property).
 * @remarks
 * To see more code examples that use this class, see the [File access sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/FileAccess).
 * 
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.accesslistentryview
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class AccessListEntryView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVectorView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVectorView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of storage items in the access list or most recently used (MRU) list.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.accesslistentryview.size
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
     * Retrieves the storage item at the specified index in the access list or most recently used (MRU) list.
     * @param {Integer} index The 
     * 
     * zero-based index of the storage item to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.accesslistentryview.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{42b49b8a-3014-5d27-8f2c-1ef5ee89ec00}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView((ptr) => IPropertyValue(ptr).GetAccessListEntry(), outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{42b49b8a-3014-5d27-8f2c-1ef5ee89ec00}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView((ptr) => IPropertyValue(ptr).GetAccessListEntry(), outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Retrieves the index of the specified storage item in the access list or most recently used (MRU) list.
     * @param {Generic} value The storage item.
     * @param {Pointer<UInt32>} index The zero-based index of the storage item.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.accesslistentryview.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{42b49b8a-3014-5d27-8f2c-1ef5ee89ec00}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView((ptr) => IPropertyValue(ptr).GetAccessListEntry(), outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Retrieves the storage items that start at the specified index in the access list or most recently used (MRU) list.
     * @param {Integer} startIndex The zero-based index of the start of the items in the collection to retrieve.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The items in the collection that start at *startIndex*.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.accesslistentryview.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{42b49b8a-3014-5d27-8f2c-1ef5ee89ec00}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView((ptr) => IPropertyValue(ptr).GetAccessListEntry(), outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Retrieves the first storage item from the access list or most recently used (MRU) list.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.accesslistentryview.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{4995c2b0-736b-588d-ae42-6f69b025b388}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable((ptr) => IPropertyValue(ptr).GetAccessListEntry(), outPtr)
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
