#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\CharacterGrouping.ahk
#Include .\ICharacterGroupings.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include .\ICharacterGroupingsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the set of character groups and the functionality to get the label for any given string.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.collation.charactergroupings
 * @namespace Windows.Globalization.Collation
 * @version WindowsRuntime 1.4
 */
class CharacterGroupings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICharacterGroupings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICharacterGroupings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Create a [CharacterGroupings](charactergroupings.md) object for the collation belonging to the given language.
     * @param {HSTRING} language_ 
     * @returns {CharacterGroupings} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.collation.charactergroupings.#ctor
     */
    static Create(language_) {
        if (!CharacterGroupings.HasProp("__ICharacterGroupingsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Collation.CharacterGroupings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICharacterGroupingsFactory.IID)
            CharacterGroupings.__ICharacterGroupingsFactory := ICharacterGroupingsFactory(factoryPtr)
        }

        return CharacterGroupings.__ICharacterGroupingsFactory.Create(language_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the number of [CharacterGrouping](charactergrouping.md) objects in the set of character groups.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.collation.charactergroupings.size
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
     * Create a [CharacterGroupings](charactergroupings.md) object for the default collation.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Globalization.Collation.CharacterGroupings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Gets the label under which the provided text falls.
     * @param {HSTRING} text The string for which to get the label.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.collation.charactergroupings.lookup
     */
    Lookup(text) {
        if (!this.HasProp("__ICharacterGroupings")) {
            if ((queryResult := this.QueryInterface(ICharacterGroupings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICharacterGroupings := ICharacterGroupings(outPtr)
        }

        return this.__ICharacterGroupings.Lookup(text)
    }

    /**
     * Returns the [CharacterGrouping](charactergrouping.md) at the specified index in the set of character groups.
     * @param {Integer} index The zero-based index of the [CharacterGrouping](charactergrouping.md) in the set to return.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.collation.charactergroupings.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{f7cf5a4a-2b7a-5bc9-a0c4-9dce07ff61c9}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(CharacterGrouping, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{f7cf5a4a-2b7a-5bc9-a0c4-9dce07ff61c9}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(CharacterGrouping, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Returns the index of a specified [CharacterGrouping](charactergrouping.md) object in the set of character groups.
     * @param {Generic} value The [CharacterGrouping](charactergrouping.md) object to find in the set.
     * @param {Pointer<UInt32>} index The zero-based index of the [CharacterGrouping](charactergrouping.md) object, if found. The method returns zero if the object is not found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.collation.charactergroupings.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{f7cf5a4a-2b7a-5bc9-a0c4-9dce07ff61c9}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(CharacterGrouping, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Returns the [CharacterGrouping](charactergrouping.md) objects that start at the specified index in the set of character groups.
     * @param {Integer} startIndex The zero-based index of the start of the [CharacterGrouping](charactergrouping.md) objects in the set to return.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The [CharacterGrouping](charactergrouping.md) objects in the set that start at *startIndex*.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.collation.charactergroupings.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{f7cf5a4a-2b7a-5bc9-a0c4-9dce07ff61c9}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(CharacterGrouping, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Returns an iterator to enumerate the items in the set of character groups.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.collation.charactergroupings.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{82e3abf0-06e3-5609-ba39-c51eb2f5fae6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(CharacterGrouping, outPtr)
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
