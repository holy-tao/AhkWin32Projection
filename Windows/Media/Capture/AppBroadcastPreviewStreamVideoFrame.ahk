#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastPreviewStreamVideoFrame.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a video frame from the app broadcast preview stream.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamvideoframe
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastPreviewStreamVideoFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastPreviewStreamVideoFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastPreviewStreamVideoFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the header describing the image data for the app broadcast preview stream video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamvideoframe.videoheader
     * @type {AppBroadcastPreviewStreamVideoHeader} 
     */
    VideoHeader {
        get => this.get_VideoHeader()
    }

    /**
     * Gets the buffer containing the image data for the app broadcast preview stream video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstreamvideoframe.videobuffer
     * @type {IBuffer} 
     */
    VideoBuffer {
        get => this.get_VideoBuffer()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppBroadcastPreviewStreamVideoHeader} 
     */
    get_VideoHeader() {
        if (!this.HasProp("__IAppBroadcastPreviewStreamVideoFrame")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamVideoFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamVideoFrame := IAppBroadcastPreviewStreamVideoFrame(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamVideoFrame.get_VideoHeader()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_VideoBuffer() {
        if (!this.HasProp("__IAppBroadcastPreviewStreamVideoFrame")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStreamVideoFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStreamVideoFrame := IAppBroadcastPreviewStreamVideoFrame(outPtr)
        }

        return this.__IAppBroadcastPreviewStreamVideoFrame.get_VideoBuffer()
    }

;@endregion Instance Methods
}
