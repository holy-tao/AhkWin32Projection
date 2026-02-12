#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoStreamConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a set of input and output [VideoEncodingProperties](../windows.media.mediaproperties/videoencodingproperties.md) for a video stream
 * @remarks
 * This is a helper class that enables the bundling of two [VideoEncodingProperties](../windows.media.mediaproperties/videoencodingproperties.md), one for input and one for output, to represent a single video stream configuration. Get an instance of this class by calling [VideoStabilizationEffect.GetRecommendedStreamConfiguration](../windows.media.core/videostabilizationeffect_getrecommendedstreamconfiguration_282764984.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.videostreamconfiguration
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class VideoStreamConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoStreamConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoStreamConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [VideoEncodingProperties](../windows.media.mediaproperties/videoencodingproperties.md) object representing an video stream input configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.videostreamconfiguration.inputproperties
     * @type {VideoEncodingProperties} 
     */
    InputProperties {
        get => this.get_InputProperties()
    }

    /**
     * Gets a [VideoEncodingProperties](../windows.media.mediaproperties/videoencodingproperties.md) object representing an video stream output configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.videostreamconfiguration.outputproperties
     * @type {VideoEncodingProperties} 
     */
    OutputProperties {
        get => this.get_OutputProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    get_InputProperties() {
        if (!this.HasProp("__IVideoStreamConfiguration")) {
            if ((queryResult := this.QueryInterface(IVideoStreamConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoStreamConfiguration := IVideoStreamConfiguration(outPtr)
        }

        return this.__IVideoStreamConfiguration.get_InputProperties()
    }

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    get_OutputProperties() {
        if (!this.HasProp("__IVideoStreamConfiguration")) {
            if ((queryResult := this.QueryInterface(IVideoStreamConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoStreamConfiguration := IVideoStreamConfiguration(outPtr)
        }

        return this.__IVideoStreamConfiguration.get_OutputProperties()
    }

;@endregion Instance Methods
}
