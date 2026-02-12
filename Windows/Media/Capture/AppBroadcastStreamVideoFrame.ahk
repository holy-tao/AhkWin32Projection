#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastStreamVideoFrame.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a video frame in a broadcast stream.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get an instance of this class by calling [AppBroadcastStreamReader.TryGetNextVideoFrame](appbroadcaststreamreader_trygetnextvideoframe_1410796427.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamvideoframe
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastStreamVideoFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastStreamVideoFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastStreamVideoFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object that contains metadata about the associated broadcast video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamvideoframe.videoheader
     * @type {AppBroadcastStreamVideoHeader} 
     */
    VideoHeader {
        get => this.get_VideoHeader()
    }

    /**
     * Gets the buffer containing the image data for the broadcast audio frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamvideoframe.videobuffer
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
     * @returns {AppBroadcastStreamVideoHeader} 
     */
    get_VideoHeader() {
        if (!this.HasProp("__IAppBroadcastStreamVideoFrame")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamVideoFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamVideoFrame := IAppBroadcastStreamVideoFrame(outPtr)
        }

        return this.__IAppBroadcastStreamVideoFrame.get_VideoHeader()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_VideoBuffer() {
        if (!this.HasProp("__IAppBroadcastStreamVideoFrame")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamVideoFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamVideoFrame := IAppBroadcastStreamVideoFrame(outPtr)
        }

        return this.__IAppBroadcastStreamVideoFrame.get_VideoBuffer()
    }

;@endregion Instance Methods
}
