#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\ResourceCandidate.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a collection of [ResourceCandidate](resourcecandidate.md) objects.
 * @remarks
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidatevectorview
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceCandidateVectorView extends IInspectable {
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
     * Gets the number of [ResourceCandidate](resourcecandidate.md) objects in the set.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidatevectorview.size
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
     * Returns the [ResourceCandidate](resourcecandidate.md) at the specified index in the set.
     * @param {Integer} index The zero-based index of the [ResourceCandidate](resourcecandidate.md) in the set to return.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidatevectorview.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e28e92f0-9ffb-5ea7-9fc9-a73bda471886}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ResourceCandidate, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e28e92f0-9ffb-5ea7-9fc9-a73bda471886}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ResourceCandidate, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Gets the index of a specified [ResourceCandidate](resourcecandidate.md) in the set.
     * @param {Generic} value The [ResourceCandidate](resourcecandidate.md) to find in the set.
     * @param {Pointer<UInt32>} index The zero-based index of the [ResourceCandidate](resourcecandidate.md), if the item is found; zero if the item is not found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidatevectorview.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e28e92f0-9ffb-5ea7-9fc9-a73bda471886}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ResourceCandidate, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Returns the [ResourceCandidate](resourcecandidate.md) objects that start at the specified index in the set.
     * @param {Integer} startIndex The zero-based index of the start of the [ResourceCandidate](resourcecandidate.md) objects in the set to return.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The [ResourceCandidate](resourcecandidate.md) objects in the set that start at *startIndex*.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidatevectorview.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e28e92f0-9ffb-5ea7-9fc9-a73bda471886}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ResourceCandidate, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Returns an iterator to enumerate the items in the set of [ResourceCandidate](resourcecandidate.md) objects.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidatevectorview.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{d89c9498-8869-57f8-a883-9c2dfeecb6c6}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(ResourceCandidate, outPtr)
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
