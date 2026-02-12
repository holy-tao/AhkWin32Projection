#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICastingDevicePicker.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CastingDevicePicker.ahk
#Include .\CastingDeviceSelectedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a device picker that contains a list of casting devices for the user to choose from.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevicepicker
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class CastingDevicePicker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICastingDevicePicker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICastingDevicePicker.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the filter information for which devices to show in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevicepicker.filter
     * @type {CastingDevicePickerFilter} 
     */
    Filter {
        get => this.get_Filter()
    }

    /**
     * Gets the colors of the picker UI.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevicepicker.appearance
     * @type {DevicePickerAppearance} 
     */
    Appearance {
        get => this.get_Appearance()
    }

    /**
     * Indicates that the user has selected a device from the picker.
     * @type {TypedEventHandler<CastingDevicePicker, CastingDeviceSelectedEventArgs>}
    */
    OnCastingDeviceSelected {
        get {
            if(!this.HasProp("__OnCastingDeviceSelected")){
                this.__OnCastingDeviceSelected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b3655b33-c4ad-5f4c-a187-b2e4c770a16b}"),
                    CastingDevicePicker,
                    CastingDeviceSelectedEventArgs
                )
                this.__OnCastingDeviceSelectedToken := this.add_CastingDeviceSelected(this.__OnCastingDeviceSelected.iface)
            }
            return this.__OnCastingDeviceSelected
        }
    }

    /**
     * Indicates that the user has dismissed the picker UI.
     * @type {TypedEventHandler<CastingDevicePicker, IInspectable>}
    */
    OnCastingDevicePickerDismissed {
        get {
            if(!this.HasProp("__OnCastingDevicePickerDismissed")){
                this.__OnCastingDevicePickerDismissed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a64b972b-aa63-5c61-9cde-cd6ffea8a247}"),
                    CastingDevicePicker,
                    IInspectable
                )
                this.__OnCastingDevicePickerDismissedToken := this.add_CastingDevicePickerDismissed(this.__OnCastingDevicePickerDismissed.iface)
            }
            return this.__OnCastingDevicePickerDismissed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [CastingDevicePicker](castingdevicepicker.md) object.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Casting.CastingDevicePicker")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCastingDeviceSelectedToken")) {
            this.remove_CastingDeviceSelected(this.__OnCastingDeviceSelectedToken)
            this.__OnCastingDeviceSelected.iface.Dispose()
        }

        if(this.HasProp("__OnCastingDevicePickerDismissedToken")) {
            this.remove_CastingDevicePickerDismissed(this.__OnCastingDevicePickerDismissedToken)
            this.__OnCastingDevicePickerDismissed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {CastingDevicePickerFilter} 
     */
    get_Filter() {
        if (!this.HasProp("__ICastingDevicePicker")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePicker := ICastingDevicePicker(outPtr)
        }

        return this.__ICastingDevicePicker.get_Filter()
    }

    /**
     * 
     * @returns {DevicePickerAppearance} 
     */
    get_Appearance() {
        if (!this.HasProp("__ICastingDevicePicker")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePicker := ICastingDevicePicker(outPtr)
        }

        return this.__ICastingDevicePicker.get_Appearance()
    }

    /**
     * 
     * @param {TypedEventHandler<CastingDevicePicker, CastingDeviceSelectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CastingDeviceSelected(handler) {
        if (!this.HasProp("__ICastingDevicePicker")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePicker := ICastingDevicePicker(outPtr)
        }

        return this.__ICastingDevicePicker.add_CastingDeviceSelected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CastingDeviceSelected(token) {
        if (!this.HasProp("__ICastingDevicePicker")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePicker := ICastingDevicePicker(outPtr)
        }

        return this.__ICastingDevicePicker.remove_CastingDeviceSelected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<CastingDevicePicker, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CastingDevicePickerDismissed(handler) {
        if (!this.HasProp("__ICastingDevicePicker")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePicker := ICastingDevicePicker(outPtr)
        }

        return this.__ICastingDevicePicker.add_CastingDevicePickerDismissed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CastingDevicePickerDismissed(token) {
        if (!this.HasProp("__ICastingDevicePicker")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePicker := ICastingDevicePicker(outPtr)
        }

        return this.__ICastingDevicePicker.remove_CastingDevicePickerDismissed(token)
    }

    /**
     * Shows the casting device picker UI, which flies out from an edge of the provided rectangle.
     * @param {RECT} selection The rectangle from which the picker UI should fly out.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevicepicker.show
     */
    Show(selection) {
        if (!this.HasProp("__ICastingDevicePicker")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePicker := ICastingDevicePicker(outPtr)
        }

        return this.__ICastingDevicePicker.Show(selection)
    }

    /**
     * Shows the casting device picker UI, which flies out from the specified edge of the provided rectangle.
     * @param {RECT} selection The rectangle from which the picker should fly out.
     * @param {Integer} preferredPlacement The edge of the rectangle from which the picker should fly out.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevicepicker.show
     */
    ShowWithPlacement(selection, preferredPlacement) {
        if (!this.HasProp("__ICastingDevicePicker")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePicker := ICastingDevicePicker(outPtr)
        }

        return this.__ICastingDevicePicker.ShowWithPlacement(selection, preferredPlacement)
    }

    /**
     * Hides the device picker UI.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevicepicker.hide
     */
    Hide() {
        if (!this.HasProp("__ICastingDevicePicker")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePicker := ICastingDevicePicker(outPtr)
        }

        return this.__ICastingDevicePicker.Hide()
    }

;@endregion Instance Methods
}
