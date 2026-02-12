#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaStreamSourceStartingRequestDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a way for the application to asynchronously report that it has completed processing the [MediaStreamSource.Starting](mediastreamsource_starting.md) event.
 * @remarks
 * You can use a deferral when you want to make an asynchronous call in response to the [MediaStreamSource.Starting](mediastreamsource_starting.md) event. For example, if you need to establish a HTTP connection or open a file for reading. The [MediaStreamSource](mediastreamsource.md) will then wait for you to mark the deferral as complete before it begins raising the [SampleRequested](mediastreamsource_samplerequested.md) event.
 * 
 * To create a deferral, call the [GetDeferral](mediastreamsourcestartingrequest_getdeferral_254836512.md) method on the [MediaStreamSourceStartingRequest](mediastreamsourcestartingrequest.md) object to instruct the [MediaStreamSource](mediastreamsource.md) to wait for your asynchronous call to complete. When you are ready to start receiving [SampleRequested](mediastreamsource_samplerequested.md) events, call the [Complete](mediastreamsourcestartingrequestdeferral_complete_1807836922.md) method to end the deferral.
 * 
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a UWP app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcestartingrequestdeferral
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSourceStartingRequestDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaStreamSourceStartingRequestDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaStreamSourceStartingRequestDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Reports that the application has completed processing the Starting event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcestartingrequestdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IMediaStreamSourceStartingRequestDeferral")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceStartingRequestDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceStartingRequestDeferral := IMediaStreamSourceStartingRequestDeferral(outPtr)
        }

        return this.__IMediaStreamSourceStartingRequestDeferral.Complete()
    }

;@endregion Instance Methods
}
