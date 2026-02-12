#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaCaptureVideoProfileMediaDescription.ahk
#Include .\IMediaCaptureVideoProfileMediaDescription2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a description of media that is supported by a video profile.
 * @remarks
 * An instance of MediaCaptureVideoProfileMediaDescription defines a group of capture settings that are supported by a video profile. For example, a single video profile may support recording 720p video at 30 fps with HDR video support and also support recording 1080p video at 30 fps without HDR video support. In this case, each of these would be represented by a MediaCaptureVideoProfileMediaDescription object in the [SupportedRecordMediaDescription](mediacapturevideoprofile_supportedrecordmediadescription.md) list of the video profile. Each profile contains separate lists of media descriptions for photo capture, preview, and video recording. For more information on video profiles, see [MediaCaptureVideoProfile](mediacapturevideoprofile.md).
 * 
 * You configure the capture device to use a particular MediaCaptureVideoProfileMediaDescription by using the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md) object. It is important that the video profile media description values you use when configuring the device are compatible with the other initialization settings. For more information on how to correctly use media profile descriptions in the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md), see [MediaCaptureInitializationSettings.PhotoMediaDescription](mediacaptureinitializationsettings_photomediadescription.md), [MediaCaptureInitializationSettings.PreviewMediaDescription](mediacaptureinitializationsettings_previewmediadescription.md), and [MediaCaptureInitializationSettings.RecordMediaDescription](mediacaptureinitializationsettings_recordmediadescription.md).
 * 
 * For how-to guidance for working with video profiles, see [Discover and select camera capabilities with camera profiles](/windows/apps/develop/camera/camera-profiles).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofilemediadescription
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureVideoProfileMediaDescription extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaCaptureVideoProfileMediaDescription

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaCaptureVideoProfileMediaDescription.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the width of the media description.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofilemediadescription.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the height of the media description.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofilemediadescription.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets the frame rate of the media description.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofilemediadescription.framerate
     * @type {Float} 
     */
    FrameRate {
        get => this.get_FrameRate()
    }

    /**
     * Gets a value indicating if the media description includes variable photo sequence support.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofilemediadescription.isvariablephotosequencesupported
     * @type {Boolean} 
     */
    IsVariablePhotoSequenceSupported {
        get => this.get_IsVariablePhotoSequenceSupported()
    }

    /**
     * Gets a value indicating if the media description includes HDR video support.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofilemediadescription.ishdrvideosupported
     * @type {Boolean} 
     */
    IsHdrVideoSupported {
        get => this.get_IsHdrVideoSupported()
    }

    /**
     * Gets a string containing the standard name for the media encoding subtype supported by the media profile, such as "Aac", "Jpeg", or "Hevc".
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofilemediadescription.subtype
     * @type {HSTRING} 
     */
    Subtype {
        get => this.get_Subtype()
    }

    /**
     * Gets a read-only map of custom attributes provided by the capture device manufacturer.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturevideoprofilemediadescription.properties
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
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IMediaCaptureVideoProfileMediaDescription")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfileMediaDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfileMediaDescription := IMediaCaptureVideoProfileMediaDescription(outPtr)
        }

        return this.__IMediaCaptureVideoProfileMediaDescription.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IMediaCaptureVideoProfileMediaDescription")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfileMediaDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfileMediaDescription := IMediaCaptureVideoProfileMediaDescription(outPtr)
        }

        return this.__IMediaCaptureVideoProfileMediaDescription.get_Height()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FrameRate() {
        if (!this.HasProp("__IMediaCaptureVideoProfileMediaDescription")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfileMediaDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfileMediaDescription := IMediaCaptureVideoProfileMediaDescription(outPtr)
        }

        return this.__IMediaCaptureVideoProfileMediaDescription.get_FrameRate()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVariablePhotoSequenceSupported() {
        if (!this.HasProp("__IMediaCaptureVideoProfileMediaDescription")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfileMediaDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfileMediaDescription := IMediaCaptureVideoProfileMediaDescription(outPtr)
        }

        return this.__IMediaCaptureVideoProfileMediaDescription.get_IsVariablePhotoSequenceSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHdrVideoSupported() {
        if (!this.HasProp("__IMediaCaptureVideoProfileMediaDescription")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfileMediaDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfileMediaDescription := IMediaCaptureVideoProfileMediaDescription(outPtr)
        }

        return this.__IMediaCaptureVideoProfileMediaDescription.get_IsHdrVideoSupported()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtype() {
        if (!this.HasProp("__IMediaCaptureVideoProfileMediaDescription2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfileMediaDescription2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfileMediaDescription2 := IMediaCaptureVideoProfileMediaDescription2(outPtr)
        }

        return this.__IMediaCaptureVideoProfileMediaDescription2.get_Subtype()
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IMediaCaptureVideoProfileMediaDescription2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoProfileMediaDescription2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoProfileMediaDescription2 := IMediaCaptureVideoProfileMediaDescription2(outPtr)
        }

        return this.__IMediaCaptureVideoProfileMediaDescription2.get_Properties()
    }

;@endregion Instance Methods
}
