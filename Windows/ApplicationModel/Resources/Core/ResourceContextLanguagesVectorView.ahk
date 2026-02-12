#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a collection of [ResourceContext](resourcecontext.md) language qualifiers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontextlanguagesvectorview
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceContextLanguagesVectorView extends IInspectable {
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
     * Gets the number of [ResourceContext](resourcecontext.md) language qualifiers in the set.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontextlanguagesvectorview.size
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
     * Returns the [ResourceContext](resourcecontext.md) language qualifier at the specified index in the set.
     * @param {Integer} index The zero-based index of the [ResourceContext](resourcecontext.md) language qualifier in the set to return.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontextlanguagesvectorview.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{2f13c006-a03a-5f69-b090-75a43e33423e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{2f13c006-a03a-5f69-b090-75a43e33423e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Returns the index of a specified [ResourceContext](resourcecontext.md) language qualifier in the set.
     * @param {Generic} value The [ResourceContext](resourcecontext.md) language qualifier to find in the set.
     * @param {Pointer<UInt32>} index The zero-based index of the [ResourceContext](resourcecontext.md) language qualifier, if the item is found. The method returns zero if the item is not found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontextlanguagesvectorview.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{2f13c006-a03a-5f69-b090-75a43e33423e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Returns the [ResourceContext](resourcecontext.md) language qualifiers that start at the specified index in the set.
     * @param {Integer} startIndex The zero-based index of the start of the [ResourceContext](resourcecontext.md) language qualifiers in the set to return.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The [ResourceContext](resourcecontext.md) language qualifiers in the set that start at *startIndex*.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontextlanguagesvectorview.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{2f13c006-a03a-5f69-b090-75a43e33423e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView((ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Returns an iterator to enumerate the items in the set of [ResourceContext](resourcecontext.md) language qualifiers.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecontextlanguagesvectorview.first
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
