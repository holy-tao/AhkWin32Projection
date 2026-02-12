#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\ResourceMap.ahk
#Include ..\..\..\Foundation\Collections\IIterator.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Supports iteration over a [ResourceMapMapView](resourcemapmapview.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemapmapviewiterator
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceMapMapViewIterator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIterator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIterator.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current item in the [ResourceMapMapView](resourcemapmapview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemapmapviewiterator.current
     * @type {Generic} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * Gets a value that indicates whether there is a current item, or whether the iterator is at the end of the [ResourceMapMapView](resourcemapmapview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemapmapviewiterator.hascurrent
     * @type {Boolean} 
     */
    HasCurrent {
        get => this.get_HasCurrent()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Generic} 
     */
    get_Current() {
        if (!this.HasProp("__IIterator")) {
            piid := Guid("{28cf8d5e-69f6-59f6-9865-bca97d59f74f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterator := IIterator(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), ResourceMap), outPtr)
        }

        return this.__IIterator.get_Current()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasCurrent() {
        if (!this.HasProp("__IIterator")) {
            piid := Guid("{28cf8d5e-69f6-59f6-9865-bca97d59f74f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterator := IIterator(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), ResourceMap), outPtr)
        }

        return this.__IIterator.get_HasCurrent()
    }

    /**
     * Moves the iterator forward to the next item and returns [HasCurrent](resourcemapmapviewiterator_hascurrent.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemapmapviewiterator.movenext
     */
    MoveNext() {
        if (!this.HasProp("__IIterator")) {
            piid := Guid("{28cf8d5e-69f6-59f6-9865-bca97d59f74f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterator := IIterator(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), ResourceMap), outPtr)
        }

        return this.__IIterator.MoveNext()
    }

    /**
     * Returns all the items in the [ResourceMapMapView](resourcemapmapview.md).
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The items in the map view.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemapmapviewiterator.getmany
     */
    GetMany(items_length, items) {
        if (!this.HasProp("__IIterator")) {
            piid := Guid("{28cf8d5e-69f6-59f6-9865-bca97d59f74f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterator := IIterator(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), ResourceMap), outPtr)
        }

        return this.__IIterator.GetMany(items_length, items)
    }

;@endregion Instance Methods
}
