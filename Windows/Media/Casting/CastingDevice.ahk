#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICastingDevice.ahk
#Include .\ICastingDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a physical device that is capable of supporting casting connections and rendering media content sent to it.
 * @remarks
 * Get an instance of this class by accessing the [CastingConnection.Device](castingconnection_device.md) or [VastingDeviceSelectedEventArgs.SelectedCastingDevice](castingdeviceselectedeventargs_selectedcastingdevice.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevice
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class CastingDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICastingDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICastingDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an AQS filter string to be used with the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) APIs for a given [CastingPlaybackTypes](castingplaybacktypes.md).
     * @param {Integer} type The casting playback type.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevice.getdeviceselector
     */
    static GetDeviceSelector(type) {
        if (!CastingDevice.HasProp("__ICastingDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Casting.CastingDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICastingDeviceStatics.IID)
            CastingDevice.__ICastingDeviceStatics := ICastingDeviceStatics(factoryPtr)
        }

        return CastingDevice.__ICastingDeviceStatics.GetDeviceSelector(type)
    }

    /**
     * Gets an AQS filter string to be used with the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) APIs for a given [CastingSource](castingsource.md).
     * @param {CastingSource} castingSource_ The casting source.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevice.getdeviceselectorfromcastingsourceasync
     */
    static GetDeviceSelectorFromCastingSourceAsync(castingSource_) {
        if (!CastingDevice.HasProp("__ICastingDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Casting.CastingDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICastingDeviceStatics.IID)
            CastingDevice.__ICastingDeviceStatics := ICastingDeviceStatics(factoryPtr)
        }

        return CastingDevice.__ICastingDeviceStatics.GetDeviceSelectorFromCastingSourceAsync(castingSource_)
    }

    /**
     * Gets a [CastingDevice](castingdevice.md) object for a given a device ID (acquired from a query using the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) APIs).
     * @param {HSTRING} value The device ID.
     * @returns {IAsyncOperation<CastingDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevice.fromidasync
     */
    static FromIdAsync(value) {
        if (!CastingDevice.HasProp("__ICastingDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Casting.CastingDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICastingDeviceStatics.IID)
            CastingDevice.__ICastingDeviceStatics := ICastingDeviceStatics(factoryPtr)
        }

        return CastingDevice.__ICastingDeviceStatics.FromIdAsync(value)
    }

    /**
     * Indicates whether the given device (a [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object) supports casting.
     * @param {DeviceInformation} device The device you want to know about.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevice.deviceinfosupportscastingasync
     */
    static DeviceInfoSupportsCastingAsync(device) {
        if (!CastingDevice.HasProp("__ICastingDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Casting.CastingDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICastingDeviceStatics.IID)
            CastingDevice.__ICastingDeviceStatics := ICastingDeviceStatics(factoryPtr)
        }

        return CastingDevice.__ICastingDeviceStatics.DeviceInfoSupportsCastingAsync(device)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The device ID. This is the same ID used with Windows.Devices.Enumeration APIs.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevice.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * A human-readable name for the device, retrieved from the device itself.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevice.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * An icon representing the device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevice.icon
     * @type {IRandomAccessStreamWithContentType} 
     */
    Icon {
        get => this.get_Icon()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__ICastingDevice")) {
            if ((queryResult := this.QueryInterface(ICastingDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevice := ICastingDevice(outPtr)
        }

        return this.__ICastingDevice.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        if (!this.HasProp("__ICastingDevice")) {
            if ((queryResult := this.QueryInterface(ICastingDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevice := ICastingDevice(outPtr)
        }

        return this.__ICastingDevice.get_FriendlyName()
    }

    /**
     * 
     * @returns {IRandomAccessStreamWithContentType} 
     */
    get_Icon() {
        if (!this.HasProp("__ICastingDevice")) {
            if ((queryResult := this.QueryInterface(ICastingDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevice := ICastingDevice(outPtr)
        }

        return this.__ICastingDevice.get_Icon()
    }

    /**
     * Gets the media types supported by the device. containing
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevice.getsupportedcastingplaybacktypesasync
     */
    GetSupportedCastingPlaybackTypesAsync() {
        if (!this.HasProp("__ICastingDevice")) {
            if ((queryResult := this.QueryInterface(ICastingDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevice := ICastingDevice(outPtr)
        }

        return this.__ICastingDevice.GetSupportedCastingPlaybackTypesAsync()
    }

    /**
     * Creates a new [CastingConnection](castingconnection.md) object. This method does not establish a connection to the casting device.
     * @returns {CastingConnection} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevice.createcastingconnection
     */
    CreateCastingConnection() {
        if (!this.HasProp("__ICastingDevice")) {
            if ((queryResult := this.QueryInterface(ICastingDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevice := ICastingDevice(outPtr)
        }

        return this.__ICastingDevice.CreateCastingConnection()
    }

;@endregion Instance Methods
}
