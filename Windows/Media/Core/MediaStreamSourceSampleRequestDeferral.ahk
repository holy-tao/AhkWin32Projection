#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaStreamSourceSampleRequestDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a way for the application to asynchronously report that it has completed retrieving the [MediaStreamSample](mediastreamsample.md).
 * @remarks
 * You can use a deferral to retrieve the [MediaStreamSample](mediastreamsample.md) asynchronously. The [MediaStreamSource](mediastreamsource.md) will wait until you mark the deferral as complete.
 * 
 * To create a deferral, call [MediaStreamSourceSampleRequest.GetDeferral](mediastreamsourcesamplerequest_getdeferral_254836512.md). This will instruct the [MediaStreamSource](mediastreamsource.md) to wait for the [MediaStreamSample](mediastreamsample.md). After you have assigned the [MediaStreamSample](mediastreamsample.md) to the [MediaStreamSourceSampleRequest.Sample](mediastreamsourcesamplerequest_sample.md) property, call the [Complete](mediastreamsourcesamplerequestdeferral_complete_1807836922.md) method to end the deferral.
 * 
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a UWP app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcesamplerequestdeferral
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSourceSampleRequestDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaStreamSourceSampleRequestDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaStreamSourceSampleRequestDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Reports that the application has completed retrieving the [MediaStreamSample](mediastreamsample.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcesamplerequestdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IMediaStreamSourceSampleRequestDeferral")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceSampleRequestDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceSampleRequestDeferral := IMediaStreamSourceSampleRequestDeferral(outPtr)
        }

        return this.__IMediaStreamSourceSampleRequestDeferral.Complete()
    }

;@endregion Instance Methods
}
