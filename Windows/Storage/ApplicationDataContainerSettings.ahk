#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Foundation\Collections\IKeyValuePair.ahk
#Include ..\Foundation\Collections\IPropertySet.ahk
#Include ..\Foundation\Collections\IObservableMap.ahk
#Include ..\Foundation\Collections\IMap.ahk
#Include ..\Foundation\Collections\IIterable.ahk
#Include ..\Foundation\Collections\MapChangedEventHandler.ahk
#Include ..\Foundation\Collections\IObservableMap.ahk
#Include ..\Foundation\Collections\IMapChangedEventArgs.ahk
#Include ..\..\Guid.ahk
#Include ..\..\WinRTEventHandler.ahk

/**
 * Provides access to the settings in a settings container. The [ApplicationDataContainer.Values](applicationdatacontainer_values.md) property returns an object that can be cast to this type.
 * @remarks
 * To get an app's local settings, do the following things. These steps are demonstrated in the [LocalSettings](applicationdata_localsettings.md) example.
 * 
 * 
 * 1. Get the value of the static [ApplicationData.Current](applicationdata_current.md) property. This property returns a data store of type [ApplicationData](applicationdata.md).
 * 1. Get the value of the data store's [LocalSettings](applicationdata_localsettings.md) property. This property returns a data container of type [ApplicationDataContainer](applicationdatacontainer.md).
 * 1. Read the [Values](applicationdatacontainer_values.md) property of the data container. This property returns a group of settings of type **IPropertySet**, which can be cast to the ApplicationDataContainerSettings type.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainersettings
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ApplicationDataContainerSettings extends IInspectable {
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
     * Gets the number of related application settings.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainersettings.size
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
     * Retrieves the specified application setting.
     * @remarks
     * For a code example of Lookup, see the [HasKey](applicationdatacontainersettings_haskey_425964900.md) example.
     * @param {Generic} key The key of the setting.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainersettings.lookup
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
     * Determines whether there is an application setting with the specified key.
     * @param {Generic} key The key.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainersettings.haskey
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
     * Returns a read-only snapshot of the contents of the settings container.
     * @remarks
     * If the container is mutated, you must get a new view to see the updated contents of the settings container.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainersettings.getview
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
     * Inserts or replaces an application setting.
     * @param {Generic} key The key of the setting to insert or replace.
     * @param {Generic} value The setting value.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainersettings.insert
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
     * Removes the specified application setting.
     * @param {Generic} key The key of the setting.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainersettings.remove
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
     * Removes all related application settings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainersettings.clear
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
     * Retrieves an iterator to enumerate the settings in the settings container.
     * @remarks
     * This iterator remains valid even if the container's contents are mutated. If the container is mutated, you must get a new iterator to see the updated contents of the settings container.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainersettings.first
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
