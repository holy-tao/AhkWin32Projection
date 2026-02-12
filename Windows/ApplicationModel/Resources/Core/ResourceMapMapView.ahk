#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\ResourceMap.ahk
#Include ..\..\..\Foundation\Collections\IKeyValuePair.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * An unchangeable view into a map of [ResourceMap](resourcemap.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemapmapview
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceMapMapView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of [ResourceMap](resourcemap.md) objects in the map.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemapmapview.size
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
     * Returns the [ResourceMap](resourcemap.md) at the specified key in the map view.
     * @param {Generic} key The key to locate in the map view.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemapmapview.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{d4349ade-93b1-5325-ba5c-05f35eeffc55}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), ResourceMap, outPtr)
        }

        return this.__IMapView.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{d4349ade-93b1-5325-ba5c-05f35eeffc55}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), ResourceMap, outPtr)
        }

        return this.__IMapView.get_Size()
    }

    /**
     * Determines whether the map view contains the specified key.
     * @param {Generic} key The key to locate in the map view.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemapmapview.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{d4349ade-93b1-5325-ba5c-05f35eeffc55}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), ResourceMap, outPtr)
        }

        return this.__IMapView.HasKey(key)
    }

    /**
     * Splits the map view into two views.
     * @remarks
     * The two views that result from the split operation might not contain the same number of items. The two views do not overlap.
     * 
     * If a view can't be split, then both the first and second parameter are `null`.
     * @param {Pointer<IMapView>} first One half of the original map.
     * @param {Pointer<IMapView>} second The second half of the original map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemapmapview.split
     */
    Split(first, second) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{d4349ade-93b1-5325-ba5c-05f35eeffc55}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), ResourceMap, outPtr)
        }

        return this.__IMapView.Split(first, second)
    }

    /**
     * Returns an iterator to enumerate the items in the map view.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemapmapview.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{9895431e-a817-5509-91e6-d90a933ed830}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), ResourceMap), outPtr)
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
