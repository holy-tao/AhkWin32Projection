#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaCaptureVideoProfile.ahk
#Include .\IMediaCaptureVideoProfile2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a video profile that indicates a configuration supported by the video capture device.
 * @remarks
 * Video profiles provide a simple way to configure the video capture device with a group of settings that are guaranteed to work with a particular capture device and are optimized for your desired capture scenario. There is a set of known video profiles that the system provides for common scenarios, such as capturing high-quality photos or video, capturing a photo sequence, or video conferencing. To get a list of the known video profiles for a given video device, use [MediaCapture.FindKnownVideoProfiles](mediacapture_findknownvideoprofiles_875917242.md). Some hardware vendors may expose other video profiles that you can get by calling [MediaCapture.FindAllVideoProfiles](mediacapture_findallvideoprofiles_690787568.md).
 * 
 * A video profile exposes three lists of [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) objects, [SupportedPhotoMediaDescription](mediacapturevideoprofile_supportedphotomediadescription.md), [SupportedPreviewMediaDescription](mediacapturevideoprofile_supportedpreviewmediadescription.md), and [SupportedRecordMediaDescription](mediacapturevideoprofile_supportedrecordmediadescription.md). Each item in these lists is a group of settings that are supported for the corresponding operation. For example, a single video profile may support recording 720p video at 30 fps with HDR video support and also support recording 1080p video at 30 fps without HDR video support. In this case, each of these would be represented by a [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) object in the [SupportedRecordMediaDescription](mediacapturevideoprofile_supportedrecordmediadescription.md) list of the video profile.
 * 
 * You configure the capture device to use a particular video profile by using the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md) object. It is important that the video profile you use when configuring the device is compatible with the other initialization settings. For more information on how to correctly use media profile descriptions in the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md), see [MediaCaptureInitializationSettings.VideoProfile](mediacaptureinitializationsettings_videoprofile.md).
 * 
 * Before using video profiles, you should check the value returned by [MediaCapture.IsVideoProfileSupported](mediacapture_isvideoprofilesupported_190014579.md) to make sure that video profiles are supported by the capture device.
 * 
 * For how-to guidance for working with video profiles, see [Discover and select camera capabilities with camera profiles](/windows/apps/develop/camera/camera-profiles).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofile
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureVideoProfile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaCaptureVideoProfile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaCaptureVideoProfile.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier of the video profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofile.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the device ID of the video device associated with the video profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofile.videodeviceid
     * @type {HSTRING} 
     */
    VideoDeviceId {
        get => this.get_VideoDeviceId()
    }

    /**
     * Gets a list of [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) objects that represent supported video device settings for video preview.
     * @remarks
     * You configure the capture device to use a particular [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) for photo capture by using the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md) object. It is important that the video profile media description value you use when configuring the device is compatible with the other initialization settings. For more information on how to correctly use media profile descriptions in the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md), see [MediaCaptureInitializationSettings.PreviewMediaDescription](mediacaptureinitializationsettings_previewmediadescription.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofile.supportedpreviewmediadescription
     * @type {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    SupportedPreviewMediaDescription {
        get => this.get_SupportedPreviewMediaDescription()
    }

    /**
     * Gets a list of [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) objects that represent supported video device settings for video recording.
     * @remarks
     * You configure the capture device to use a particular [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) for photo capture by using the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md) object. It is important that the video profile media description value you use when configuring the device is compatible with the other initialization settings. For more information on how to correctly use media profile descriptions in the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md), see [MediaCaptureInitializationSettings.RecordMediaDescription](mediacaptureinitializationsettings_recordmediadescription.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofile.supportedrecordmediadescription
     * @type {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    SupportedRecordMediaDescription {
        get => this.get_SupportedRecordMediaDescription()
    }

    /**
     * Gets a list of [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) objects that represent supported video device settings for photo capture.
     * @remarks
     * You configure the capture device to use a particular [MediaCaptureVideoProfileMediaDescription](mediacapturevideoprofilemediadescription.md) for photo capture by using the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md) object. It is important that the video profile media description value you use when configuring the device is compatible with the other initialization settings. For more information on how to correctly use media profile descriptions in the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md), see [MediaCaptureInitializationSettings.PhotoMediaDescription](mediacaptureinitializationsettings_photomediadescription.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofile.supportedphotomediadescription
     * @type {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    SupportedPhotoMediaDescription {
        get => this.get_SupportedPhotoMediaDescription()
    }

    /**
     * Gets a read-only list of [MediaFrameSourceInfo](../windows.media.capture.frames/mediaframesourceinfo.md) objects which provide details about the capabilities of a [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md).
     * @remarks
     * When you use [MediaCapture](mediacapture.md) to capture from a [MediaFrameSourceGroup](../windows.media.capture.frames/mediaframesourcegroup.md), each individual frame source within the group is described by a [MediaFrameSourceInfo](../windows.media.capture.frames/mediaframesourceinfo.md). This property allows you to retrieve the **MediaFrameSourceInfo** objects that are associated with the [MediaCaptureVideoProfile](mediacapturevideoprofile.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofile.framesourceinfos
     * @type {IVectorView<MediaFrameSourceInfo>} 
     */
    FrameSourceInfos {
        get => this.get_FrameSourceInfos()
    }

    /**
     * Gets a read-only map of custom attributes provided by the capture device manufacturer.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofile.properties
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
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
    get_Id() {
        if (!this.HasProp("__IMediaCaptureVideoProfile")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfile := IMediaCaptureVideoProfile(outPtr)
        }

        return this.__IMediaCaptureVideoProfile.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VideoDeviceId() {
        if (!this.HasProp("__IMediaCaptureVideoProfile")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfile := IMediaCaptureVideoProfile(outPtr)
        }

        return this.__IMediaCaptureVideoProfile.get_VideoDeviceId()
    }

    /**
     * 
     * @returns {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    get_SupportedPreviewMediaDescription() {
        if (!this.HasProp("__IMediaCaptureVideoProfile")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfile := IMediaCaptureVideoProfile(outPtr)
        }

        return this.__IMediaCaptureVideoProfile.get_SupportedPreviewMediaDescription()
    }

    /**
     * 
     * @returns {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    get_SupportedRecordMediaDescription() {
        if (!this.HasProp("__IMediaCaptureVideoProfile")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfile := IMediaCaptureVideoProfile(outPtr)
        }

        return this.__IMediaCaptureVideoProfile.get_SupportedRecordMediaDescription()
    }

    /**
     * 
     * @returns {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    get_SupportedPhotoMediaDescription() {
        if (!this.HasProp("__IMediaCaptureVideoProfile")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfile := IMediaCaptureVideoProfile(outPtr)
        }

        return this.__IMediaCaptureVideoProfile.get_SupportedPhotoMediaDescription()
    }

    /**
     * Gets the list of [MediaCaptureVideoProfile](mediacapturevideoprofile.md) objects that can be used concurrently with this video profile.
     * @remarks
     * You can get a list of video profiles that support concurrency by calling [MediaCapture.FindConcurrentProfiles](mediacapture_findconcurrentprofiles_834250833.md).
     * @returns {IVectorView<MediaCaptureVideoProfile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofile.getconcurrency
     */
    GetConcurrency() {
        if (!this.HasProp("__IMediaCaptureVideoProfile")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfile := IMediaCaptureVideoProfile(outPtr)
        }

        return this.__IMediaCaptureVideoProfile.GetConcurrency()
    }

    /**
     * 
     * @returns {IVectorView<MediaFrameSourceInfo>} 
     */
    get_FrameSourceInfos() {
        if (!this.HasProp("__IMediaCaptureVideoProfile2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfile2 := IMediaCaptureVideoProfile2(outPtr)
        }

        return this.__IMediaCaptureVideoProfile2.get_FrameSourceInfos()
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IMediaCaptureVideoProfile2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfile2 := IMediaCaptureVideoProfile2(outPtr)
        }

        return this.__IMediaCaptureVideoProfile2.get_Properties()
    }

;@endregion Instance Methods
}
