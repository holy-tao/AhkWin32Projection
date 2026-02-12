#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILineDisplayAttributes.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the attributes of a [line display](linedisplay.md) device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplayattributes
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayAttributes extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineDisplayAttributes

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineDisplayAttributes.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether the device is enabled to notify the user of power state changes.
     * @remarks
     * Power state notifications are delivered via [ClaimedLineDisplay.StatusUpdated](ClaimedLineDisplay_StatusUpdated.md). The property's default value is False (meaning that the device does not send power state notifications even if the app is subscribed to the [ClaimedLineDisplay.StatusUpdated](ClaimedLineDisplay_StatusUpdated.md) event). This property can be set to True only when [LineDisplayCapabilities.PowerReportingType](LineDisplayCapabilities_PowerReportingType.md) is not set to UnknownPowerReportingType. 
     * 
     * Changes to this property are committed to the device on the next call to [ClaimedLineDisplay.TryUpdateAttributesAsync(LineDisplayAttributes)](claimedlinedisplay_tryupdateattributesasync_1303674463.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplayattributes.ispowernotifyenabled
     * @type {Boolean} 
     */
    IsPowerNotifyEnabled {
        get => this.get_IsPowerNotifyEnabled()
        set => this.put_IsPowerNotifyEnabled(value)
    }

    /**
     * Gets or sets the brightness of the line display.
     * @remarks
     * When the device supports brightness adjustment ([LineDisplayCapabilities.IsBrightnessSupported](LineDisplayCapabilities_IsBrightnessSupported.md) is True) this writeable property configures the current screen brightness, in percent (valid values are positive integers from 0 to 100, inclusive). All devices support 100% (maximum brightness) and 0% (blank screen). Some devices also support dimming values in between these limits. In all cases the device driver (the Service Object) maps the requested brightness value to the closest value supported by the Hardware device. 
     * 
     * The default value of this property is 100.
     * 
     * Changes to this property are committed to the device on the next call to [ClaimedLineDisplay.TryUpdateAttributesAsync(LineDisplayAttributes)](claimedlinedisplay_tryupdateattributesasync_1303674463.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplayattributes.brightness
     * @type {Integer} 
     */
    Brightness {
        get => this.get_Brightness()
        set => this.put_Brightness(value)
    }

    /**
     * Gets or sets the blink rate of the line display.
     * @remarks
     * When the device supports blinking ([LineDisplayCapabilities.CanBlink](LineDisplayCapabilities_CanBlink.md) is not NotSupported) this writeable property configures the current blink cycle time. A blink cycle is the period of time when text completes an on-off-on cycle during blinking. After this property is set, the device driver (the Service Object) typically sets the blink rate to the closest supported rate.
     * 
     * When the device does not support blinking ([LineDisplayCapabilities.CanBlink](LineDisplayCapabilities_CanBlink.md) is NotSupported) this property is fixed to a value of 0 and cannot be changed.
     * 
     * The default value of this property is 0.
     * 
     * Changes to this property are committed to the device on the next call of [ClaimedLineDisplay.TryUpdateAttributesAsync(LineDisplayAttributes)](claimedlinedisplay_tryupdateattributesasync_1303674463.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplayattributes.blinkrate
     * @type {TimeSpan} 
     */
    BlinkRate {
        get => this.get_BlinkRate()
        set => this.put_BlinkRate(value)
    }

    /**
     * Gets or sets the current screen size.
     * @remarks
     * When the device supports multiple screen sizes ([LineDisplayCapabilities.CanChangeScreenSize](linedisplaycapabilities_canchangescreensize.md) is True) this writeable property configures the current screen size. When bitmaps are also supported, changing the ScreenSizeinCharacters property may cause MaxBitmapSize to change to a new value.
     * 
     * When the device supports only one screen size ([LineDisplayCapabilities.CanChangeScreenSize](linedisplaycapabilities_canchangescreensize.md) is False) this property supports only one value, behaving as a read-only property.
     * 
     * Changes to this property are committed to the device on the next call to [ClaimedLineDisplay.TryUpdateAttributesAsync(LineDisplayAttributes)](claimedlinedisplay_tryupdateattributesasync_1303674463.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplayattributes.screensizeincharacters
     * @type {SIZE} 
     */
    ScreenSizeInCharacters {
        get => this.get_ScreenSizeInCharacters()
        set => this.put_ScreenSizeInCharacters(value)
    }

    /**
     * Gets or sets the current character set used by the device to display characters.
     * @remarks
     * Valid values for this property are the values stored in [ClaimedLineDisplay.SupportedCharacterSets](ClaimedLineDisplay_SupportedCharacterSets.md).
     * 
     * Changes to this property are committed to the device on the next call to [ClaimedLineDisplay.TryUpdateAttributesAsync(LineDisplayAttributes)](claimedlinedisplay_tryupdateattributesasync_1303674463.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplayattributes.characterset
     * @type {Integer} 
     */
    CharacterSet {
        get => this.get_CharacterSet()
        set => this.put_CharacterSet(value)
    }

    /**
     * Gets or sets whether character set mapping is enabled.
     * @remarks
     * When [LineDisplayCapabilities.CanMapCharacterSets](linedisplaycapabilities_canmapcharactersets.md) is True, this writeable property controls whether character mapping is enabled. When character mapping is enabled, characters sent by the application are mapped by the device driver/the Service Object to the characters supported by the device.
     * 
     * When [LineDisplayCapabilities.CanMapCharacterSets](linedisplaycapabilities_canmapcharactersets.md) is False the value of this property is fixed to False and cannot be changed.
     * 
     * Changes to this property are committed to the device on the next call to [ClaimedLineDisplay.TryUpdateAttributesAsync(LineDisplayAttributes)](claimedlinedisplay_tryupdateattributesasync_1303674463.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplayattributes.ischaractersetmappingenabled
     * @type {Boolean} 
     */
    IsCharacterSetMappingEnabled {
        get => this.get_IsCharacterSetMappingEnabled()
        set => this.put_IsCharacterSetMappingEnabled(value)
    }

    /**
     * Gets or sets the current window to which text is displayed.
     * @remarks
     * Setting the current window does not refresh that window's viewport. If the viewports of the current window and another window overlap, and the other window has changed content within the viewport, then refreshWindow may be called to restore the window's viewport contents.
     * 
     * Changes to this property are committed to the device on the next call to [ClaimedLineDisplay.TryUpdateAttributesAsync(LineDisplayAttributes)](claimedlinedisplay_tryupdateattributesasync_1303674463.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplayattributes.currentwindow
     * @type {LineDisplayWindow} 
     */
    CurrentWindow {
        get => this.get_CurrentWindow()
        set => this.put_CurrentWindow(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPowerNotifyEnabled() {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.get_IsPowerNotifyEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPowerNotifyEnabled(value) {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.put_IsPowerNotifyEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Brightness() {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.get_Brightness()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Brightness(value) {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.put_Brightness(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BlinkRate() {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.get_BlinkRate()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_BlinkRate(value) {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.put_BlinkRate(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_ScreenSizeInCharacters() {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.get_ScreenSizeInCharacters()
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_ScreenSizeInCharacters(value) {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.put_ScreenSizeInCharacters(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSet() {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.get_CharacterSet()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterSet(value) {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.put_CharacterSet(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCharacterSetMappingEnabled() {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.get_IsCharacterSetMappingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCharacterSetMappingEnabled(value) {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.put_IsCharacterSetMappingEnabled(value)
    }

    /**
     * 
     * @returns {LineDisplayWindow} 
     */
    get_CurrentWindow() {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.get_CurrentWindow()
    }

    /**
     * 
     * @param {LineDisplayWindow} value 
     * @returns {HRESULT} 
     */
    put_CurrentWindow(value) {
        if (!this.HasProp("__ILineDisplayAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayAttributes := ILineDisplayAttributes(outPtr)
        }

        return this.__ILineDisplayAttributes.put_CurrentWindow(value)
    }

;@endregion Instance Methods
}
