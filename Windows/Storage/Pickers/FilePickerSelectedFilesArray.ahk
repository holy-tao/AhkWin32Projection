#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\StorageFile.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of storage files that the user has selected by using a file picker.
 * @remarks
 * When a call to the [fileOpenPicker.pickMultipleFilesAsync](fileopenpicker_pickmultiplefilesasync_1324933367.md) method completes successfully, it returns a filePickerSelectedFilesArray object that contains all the files that were picked by the user. Picked files in this array are represented by [storageFile](../windows.storage/storagefile.md) objects.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerselectedfilesarray
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class FilePickerSelectedFilesArray extends IInspectable {
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
     * Gets the number of [StorageFile](../windows.storage/storagefile.md) objects in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerselectedfilesarray.size
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
     * Returns the [StorageFile](../windows.storage/storagefile.md) object at the specified index in the collection.
     * @param {Integer} index The zero-based index of the object to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerselectedfilesarray.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{80646519-5e2a-595d-a8cd-2a24b4067f1b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(StorageFile, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{80646519-5e2a-595d-a8cd-2a24b4067f1b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(StorageFile, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Retrieves the index of a specified [StorageFile](../windows.storage/storagefile.md) object in the collection.
     * @param {Generic} value The object to find in the collection.
     * @param {Pointer<UInt32>} index The zero-based index of the object if found. Zero is returned if the object is not found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerselectedfilesarray.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{80646519-5e2a-595d-a8cd-2a24b4067f1b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(StorageFile, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Retrieves the [StorageFile](../windows.storage/storagefile.md) objects that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the objects in the collection to return.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The items in the collection that start at *startIndex*.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerselectedfilesarray.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{80646519-5e2a-595d-a8cd-2a24b4067f1b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(StorageFile, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Retrieves an iterator that iterates through the collection of [StorageFile](../windows.storage/storagefile.md) objects that represent selected files.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerselectedfilesarray.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{9ac00304-83ea-5688-87b6-ae38aab65d0b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(StorageFile, outPtr)
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
