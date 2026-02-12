#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaFrameFormat.ahk
#Include .\IMediaFrameFormat2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes the format of a media frame obtained from a [MediaFrameSource](mediaframesource.md) and represented by a [MediaFrameReference](mediaframereference.md).
 * @remarks
 * The [MediaFrameSource](mediaframesource.md) class uses this object to specify the current format of the media frames it generates. Get the current format of a media frame source by accessing the [CurrentFormat](mediaframesource_currentformat.md) property. Set the current format of a media frame source by calling [SetFormatAsync](mediaframesource_setformatasync_966320450.md).
 * 
 * Get the format of a media frame represented by a [MediaFrameReference](mediaframereference.md) by accessing the [Format](mediaframereference_format.md) property.
 * 
 * Get the format of a video frame represented by a [VideoMediaFrame](videomediaframe.md) by accessing the [VideoFormat](depthmediaframeformat_videoformat.md) property and then using the returned object's MediaFrameFormat property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframeformat
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameFormat extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaFrameFormat

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaFrameFormat.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a string identifying the major type of a media frame.
     * @remarks
     * The value of this property is one of the following strings:<table>
     *    <tr><td>"audio"</td><td>The frame contains audio data.</td></tr>
     *    <tr><td>"video"</td><td>The frame contains video data, which may represent color, depth, infrared, or other content.</td></tr>
     *    <tr><td>"perception"</td><td>The frame contains perception data such as skeletal or facial data.</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframeformat.majortype
     * @type {HSTRING} 
     */
    MajorType {
        get => this.get_MajorType()
    }

    /**
     * Gets a string identifying the subtype of a media frame.
     * @remarks
     * The value of this property is one of the strings defined by the properties of the [MediaEncodingSubtypes](../windows.media.mediaproperties/mediaencodingsubtypes.md) class. If the friendly name for the subtype can't be found, the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the subtype is returned in plain-text format.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframeformat.subtype
     * @type {HSTRING} 
     */
    Subtype {
        get => this.get_Subtype()
    }

    /**
     * Gets the frame rate of the media frame.
     * @remarks
     * The frame rate is expressed as a ratio. For example, if the frame rate is 30 frames per second (fps), the ratio is 30/1. If the frame rate is 29.97 fps, the ratio is 30,000/1001.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframeformat.framerate
     * @type {MediaRatio} 
     */
    FrameRate {
        get => this.get_FrameRate()
    }

    /**
     * Gets a map of properties for the frame format.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframeformat.properties
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets an object describing the image format of a video media frame.
     * @remarks
     * If a media frame does not contain video data, such as a [BufferMediaFrame](buffermediaframe.md), this property is null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframeformat.videoformat
     * @type {VideoMediaFrameFormat} 
     */
    VideoFormat {
        get => this.get_VideoFormat()
    }

    /**
     * Gets an [AudioEncodingProperties](../windows.media.mediaproperties/audioencodingproperties.md) object that provides information about the audio data in an audio frame. This includes information like the bitrate, sample rate, and channel count of the audio data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframeformat.audioencodingproperties
     * @type {AudioEncodingProperties} 
     */
    AudioEncodingProperties {
        get => this.get_AudioEncodingProperties()
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
    get_MajorType() {
        if (!this.HasProp("__IMediaFrameFormat")) {
            if ((queryResult := this.QueryInterface(IMediaFrameFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameFormat := IMediaFrameFormat(outPtr)
        }

        return this.__IMediaFrameFormat.get_MajorType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtype() {
        if (!this.HasProp("__IMediaFrameFormat")) {
            if ((queryResult := this.QueryInterface(IMediaFrameFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameFormat := IMediaFrameFormat(outPtr)
        }

        return this.__IMediaFrameFormat.get_Subtype()
    }

    /**
     * 
     * @returns {MediaRatio} 
     */
    get_FrameRate() {
        if (!this.HasProp("__IMediaFrameFormat")) {
            if ((queryResult := this.QueryInterface(IMediaFrameFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameFormat := IMediaFrameFormat(outPtr)
        }

        return this.__IMediaFrameFormat.get_FrameRate()
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IMediaFrameFormat")) {
            if ((queryResult := this.QueryInterface(IMediaFrameFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameFormat := IMediaFrameFormat(outPtr)
        }

        return this.__IMediaFrameFormat.get_Properties()
    }

    /**
     * 
     * @returns {VideoMediaFrameFormat} 
     */
    get_VideoFormat() {
        if (!this.HasProp("__IMediaFrameFormat")) {
            if ((queryResult := this.QueryInterface(IMediaFrameFormat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameFormat := IMediaFrameFormat(outPtr)
        }

        return this.__IMediaFrameFormat.get_VideoFormat()
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    get_AudioEncodingProperties() {
        if (!this.HasProp("__IMediaFrameFormat2")) {
            if ((queryResult := this.QueryInterface(IMediaFrameFormat2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameFormat2 := IMediaFrameFormat2(outPtr)
        }

        return this.__IMediaFrameFormat2.get_AudioEncodingProperties()
    }

;@endregion Instance Methods
}
