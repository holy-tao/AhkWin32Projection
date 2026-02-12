#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaFrameSource.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaFrameSource.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a source of media frames, such as a color or infrared camera.
 * @remarks
 * To get an instance of **MediaFrameSource**, you must first initialize the [MediaCapture](../windows.media.capture/mediacapture.md) object with a [MediaFrameSourceGroup](mediaframesourcegroup.md) that includes your desired media frame source. You do this by setting the [SourceGroup](../windows.media.capture/mediacaptureinitializationsettings_sourcegroup.md) of the [MediaCaptureInitializationSettings](../windows.media.capture/mediacaptureinitializationsettings.md) object you pass into [MediaCapture.InitializeAsync](../windows.media.capture/mediacapture_initializeasync_315323248.md). Next, use the [MediaFrameSourceInfo.Id](mediaframesourceinfo_id.md) property associated with the desired frame source as the key in the **MediaCapture** object's [FrameSources](../windows.media.capture/mediacapture_framesources.md) dictionary to get an instance of the **MediaFrameSource** object.
 * 
 * For how-to guidance on using MediaFrameSource to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesource
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaFrameSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaFrameSource.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaFrameSourceInfo](mediaframesourceinfo.md) object that provides information about the [MediaFrameSource](mediaframesource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesource.info
     * @type {MediaFrameSourceInfo} 
     */
    Info {
        get => this.get_Info()
    }

    /**
     * Gets the [MediaFrameSourceController](mediaframesourcecontroller.md) for the [MediaFrameSource](mediaframesource.md).
     * @remarks
     * The [MediaFrameSourceController](mediaframesourcecontroller.md) object allows you to get and set properties of a media frame source and to get a [VideoDeviceController](../windows.media.devices/videodevicecontroller.md), which provides camera controls such as exposure, focus, and zoom.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesource.controller
     * @type {MediaFrameSourceController} 
     */
    Controller {
        get => this.get_Controller()
    }

    /**
     * Gets a read-only list of [MediaFrameFormat](mediaframeformat.md) objects representing the frame formats supported by the [MediaFrameSource](mediaframesource.md).
     * @remarks
     * Get the list of supported frame formats for a media frame source by accessing the SupportedFormats property.
     * 
     * Get the current frame format of the media frame source by accessing the [CurrentFormat](mediaframesource_currentformat.md) property. Set the current frame format by calling [SetFormatAsync](mediaframesource_setformatasync_966320450.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesource.supportedformats
     * @type {IVectorView<MediaFrameFormat>} 
     */
    SupportedFormats {
        get => this.get_SupportedFormats()
    }

    /**
     * Gets a value indicating the current frame format of the [MediaFrameSource](mediaframesource.md).
     * @remarks
     * To be notified when the current frame format of the media frame source changes, handle the [FormatChanged](mediaframesource_formatchanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesource.currentformat
     * @type {MediaFrameFormat} 
     */
    CurrentFormat {
        get => this.get_CurrentFormat()
    }

    /**
     * Occurs when the current frame format of the [MediaFrameSource](mediaframesource.md) changes.
     * @remarks
     * Get the current frame format of the media frame source by accessing the [CurrentFormat](mediaframesource_currentformat.md) property.
     * @type {TypedEventHandler<MediaFrameSource, IInspectable>}
    */
    OnFormatChanged {
        get {
            if(!this.HasProp("__OnFormatChanged")){
                this.__OnFormatChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c7e61aa7-4716-5514-a913-ef1796b98dbd}"),
                    MediaFrameSource,
                    IInspectable
                )
                this.__OnFormatChangedToken := this.add_FormatChanged(this.__OnFormatChanged.iface)
            }
            return this.__OnFormatChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnFormatChangedToken")) {
            this.remove_FormatChanged(this.__OnFormatChangedToken)
            this.__OnFormatChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {MediaFrameSourceInfo} 
     */
    get_Info() {
        if (!this.HasProp("__IMediaFrameSource")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSource := IMediaFrameSource(outPtr)
        }

        return this.__IMediaFrameSource.get_Info()
    }

    /**
     * 
     * @returns {MediaFrameSourceController} 
     */
    get_Controller() {
        if (!this.HasProp("__IMediaFrameSource")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSource := IMediaFrameSource(outPtr)
        }

        return this.__IMediaFrameSource.get_Controller()
    }

    /**
     * 
     * @returns {IVectorView<MediaFrameFormat>} 
     */
    get_SupportedFormats() {
        if (!this.HasProp("__IMediaFrameSource")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSource := IMediaFrameSource(outPtr)
        }

        return this.__IMediaFrameSource.get_SupportedFormats()
    }

    /**
     * 
     * @returns {MediaFrameFormat} 
     */
    get_CurrentFormat() {
        if (!this.HasProp("__IMediaFrameSource")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSource := IMediaFrameSource(outPtr)
        }

        return this.__IMediaFrameSource.get_CurrentFormat()
    }

    /**
     * Asynchronously sets the frame format of the [MediaFrameSource](mediaframesource.md).
     * @remarks
     * This method is an alternative to [MediaCapture.SetEncodingPropertiesAsync](../windows.media.capture/mediacapture_setencodingpropertiesasync_1218555455.md), but unlike **SetEncodingPropertiesAsync**, this method can be used with any stream, not just the color camera preview, record, and photo capture streams.
     * 
     * Get the list of supported frame formats for a media frame source by accessing the [SupportedFormats](mediaframesource_supportedformats.md) property.
     * 
     * Get the current frame format of the media frame source by accessing the [CurrentFormat](mediaframesource_currentformat.md) property.
     * @param {MediaFrameFormat} format The new frame format for the media frame source.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesource.setformatasync
     */
    SetFormatAsync(format) {
        if (!this.HasProp("__IMediaFrameSource")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSource := IMediaFrameSource(outPtr)
        }

        return this.__IMediaFrameSource.SetFormatAsync(format)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FormatChanged(handler) {
        if (!this.HasProp("__IMediaFrameSource")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSource := IMediaFrameSource(outPtr)
        }

        return this.__IMediaFrameSource.add_FormatChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FormatChanged(token) {
        if (!this.HasProp("__IMediaFrameSource")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSource := IMediaFrameSource(outPtr)
        }

        return this.__IMediaFrameSource.remove_FormatChanged(token)
    }

    /**
     * Attempts to retrieve the media frame source's camera intrinsics, which describe a camera's distortion model, for the specified [MediaFrameFormat](mediaframeformat.md).
     * @param {MediaFrameFormat} format The media frame format for which the camera intrinsics should be retrieved.
     * @returns {CameraIntrinsics} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesource.trygetcameraintrinsics
     */
    TryGetCameraIntrinsics(format) {
        if (!this.HasProp("__IMediaFrameSource")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSource := IMediaFrameSource(outPtr)
        }

        return this.__IMediaFrameSource.TryGetCameraIntrinsics(format)
    }

;@endregion Instance Methods
}
