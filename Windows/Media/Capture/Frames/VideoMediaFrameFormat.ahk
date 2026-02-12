#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoMediaFrameFormat.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes the image format of a [VideoMediaFrame](videomediaframe.md).
 * @remarks
 * Get an instance of this class by accessing the [MediaFrameFormat.VideoFormat](mediaframeformat_videoformat.md), [VideoMediaFrame.VideoFormat](videomediaframe_videoformat.md), or [DepthMediaFrame.VideoFormat](depthmediaframeformat_videoformat.md) property.
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframeformat
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class VideoMediaFrameFormat extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoMediaFrameFormat

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoMediaFrameFormat.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object that provides information about the format of the media frame that is not specific to video frames.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframeformat.mediaframeformat
     * @type {MediaFrameFormat} 
     */
    MediaFrameFormat {
        get => this.get_MediaFrameFormat()
    }

    /**
     * Gets an object that describes the format of the depth data in a video media frame, if the frame contains depth data.
     * @remarks
     * If the video media frame does not contain depth data, this property is null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframeformat.depthformat
     * @type {DepthMediaFrameFormat} 
     */
    DepthFormat {
        get => this.get_DepthFormat()
    }

    /**
     * Gets the width of the video media frame, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframeformat.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the height of the video media frame, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.videomediaframeformat.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaFrameFormat} 
     */
    get_MediaFrameFormat() {
        if (!this.HasProp("__IVideoMediaFrameFormat")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrameFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrameFormat := IVideoMediaFrameFormat(outPtr)
        }

        return this.__IVideoMediaFrameFormat.get_MediaFrameFormat()
    }

    /**
     * 
     * @returns {DepthMediaFrameFormat} 
     */
    get_DepthFormat() {
        if (!this.HasProp("__IVideoMediaFrameFormat")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrameFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrameFormat := IVideoMediaFrameFormat(outPtr)
        }

        return this.__IVideoMediaFrameFormat.get_DepthFormat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IVideoMediaFrameFormat")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrameFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrameFormat := IVideoMediaFrameFormat(outPtr)
        }

        return this.__IVideoMediaFrameFormat.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IVideoMediaFrameFormat")) {
            if ((queryResult := this.QueryInterface(IVideoMediaFrameFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoMediaFrameFormat := IVideoMediaFrameFormat(outPtr)
        }

        return this.__IVideoMediaFrameFormat.get_Height()
    }

;@endregion Instance Methods
}
