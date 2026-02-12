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
 * Represents a property set, which is a set of [PropertyValue](../windows.foundation/propertyvalue.md) objects with string keys.
 * @remarks
 * This class implements a map (the [IMap<K,V>](imap_2.md) interface) with keys of type **String** and values of type [PropertyValue](../windows.foundation/propertyvalue.md). The PropertySet type enables various Windows Runtime APIs to return a collection of mixed values that can still be iterated or inspected using the common collection APIs of PropertySet, which match those of [IMap<K,V>](imap_2.md), [IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true), or JavaScript collection and enumeration techniques, depending on which language your app uses.
 * 
 * [PropertyValue](../windows.foundation/propertyvalue.md) is a class that supports a large number of static **Create*** methods that create a deliberately untyped value from an input that's typically a value type or primitive (Boolean, numbers and so on) or an array of those values. Once one of the static [PropertyValue](../windows.foundation/propertyvalue.md) methods is called, its return value can be treated as a [PropertyValue](../windows.foundation/propertyvalue.md) instance (however the **Create*** methods technically return an **Object** if you look at the signatures).
 * 
 * However, you don't typically use a PropertySet in a way that requires you to fill the [PropertyValue](../windows.foundation/propertyvalue.md) values in the set yourself. Instead, you typically get a filled-in PropertySet as a return value from a Windows Runtime API that's providing a collection where the value types within it might be mixed, but are still related to each other by origin or scenario. For example, the [LocalSettings](../windows.storage/applicationdata_localsettings.md) and [RoamingSettings](../windows.storage/applicationdata_roamingsettings.md) values that you get when you retrieve app data are of type [ApplicationDataContainer](../windows.storage/applicationdatacontainer.md), and each contains a PropertySet as its [Values](../windows.storage/applicationdatacontainer_values.md) property value. When you interact with app data that's storing settings, you typically get the collection from [ApplicationDataContainer.Values](../windows.storage/applicationdatacontainer_values.md). Then you can:
 * + iterate over the set using the appropriate iteration syntax
 * + use [HasKey](propertyset_haskey_425964900.md)/[ContainsKey](/dotnet/api/system.collections.generic.idictionary-2.containskey) to verify the existence of a [PropertyValue](../windows.foundation/propertyvalue.md) in the set
 * + use [Lookup](propertyset_lookup_711408188.md) or the [Item](/dotnet/api/system.collections.generic.idictionary-2.item) indexer to retrieve an item once you know it exists
 * 
 * 
 * For scenarios like working with app data, when you have a PropertySet you have it by reference, so if you add items to the PropertySet using [Add](/dotnet/api/system.collections.generic.idictionary-2.add)/[Insert](propertyset_insert_2123640444.md) these items will be added to the app data, and removing items removes them from app data. All such changes are then shared through the app data mechanisms, if they're made to the [RoamingSettings](../windows.storage/applicationdata_roamingsettings.md).
 * 
 * There are other Windows Runtime APIs that use a PropertySet value as a direct value rather than wrapped in another class like [ApplicationDataContainer](../windows.storage/applicationdatacontainer.md). For example, [CoreApplication.Properties](../windows.applicationmodel.core/coreapplication_properties.md) returns a PropertySet.
 * 
 * Various properties that report info from media and devices use PropertySet, for example [PlayToReceiver.Properties](../windows.media.playto/playtoreceiver_properties.md). However, there are other media/devices property sets that don't use PropertySet and instead use [MediaPropertySet](../windows.media.mediaproperties/mediapropertyset.md), because the identifier for those properties is better represented when keyed as a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) rather than a string.
 * 
 * In many cases where a Windows Runtime API uses a PropertySet as a value, it's actually shown as [IPropertySet](ipropertyset.md) in the signatures. PropertySet can be considered the practical implementation of [IPropertySet](ipropertyset.md) that's ready for use by app code. JavaScript code can treat any [IPropertySet](ipropertyset.md) value as if it implemented the PropertySet prototypes.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class PropertySet extends IInspectable {
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
     * Gets the number of items contained in the property set.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.size
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
            activatableClassId := HSTRING.Create("Windows.Foundation.Collections.PropertySet")
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
     * @param {Generic} key The key.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.lookup
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
     * Indicates whether the property set has an item with the specified key.
     * @param {Generic} key The key.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.haskey
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
     * Gets an immutable view of the property set.
     * @remarks
     * If changes are made to the map, such as adding, modifying, or deleting elements,
     * the map view is permitted to raise an exception for all future operations.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.getview
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
     * Adds an item to the property set.
     * @param {Generic} key The key to insert.
     * @param {Generic} value The value to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.insert
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
     * Removes an item from the property set.
     * @remarks
     * For the C# or Microsoft Visual Basic version of the **Remove** method, see [Remove](/dotnet/api/system.collections.generic.idictionary-2.remove).
     * @param {Generic} key The key.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.remove
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
     * Removes all items from the property set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.clear
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
     * Returns an iterator to enumerate the items in the property set.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.propertyset.first
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
