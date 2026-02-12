#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaEncodingProfile.ahk
#Include .\IMediaEncodingProfile2.ahk
#Include .\IMediaEncodingProfile3.ahk
#Include .\IMediaEncodingProfileStatics4.ahk
#Include .\IMediaEncodingProfileStatics2.ahk
#Include .\IMediaEncodingProfileStatics3.ahk
#Include .\IMediaEncodingProfileStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the encoding profile for an audio or video file. The encoding profile includes descriptions of the audio and video encoding formats, and a description of the media container.
 * @remarks
 * The encoding quality **Auto** is a special preset that fills in the proper settings based on the current camera settings. Settings that are manually modified are ignored. For example, if you create a preset profile using one the static create methods, such as [CreateM4a](mediaencodingprofile_createm4a_1230065862.md), and specify **Auto** as the encoding quality, any changes you make to the properties will be overwritten with values based on the current camera settings.
 * 
 * > [!NOTE]
 * > It is possible to create a **MediaEncodingProfile** that is not supported on a particular device. For example, you may successfully call [CreateMp3](mediaencodingprofile_createmp3_1449480444.md), but if an mp3 encoder is not present on the device, attempting to encode audio with the properties returned from this method will fail. For a list of the codecs present by default for each device family, see [Supported codecs.](/windows/uwp/audio-video-camera/supported-codecs).
 * 
 * > [!NOTE]
 * > Only video encoding profile types support the encoding quality setting of Auto. Audio profiles don’t support this setting and will generate an error when the setting is used. For example: If you create a profile using [MediaEncodingProfile.CreateMp3](/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createmp3#Windows_Media_MediaProperties_MediaEncodingProfile_CreateMp3_Windows_Media_MediaProperties_AudioEncodingQuality_) with [AudioEncodingQuality.Auto](/uwp/api/windows.media.mediaproperties.audioencodingquality) and then call [PrepareStreamTranscodeAsync](/uwp/api/windows.media.transcoding.mediatranscoder.preparestreamtranscodeasync), you will receive a [NullReferenceException](/dotnet/api/system.nullreferenceexception?view=dotnet-uwp-10.0&preserve-view=true) error. In this case you will need to choose an encoding quality setting other than Auto to allow you to create a functional profile.
 * 
 * For how-to guidance for using **MediaEncodingProfile** to set the encoding properties for captured images, see [Basic photo, video, and audio capture with MediaCapture](/windows/uwp/audio-video-camera/basic-photo-video-and-audio-capture-with-mediacapture). For information on using **MediaEncodingProfile** when transcoding media files, see [Transcode media files](/windows/uwp/audio-video-camera/transcode-media-files).
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class MediaEncodingProfile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaEncodingProfile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaEncodingProfile.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an encoding profile for VP9 video.
     * @param {Integer} quality_ Specifies the video resolution of the profile.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createvp9
     */
    static CreateVp9(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics4.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics4 := IMediaEncodingProfileStatics4(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics4.CreateVp9(quality_)
    }

    /**
     * Creates an encoding profile for AOMedia Video 1 (AV1) video.
     * @param {Integer} quality_ Specifies the video resolution of the profile.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createav1
     */
    static CreateAv1(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics4.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics4 := IMediaEncodingProfileStatics4(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics4.CreateAv1(quality_)
    }

    /**
     * Creates an instance of [MediaEncodingProfile](mediaencodingprofile.md) for WAV
     * @param {Integer} quality_ The audio encoding quality.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createwav
     */
    static CreateWav(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics2.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics2 := IMediaEncodingProfileStatics2(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics2.CreateWav(quality_)
    }

    /**
     * Creates an instance of [MediaEncodingProfile](mediaencodingprofile.md) for AVI.
     * @remarks
     * The encoding quality **Auto** is a special preset that fills in the proper settings based on the current camera settings. Settings that are manually modified are ignored. For example, if you create a preset profile using one the static create methods, such as [CreateM4a](mediaencodingprofile_createm4a_1230065862.md), and specify **Auto** as the encoding quality, any changes you make to the properties will be overwritten with values based on the current camera settings.
     * @param {Integer} quality_ The video quality.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createavi
     */
    static CreateAvi(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics2.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics2 := IMediaEncodingProfileStatics2(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics2.CreateAvi(quality_)
    }

    /**
     * Creates an instance of [MediaEncodingProfile](mediaencodingprofile.md) for Apple Lossless Audio Codec (ALAC) audio.
     * @param {Integer} quality_ The ecoding quality.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createalac
     */
    static CreateAlac(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics3.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics3 := IMediaEncodingProfileStatics3(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics3.CreateAlac(quality_)
    }

    /**
     * Creates an instance of [MediaEncodingProfile](mediaencodingprofile.md) for Free Lossless Audio Codec (FLAC) audio.
     * @param {Integer} quality_ The ecoding quality.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createflac
     */
    static CreateFlac(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics3.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics3 := IMediaEncodingProfileStatics3(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics3.CreateFlac(quality_)
    }

    /**
     * Creates an instance of [MediaEncodingProfile](mediaencodingprofile.md) for High Efficiency Video Coding (HEVC) video, also known as H.265 video.
     * @param {Integer} quality_ The video quality.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createhevc
     */
    static CreateHevc(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics3.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics3 := IMediaEncodingProfileStatics3(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics3.CreateHevc(quality_)
    }

    /**
     * Creates an encoding profile for AAC audio.
     * @param {Integer} quality_ Specifies whether to create a profile with a low bit rate, medium bit rate, or high bit rate.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createm4a
     */
    static CreateM4a(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics := IMediaEncodingProfileStatics(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics.CreateM4a(quality_)
    }

    /**
     * Creates an encoding profile for MP3 (MPEG-1 layer 3) audio.
     * @param {Integer} quality_ Specifies whether to create a profile with a low bit rate, medium bit rate, or high bit rate.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createmp3
     */
    static CreateMp3(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics := IMediaEncodingProfileStatics(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics.CreateMp3(quality_)
    }

    /**
     * Creates an encoding profile for Windows Media Audio (WMA).
     * @param {Integer} quality_ Specifies whether to create a profile with a low bit rate, medium bit rate, or high bit rate.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createwma
     */
    static CreateWma(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics := IMediaEncodingProfileStatics(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics.CreateWma(quality_)
    }

    /**
     * Creates an encoding profile for H.264 video.
     * @param {Integer} quality_ Specifies the video resolution of the profile.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createmp4
     */
    static CreateMp4(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics := IMediaEncodingProfileStatics(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics.CreateMp4(quality_)
    }

    /**
     * Creates an encoding profile for Windows Media Video (WMV).
     * @param {Integer} quality_ Specifies the video resolution of the profile.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createwmv
     */
    static CreateWmv(quality_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics := IMediaEncodingProfileStatics(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics.CreateWmv(quality_)
    }

    /**
     * Creates an encoding profile from an existing media file.
     * @param {IStorageFile} file_ The media file from which to create the profile.
     * @returns {IAsyncOperation<MediaEncodingProfile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createfromfileasync
     */
    static CreateFromFileAsync(file_) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics := IMediaEncodingProfileStatics(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics.CreateFromFileAsync(file_)
    }

    /**
     * Creates an encoding profile from a stream that contains media data.
     * @param {IRandomAccessStream} stream The media stream from which to create the profile.
     * @returns {IAsyncOperation<MediaEncodingProfile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.createfromstreamasync
     */
    static CreateFromStreamAsync(stream) {
        if (!MediaEncodingProfile.HasProp("__IMediaEncodingProfileStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingProfileStatics.IID)
            MediaEncodingProfile.__IMediaEncodingProfileStatics := IMediaEncodingProfileStatics(factoryPtr)
        }

        return MediaEncodingProfile.__IMediaEncodingProfileStatics.CreateFromStreamAsync(stream)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the encoding properties for the audio stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.audio
     * @type {AudioEncodingProperties} 
     */
    Audio {
        get => this.get_Audio()
        set => this.put_Audio(value)
    }

    /**
     * Gets or sets the encoding properties for the video stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.video
     * @type {VideoEncodingProperties} 
     */
    Video {
        get => this.get_Video()
        set => this.put_Video(value)
    }

    /**
     * Gets or sets the properties of the media container.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.container
     * @type {ContainerEncodingProperties} 
     */
    Container {
        get => this.get_Container()
        set => this.put_Container(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [MediaEncodingProfile](mediaencodingprofile.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingProfile")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {AudioEncodingProperties} value 
     * @returns {HRESULT} 
     */
    put_Audio(value) {
        if (!this.HasProp("__IMediaEncodingProfile")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile := IMediaEncodingProfile(outPtr)
        }

        return this.__IMediaEncodingProfile.put_Audio(value)
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    get_Audio() {
        if (!this.HasProp("__IMediaEncodingProfile")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile := IMediaEncodingProfile(outPtr)
        }

        return this.__IMediaEncodingProfile.get_Audio()
    }

    /**
     * 
     * @param {VideoEncodingProperties} value 
     * @returns {HRESULT} 
     */
    put_Video(value) {
        if (!this.HasProp("__IMediaEncodingProfile")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile := IMediaEncodingProfile(outPtr)
        }

        return this.__IMediaEncodingProfile.put_Video(value)
    }

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    get_Video() {
        if (!this.HasProp("__IMediaEncodingProfile")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile := IMediaEncodingProfile(outPtr)
        }

        return this.__IMediaEncodingProfile.get_Video()
    }

    /**
     * 
     * @param {ContainerEncodingProperties} value 
     * @returns {HRESULT} 
     */
    put_Container(value) {
        if (!this.HasProp("__IMediaEncodingProfile")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile := IMediaEncodingProfile(outPtr)
        }

        return this.__IMediaEncodingProfile.put_Container(value)
    }

    /**
     * 
     * @returns {ContainerEncodingProperties} 
     */
    get_Container() {
        if (!this.HasProp("__IMediaEncodingProfile")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile := IMediaEncodingProfile(outPtr)
        }

        return this.__IMediaEncodingProfile.get_Container()
    }

    /**
     * Sets the list of [AudioStreamDescriptor](/uwp/api/Windows.Media.Core.AudioStreamDescriptor) objects describing the audio streams included in the **MediaEncodingProfile**.
     * @remarks
     * The  [Label](/uwp/api/windows.media.core.audiostreamdescriptor.Label) field for each [AudioStreamDescriptor](/uwp/api/windows.media.core.audiostreamdescriptor) in the collection must be unique. If you attempt to add more than one stream descriptor with the same label, an invalid argument error will occur.
     * 
     * If you set the [Audio](/uwp/api/windows.media.mediaproperties.mediaencodingprofile.Audio) property, the list of video tracks is reset to a list with a single **AudioStreamDescriptor** entry. If you retrieve the **Audio** property after calling **SetVideoTracks**, the property will return the first entry in the provided list.
     * @param {IIterable<AudioStreamDescriptor>} value A list of [VideoStreamDescriptor](/uwp/api/windows.media.core.videostreamdescriptor) objects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.setaudiotracks
     */
    SetAudioTracks(value) {
        if (!this.HasProp("__IMediaEncodingProfile2")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile2 := IMediaEncodingProfile2(outPtr)
        }

        return this.__IMediaEncodingProfile2.SetAudioTracks(value)
    }

    /**
     * Retrieves the list of [AudioStreamDescriptor](/uwp/api/Windows.Media.Core.AudioStreamDescriptor) objects describing the audio streams included in the **MediaEncodingProfile**.
     * @returns {IVector<AudioStreamDescriptor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.getaudiotracks
     */
    GetAudioTracks() {
        if (!this.HasProp("__IMediaEncodingProfile2")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile2 := IMediaEncodingProfile2(outPtr)
        }

        return this.__IMediaEncodingProfile2.GetAudioTracks()
    }

    /**
     * Sets the list of [VideoStreamDescriptor](/uwp/api/windows.media.core.videostreamdescriptor) objects describing the video streams included in the **MediaEncodingProfile**.
     * @remarks
     * The  [Label](/uwp/api/windows.media.core.videostreamdescriptor.Label) field for each [VideoStreamDescriptor](/uwp/api/windows.media.core.videostreamdescriptor) in the collection must be unique. If you attempt to add more than one stream descriptor with the same label, an invalid argument error will occur.
     * 
     * If you set the [Video](/uwp/api/windows.media.mediaproperties.mediaencodingprofile.Video) property, the list of video tracks is reset to a list with a single **VideoStreamDescriptor** entry. If you retrieve the **Video** property after calling **SetVideoTracks**, the property will return the first entry in the provided list.
     * @param {IIterable<VideoStreamDescriptor>} value A collection of [VideoStreamDescriptor](/uwp/api/windows.media.core.videostreamdescriptor) objects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.setvideotracks
     */
    SetVideoTracks(value) {
        if (!this.HasProp("__IMediaEncodingProfile2")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile2 := IMediaEncodingProfile2(outPtr)
        }

        return this.__IMediaEncodingProfile2.SetVideoTracks(value)
    }

    /**
     * Retrieves the list of [VideoStreamDescriptor](/uwp/api/windows.media.core.videostreamdescriptor) objects describing the video streams included in the **MediaEncodingProfile**.
     * @returns {IVector<VideoStreamDescriptor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.getvideotracks
     */
    GetVideoTracks() {
        if (!this.HasProp("__IMediaEncodingProfile2")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile2 := IMediaEncodingProfile2(outPtr)
        }

        return this.__IMediaEncodingProfile2.GetVideoTracks()
    }

    /**
     * Sets the list of [TimedMetadataStreamDescriptor](../windows.media.core/timedmetadatastreamdescriptor.md) objects describing the timed metadata streams included in the **MediaEncodingProfile**.
     * @remarks
     * The  [Label](/uwp/api/windows.media.core.videostreamdescriptor.Label) field for each [VideoStreamDescriptor](/uwp/api/windows.media.core.videostreamdescriptor) in the collection must be unique. If you attempt to add more than one stream descriptor with the same label, an invalid argument error will occur.
     * @param {IIterable<TimedMetadataStreamDescriptor>} value A collection of TimedMetadataStreamDescriptor objects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.settimedmetadatatracks
     */
    SetTimedMetadataTracks(value) {
        if (!this.HasProp("__IMediaEncodingProfile3")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile3 := IMediaEncodingProfile3(outPtr)
        }

        return this.__IMediaEncodingProfile3.SetTimedMetadataTracks(value)
    }

    /**
     * Retrieves the list of [TimedMetadataStreamDescriptor](../windows.media.core/timedmetadatastreamdescriptor.md) objects describing the timed metadata streams included in the **MediaEncodingProfile**.
     * @returns {IVector<TimedMetadataStreamDescriptor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingprofile.gettimedmetadatatracks
     */
    GetTimedMetadataTracks() {
        if (!this.HasProp("__IMediaEncodingProfile3")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProfile3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProfile3 := IMediaEncodingProfile3(outPtr)
        }

        return this.__IMediaEncodingProfile3.GetTimedMetadataTracks()
    }

;@endregion Instance Methods
}
