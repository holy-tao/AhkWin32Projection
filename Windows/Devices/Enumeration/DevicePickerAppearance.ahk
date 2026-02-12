#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDevicePickerAppearance.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the appearance of a device picker.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerappearance
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DevicePickerAppearance extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDevicePickerAppearance

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDevicePickerAppearance.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets the title for the picker UI.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerappearance.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets and sets the foreground color of the picker UI.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerappearance.foregroundcolor
     * @type {Color} 
     */
    ForegroundColor {
        get => this.get_ForegroundColor()
        set => this.put_ForegroundColor(value)
    }

    /**
     * Gets and sets the background color of the picker UI.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerappearance.backgroundcolor
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * Gets and sets the accent color of the picker UI.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerappearance.accentcolor
     * @type {Color} 
     */
    AccentColor {
        get => this.get_AccentColor()
        set => this.put_AccentColor(value)
    }

    /**
     * Gets and sets the foreground color for a device that is selected in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerappearance.selectedforegroundcolor
     * @type {Color} 
     */
    SelectedForegroundColor {
        get => this.get_SelectedForegroundColor()
        set => this.put_SelectedForegroundColor(value)
    }

    /**
     * Gets and sets the background color for a device that is selected in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerappearance.selectedbackgroundcolor
     * @type {Color} 
     */
    SelectedBackgroundColor {
        get => this.get_SelectedBackgroundColor()
        set => this.put_SelectedBackgroundColor(value)
    }

    /**
     * Gets and sets the accent color for a device that has been selected in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerappearance.selectedaccentcolor
     * @type {Color} 
     */
    SelectedAccentColor {
        get => this.get_SelectedAccentColor()
        set => this.put_SelectedAccentColor(value)
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
    get_Title() {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.put_Title(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_ForegroundColor() {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.get_ForegroundColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_ForegroundColor(value) {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.put_ForegroundColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.get_BackgroundColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.put_BackgroundColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_AccentColor() {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.get_AccentColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_AccentColor(value) {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.put_AccentColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SelectedForegroundColor() {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.get_SelectedForegroundColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_SelectedForegroundColor(value) {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.put_SelectedForegroundColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SelectedBackgroundColor() {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.get_SelectedBackgroundColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_SelectedBackgroundColor(value) {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.put_SelectedBackgroundColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SelectedAccentColor() {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.get_SelectedAccentColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_SelectedAccentColor(value) {
        if (!this.HasProp("__IDevicePickerAppearance")) {
            if ((queryResult := this.QueryInterface(IDevicePickerAppearance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerAppearance := IDevicePickerAppearance(outPtr)
        }

        return this.__IDevicePickerAppearance.put_SelectedAccentColor(value)
    }

;@endregion Instance Methods
}
