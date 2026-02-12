#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastPreviewStreamReader.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppBroadcastPreviewStreamReader.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information about and access to the app broadcast preview stream.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamreader
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastPreviewStreamReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastPreviewStreamReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastPreviewStreamReader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the video width, in pixels, of the app broadcast preview stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamreader.videowidth
     * @type {Integer} 
     */
    VideoWidth {
        get => this.get_VideoWidth()
    }

    /**
     * Gets the video height, in pixels, of the app broadcast preview stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamreader.videoheight
     * @type {Integer} 
     */
    VideoHeight {
        get => this.get_VideoHeight()
    }

    /**
     * Gets the video stride of the app broadcast preview stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamreader.videostride
     * @type {Integer} 
     */
    VideoStride {
        get => this.get_VideoStride()
    }

    /**
     * Gets the video bitmap pixel format for the app broadcast preview stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamreader.videobitmappixelformat
     * @type {Integer} 
     */
    VideoBitmapPixelFormat {
        get => this.get_VideoBitmapPixelFormat()
    }

    /**
     * Gets the video bitmap alpha mode for the app broadcast preview stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamreader.videobitmapalphamode
     * @type {Integer} 
     */
    VideoBitmapAlphaMode {
        get => this.get_VideoBitmapAlphaMode()
    }

    /**
     * Occurs when a new video frame arrives from the app broadcast preview stream.
     * @type {TypedEventHandler<AppBroadcastPreviewStreamReader, IInspectable>}
    */
    OnVideoFrameArrived {
        get {
            if(!this.HasProp("__OnVideoFrameArrived")){
                this.__OnVideoFrameArrived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7918f32c-187f-5f0f-b80e-6fcaaa5e14b9}"),
                    AppBroadcastPreviewStreamReader,
                    IInspectable
                )
                this.__OnVideoFrameArrivedToken := this.add_VideoFrameArrived(this.__OnVideoFrameArrived.iface)
            }
            return this.__OnVideoFrameArrived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnVideoFrameArrivedToken")) {
            this.remove_VideoFrameArrived(this.__OnVideoFrameArrivedToken)
            this.__OnVideoFrameArrived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoWidth() {
        if (!this.HasProp("__IAppBroadcastPreviewStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamReader := IAppBroadcastPreviewStreamReader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamReader.get_VideoWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoHeight() {
        if (!this.HasProp("__IAppBroadcastPreviewStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamReader := IAppBroadcastPreviewStreamReader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamReader.get_VideoHeight()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoStride() {
        if (!this.HasProp("__IAppBroadcastPreviewStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamReader := IAppBroadcastPreviewStreamReader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamReader.get_VideoStride()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoBitmapPixelFormat() {
        if (!this.HasProp("__IAppBroadcastPreviewStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamReader := IAppBroadcastPreviewStreamReader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamReader.get_VideoBitmapPixelFormat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoBitmapAlphaMode() {
        if (!this.HasProp("__IAppBroadcastPreviewStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamReader := IAppBroadcastPreviewStreamReader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamReader.get_VideoBitmapAlphaMode()
    }

    /**
     * Attempts to retrieve the next video frame from the app broadcast preview stream.
     * @returns {AppBroadcastPreviewStreamVideoFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamreader.trygetnextvideoframe
     */
    TryGetNextVideoFrame() {
        if (!this.HasProp("__IAppBroadcastPreviewStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamReader := IAppBroadcastPreviewStreamReader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamReader.TryGetNextVideoFrame()
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastPreviewStreamReader, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_VideoFrameArrived(value) {
        if (!this.HasProp("__IAppBroadcastPreviewStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamReader := IAppBroadcastPreviewStreamReader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamReader.add_VideoFrameArrived(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VideoFrameArrived(token) {
        if (!this.HasProp("__IAppBroadcastPreviewStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamReader := IAppBroadcastPreviewStreamReader(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamReader.remove_VideoFrameArrived(token)
    }

;@endregion Instance Methods
}
