#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDigitalWindowCapability.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the digital window capture capabilities of the capture device.
 * @remarks
 * Get an instance of this class by calling [GetCapabilityForSize](digitalwindowcontrol_getcapabilityforsize_1381309850.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcapability
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class DigitalWindowCapability extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDigitalWindowCapability

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDigitalWindowCapability.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the width of the capture resolution for which the capabilities are supported.
     * @remarks
     * The [DigitalWindowControl.SupportedCapabilities](digitalwindowcontrol_supportedcapabilities.md) method returns a list of capabilities supported for different capture resolutions. [GetCapabilitiyForSize](digitalwindowcontrol_getcapabilityforsize_1381309850.md) gets the capabilities for a specific capture resolution.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcapability.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the height of the capture resolution for which the capabilities are supported.
     * @remarks
     * The [DigitalWindowControl.SupportedCapabilities](digitalwindowcontrol_supportedcapabilities.md) method returns a list of capabilities supported for different capture resolutions. [GetCapabilitiyForSize](digitalwindowcontrol_getcapabilityforsize_1381309850.md) gets the capabilities for a specific capture resolution.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcapability.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets the minimum scale value supported by the capture device for digital window capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcapability.minscalevalue
     * @type {Float} 
     */
    MinScaleValue {
        get => this.get_MinScaleValue()
    }

    /**
     * Gets the maximum scale value supported by the capture device for digital window capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcapability.maxscalevalue
     * @type {Float} 
     */
    MaxScaleValue {
        get => this.get_MaxScaleValue()
    }

    /**
     * Gets the minimum scale value supported by the capture device for digital window capture that doesn't require the captured pixels to be upsampled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcapability.minscalevaluewithoutupsampling
     * @type {Float} 
     */
    MinScaleValueWithoutUpsampling {
        get => this.get_MinScaleValueWithoutUpsampling()
    }

    /**
     * Gets a normalized rectangle representing the field of view limit of the capture device.
     * @remarks
     * Since the digital window field of view is a subset of the field of view that the sensor can see, these values are likely to be outside the bounds of 0 and 1, for example (-.5, -.5, 1.5, 1.5).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcapability.normalizedfieldofviewlimit
     * @type {RECT} 
     */
    NormalizedFieldOfViewLimit {
        get => this.get_NormalizedFieldOfViewLimit()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IDigitalWindowCapability")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowCapability := IDigitalWindowCapability(outPtr)
        }

        return this.__IDigitalWindowCapability.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IDigitalWindowCapability")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowCapability := IDigitalWindowCapability(outPtr)
        }

        return this.__IDigitalWindowCapability.get_Height()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinScaleValue() {
        if (!this.HasProp("__IDigitalWindowCapability")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowCapability := IDigitalWindowCapability(outPtr)
        }

        return this.__IDigitalWindowCapability.get_MinScaleValue()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxScaleValue() {
        if (!this.HasProp("__IDigitalWindowCapability")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowCapability := IDigitalWindowCapability(outPtr)
        }

        return this.__IDigitalWindowCapability.get_MaxScaleValue()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinScaleValueWithoutUpsampling() {
        if (!this.HasProp("__IDigitalWindowCapability")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowCapability := IDigitalWindowCapability(outPtr)
        }

        return this.__IDigitalWindowCapability.get_MinScaleValueWithoutUpsampling()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_NormalizedFieldOfViewLimit() {
        if (!this.HasProp("__IDigitalWindowCapability")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowCapability := IDigitalWindowCapability(outPtr)
        }

        return this.__IDigitalWindowCapability.get_NormalizedFieldOfViewLimit()
    }

;@endregion Instance Methods
}
