#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaStreamSourceSampleRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object to be used by the [MediaStreamSource.SampleRequest](mediastreamsource_samplerequested.md) event to provide information to the application.
 * @remarks
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a UWP app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcesamplerequest
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSourceSampleRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaStreamSourceSampleRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaStreamSourceSampleRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [IMediaStreamDescriptor](imediastreamdescriptor.md) interface of the stream for which a [MediaStreamSample](mediastreamsample.md) is being requested.
     * @remarks
     * The [Sample](mediastreamsourcesamplerequest_sample.md) property of the [MediaStreamSourceSampleRequest](mediastreamsourcesamplerequest.md) object should be assigned a [MediaStreamSample](mediastreamsample.md) belonging to the stream identified by the StreamDescriptor property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcesamplerequest.streamdescriptor
     * @type {IMediaStreamDescriptor} 
     */
    StreamDescriptor {
        get => this.get_StreamDescriptor()
    }

    /**
     * Sets the [MediaStreamSample](mediastreamsample.md) requested by the [MediaStreamSource](mediastreamsource.md). Applications deliver a [MediaStreamSample](mediastreamsample.md) to the [MediaStreamSource](mediastreamsource.md) by assigning a value to this property.
     * @remarks
     * The initial value of this property is **null**.
     * 
     * The application should allocate a [MediaStreamSample](mediastreamsample.md) and deliver it to the [MediaStreamSource](mediastreamsource.md) by assigning the [MediaStreamSample](mediastreamsample.md) to this property.
     * 
     * If there are no more [MediaStreamSamples](mediastreamsample.md) to deliver to the stream identified by the [StreamDescriptor](mediastreamsourcesamplerequest_streamdescriptor.md) property because the end of the stream has been reached, then the application should set the Sample property to **null**.
     * 
     * If the application needs to perform an asynchronous operation to retrieve the [MediaStreamSample](mediastreamsample.md), it should invoke the [GetDeferral](mediastreamsourcesamplerequest_getdeferral_254836512.md) method to indicate that the assignment of the Sample property has been deferred.
     * 
     * If a [MediaStreamSample](mediastreamsample.md) is not currently available, for example, because it has not yet been downloaded from a server, the application should call [GetDeferral](mediastreamsourcesamplerequest_getdeferral_254836512.md) and also call [ReportSampleProgress](mediastreamsourcesamplerequest_reportsampleprogress_2045860101.md) on as the necessary data is being downloaded.
     * 
     * The recommended interval between each invocation of [ReportSampleProgress](mediastreamsourcesamplerequest_reportsampleprogress_2045860101.md) is 500 milliseconds.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcesamplerequest.sample
     * @type {MediaStreamSample} 
     */
    Sample {
        get => this.get_Sample()
        set => this.put_Sample(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IMediaStreamDescriptor} 
     */
    get_StreamDescriptor() {
        if (!this.HasProp("__IMediaStreamSourceSampleRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceSampleRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceSampleRequest := IMediaStreamSourceSampleRequest(outPtr)
        }

        return this.__IMediaStreamSourceSampleRequest.get_StreamDescriptor()
    }

    /**
     * Defers assigning a [MediaStreamSample](mediastreamsample.md) to [MediaStreamSourceSampleRequest](mediastreamsourcesamplerequest.md) object.
     * @remarks
     * You can use a deferral when you want to make an asynchronous call to retrieve the [MediaStreamSample](mediastreamsample.md). The [MediaStreamSource](mediastreamsource.md) will then wait for you to supply the [MediaStreamSample](mediastreamsample.md) until you mark the deferral as complete.
     * 
     * To create a deferral, call the GetDeferral method to instruct the [MediaStreamSource](mediastreamsource.md) to wait for the [MediaStreamSample](mediastreamsample.md). After you have assigned the [MediaStreamSample](mediastreamsample.md) to the [Sample](mediastreamsourcesamplerequest_sample.md) property of the [MediaStreamSourceSampleRequest](mediastreamsourcesamplerequest.md) object, call the [MediaStreamSourceSampleRequestDeferral.Complete](mediastreamsourcesamplerequestdeferral_complete_1807836922.md) method to end the deferral.
     * @returns {MediaStreamSourceSampleRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcesamplerequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMediaStreamSourceSampleRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceSampleRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceSampleRequest := IMediaStreamSourceSampleRequest(outPtr)
        }

        return this.__IMediaStreamSourceSampleRequest.GetDeferral()
    }

    /**
     * 
     * @param {MediaStreamSample} value 
     * @returns {HRESULT} 
     */
    put_Sample(value) {
        if (!this.HasProp("__IMediaStreamSourceSampleRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceSampleRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceSampleRequest := IMediaStreamSourceSampleRequest(outPtr)
        }

        return this.__IMediaStreamSourceSampleRequest.put_Sample(value)
    }

    /**
     * 
     * @returns {MediaStreamSample} 
     */
    get_Sample() {
        if (!this.HasProp("__IMediaStreamSourceSampleRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceSampleRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceSampleRequest := IMediaStreamSourceSampleRequest(outPtr)
        }

        return this.__IMediaStreamSourceSampleRequest.get_Sample()
    }

    /**
     * Provides a status update to the [MediaStreamSource](mediastreamsource.md) while the application is temporarily unable to deliver a requested [MediaStreamSample](mediastreamsample.md).
     * @remarks
     * The application should invoke this method when it is unable to immediately to deliver the [MediaStreamSample](mediastreamsample.md), which is accomplished by assigning it to the [Sample](mediastreamsourcesamplerequest_sample.md) property. The application should continue to invoke ReportSampleProgress on a regular basis until it is able to deliver the requested [MediaStreamSample](mediastreamsample.md).
     * 
     * The recommended interval between each invocation of ReportSampleProgress is 500 milliseconds.
     * @param {Integer} progress A value between 0 to 100 that indicates the progress towards being able to deliver the requested [MediaStreamSample](mediastreamsample.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcesamplerequest.reportsampleprogress
     */
    ReportSampleProgress(progress) {
        if (!this.HasProp("__IMediaStreamSourceSampleRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceSampleRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceSampleRequest := IMediaStreamSourceSampleRequest(outPtr)
        }

        return this.__IMediaStreamSourceSampleRequest.ReportSampleProgress(progress)
    }

;@endregion Instance Methods
}
