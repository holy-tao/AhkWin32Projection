#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\IPropertyValue.ahk
#Include .\IKeyValuePair.ahk
#Include .\IMap.ahk
#Include .\IIterable.ahk
#Include .\IObservableMap.ahk
#Include .\MapChangedEventHandler.ahk
#Include .\IObservableMap.ahk
#Include .\IMapChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * An associative collection, also known as a map or a dictionary.
 * @remarks
 * This class allows JavaScript to easily iterate over a collection for which strings are the only expected value for both keys and values.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class StringMap extends IInspectable {
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
     * Gets the number of items in the map.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.size
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
     * Occurs when the contents of the map change.
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
    /**
     * Creates and initializes a new instance of the StringMap.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Collections.StringMap")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

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
     * Returns the item at the specified key in the map.
     * @param {Generic} key The key associated with the item to locate.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.lookup
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
     * Determines whether the map contains the specified key.
     * @param {Generic} key The key associated with the item to locate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.haskey
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
     * Returns an immutable view of the map.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.getview
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
     * Inserts or replaces an item in the map.
     * @param {Generic} key The key associated with the item to insert.
     * @param {Generic} value The item to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.insert
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
     * Removes an item from the map.
     * @param {Generic} key The key associated with the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.remove
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
     * Removes all items from the map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.clear
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
     * Returns an iterator containing the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.stringmap.first
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

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
