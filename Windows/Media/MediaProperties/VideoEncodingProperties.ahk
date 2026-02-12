#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoEncodingProperties.ahk
#Include .\IMediaEncodingProperties.ahk
#Include .\IVideoEncodingProperties2.ahk
#Include .\IVideoEncodingProperties3.ahk
#Include .\IVideoEncodingProperties4.ahk
#Include .\IVideoEncodingProperties5.ahk
#Include .\IVideoEncodingPropertiesStatics3.ahk
#Include .\IVideoEncodingPropertiesStatics2.ahk
#Include .\IVideoEncodingPropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the encoding properties of a video stream.
 * @remarks
 * Properties that are manually set are ignored for [VideoEncodingProperties](videoencodingproperties_videoencodingproperties_1221375020.md) created from one of the presets encoding profiles: [CreateH264](videoencodingproperties_createh264_510168634.md) and [CreateMpeg2](videoencodingproperties_creatempeg2_1881310423.md).
 * 
 * The encoding quality **Auto** is a special preset that fills in the proper settings based on the current camera settings. Settings that are manually modified are ignored. For example, if you create a preset profile using one the static create methods, such as [CreateM4a](mediaencodingprofile_createm4a_1230065862.md), and specify **Auto** as the encoding quality, any changes you make to the properties will be overwritten with values based on the current camera settings.
 * 
 * > [!NOTE]
 * > It is possible to create an **VideoEncodingProperties** that is not supported on a particular device. For example, you may successfully call [CreateH264](videoencodingproperties_createh264_510168634.md), but if an h264 encoder is not present on the device, attempting to encode video with the properties returned from this method will fail. For a list of the codecs present by default for each device family, see [Supported codecs.](/windows/uwp/audio-video-camera/supported-codecs).
 * 
 * For how-to guidance for setting the encoding properties for captured video, see [Basic photo, video, and audio capture with MediaCapture](/windows/uwp/audio-video-camera/basic-photo-video-and-audio-capture-with-mediacapture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class VideoEncodingProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoEncodingProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoEncodingProperties.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [VideoEncodingProperties](videoencodingproperties.md) for a VP9 video.
     * @returns {VideoEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.createvp9
     */
    static CreateVp9() {
        if (!VideoEncodingProperties.HasProp("__IVideoEncodingPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.VideoEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoEncodingPropertiesStatics3.IID)
            VideoEncodingProperties.__IVideoEncodingPropertiesStatics3 := IVideoEncodingPropertiesStatics3(factoryPtr)
        }

        return VideoEncodingProperties.__IVideoEncodingPropertiesStatics3.CreateVp9()
    }

    /**
     * Creates an instance of [VideoEncodingProperties](videoencodingproperties.md) for an AOMedia Video 1 (AV1) video.
     * @returns {VideoEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.createav1
     */
    static CreateAv1() {
        if (!VideoEncodingProperties.HasProp("__IVideoEncodingPropertiesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.VideoEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoEncodingPropertiesStatics3.IID)
            VideoEncodingProperties.__IVideoEncodingPropertiesStatics3 := IVideoEncodingPropertiesStatics3(factoryPtr)
        }

        return VideoEncodingProperties.__IVideoEncodingPropertiesStatics3.CreateAv1()
    }

    /**
     * Creates an instance of [VideoEncodingProperties](videoencodingproperties.md) for High Efficiency Video Coding (HEVC).
     * @returns {VideoEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.createhevc
     */
    static CreateHevc() {
        if (!VideoEncodingProperties.HasProp("__IVideoEncodingPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.VideoEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoEncodingPropertiesStatics2.IID)
            VideoEncodingProperties.__IVideoEncodingPropertiesStatics2 := IVideoEncodingPropertiesStatics2(factoryPtr)
        }

        return VideoEncodingProperties.__IVideoEncodingPropertiesStatics2.CreateHevc()
    }

    /**
     * Creates an instance of [VideoEncodingProperties](videoencodingproperties.md) for a H.264 video.
     * @returns {VideoEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.createh264
     */
    static CreateH264() {
        if (!VideoEncodingProperties.HasProp("__IVideoEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.VideoEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoEncodingPropertiesStatics.IID)
            VideoEncodingProperties.__IVideoEncodingPropertiesStatics := IVideoEncodingPropertiesStatics(factoryPtr)
        }

        return VideoEncodingProperties.__IVideoEncodingPropertiesStatics.CreateH264()
    }

    /**
     * Creates an instance of [VideoEncodingProperties](videoencodingproperties.md) for a MPEG-2 video.
     * @returns {VideoEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.creatempeg2
     */
    static CreateMpeg2() {
        if (!VideoEncodingProperties.HasProp("__IVideoEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.VideoEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoEncodingPropertiesStatics.IID)
            VideoEncodingProperties.__IVideoEncodingPropertiesStatics := IVideoEncodingPropertiesStatics(factoryPtr)
        }

        return VideoEncodingProperties.__IVideoEncodingPropertiesStatics.CreateMpeg2()
    }

    /**
     * Creates an instance of [VideoEncodingProperties](videoencodingproperties.md) for a uncompressed video.
     * @param {HSTRING} subtype The media subtype of the format.
     * @param {Integer} width The video image width.
     * @param {Integer} height The video image height.
     * @returns {VideoEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.createuncompressed
     */
    static CreateUncompressed(subtype, width, height) {
        if (!VideoEncodingProperties.HasProp("__IVideoEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.VideoEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoEncodingPropertiesStatics.IID)
            VideoEncodingProperties.__IVideoEncodingPropertiesStatics := IVideoEncodingPropertiesStatics(factoryPtr)
        }

        return VideoEncodingProperties.__IVideoEncodingPropertiesStatics.CreateUncompressed(subtype, width, height)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the video bit rate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.bitrate
     * @type {Integer} 
     */
    Bitrate {
        get => this.get_Bitrate()
        set => this.put_Bitrate(value)
    }

    /**
     * Gets or sets the video image width.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * Gets or sets the video image height.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
        set => this.put_Height(value)
    }

    /**
     * Gets or sets the video frame rate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.framerate
     * @type {MediaRatio} 
     */
    FrameRate {
        get => this.get_FrameRate()
    }

    /**
     * Gets or sets the pixel aspect ratio.
     * @remarks
     * The pixel aspect ratio describes the shape of the pixels in the displayed video image. For square pixels, the pixel aspect ratio is 1:1.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.pixelaspectratio
     * @type {MediaRatio} 
     */
    PixelAspectRatio {
        get => this.get_PixelAspectRatio()
    }

    /**
     * Gets additional format properties for the video stream.
     * @remarks
     * For information on working with a property set collection, see [PropertySet](../windows.foundation.collections/propertyset.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.properties
     * @type {MediaPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the format type.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets or sets the subtype of the format.
     * @remarks
     * The value can be the string representation of a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) in canonical form, or one of the predefined values listed in the following table.<table>
     *    <tr><th>Value</th><th>Description</th></tr>
     *    <tr><td>"ARGB32"</td><td>RGB, 32 bpp with alpha channel.</td></tr>
     *    <tr><td>"BGRA8"</td><td>BGRA, 32 bpp with alpha channel.</td></tr>
     *    <tr><td>"D16"</td><td>16-bit z-buffer depth</td></tr>
     *    <tr><td>"H263"</td><td>H.263 video</td></tr>
     *    <tr><td>"H264"</td><td>H.264 video</td></tr>
     *    <tr><td>"H264ES"</td><td>H.264 elementary stream</td></tr>
     *    <tr><td>"HEVC"</td><td>HEVC video</td></tr>
     *    <tr><td>"HEVCES"</td><td>HEVT elementary stream</td></tr>
     *    <tr><td>"IYUV"</td><td>YUV 8 bpp 4:2:0</td></tr>
     *    <tr><td>"L8"</td><td>8-bit luminance only.</td></tr>
     *    <tr><td>"L16"</td><td>16-bit luminance only.</td></tr>
     *    <tr><td>"MJPG"</td><td>Motion jpeg</td></tr>
     *    <tr><td>"NV12"</td><td>YUV 8 bpp 4:2:0</td></tr>
     *    <tr><td>"MPEG1"</td><td>MPEG-1 video</td></tr>
     *    <tr><td>"MPEG2"</td><td>MPEG-2 video</td></tr>
     *    <tr><td>"RGB24"</td><td>RGB, 24 bpp</td></tr>
     *    <tr><td>"RGB32"</td><td>RGB, 32 bpp</td></tr>
     *    <tr><td>"WMV3"</td><td>Windows Media Video 9 codec</td></tr>
     *    <tr><td>"WVC1"</td><td>SMPTE 421M ("VC-1") codec</td></tr>
     *    <tr><td>"VP9"</td><td>VP9 video</td></tr>
     *    <tr><td>"YUY2"</td><td>YUV 8 bpp 4:2:2</td></tr>
     *    <tr><td>"YV12"</td><td>YUV 8 bpp 4:2:0</td></tr>
     * </table>
     * 
     * > [!WARNING]
     * > The string values returned by the [MediaEncodingSubtypes](mediaencodingsubtypes.md) properties may not use the same letter casing as [AudioEncodingProperties.Subtype](audioencodingproperties_subtype.md), VideoEncodingProperties.Subtype, [ContainerEncodingProperties.Subtype](containerencodingproperties_subtype.md), and [ImageEncodingProperties.Subtype](imageencodingproperties_subtype.md). For this reason, if you compare the values, you should use a case-insensitive comparison or use hardcoded strings that match the casing returned by the encoding properties.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.subtype
     * @type {HSTRING} 
     */
    Subtype {
        get => this.get_Subtype()
        set => this.put_Subtype(value)
    }

    /**
     * Gets or sets the media format profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.profileid
     * @type {Integer} 
     */
    ProfileId {
        get => this.get_ProfileId()
        set => this.put_ProfileId(value)
    }

    /**
     * Gets a value indicating the stereoscopic video packing mode of the video stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.stereoscopicvideopackingmode
     * @type {Integer} 
     */
    StereoscopicVideoPackingMode {
        get => this.get_StereoscopicVideoPackingMode()
    }

    /**
     * Gets a value that specifies the spherical video format of a video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.sphericalvideoframeformat
     * @type {Integer} 
     */
    SphericalVideoFrameFormat {
        get => this.get_SphericalVideoFrameFormat()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [VideoEncodingProperties](videoencodingproperties.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.VideoEncodingProperties")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Bitrate(value) {
        if (!this.HasProp("__IVideoEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties := IVideoEncodingProperties(outPtr)
        }

        return this.__IVideoEncodingProperties.put_Bitrate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bitrate() {
        if (!this.HasProp("__IVideoEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties := IVideoEncodingProperties(outPtr)
        }

        return this.__IVideoEncodingProperties.get_Bitrate()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Width(value) {
        if (!this.HasProp("__IVideoEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties := IVideoEncodingProperties(outPtr)
        }

        return this.__IVideoEncodingProperties.put_Width(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IVideoEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties := IVideoEncodingProperties(outPtr)
        }

        return this.__IVideoEncodingProperties.get_Width()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Height(value) {
        if (!this.HasProp("__IVideoEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties := IVideoEncodingProperties(outPtr)
        }

        return this.__IVideoEncodingProperties.put_Height(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IVideoEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties := IVideoEncodingProperties(outPtr)
        }

        return this.__IVideoEncodingProperties.get_Height()
    }

    /**
     * 
     * @returns {MediaRatio} 
     */
    get_FrameRate() {
        if (!this.HasProp("__IVideoEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties := IVideoEncodingProperties(outPtr)
        }

        return this.__IVideoEncodingProperties.get_FrameRate()
    }

    /**
     * 
     * @returns {MediaRatio} 
     */
    get_PixelAspectRatio() {
        if (!this.HasProp("__IVideoEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties := IVideoEncodingProperties(outPtr)
        }

        return this.__IVideoEncodingProperties.get_PixelAspectRatio()
    }

    /**
     * 
     * @returns {MediaPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.get_Properties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.get_Type()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subtype(value) {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.put_Subtype(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtype() {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.get_Subtype()
    }

    /**
     * Sets the media format user data.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The media data to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.setformatuserdata
     */
    SetFormatUserData(value_length, value) {
        if (!this.HasProp("__IVideoEncodingProperties2")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties2 := IVideoEncodingProperties2(outPtr)
        }

        return this.__IVideoEncodingProperties2.SetFormatUserData(value_length, value)
    }

    /**
     * Gets the media format user data.
     * @param {Pointer<Byte>} value Receives the media format data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.getformatuserdata
     */
    GetFormatUserData(value) {
        if (!this.HasProp("__IVideoEncodingProperties2")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties2 := IVideoEncodingProperties2(outPtr)
        }

        return this.__IVideoEncodingProperties2.GetFormatUserData(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProfileId(value) {
        if (!this.HasProp("__IVideoEncodingProperties2")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties2 := IVideoEncodingProperties2(outPtr)
        }

        return this.__IVideoEncodingProperties2.put_ProfileId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProfileId() {
        if (!this.HasProp("__IVideoEncodingProperties2")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties2 := IVideoEncodingProperties2(outPtr)
        }

        return this.__IVideoEncodingProperties2.get_ProfileId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StereoscopicVideoPackingMode() {
        if (!this.HasProp("__IVideoEncodingProperties3")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties3 := IVideoEncodingProperties3(outPtr)
        }

        return this.__IVideoEncodingProperties3.get_StereoscopicVideoPackingMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SphericalVideoFrameFormat() {
        if (!this.HasProp("__IVideoEncodingProperties4")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties4 := IVideoEncodingProperties4(outPtr)
        }

        return this.__IVideoEncodingProperties4.get_SphericalVideoFrameFormat()
    }

    /**
     * Creates a copy of the **VideoEncodingProperties** object.
     * @returns {VideoEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingproperties.copy
     */
    Copy() {
        if (!this.HasProp("__IVideoEncodingProperties5")) {
            if ((queryResult := this.QueryInterface(IVideoEncodingProperties5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEncodingProperties5 := IVideoEncodingProperties5(outPtr)
        }

        return this.__IVideoEncodingProperties5.Copy()
    }

;@endregion Instance Methods
}
