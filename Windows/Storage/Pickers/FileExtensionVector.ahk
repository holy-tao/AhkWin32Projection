#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a random-access collection of file name extensions.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class FileExtensionVector extends IInspectable {
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
     * Gets the number of file name extensions in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.size
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
     * Retrieves the file name extension at the specified index in the collection.
     * @param {Integer} index The zero-based index of the file name extension to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Retrieves an immutable view of the collection of file name extensions.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of a specified file name extension in the collection.
     * @param {Generic} value The file name extension to find in the collection.
     * @param {Pointer<UInt32>} index The zero-based index of the file name extension if found. This parameter is set to zero if the file name extension is not found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the file name extension at the specified index of the collection.
     * @param {Integer} index The zero-based index of the location at which to set the file name extension.
     * @param {Generic} value The file name extension.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts a file name extension into a collection at a specified index.
     * @param {Integer} index Zero-based index of the location at which to insert the file name extension.
     * @param {Generic} value The file name extension to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the file name extension at the specified index in the collection.
     * @param {Integer} index The zero-based index of the file name extension to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Appends a file name extension to the end of the collection.
     * @param {Generic} value The file name extension to append.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last file name extension from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all file name extensions from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves the file name extensions that start at the specified index in the collection.
     * @param {Integer} startIndex The zero-based index of the start of the file name extensions in the collection to retrieve.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The file name extensions in the collection that start at *startIndex*.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Replaces all file name extensions in the collection with the specified file name extensions.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The collection of file name extensions to put in the vector.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{98b9acc1-4b56-532e-ac73-03d5291cca90}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Retrieves an iterator that iterates through the file name extensions in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileextensionvector.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{e2fcc7c1-3bfc-5a0b-b2b0-72e769d1cb7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable((ptr) => HSTRING({ Value: ptr }), outPtr)
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
