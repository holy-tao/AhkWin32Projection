#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameControlCapabilities.ahk
#Include .\IFrameControlCapabilities2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the variable photo sequence capabilities of the capture device.
 * @remarks
 * Get an instance of this class by accessing the [FrameCapabilities](variablephotosequencecontroller_framecapabilities.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontrolcapabilities
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameControlCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameControlCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameControlCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the exposure capabilities of the capture device for variable photo sequences.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontrolcapabilities.exposure
     * @type {FrameExposureCapabilities} 
     */
    Exposure {
        get => this.get_Exposure()
    }

    /**
     * Gets the exposure compensation capabilities of the capture device for variable photo sequences.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontrolcapabilities.exposurecompensation
     * @type {FrameExposureCompensationCapabilities} 
     */
    ExposureCompensation {
        get => this.get_ExposureCompensation()
    }

    /**
     * Gets the ISO speed capabilities of the capture device for variable photo sequences.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontrolcapabilities.isospeed
     * @type {FrameIsoSpeedCapabilities} 
     */
    IsoSpeed {
        get => this.get_IsoSpeed()
    }

    /**
     * Gets the focus capabilities of the capture device for variable photo sequences.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontrolcapabilities.focus
     * @type {FrameFocusCapabilities} 
     */
    Focus {
        get => this.get_Focus()
    }

    /**
     * Gets whether the capture device supports photo confirmation for variable photo sequences.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontrolcapabilities.photoconfirmationsupported
     * @type {Boolean} 
     */
    PhotoConfirmationSupported {
        get => this.get_PhotoConfirmationSupported()
    }

    /**
     * Gets the flash capabilities of the capture device for variable photo sequences.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontrolcapabilities.flash
     * @type {FrameFlashCapabilities} 
     */
    Flash {
        get => this.get_Flash()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {FrameExposureCapabilities} 
     */
    get_Exposure() {
        if (!this.HasProp("__IFrameControlCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameControlCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameControlCapabilities := IFrameControlCapabilities(outPtr)
        }

        return this.__IFrameControlCapabilities.get_Exposure()
    }

    /**
     * 
     * @returns {FrameExposureCompensationCapabilities} 
     */
    get_ExposureCompensation() {
        if (!this.HasProp("__IFrameControlCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameControlCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameControlCapabilities := IFrameControlCapabilities(outPtr)
        }

        return this.__IFrameControlCapabilities.get_ExposureCompensation()
    }

    /**
     * 
     * @returns {FrameIsoSpeedCapabilities} 
     */
    get_IsoSpeed() {
        if (!this.HasProp("__IFrameControlCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameControlCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameControlCapabilities := IFrameControlCapabilities(outPtr)
        }

        return this.__IFrameControlCapabilities.get_IsoSpeed()
    }

    /**
     * 
     * @returns {FrameFocusCapabilities} 
     */
    get_Focus() {
        if (!this.HasProp("__IFrameControlCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameControlCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameControlCapabilities := IFrameControlCapabilities(outPtr)
        }

        return this.__IFrameControlCapabilities.get_Focus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PhotoConfirmationSupported() {
        if (!this.HasProp("__IFrameControlCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameControlCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameControlCapabilities := IFrameControlCapabilities(outPtr)
        }

        return this.__IFrameControlCapabilities.get_PhotoConfirmationSupported()
    }

    /**
     * 
     * @returns {FrameFlashCapabilities} 
     */
    get_Flash() {
        if (!this.HasProp("__IFrameControlCapabilities2")) {
            if ((queryResult := this.QueryInterface(IFrameControlCapabilities2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameControlCapabilities2 := IFrameControlCapabilities2(outPtr)
        }

        return this.__IFrameControlCapabilities2.get_Flash()
    }

;@endregion Instance Methods
}
