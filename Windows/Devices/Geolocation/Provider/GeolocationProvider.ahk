#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeolocationProvider.ahk
#Include ..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides the ability to override the user's location from a remote source.
  * 
  * > [!NOTE]
  * > To call location-override APIs, an app must declare the `runFullTrust`
  * > [restricted capability](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
  * 
  * > [!IMPORTANT]
  * > The [Windows.Devices.Geolocation.Provider](/uwp/api/windows.devices.geolocation.provider.geolocationprovider) APIs are
  * > part of a Limited Access Feature (see
  * > [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to
  * > request an unlock token, please use the
  * > [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * You should access a `GeolocationProvider` object from the context of the user for whom location is to be overridden
 * and provided to location-aware apps. The length of a location override session is bound by calls to
 * [SetOverridePosition](geolocationprovider_setoverrideposition_807670976.md) and
 * [ClearOverridePosition](geolocationprovider_clearoverrideposition_399430586.md). Once a session starts successfully,
 * other entities can't obtain override functionality until the original object is cleared.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.provider.geolocationprovider
 * @namespace Windows.Devices.Geolocation.Provider
 * @version WindowsRuntime 1.4
 */
class GeolocationProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeolocationProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeolocationProvider.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the owning [GeolocationProvider](geolocationprovider.md) is currently overridden or not. You can access this property's value in your handler for the [GeolocationProvider.IsOverriddenChanged](geolocationprovider_isoverriddenchanged.md) event.
     * 
     * > [!NOTE]
     * > To call location-override APIs, an app must declare the `runFullTrust` [restricted capability](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * 
     * > [!IMPORTANT]
     * > The [Windows.Devices.Geolocation.Provider](/uwp/api/windows.devices.geolocation.provider.geolocationprovider) APIs are part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * See the remarks in [GeolocationProvider](geolocationprovider.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.provider.geolocationprovider.isoverridden
     * @type {Boolean} 
     */
    IsOverridden {
        get => this.get_IsOverridden()
    }

    /**
     * An event that's raised when the value of the [GeolocationProvider.IsOverridden](geolocationprovider_isoverridden.md) property changes. You can register to handle this event and access the current value of `GeolocationProvider.IsOverridden` in response.
     * 
     * > [!NOTE]
     * > To call location-override APIs, an app must declare the `runFullTrust` [restricted capability](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * 
     * > [!IMPORTANT]
     * > The [Windows.Devices.Geolocation.Provider](/uwp/api/windows.devices.geolocation.provider.geolocationprovider) APIs are part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * See the remarks in [GeolocationProvider](geolocationprovider.md).
     * @type {EventHandler<IInspectable>}
    */
    OnIsOverriddenChanged {
        get {
            if(!this.HasProp("__OnIsOverriddenChanged")){
                this.__OnIsOverriddenChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnIsOverriddenChangedToken := this.add_IsOverriddenChanged(this.__OnIsOverriddenChanged.iface)
            }
            return this.__OnIsOverriddenChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructs a new instance of [GeolocationProvider](geolocationprovider.md).
     * 
     * > [!NOTE]
     * > To call location-override APIs, an app must declare the `runFullTrust` [restricted capability](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * 
     * > [!IMPORTANT]
     * > The [Windows.Devices.Geolocation.Provider](/uwp/api/windows.devices.geolocation.provider.geolocationprovider) APIs are part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * See the remarks in [GeolocationProvider](geolocationprovider.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Provider.GeolocationProvider")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnIsOverriddenChangedToken")) {
            this.remove_IsOverriddenChanged(this.__OnIsOverriddenChangedToken)
            this.__OnIsOverriddenChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverridden() {
        if (!this.HasProp("__IGeolocationProvider")) {
            if ((queryResult := this.QueryInterface(IGeolocationProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocationProvider := IGeolocationProvider(outPtr)
        }

        return this.__IGeolocationProvider.get_IsOverridden()
    }

    /**
     * Sets an override position for the user's location. You can clear the override position by calling [GeolocationProvider.ClearOverridePosition](geolocationprovider_clearoverrideposition_399430586.md)
     * 
     * > [!NOTE]
     * > To call location-override APIs, an app must declare the `runFullTrust` [restricted capability](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * 
     * > [!IMPORTANT]
     * > The [Windows.Devices.Geolocation.Provider](/uwp/api/windows.devices.geolocation.provider.geolocationprovider) APIs are part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * See the remarks in [GeolocationProvider](geolocationprovider.md).
     * @param {BasicGeoposition} newPosition The override position.
     * @param {Integer} positionSource_ The source that's overriding the position.
     * @param {Float} accuracyInMeters The accuracy of the override position, in meters.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.provider.geolocationprovider.setoverrideposition
     */
    SetOverridePosition(newPosition, positionSource_, accuracyInMeters) {
        if (!this.HasProp("__IGeolocationProvider")) {
            if ((queryResult := this.QueryInterface(IGeolocationProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocationProvider := IGeolocationProvider(outPtr)
        }

        return this.__IGeolocationProvider.SetOverridePosition(newPosition, positionSource_, accuracyInMeters)
    }

    /**
     * Clears (or resets) an override position that was set previously by a call to [GeolocationProvider.SetOverridePosition](geolocationprovider_setoverrideposition_807670976.md).
     * 
     * > [!NOTE]
     * > To call location-override APIs, an app must declare the `runFullTrust` [restricted capability](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * 
     * > [!IMPORTANT]
     * > The [Windows.Devices.Geolocation.Provider](/uwp/api/windows.devices.geolocation.provider.geolocationprovider) APIs are part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * See the remarks in [GeolocationProvider](geolocationprovider.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.provider.geolocationprovider.clearoverrideposition
     */
    ClearOverridePosition() {
        if (!this.HasProp("__IGeolocationProvider")) {
            if ((queryResult := this.QueryInterface(IGeolocationProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocationProvider := IGeolocationProvider(outPtr)
        }

        return this.__IGeolocationProvider.ClearOverridePosition()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsOverriddenChanged(handler) {
        if (!this.HasProp("__IGeolocationProvider")) {
            if ((queryResult := this.QueryInterface(IGeolocationProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocationProvider := IGeolocationProvider(outPtr)
        }

        return this.__IGeolocationProvider.add_IsOverriddenChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsOverriddenChanged(token) {
        if (!this.HasProp("__IGeolocationProvider")) {
            if ((queryResult := this.QueryInterface(IGeolocationProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocationProvider := IGeolocationProvider(outPtr)
        }

        return this.__IGeolocationProvider.remove_IsOverriddenChanged(token)
    }

;@endregion Instance Methods
}
