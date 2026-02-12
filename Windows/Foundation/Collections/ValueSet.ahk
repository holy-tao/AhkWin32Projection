#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\IPropertyValue.ahk
#Include .\IKeyValuePair.ahk
#Include .\IPropertySet.ahk
#Include .\IObservableMap.ahk
#Include .\IMap.ahk
#Include .\IIterable.ahk
#Include .\MapChangedEventHandler.ahk
#Include .\IObservableMap.ahk
#Include .\IMapChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Implements a map with keys of type **String** and values of type [Object](/dotnet/api/system.object?view=dotnet-uwp-10.0&preserve-view=true). Object must be a WinRT [PropertyValue](/windows/win32/api/windows.foundation/nn-windows-foundation-ipropertyvalue) or ValueSet. As a PropertyValue, it can be any type except [PropertyType](/windows/win32/api/windows.foundation/ne-windows-foundation-propertytype) **InspectableArray**. This limitation exists to ensure that the value can be serialized; passed by value across a process boundary.
  * 
  * > [!NOTE]
  * > Some members are only available for the specified language.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class ValueSet extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPropertySet

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPropertySet.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of items contained in the value set.
     * @remarks
     * Some functionality in this class is restricted to specific development languages. The parent topic, [ValueSet](valueset.md) class, indicates which members are accessible in specific languages.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.size
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
     * Occurs when the observable map has changed.
     * @type {MapChangedEventHandler<HSTRING, IInspectable>}
    */
    OnMapChanged {
        get {
            if(!this.HasProp("__OnMapChanged")){
                this.__OnMapChanged := WinRTEventHandler(
                    MapChangedEventHandler,
                    Guid("{24f981e5-ddca-538d-aada-a59906084cf1}"),
                    IObservableMap.Call.Bind(IObservableMap, (ptr) => HSTRING({ Value: ptr }), IInspectable),
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
     * Creates and initializes a new instance of the property set.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Collections.ValueSet")
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
     * 
     * @param {MapChangedEventHandler<Generic, Generic>} vhnd 
     * @returns {EventRegistrationToken} 
     */
    add_MapChanged(vhnd) {
        if (!this.HasProp("__IObservableMap")) {
            piid := Guid("{236aac9d-fb12-5c4d-a41c-9e445fb4d7ec}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObservableMap := IObservableMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
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
            piid := Guid("{236aac9d-fb12-5c4d-a41c-9e445fb4d7ec}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObservableMap := IObservableMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IObservableMap.remove_MapChanged(token)
    }

    /**
     * Retrieves the value for the specified key.
     * @remarks
     * Some functionality in this class is restricted to specific development languages. The parent topic, [ValueSet](valueset.md) class, indicates which members are accessible in specific languages. For functionality similar to this member, see [TryGetValue](/dotnet/api/system.collections.generic.idictionary-2.trygetvalue?view=dotnet-uwp-10.0&preserve-view=true).
     * @param {Generic} key The key.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.get_Size()
    }

    /**
     * Indicates whether the value set has an item with the specified key.
     * @remarks
     * Some functionality in this class is restricted to specific development languages. The parent topic, [ValueSet](valueset.md) class, indicates which members are accessible in specific languages.
     * @param {Generic} key The key.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.HasKey(key)
    }

    /**
     * Gets an immutable view of the value set.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.getview
     */
    GetView() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.GetView()
    }

    /**
     * Adds an item to the value set.
     * @remarks
     * Some functionality in this class is restricted to specific development languages. The parent topic, [ValueSet](valueset.md) class, indicates which members are accessible in specific languages. For functionality similar to this member, see [Add(String,Object)](/dotnet/api/system.collections.generic.idictionary-2.add?view=dotnet-uwp-10.0&preserve-view=true).
     * @param {Generic} key The key to insert.
     * @param {Generic} value The value to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.insert
     */
    Insert(key, value) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.Insert(key, value)
    }

    /**
     * Removes an item from the value set.
     * @remarks
     * Some functionality in this class is restricted to specific development languages. The parent topic, [ValueSet](valueset.md) class, indicates which members are accessible in specific languages.
     * @param {Generic} key The key.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.remove
     */
    Remove(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.Remove(key)
    }

    /**
     * Removes all items from the value set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.clear
     */
    Clear() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.Clear()
    }

    /**
     * Returns an iterator to enumerate the items in the value set.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.valueset.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{fe2f3d47-5d47-5499-8374-430c7cda0204}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), IInspectable), outPtr)
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
