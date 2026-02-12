#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaStreamSourceStartingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaStreamSource.Starting](mediastreamsource_starting.md) event.
 * @remarks
 * This object is not instantiated directly, it is created by the [MediaStreamSource.Starting](mediastreamsource_starting.md) event.
 * 
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a UWP app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcestartingeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSourceStartingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaStreamSourceStartingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaStreamSourceStartingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the object that represents the request to start accumulating [MediaStreamSample](mediastreamsample.md) data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcestartingeventargs.request
     * @type {MediaStreamSourceStartingRequest} 
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
     * @returns {MediaStreamSourceStartingRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IMediaStreamSourceStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceStartingEventArgs := IMediaStreamSourceStartingEventArgs(outPtr)
        }

        return this.__IMediaStreamSourceStartingEventArgs.get_Request()
    }

;@endregion Instance Methods
}
