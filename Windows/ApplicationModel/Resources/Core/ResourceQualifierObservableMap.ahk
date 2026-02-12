#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IKeyValuePair.ahk
#Include ..\..\..\Foundation\Collections\IObservableMap.ahk
#Include ..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\Collections\MapChangedEventHandler.ahk
#Include ..\..\..\Foundation\Collections\IObservableMap.ahk
#Include ..\..\..\Foundation\Collections\IMapChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Notifies listeners of dynamic changes to a map of [ResourceQualifier](resourcequalifier.md) objects, such as when items get added or removed, and allows qualifier values to change.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifierobservablemap
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceQualifierObservableMap extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IObservableMap

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IObservableMap.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of [ResourceQualifier](resourcequalifier.md) objects in the observable map.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifierobservablemap.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[key] {
        get => this.Lookup(key)
        set => this.Insert(key, value)
    }

    /**
     * Occurs when the map changes.
     * @type {MapChangedEventHandler<HSTRING, HSTRING>}
    */
    OnMapChanged {
        get {
            if(!this.HasProp("__OnMapChanged")){
                this.__OnMapChanged := WinRTEventHandler(
                    MapChangedEventHandler,
                    Guid("{e2663f37-2e1b-500c-ad68-c3ed7a8f74c8}"),
                    IObservableMap.Call.Bind(IObservableMap, (ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr })),
                    IMapChangedEventArgs.Call.Bind(IMapChangedEventArgs, (ptr) => HSTRING({ Value: ptr }))
                )
                this.__OnMapChangedToken := this.add_MapChanged(this.__OnMapChanged.iface)
            }
            return this.__OnMapChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMapChangedToken")) {
            this.remove_MapChanged(this.__OnMapChangedToken)
            this.__OnMapChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {MapChangedEventHandler<Generic, Generic>} vhnd 
     * @returns {EventRegistrationToken} 
     */
    add_MapChanged(vhnd) {
        if (!this.HasProp("__IObservableMap")) {
            piid := Guid("{1e036276-2f60-55f6-b7f3-f86079e6900b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObservableMap := IObservableMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IObservableMap.add_MapChanged(vhnd)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapChanged(token) {
        if (!this.HasProp("__IObservableMap")) {
            piid := Guid("{1e036276-2f60-55f6-b7f3-f86079e6900b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObservableMap := IObservableMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IObservableMap.remove_MapChanged(token)
    }

    /**
     * Returns the qualifier name at the specified key in the observable map.
     * @param {Generic} key The key to locate in the observable map.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifierobservablemap.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.get_Size()
    }

    /**
     * Determines whether the observable map contains the specified key.
     * @param {Generic} key The key to locate in the observable map.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifierobservablemap.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.HasKey(key)
    }

    /**
     * Returns an unchangeable view of the observable map.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifierobservablemap.getview
     */
    GetView() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.GetView()
    }

    /**
     * Inserts or replaces an item in the observable map.
     * @param {Generic} key The key associated with the item to insert.
     * @param {Generic} value The item to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifierobservablemap.insert
     */
    Insert(key, value) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.Insert(key, value)
    }

    /**
     * Removes an item from the observable map.
     * @param {Generic} key The key associated with the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifierobservablemap.remove
     */
    Remove(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.Remove(key)
    }

    /**
     * Removes all items from the observable map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifierobservablemap.clear
     */
    Clear() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.Clear()
    }

    /**
     * Returns an iterator to enumerate the items in the observable map.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifierobservablemap.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{e9bdaaf0-cbf6-5c72-be90-29cbf3a1319b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr })), outPtr)
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
