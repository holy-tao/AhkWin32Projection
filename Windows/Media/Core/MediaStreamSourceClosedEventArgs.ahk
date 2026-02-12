#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaStreamSourceClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaStreamSource.Closed](mediastreamsource_closed.md) event.
 * @remarks
 * This object is not instantiated directly, it is created by the [MediaStreamSource.Closed](mediastreamsource_closed.md) event.
 * 
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a Universal Windows app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourceclosedeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSourceClosedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaStreamSourceClosedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaStreamSourceClosedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the object that represents the notification that the [MediaStreamSource](mediastreamsource.md) has been closed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourceclosedeventargs.request
     * @type {MediaStreamSourceClosedRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaStreamSourceClosedRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IMediaStreamSourceClosedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceClosedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceClosedEventArgs := IMediaStreamSourceClosedEventArgs(outPtr)
        }

        return this.__IMediaStreamSourceClosedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
