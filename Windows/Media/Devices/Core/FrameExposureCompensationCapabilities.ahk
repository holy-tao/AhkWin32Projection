#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameExposureCompensationCapabilities.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the exposure compensation capabilities of the capture device for frames in a variable photo sequences.
 * @remarks
 * Get an instance of this class by accessing the [ExposureCompensation](framecontrolcapabilities_exposurecompensation.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecompensationcapabilities
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameExposureCompensationCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameExposureCompensationCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameExposureCompensationCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the capture device supports the frame exposure compensation control for frames in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecompensationcapabilities.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the minimum exposure compensation supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecompensationcapabilities.min
     * @type {Float} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * Gets the maximum exposure compensation supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecompensationcapabilities.max
     * @type {Float} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Gets the smallest exposure time compensation increment supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecompensationcapabilities.step
     * @type {Float} 
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
        if (!this.HasProp("__IFrameExposureCompensationCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameExposureCompensationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureCompensationCapabilities := IFrameExposureCompensationCapabilities(outPtr)
        }

        return this.__IFrameExposureCompensationCapabilities.get_Supported()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Min() {
        if (!this.HasProp("__IFrameExposureCompensationCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameExposureCompensationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureCompensationCapabilities := IFrameExposureCompensationCapabilities(outPtr)
        }

        return this.__IFrameExposureCompensationCapabilities.get_Min()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Max() {
        if (!this.HasProp("__IFrameExposureCompensationCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameExposureCompensationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureCompensationCapabilities := IFrameExposureCompensationCapabilities(outPtr)
        }

        return this.__IFrameExposureCompensationCapabilities.get_Max()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Step() {
        if (!this.HasProp("__IFrameExposureCompensationCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameExposureCompensationCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureCompensationCapabilities := IFrameExposureCompensationCapabilities(outPtr)
        }

        return this.__IFrameExposureCompensationCapabilities.get_Step()
    }

;@endregion Instance Methods
}
