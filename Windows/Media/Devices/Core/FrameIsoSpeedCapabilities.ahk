#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameIsoSpeedCapabilities.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the ISO speed capabilities of the capture device for frames in a variable photo sequences.
 * @remarks
 * Get an instance of this class by accessing the [IsoSpeed](framecontrolcapabilities_isospeed.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameisospeedcapabilities
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameIsoSpeedCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameIsoSpeedCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameIsoSpeedCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the capture device supports the ISO speed control for frames in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameisospeedcapabilities.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * The minimum ISO speed supported by the capture device for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameisospeedcapabilities.min
     * @type {Integer} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * Gets the maximum ISO speed supported by the capture device for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameisospeedcapabilities.max
     * @type {Integer} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Gets the smallest ISO speed increment supported by the capture device for a frame in a variable photo sequence, specified in millimeters.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameisospeedcapabilities.step
     * @type {Integer} 
     */
    Step {
        get => this.get_Step()
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
    get_Supported() {
        if (!this.HasProp("__IFrameIsoSpeedCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameIsoSpeedCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameIsoSpeedCapabilities := IFrameIsoSpeedCapabilities(outPtr)
        }

        return this.__IFrameIsoSpeedCapabilities.get_Supported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Min() {
        if (!this.HasProp("__IFrameIsoSpeedCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameIsoSpeedCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameIsoSpeedCapabilities := IFrameIsoSpeedCapabilities(outPtr)
        }

        return this.__IFrameIsoSpeedCapabilities.get_Min()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Max() {
        if (!this.HasProp("__IFrameIsoSpeedCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameIsoSpeedCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameIsoSpeedCapabilities := IFrameIsoSpeedCapabilities(outPtr)
        }

        return this.__IFrameIsoSpeedCapabilities.get_Max()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Step() {
        if (!this.HasProp("__IFrameIsoSpeedCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameIsoSpeedCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameIsoSpeedCapabilities := IFrameIsoSpeedCapabilities(outPtr)
        }

        return this.__IFrameIsoSpeedCapabilities.get_Step()
    }

;@endregion Instance Methods
}
