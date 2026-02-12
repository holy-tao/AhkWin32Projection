#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDevicePicker.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DevicePicker.ahk
#Include .\DeviceSelectedEventArgs.ahk
#Include .\DeviceDisconnectButtonClickedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a picker flyout that contains a list of devices for the user to choose from.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepicker
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DevicePicker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDevicePicker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDevicePicker.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the filter used to choose what devices to show in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepicker.filter
     * @type {DevicePickerFilter} 
     */
    Filter {
        get => this.get_Filter()
    }

    /**
     * Gets the colors of the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepicker.appearance
     * @type {DevicePickerAppearance} 
     */
    Appearance {
        get => this.get_Appearance()
    }

    /**
     * Gets a collection of properties for the returned device information object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepicker.requestedproperties
     * @type {IVector<HSTRING>} 
     */
    RequestedProperties {
        get => this.get_RequestedProperties()
    }

    /**
     * Indicates that the user selected a device in the picker.
     * @type {TypedEventHandler<DevicePicker, DeviceSelectedEventArgs>}
    */
    OnDeviceSelected {
        get {
            if(!this.HasProp("__OnDeviceSelected")){
                this.__OnDeviceSelected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{47e48c88-1c56-5b58-96a2-8e813d25077a}"),
                    DevicePicker,
                    DeviceSelectedEventArgs
                )
                this.__OnDeviceSelectedToken := this.add_DeviceSelected(this.__OnDeviceSelected.iface)
            }
            return this.__OnDeviceSelected
        }
    }

    /**
     * Indicates that the user clicked or tapped the disconnect button for a device in the picker.
     * @type {TypedEventHandler<DevicePicker, DeviceDisconnectButtonClickedEventArgs>}
    */
    OnDisconnectButtonClicked {
        get {
            if(!this.HasProp("__OnDisconnectButtonClicked")){
                this.__OnDisconnectButtonClicked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{35dd0319-5723-506c-8896-1a28b82be798}"),
                    DevicePicker,
                    DeviceDisconnectButtonClickedEventArgs
                )
                this.__OnDisconnectButtonClickedToken := this.add_DisconnectButtonClicked(this.__OnDisconnectButtonClicked.iface)
            }
            return this.__OnDisconnectButtonClicked
        }
    }

    /**
     * Indicates that the device picker was light dismissed by the user. Light dismiss happens when the user clicks somewhere other than the picker UI and the picker UI disappears.
     * @type {TypedEventHandler<DevicePicker, IInspectable>}
    */
    OnDevicePickerDismissed {
        get {
            if(!this.HasProp("__OnDevicePickerDismissed")){
                this.__OnDevicePickerDismissed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{62c6d98c-57ee-5bb8-a41c-958d20c3f3e8}"),
                    DevicePicker,
                    IInspectable
                )
                this.__OnDevicePickerDismissedToken := this.add_DevicePickerDismissed(this.__OnDevicePickerDismissed.iface)
            }
            return this.__OnDevicePickerDismissed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [DevicePicker](devicepicker.md) object.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DevicePicker")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDeviceSelectedToken")) {
            this.remove_DeviceSelected(this.__OnDeviceSelectedToken)
            this.__OnDeviceSelected.iface.Dispose()
        }

        if(this.HasProp("__OnDisconnectButtonClickedToken")) {
            this.remove_DisconnectButtonClicked(this.__OnDisconnectButtonClickedToken)
            this.__OnDisconnectButtonClicked.iface.Dispose()
        }

        if(this.HasProp("__OnDevicePickerDismissedToken")) {
            this.remove_DevicePickerDismissed(this.__OnDevicePickerDismissedToken)
            this.__OnDevicePickerDismissed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {DevicePickerFilter} 
     */
    get_Filter() {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.get_Filter()
    }

    /**
     * 
     * @returns {DevicePickerAppearance} 
     */
    get_Appearance() {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.get_Appearance()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_RequestedProperties() {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.get_RequestedProperties()
    }

    /**
     * 
     * @param {TypedEventHandler<DevicePicker, DeviceSelectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DeviceSelected(handler) {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.add_DeviceSelected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DeviceSelected(token) {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.remove_DeviceSelected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DevicePicker, DeviceDisconnectButtonClickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DisconnectButtonClicked(handler) {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.add_DisconnectButtonClicked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DisconnectButtonClicked(token) {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.remove_DisconnectButtonClicked(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DevicePicker, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DevicePickerDismissed(handler) {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.add_DevicePickerDismissed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DevicePickerDismissed(token) {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.remove_DevicePickerDismissed(token)
    }

    /**
     * Shows the picker UI. The picker flies out from the edge of the specified rectangle.
     * @param {RECT} selection The rectangle from which you want the picker to fly out.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepicker.show
     */
    Show(selection) {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.Show(selection)
    }

    /**
     * Shows the picker UI. The picker flies out from the specified edge of the specified rectangle.
     * @param {RECT} selection The rectangle from which you want the picker to fly out.
     * @param {Integer} placement_ The edge of the rectangle from which you want the picker to fly out.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepicker.show
     */
    ShowWithPlacement(selection, placement_) {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.ShowWithPlacement(selection, placement_)
    }

    /**
     * Shows the picker UI and returns the selected device; does not require you to register for an event. The picker flies out from the specified edge of the specified rectangle.
     * @param {RECT} selection The rectangle from which you want the picker to fly out.
     * @returns {IAsyncOperation<DeviceInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepicker.picksingledeviceasync
     */
    PickSingleDeviceAsync(selection) {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.PickSingleDeviceAsync(selection)
    }

    /**
     * Shows the picker UI and returns the selected device; does not require you to register for an event. The picker flies out from the edge of the specified rectangle.
     * @param {RECT} selection The rectangle from which you want the picker to fly out.
     * @param {Integer} placement_ 
     * @returns {IAsyncOperation<DeviceInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepicker.picksingledeviceasync
     */
    PickSingleDeviceAsyncWithPlacement(selection, placement_) {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.PickSingleDeviceAsyncWithPlacement(selection, placement_)
    }

    /**
     * Hides the picker.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepicker.hide
     */
    Hide() {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.Hide()
    }

    /**
     * Updates the picker UI to reflect the provided status and display options for a specified device. The state of the picker UI typically persists until the operating system (OS) is restarted.
     * @param {DeviceInformation} device The device information.
     * @param {HSTRING} status_ The status to display.
     * @param {Integer} options The display options for the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepicker.setdisplaystatus
     */
    SetDisplayStatus(device, status_, options) {
        if (!this.HasProp("__IDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePicker := IDevicePicker(outPtr)
        }

        return this.__IDevicePicker.SetDisplayStatus(device, status_, options)
    }

;@endregion Instance Methods
}
