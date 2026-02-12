#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameExposureCapabilities.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the exposure time capabilities of the capture device for frames in a variable photo sequences.
 * @remarks
 * Get an instance of this class by accessing the [Exposure](framecontrolcapabilities_exposure.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecapabilities
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameExposureCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameExposureCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameExposureCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the capture device supports the exposure control for variable photo sequences.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecapabilities.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the minimum exposure time supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecapabilities.min
     * @type {TimeSpan} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * Gets the maximum exposure time supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecapabilities.max
     * @type {TimeSpan} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Gets the smallest exposure time increment supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecapabilities.step
     * @type {TimeSpan} 
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
        if (!this.HasProp("__IFrameExposureCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameExposureCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureCapabilities := IFrameExposureCapabilities(outPtr)
        }

        return this.__IFrameExposureCapabilities.get_Supported()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Min() {
        if (!this.HasProp("__IFrameExposureCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameExposureCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureCapabilities := IFrameExposureCapabilities(outPtr)
        }

        return this.__IFrameExposureCapabilities.get_Min()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Max() {
        if (!this.HasProp("__IFrameExposureCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameExposureCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureCapabilities := IFrameExposureCapabilities(outPtr)
        }

        return this.__IFrameExposureCapabilities.get_Max()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Step() {
        if (!this.HasProp("__IFrameExposureCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameExposureCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureCapabilities := IFrameExposureCapabilities(outPtr)
        }

        return this.__IFrameExposureCapabilities.get_Step()
    }

;@endregion Instance Methods
}
