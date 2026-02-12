#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDialDevicePicker.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DialDevicePicker.ahk
#Include .\DialDeviceSelectedEventArgs.ahk
#Include .\DialDisconnectButtonClickedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a picker flyout that contains a list of remote devices for the user to choose from.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicepicker
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialDevicePicker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDialDevicePicker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDialDevicePicker.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the filter used to choose what devices to show in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicepicker.filter
     * @type {DialDevicePickerFilter} 
     */
    Filter {
        get => this.get_Filter()
    }

    /**
     * Used to change the colors of the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicepicker.appearance
     * @type {DevicePickerAppearance} 
     */
    Appearance {
        get => this.get_Appearance()
    }

    /**
     * Indicates that the user selected a device from the picker.
     * @type {TypedEventHandler<DialDevicePicker, DialDeviceSelectedEventArgs>}
    */
    OnDialDeviceSelected {
        get {
            if(!this.HasProp("__OnDialDeviceSelected")){
                this.__OnDialDeviceSelected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8375c0d7-e7c3-56bc-9880-46b69ca10d45}"),
                    DialDevicePicker,
                    DialDeviceSelectedEventArgs
                )
                this.__OnDialDeviceSelectedToken := this.add_DialDeviceSelected(this.__OnDialDeviceSelected.iface)
            }
            return this.__OnDialDeviceSelected
        }
    }

    /**
     * Indicates that the user clicked on the disconnect button in the picker.
     * @type {TypedEventHandler<DialDevicePicker, DialDisconnectButtonClickedEventArgs>}
    */
    OnDisconnectButtonClicked {
        get {
            if(!this.HasProp("__OnDisconnectButtonClicked")){
                this.__OnDisconnectButtonClicked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{13492af0-1c7f-57e8-b57e-a5ae8f2c462e}"),
                    DialDevicePicker,
                    DialDisconnectButtonClickedEventArgs
                )
                this.__OnDisconnectButtonClickedToken := this.add_DisconnectButtonClicked(this.__OnDisconnectButtonClicked.iface)
            }
            return this.__OnDisconnectButtonClicked
        }
    }

    /**
     * Indicates that the device picker was light dismissed, which means that the user clicked or touched anywhere other than the picker UI, and so the picker will be closed.
     * @type {TypedEventHandler<DialDevicePicker, IInspectable>}
    */
    OnDialDevicePickerDismissed {
        get {
            if(!this.HasProp("__OnDialDevicePickerDismissed")){
                this.__OnDialDevicePickerDismissed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{dac94028-1b44-5f45-b9e3-abcf4ab044bf}"),
                    DialDevicePicker,
                    IInspectable
                )
                this.__OnDialDevicePickerDismissedToken := this.add_DialDevicePickerDismissed(this.__OnDialDevicePickerDismissed.iface)
            }
            return this.__OnDialDevicePickerDismissed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [DialDevicePicker](dialdevicepicker.md) object.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.DialProtocol.DialDevicePicker")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDialDeviceSelectedToken")) {
            this.remove_DialDeviceSelected(this.__OnDialDeviceSelectedToken)
            this.__OnDialDeviceSelected.iface.Dispose()
        }

        if(this.HasProp("__OnDisconnectButtonClickedToken")) {
            this.remove_DisconnectButtonClicked(this.__OnDisconnectButtonClickedToken)
            this.__OnDisconnectButtonClicked.iface.Dispose()
        }

        if(this.HasProp("__OnDialDevicePickerDismissedToken")) {
            this.remove_DialDevicePickerDismissed(this.__OnDialDevicePickerDismissedToken)
            this.__OnDialDevicePickerDismissed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {DialDevicePickerFilter} 
     */
    get_Filter() {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.get_Filter()
    }

    /**
     * 
     * @returns {DevicePickerAppearance} 
     */
    get_Appearance() {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.get_Appearance()
    }

    /**
     * 
     * @param {TypedEventHandler<DialDevicePicker, DialDeviceSelectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DialDeviceSelected(handler) {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.add_DialDeviceSelected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DialDeviceSelected(token) {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.remove_DialDeviceSelected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DialDevicePicker, DialDisconnectButtonClickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DisconnectButtonClicked(handler) {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.add_DisconnectButtonClicked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DisconnectButtonClicked(token) {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.remove_DisconnectButtonClicked(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DialDevicePicker, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DialDevicePickerDismissed(handler) {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.add_DialDevicePickerDismissed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DialDevicePickerDismissed(token) {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.remove_DialDevicePickerDismissed(token)
    }

    /**
     * Displays the picker to the user. When called, the picker flies out from an edge of the provided rectangle.
     * @param {RECT} selection The rectangle from which you want the picker to show.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicepicker.show
     */
    Show(selection) {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.Show(selection)
    }

    /**
     * Displays the picker to the user. When called, the picker flies out from the specified edge of the provided rectangle.
     * @param {RECT} selection The rectangle from which you want the picker to show.
     * @param {Integer} preferredPlacement The edge from which you want the picker to show.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicepicker.show
     */
    ShowWithPlacement(selection, preferredPlacement) {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.ShowWithPlacement(selection, preferredPlacement)
    }

    /**
     * Shows the picker. Call this method directly to show to show the picker, instead of showing it in response to an event.
     * @param {RECT} selection The rectangle from which to show the picker.
     * @returns {IAsyncOperation<DialDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicepicker.picksingledialdeviceasync
     */
    PickSingleDialDeviceAsync(selection) {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.PickSingleDialDeviceAsync(selection)
    }

    /**
     * Shows the picker. Call this method directly to show to show the picker, instead of showing it in response to an event.
     * @param {RECT} selection The rectangle from which to show the picker.
     * @param {Integer} preferredPlacement 
     * @returns {IAsyncOperation<DialDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicepicker.picksingledialdeviceasync
     */
    PickSingleDialDeviceAsyncWithPlacement(selection, preferredPlacement) {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.PickSingleDialDeviceAsyncWithPlacement(selection, preferredPlacement)
    }

    /**
     * Hides the picker.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicepicker.hide
     */
    Hide() {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.Hide()
    }

    /**
     * Updates the picker UI to reflect the status fo a given remote device.
     * @param {DialDevice} device The remote device whose status you want to display.
     * @param {Integer} status_ The status you want displayed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicepicker.setdisplaystatus
     */
    SetDisplayStatus(device, status_) {
        if (!this.HasProp("__IDialDevicePicker")) {
            if ((queryResult := this.QueryInterface(IDialDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePicker := IDialDevicePicker(outPtr)
        }

        return this.__IDialDevicePicker.SetDisplayStatus(device, status_)
    }

;@endregion Instance Methods
}
