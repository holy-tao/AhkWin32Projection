#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDepthMediaFrameFormat.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes the format of a [DepthMediaFrame](depthmediaframe.md).
 * @remarks
 * Get an instance of this class by accessing the [DepthFormat](depthmediaframe_depthformat.md) property of a [DepthMediaFrame](depthmediaframe.md) object.
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.depthmediaframeformat
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class DepthMediaFrameFormat extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDepthMediaFrameFormat

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDepthMediaFrameFormat.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [VideoMediaFrameFormat](videomediaframeformat.md) object that describes the non-depth-specific format of a [DepthMediaFrame](depthmediaframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.depthmediaframeformat.videoformat
     * @type {VideoMediaFrameFormat} 
     */
    VideoFormat {
        get => this.get_VideoFormat()
    }

    /**
     * Gets the scale of the depth values in a [DepthMediaFrame](depthmediaframe.md), in meters.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.depthmediaframeformat.depthscaleinmeters
     * @type {Float} 
     */
    DepthScaleInMeters {
        get => this.get_DepthScaleInMeters()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {VideoMediaFrameFormat} 
     */
    get_VideoFormat() {
        if (!this.HasProp("__IDepthMediaFrameFormat")) {
            if ((queryResult := this.QueryInterface(IDepthMediaFrameFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthMediaFrameFormat := IDepthMediaFrameFormat(outPtr)
        }

        return this.__IDepthMediaFrameFormat.get_VideoFormat()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DepthScaleInMeters() {
        if (!this.HasProp("__IDepthMediaFrameFormat")) {
            if ((queryResult := this.QueryInterface(IDepthMediaFrameFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthMediaFrameFormat := IDepthMediaFrameFormat(outPtr)
        }

        return this.__IDepthMediaFrameFormat.get_DepthScaleInMeters()
    }

;@endregion Instance Methods
}
