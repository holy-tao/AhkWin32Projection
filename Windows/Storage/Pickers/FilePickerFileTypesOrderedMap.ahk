#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\Collections\IKeyValuePair.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of display names mapped to the associated file types (extensions). Each element in this collection maps a display name to a corresponding collection of file name extensions. The key is a single string, the value is a list/vector of strings representing one or more extension choices.
 * @remarks
 * Instances of the FilePickerFileTypesOrderedMap class supply the value for the [FileSavePicker.FileTypeChoices](filesavepicker_filetypechoices.md) property. By strict typing, the [FileTypeChoices](filesavepicker_filetypechoices.md) property takes a generic map where the value is a generic vector of strings. But the FilePickerFileTypesOrderedMap class implements this combination of interfaces as a concrete class, so you should always use an FilePickerFileTypesOrderedMap object for a [FileTypeChoices](filesavepicker_filetypechoices.md) value.
 * 
 * The key for an entry in a FilePickerFileTypesOrderedMap is a string that represents a friendly-name/displayname classification of what a file type is intended for. For example, "Plain Text" is an appropriate key for a FilePickerFileTypesOrderedMap where one of the associated file type extensions is ".txt".One display name as a classification of file types might have multiple file types that support it. For example, a display name of "HTML page" could be saved either with ".htm" or ".html" extension. That is why the value of each entry in a FilePickerFileTypesOrderedMap is an ordered list (vector) of strings, displayed in the UI in the order that you place the extensions in the vector.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerfiletypesorderedmap
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class FilePickerFileTypesOrderedMap extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMap

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMap.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of items in the mapped collection of display names and associated file types.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerfiletypesorderedmap.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[key] {
        get => this.Lookup(key)
        set => this.Insert(key, value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns the item at the specified key in the mapped collection of display names and associated file types.
     * @param {Generic} key The key to use to locate the item.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerfiletypesorderedmap.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{e475ca9d-6afb-5992-993e-53e6ef7a9ecd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), outPtr)
        }

        return this.__IMap.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{e475ca9d-6afb-5992-993e-53e6ef7a9ecd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), outPtr)
        }

        return this.__IMap.get_Size()
    }

    /**
     * Determines whether the mapped collection of display names and associated file types contains the specified key.
     * @param {Generic} key The key.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerfiletypesorderedmap.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{e475ca9d-6afb-5992-993e-53e6ef7a9ecd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), outPtr)
        }

        return this.__IMap.HasKey(key)
    }

    /**
     * Returns an immutable view of the collection of display names and associated file types.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerfiletypesorderedmap.getview
     */
    GetView() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{e475ca9d-6afb-5992-993e-53e6ef7a9ecd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), outPtr)
        }

        return this.__IMap.GetView()
    }

    /**
     * Inserts or replaces an item in the mapped collection of display names and associated file types.
     * @param {Generic} key The key associated with the item to insert.
     * @param {Generic} value The item to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerfiletypesorderedmap.insert
     */
    Insert(key, value) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{e475ca9d-6afb-5992-993e-53e6ef7a9ecd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), outPtr)
        }

        return this.__IMap.Insert(key, value)
    }

    /**
     * Removes an item from the mapped collection of display names and associated file types.
     * @remarks
     * For the C# and Microsoft Visual Basic version of the **Remove(String)** method, see [Remove](/uwp/api/windows.storage.pickers.filepickerfiletypesorderedmap.remove).
     * @param {Generic} key The key associated with the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerfiletypesorderedmap.remove
     */
    Remove(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{e475ca9d-6afb-5992-993e-53e6ef7a9ecd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), outPtr)
        }

        return this.__IMap.Remove(key)
    }

    /**
     * Removes all display names and associated file name extensions from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerfiletypesorderedmap.clear
     */
    Clear() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{e475ca9d-6afb-5992-993e-53e6ef7a9ecd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), outPtr)
        }

        return this.__IMap.Clear()
    }

    /**
     * Retrieves an iterator that iterates through the display names and associated file types in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filepickerfiletypesorderedmap.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{4fed2669-d0d3-59f6-91d9-95902d728d6a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr }))), outPtr)
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
