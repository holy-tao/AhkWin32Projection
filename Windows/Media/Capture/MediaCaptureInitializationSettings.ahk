#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaCaptureInitializationSettings.ahk
#Include .\IMediaCaptureInitializationSettings2.ahk
#Include .\IMediaCaptureInitializationSettings3.ahk
#Include .\IMediaCaptureInitializationSettings4.ahk
#Include .\IMediaCaptureInitializationSettings5.ahk
#Include .\IMediaCaptureInitializationSettings6.ahk
#Include .\IMediaCaptureInitializationSettings7.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains initialization settings for the [MediaCapture](mediacapture.md) object which are passed to the [MediaCapture.InitializeAsync](mediacapture_initializeasync_315323248.md) method.
 * @remarks
 * For how-to guidance on initializing and shutting down the **MediaCapture** object, see [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
 * 
 * > [!NOTE]
 * > When **MediaCaptureSharingMode::SharedReadOnly** is used, some of the MediaCaptureInitializationSettings properties can't be configured. See [SharingMode](mediacaptureinitializationsettings_sharingmode.md) for details.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureInitializationSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaCaptureInitializationSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaCaptureInitializationSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) of the microphone.
     * @remarks
     * This method may return a NULL pointer if the device doesn't support this functionality. For more information, see the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.audiodeviceid
     * @type {HSTRING} 
     */
    AudioDeviceId {
        get => this.get_AudioDeviceId()
        set => this.put_AudioDeviceId(value)
    }

    /**
     * Gets the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) of the video camera.
     * @remarks
     * This method may return a NULL pointer if the device doesn't support this functionality. For more information, see the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.videodeviceid
     * @type {HSTRING} 
     */
    VideoDeviceId {
        get => this.get_VideoDeviceId()
        set => this.put_VideoDeviceId(value)
    }

    /**
     * Gets or sets the streaming mode.
     * @remarks
     * Use this property to choose between audio capture, video capture, or combined audio and video capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.streamingcapturemode
     * @type {Integer} 
     */
    StreamingCaptureMode {
        get => this.get_StreamingCaptureMode()
        set => this.put_StreamingCaptureMode(value)
    }

    /**
     * Gets or sets the stream that is used for photo capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.photocapturesource
     * @type {Integer} 
     */
    PhotoCaptureSource {
        get => this.get_PhotoCaptureSource()
        set => this.put_PhotoCaptureSource(value)
    }

    /**
     * Gets or set the media category.
     * @remarks
     * If you set the **MediaCategory** property, the media capture pipeline will attempt to optimize for the specified scenario. For example, if you set the value to [Speech](mediacategory.md), audio processing such as echo cancellation and noise suppression may be enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.mediacategory
     * @type {Integer} 
     */
    MediaCategory {
        get => this.get_MediaCategory()
        set => this.put_MediaCategory(value)
    }

    /**
     * Gets or sets a value that specifies the audio processing mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.audioprocessing
     * @type {Integer} 
     */
    AudioProcessing {
        get => this.get_AudioProcessing()
        set => this.put_AudioProcessing(value)
    }

    /**
     * Gets or sets the audio source for the capture operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.audiosource
     * @type {IMediaSource} 
     */
    AudioSource {
        get => this.get_AudioSource()
        set => this.put_AudioSource(value)
    }

    /**
     * Gets or sets the video source for the capture operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.videosource
     * @type {IMediaSource} 
     */
    VideoSource {
        get => this.get_VideoSource()
        set => this.put_VideoSource(value)
    }

    /**
     * Gets or sets the video profile which provides hints to the driver to allow it to optimize for different capture scenarios.
     * @remarks
     * Video profiles provide a simple way to configure the video capture device with a group of settings that are guaranteed to work with a particular capture device and are optimized for your desired capture scenario. There is a set of known video profiles that the system provides for common scenarios, such as capturing high-quality photos during video capture or video conferencing. To get a list of the known video profiles for a given video device, use [MediaCapture.FindKnownVideoProfiles](mediacapture_findknownvideoprofiles_875917242.md). Some hardware vendors may expose other video profiles that you can get by calling [MediaCapture.FindAllVideoProfiles](mediacapture_findallvideoprofiles_690787568.md). For more information on video profiles, see [MediaCaptureVideoProfile](mediacapturevideoprofile.md).
     * 
     * The value you use for this property determines how the system handles the values for other properties of the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md).
     * + If you set VideoProfile to a valid [MediaCaptureVideoProfile](mediacapturevideoprofile.md) object, the system will use the driver hints associated with the profile and will use the media description values you specify for the [PhotoMediaDescription](mediacaptureinitializationsettings_photomediadescription.md), [PreviewMediaDescription](mediacaptureinitializationsettings_previewmediadescription.md), and [RecordMediaDescription](mediacaptureinitializationsettings_recordmediadescription.md) properties.
     * + If you set VideoProfile to a valid [MediaCaptureVideoProfile](mediacapturevideoprofile.md) object and you don't set either the [PhotoMediaDescription](mediacaptureinitializationsettings_photomediadescription.md), [PreviewMediaDescription](mediacaptureinitializationsettings_previewmediadescription.md), or [RecordMediaDescription](mediacaptureinitializationsettings_recordmediadescription.md) properties, the system will use the driver hints associated with the profile and use the first (0 index) entry in the profile's [SupportedPhotoMediaDescription](mediacapturevideoprofile_supportedphotomediadescription.md), [SupportedPreviewMediaDescription](mediacapturevideoprofile_supportedpreviewmediadescription.md), and [SupportedRecordMediaDescription](mediacapturevideoprofile_supportedrecordmediadescription.md) lists as the media description for the respective properties.
     * + If the value of VideoProfile is not set at all then the system ignores the value of [PhotoMediaDescription](mediacaptureinitializationsettings_photomediadescription.md), [PreviewMediaDescription](mediacaptureinitializationsettings_previewmediadescription.md), and [RecordMediaDescription](mediacaptureinitializationsettings_recordmediadescription.md) and reverts to the legacy behavior before the video profile APIs were introduced.
     * 
     * 
     * Before using video profiles, you should check the value returned by [MediaCapture.IsVideoProfileSupported](mediacapture_isvideoprofilesupported_190014579.md) to make sure that video profiles are supported by the capture device.
     * 
     * For how-to guidance on using video profiles, see [Discover and select camera capabilities with camera profiles](/windows/apps/develop/camera/camera-profiles)
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.videoprofile
     * @type {MediaCaptureVideoProfile} 
     */
    VideoProfile {
        get => this.get_VideoProfile()
        set => this.put_VideoProfile(value)
    }

    /**
     * Gets or sets the media description for preview video.
     * @remarks
     * An instance of [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) defines a group of capture settings that are supported by a video profile. For example, one [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) object could represent settings for recording 720p video at 30 fps with HDR video and another could represent settings for recording 1080p video at 30 fps without HDR video support. A [MediaCaptureVideoProfile](mediacapturevideoprofile.md) object contains separate lists of supported media descriptions for photo capture, preview, and video recording that are supported for that profile. For more information on video profiles, see [MediaCaptureVideoProfile](mediacapturevideoprofile.md).
     * 
     * The way the system uses the **PreviewMediaDescription** property depends on the value of the [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) property.
     * + If you set [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) to a non-null value and you set PreviewMediaDescription to a value in the video profile's [SupportedPreviewMediaDescription](mediacapturevideoprofile_supportedpreviewmediadescription.md) list, the system will use your provided media description and will provide optimization hints to the driver based on the profile you specify.
     * + If you set [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) to a non-null value and the value of PreviewMediaDescription is not set, then the system will use the first entry in the video profile's [SupportedPreviewMediaDescription](mediacapturevideoprofile_supportedpreviewmediadescription.md) list as the media description.
     * + If the value of [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) is not set at all then the system ignores the value of PreviewMediaDescription and reverts to the legacy behavior before these APIs were introduced.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.previewmediadescription
     * @type {MediaCaptureVideoProfileMediaDescription} 
     */
    PreviewMediaDescription {
        get => this.get_PreviewMediaDescription()
        set => this.put_PreviewMediaDescription(value)
    }

    /**
     * Gets or sets the media description for video recording.
     * @remarks
     * An instance of [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) defines a group of capture settings that are supported by a video profile. For example, one [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) object could represent settings for recording 720p video at 30 fps with HDR video and another could represent settings for recording 1080p video at 30 fps without HDR video support. A [MediaCaptureVideoProfile](mediacapturevideoprofile.md) object contains separate lists of supported media descriptions for photo capture, preview, and video recording that are supported for that profile. For more information on video profiles, see [MediaCaptureVideoProfile](mediacapturevideoprofile.md).
     * 
     * The way the system uses the **RecordMediaDescription** property depends on the value of the [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) property.
     * + If you set [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) to a non-null value and you set RecordMediaDescription to a value in the video profile's [SupportedRecordMediaDescription](mediacapturevideoprofile_supportedrecordmediadescription.md) list, the system will use your provided media description and will provide optimization hints to the driver based on the profile you specify.
     * + If you set [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) to a non-null value and the value of RecordMediaDescription is not set, then the system will use the first entry in the video profile's [SupportedRecordMediaDescription](mediacapturevideoprofile_supportedrecordmediadescription.md) list as the media description.
     * + If the value of [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) is not set at all then the system ignores the value of RecordMediaDescription and reverts to the legacy behavior before these APIs were introduced.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.recordmediadescription
     * @type {MediaCaptureVideoProfileMediaDescription} 
     */
    RecordMediaDescription {
        get => this.get_RecordMediaDescription()
        set => this.put_RecordMediaDescription(value)
    }

    /**
     * Gets or sets the media description for photo capture.
     * @remarks
     * An instance of [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) defines a group of capture settings that are supported by a video profile. For example, one [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) object could represent settings for recording 720p video at 30 fps with HDR video and another could represent settings for recording 1080p video at 30 fps without HDR video support. A [MediaCaptureVideoProfile](mediacapturevideoprofile.md) object contains separate lists of supported media descriptions for photo capture, preview, and video recording that are supported for that profile. For more information on video profiles, see [MediaCaptureVideoProfile](mediacapturevideoprofile.md).
     * 
     * The way the system uses the **PhotoMediaDescription** property depends on the value of the [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) property.
     * + If you set [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) to a non-null value and you set PhotoMediaDescription to a value in the video profile's [SupportedPhotoMediaDescription](mediacapturevideoprofile_supportedphotomediadescription.md) list, the system will use your provided media description and will provide optimization hints to the driver based on the profile you specify.
     * + If you set [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) to a non-null value and the value of PhotoMediaDescription is not set, then the system will use the first entry in the video profile's [SupportedPhotoMediaDescription](mediacapturevideoprofile_supportedphotomediadescription.md) list as the media description.
     * + If the value of [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) is not set at all then the system ignores the value of PhotoMediaDescription and reverts to the legacy behavior before the video profile APIs were introduced.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.photomediadescription
     * @type {MediaCaptureVideoProfileMediaDescription} 
     */
    PhotoMediaDescription {
        get => this.get_PhotoMediaDescription()
        set => this.put_PhotoMediaDescription(value)
    }

    /**
     * Gets or sets the [MediaFrameSourceGroup](../windows.media.capture.frames/mediaframesourcegroup.md) with which the [MediaCapture](mediacapture.md) should be initialized. This property defines a set of media frame sources that can be used simultaneously.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.sourcegroup
     * @type {MediaFrameSourceGroup} 
     */
    SourceGroup {
        get => this.get_SourceGroup()
        set => this.put_SourceGroup(value)
    }

    /**
     * Gets or sets an object that specifies the sharing mode for the [MediaCapture](mediacapture.md).
     * @remarks
     * Multiple apps can simultaneously acquire frames from the same [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md), but only a single active MediaCapture instance can acquire exclusive control and modify the settings for the frame source. Set **SharingMode** to [ExclusiveControl](mediacapturesharingmode.md) if you need to adjust the configuration (of any of the frame sources included the requested [SourceGroup](mediacaptureinitializationsettings_sourcegroup.md). A MediaCapture instance becomes active when a stream has been started or after a camera control value is set by using the [MediaCapture.VideoDeviceController](../windows.media.devices/videodevicecontroller.md). Attempting to render active a MediaCapture instance when another controlling mode instance is already active will result in a sharing violation failure.
     * If you only need to acquire frames without modifying the configuration, set **SharingMode** to [SharedReadOnly](mediacapturesharingmode.md).
     * 
     * When the **SharingMode** is set to [SharedReadOnly](mediacapturesharingmode.md), some of the MediaCaptureInitializationSettings properties can't be configured. See below table for details.
     * 
     * | **Properties** | **Can be configured in Sharing Mode** |
     * |----------------|---------------------------------------|
     * | [AlwaysPlaySystemShutterSound](mediacaptureinitializationsettings_alwaysplaysystemshuttersound.md) | Yes |
     * | [AudioDeviceId](mediacaptureinitializationsettings_audiodeviceid.md) | Yes |
     * | [AudioProcessing](mediacaptureinitializationsettings_audioprocessing.md) | Yes |
     * | [AudioSource](mediacaptureinitializationsettings_audiosource.md) | N/A |
     * | [DeviceUri](mediacaptureinitializationsettings_deviceuri.md) | Yes |
     * | [DeviceUriPasswordCredential](mediacaptureinitializationsettings_deviceuripasswordcredential.md) | Yes |
     * | [MediaCategory](mediacaptureinitializationsettings_mediacategory.md) | Yes |
     * | [MemoryPreference](mediacaptureinitializationsettings_memorypreference.md) | Yes |
     * | [PhotoCaptureSource](mediacaptureinitializationsettings_photocapturesource.md) | N/A |
     * | [PhotoMediaDescription](mediacaptureinitializationsettings_photomediadescription.md) | No |
     * | [PreviewMediaDescription](mediacaptureinitializationsettings_previewmediadescription.md) | No |
     * | [RecordMediaDescription](mediacaptureinitializationsettings_recordmediadescription.md) | No |
     * | [SourceGroup](mediacaptureinitializationsettings_sourcegroup.md) | Yes |
     * | [StreamingCaptureMode](mediacaptureinitializationsettings_streamingcapturemode.md) | Yes |
     * | [VideoDeviceId](mediacaptureinitializationsettings_videodeviceid.md) | Yes |
     * | [VideoProfile](mediacaptureinitializationsettings_videoprofile.md) | No |
     * | [VideoSource](mediacaptureinitializationsettings_videosource.md) | Yes |
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.sharingmode
     * @type {Integer} 
     */
    SharingMode {
        get => this.get_SharingMode()
        set => this.put_SharingMode(value)
    }

    /**
     * Gets or sets an object specifying the preferred memory location for storing frames acquired from a [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) used by the [MediaCapture](mediacapture.md).
     * @remarks
     * The [MediaCapture](mediacapture.md) object may store the image data of a [VideoMediaFrame](../windows.media.capture.frames/videomediaframe.md) acquired from a [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) in either CPU or GPU memory. When **MemoryPreference** is set to [Cpu](mediacapturememorypreference.md), CPU memory is used and therefore the [SoftwareBitmap](../windows.media.capture.frames/videomediaframe_softwarebitmap.md) property of acquired [VideoMediaFrame](../windows.media.capture.frames/videomediaframe.md) objects will be non-null and contain the image data for the frame. When [Auto](mediacapturememorypreference.md) is specified, the system will dynamically choose the optimal memory location for the current device. If the system chooses to use GPU memory, the [Direct3DSurface](../windows.media.capture.frames/videomediaframe_direct3dsurface.md) property of acquired [VideoMediaFrame](../windows.media.capture.frames/videomediaframe.md) objects will be non-null and contain the image data for the frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.memorypreference
     * @type {Integer} 
     */
    MemoryPreference {
        get => this.get_MemoryPreference()
        set => this.put_MemoryPreference(value)
    }

    /**
     * Gets a value indicating whether the system should always play a shutter sound when a photo is captured.
     * @remarks
     * Some regions require that the system play a shutter sound whenever a photo is captured. Setting this value to true will cause the system to always play the shutter sound, whether or not is required by the current region. Setting this value to false will not suppress the system shutter sound when it is required.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.alwaysplaysystemshuttersound
     * @type {Boolean} 
     */
    AlwaysPlaySystemShutterSound {
        get => this.get_AlwaysPlaySystemShutterSound()
        set => this.put_AlwaysPlaySystemShutterSound(value)
    }

    /**
     * Gets or sets the [PasswordCredential](/uwp/api/Windows.Security.Credentials.PasswordCredential) object representing the credentials used to access the remote capture device to be initialized.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.deviceuripasswordcredential
     * @type {PasswordCredential} 
     */
    DeviceUriPasswordCredential {
        get => this.get_DeviceUriPasswordCredential()
        set => this.put_DeviceUriPasswordCredential(value)
    }

    /**
     * Gets or sets the URI of the remote capture device to be initialized.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacaptureinitializationsettings.deviceuri
     * @type {Uri} 
     */
    DeviceUri {
        get => this.get_DeviceUri()
        set => this.put_DeviceUri(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the MediaCaptureInitializationSettings object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.MediaCaptureInitializationSettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AudioDeviceId(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings := IMediaCaptureInitializationSettings(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings.put_AudioDeviceId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioDeviceId() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings := IMediaCaptureInitializationSettings(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings.get_AudioDeviceId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_VideoDeviceId(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings := IMediaCaptureInitializationSettings(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings.put_VideoDeviceId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VideoDeviceId() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings := IMediaCaptureInitializationSettings(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings.get_VideoDeviceId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StreamingCaptureMode(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings := IMediaCaptureInitializationSettings(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings.put_StreamingCaptureMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StreamingCaptureMode() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings := IMediaCaptureInitializationSettings(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings.get_StreamingCaptureMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PhotoCaptureSource(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings := IMediaCaptureInitializationSettings(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings.put_PhotoCaptureSource(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotoCaptureSource() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings := IMediaCaptureInitializationSettings(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings.get_PhotoCaptureSource()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MediaCategory(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings2 := IMediaCaptureInitializationSettings2(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings2.put_MediaCategory(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaCategory() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings2 := IMediaCaptureInitializationSettings2(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings2.get_MediaCategory()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioProcessing(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings2 := IMediaCaptureInitializationSettings2(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings2.put_AudioProcessing(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioProcessing() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings2 := IMediaCaptureInitializationSettings2(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings2.get_AudioProcessing()
    }

    /**
     * 
     * @param {IMediaSource} value 
     * @returns {HRESULT} 
     */
    put_AudioSource(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings3")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings3 := IMediaCaptureInitializationSettings3(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings3.put_AudioSource(value)
    }

    /**
     * 
     * @returns {IMediaSource} 
     */
    get_AudioSource() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings3")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings3 := IMediaCaptureInitializationSettings3(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings3.get_AudioSource()
    }

    /**
     * 
     * @param {IMediaSource} value 
     * @returns {HRESULT} 
     */
    put_VideoSource(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings3")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings3 := IMediaCaptureInitializationSettings3(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings3.put_VideoSource(value)
    }

    /**
     * 
     * @returns {IMediaSource} 
     */
    get_VideoSource() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings3")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings3 := IMediaCaptureInitializationSettings3(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings3.get_VideoSource()
    }

    /**
     * 
     * @returns {MediaCaptureVideoProfile} 
     */
    get_VideoProfile() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings4")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings4 := IMediaCaptureInitializationSettings4(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings4.get_VideoProfile()
    }

    /**
     * 
     * @param {MediaCaptureVideoProfile} value 
     * @returns {HRESULT} 
     */
    put_VideoProfile(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings4")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings4 := IMediaCaptureInitializationSettings4(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings4.put_VideoProfile(value)
    }

    /**
     * 
     * @returns {MediaCaptureVideoProfileMediaDescription} 
     */
    get_PreviewMediaDescription() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings4")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings4 := IMediaCaptureInitializationSettings4(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings4.get_PreviewMediaDescription()
    }

    /**
     * 
     * @param {MediaCaptureVideoProfileMediaDescription} value 
     * @returns {HRESULT} 
     */
    put_PreviewMediaDescription(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings4")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings4 := IMediaCaptureInitializationSettings4(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings4.put_PreviewMediaDescription(value)
    }

    /**
     * 
     * @returns {MediaCaptureVideoProfileMediaDescription} 
     */
    get_RecordMediaDescription() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings4")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings4 := IMediaCaptureInitializationSettings4(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings4.get_RecordMediaDescription()
    }

    /**
     * 
     * @param {MediaCaptureVideoProfileMediaDescription} value 
     * @returns {HRESULT} 
     */
    put_RecordMediaDescription(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings4")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings4 := IMediaCaptureInitializationSettings4(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings4.put_RecordMediaDescription(value)
    }

    /**
     * 
     * @returns {MediaCaptureVideoProfileMediaDescription} 
     */
    get_PhotoMediaDescription() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings4")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings4 := IMediaCaptureInitializationSettings4(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings4.get_PhotoMediaDescription()
    }

    /**
     * 
     * @param {MediaCaptureVideoProfileMediaDescription} value 
     * @returns {HRESULT} 
     */
    put_PhotoMediaDescription(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings4")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings4 := IMediaCaptureInitializationSettings4(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings4.put_PhotoMediaDescription(value)
    }

    /**
     * 
     * @returns {MediaFrameSourceGroup} 
     */
    get_SourceGroup() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings5")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings5 := IMediaCaptureInitializationSettings5(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings5.get_SourceGroup()
    }

    /**
     * 
     * @param {MediaFrameSourceGroup} value 
     * @returns {HRESULT} 
     */
    put_SourceGroup(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings5")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings5 := IMediaCaptureInitializationSettings5(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings5.put_SourceGroup(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SharingMode() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings5")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings5 := IMediaCaptureInitializationSettings5(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings5.get_SharingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SharingMode(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings5")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings5 := IMediaCaptureInitializationSettings5(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings5.put_SharingMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MemoryPreference() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings5")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings5 := IMediaCaptureInitializationSettings5(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings5.get_MemoryPreference()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MemoryPreference(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings5")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings5 := IMediaCaptureInitializationSettings5(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings5.put_MemoryPreference(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysPlaySystemShutterSound() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings6")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings6 := IMediaCaptureInitializationSettings6(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings6.get_AlwaysPlaySystemShutterSound()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysPlaySystemShutterSound(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings6")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings6 := IMediaCaptureInitializationSettings6(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings6.put_AlwaysPlaySystemShutterSound(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_DeviceUriPasswordCredential() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings7")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings7 := IMediaCaptureInitializationSettings7(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings7.get_DeviceUriPasswordCredential()
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_DeviceUriPasswordCredential(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings7")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings7 := IMediaCaptureInitializationSettings7(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings7.put_DeviceUriPasswordCredential(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_DeviceUri() {
        if (!this.HasProp("__IMediaCaptureInitializationSettings7")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings7 := IMediaCaptureInitializationSettings7(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings7.get_DeviceUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_DeviceUri(value) {
        if (!this.HasProp("__IMediaCaptureInitializationSettings7")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureInitializationSettings7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureInitializationSettings7 := IMediaCaptureInitializationSettings7(outPtr)
        }

        return this.__IMediaCaptureInitializationSettings7.put_DeviceUri(value)
    }

;@endregion Instance Methods
}
