#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\ResourceQualifier.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * An unchangeable view into a vector of [ResourceQualifier](resourcequalifier.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifiervectorview
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceQualifierVectorView extends IInspectable {
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
     * Gets the number of [ResourceQualifier](resourcequalifier.md) objects in the view.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifiervectorview.size
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
     * Returns the [ResourceQualifier](resourcequalifier.md) at the specified index in the view.
     * @param {Integer} index The zero-based index of the [ResourceQualifier](resourcequalifier.md) in the view to return.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifiervectorview.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{b82c58dc-1cc0-53f0-b0f4-66ef39a81cd6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ResourceQualifier, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{b82c58dc-1cc0-53f0-b0f4-66ef39a81cd6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ResourceQualifier, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Returns the index of a specified [ResourceQualifier](resourcequalifier.md) in the view.
     * @param {Generic} value The [ResourceQualifier](resourcequalifier.md) to find in the set.
     * @param {Pointer<UInt32>} index The zero-based index of the object, if found. The method returns zero if the object is not found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifiervectorview.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{b82c58dc-1cc0-53f0-b0f4-66ef39a81cd6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ResourceQualifier, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Returns the [ResourceQualifier](resourcequalifier.md) objects that start at the specified index in the view.
     * @param {Integer} startIndex The zero-based index of the start of the objects in the view to return.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The objects in the view that start at *startIndex*.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifiervectorview.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{b82c58dc-1cc0-53f0-b0f4-66ef39a81cd6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ResourceQualifier, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Returns an iterator to enumerate the items in the view.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifiervectorview.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{2eee68e2-687c-5f7a-a14e-588c4d3089e1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(ResourceQualifier, outPtr)
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
