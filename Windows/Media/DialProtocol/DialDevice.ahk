#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDialDevice.ahk
#Include .\IDialDevice2.ahk
#Include .\IDialDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the remote device capable of running DIAL apps.
 * @remarks
 * Get an instance of this class by handling the [DialDeviceSelected](dialdevicepicker_dialdeviceselected.md) event and accessing the [DialDeviceSelectedEventArgs.SelectedDialDevice](dialdeviceselectedeventargs_selecteddialdevice.md) or by handling the [DisconnectButtonClicked](dialdevicepicker_disconnectbuttonclicked.md) handler and accessing the [DialDisconnectButtonClickedEventArgs.Device](dialdisconnectbuttonclickedeventargs_device.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevice
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDialDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDialDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns an AQS filter string to be used with the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) APIs (such as the [CreateWatcher](/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher) API) for a given Dial app.
     * @param {HSTRING} appName The name of the app.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevice.getdeviceselector
     */
    static GetDeviceSelector(appName) {
        if (!DialDevice.HasProp("__IDialDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.DialProtocol.DialDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDialDeviceStatics.IID)
            DialDevice.__IDialDeviceStatics := IDialDeviceStatics(factoryPtr)
        }

        return DialDevice.__IDialDeviceStatics.GetDeviceSelector(appName)
    }

    /**
     * Returns a [DialDevice](dialdevice.md) object for a given a device ID (acquired from a query using the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) APIs).
     * @param {HSTRING} value The ID of the device you want a [DialDevice](dialdevice.md) object for.
     * @returns {IAsyncOperation<DialDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevice.fromidasync
     */
    static FromIdAsync(value) {
        if (!DialDevice.HasProp("__IDialDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.DialProtocol.DialDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDialDeviceStatics.IID)
            DialDevice.__IDialDeviceStatics := IDialDeviceStatics(factoryPtr)
        }

        return DialDevice.__IDialDeviceStatics.FromIdAsync(value)
    }

    /**
     * Indicates whether or not the device supports launching DIAL apps.
     * @param {DeviceInformation} device The device you want to get information for.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevice.deviceinfosupportsdialasync
     */
    static DeviceInfoSupportsDialAsync(device) {
        if (!DialDevice.HasProp("__IDialDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.DialProtocol.DialDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDialDeviceStatics.IID)
            DialDevice.__IDialDeviceStatics := IDialDeviceStatics(factoryPtr)
        }

        return DialDevice.__IDialDeviceStatics.DeviceInfoSupportsDialAsync(device)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the remote device's ID. You can use this ID with the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) APIs as well.
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevice.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the friendly name for the DIAL device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevice.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * Gets a stream containing the thumbnail image for the DIAL device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevice.thumbnail
     * @type {IRandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
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
        if (!this.HasProp("__IDialDevice")) {
            if ((queryResult := this.QueryInterface(IDialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevice := IDialDevice(outPtr)
        }

        return this.__IDialDevice.get_Id()
    }

    /**
     * Creates a new [DialApp](dialapp.md) object. This method does not establish a connection to the device or validate that the app exists. That is done when any function is called on the resulting [DialApp](dialapp.md) object.
     * @param {HSTRING} appName The name of the app. This becomes the [AppName](dialapp_appname.md) property of the new object.
     * @returns {DialApp} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevice.getdialapp
     */
    GetDialApp(appName) {
        if (!this.HasProp("__IDialDevice")) {
            if ((queryResult := this.QueryInterface(IDialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevice := IDialDevice(outPtr)
        }

        return this.__IDialDevice.GetDialApp(appName)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        if (!this.HasProp("__IDialDevice2")) {
            if ((queryResult := this.QueryInterface(IDialDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevice2 := IDialDevice2(outPtr)
        }

        return this.__IDialDevice2.get_FriendlyName()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IDialDevice2")) {
            if ((queryResult := this.QueryInterface(IDialDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevice2 := IDialDevice2(outPtr)
        }

        return this.__IDialDevice2.get_Thumbnail()
    }

;@endregion Instance Methods
}
