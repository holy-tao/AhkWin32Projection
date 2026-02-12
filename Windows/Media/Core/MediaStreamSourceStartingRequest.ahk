#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaStreamSourceStartingRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a request from the [MediaStreamSource.Starting](mediastreamsource_starting.md) event for the application to start accumulating [MediaStreamSample](mediastreamsample.md) objects from a specific position in the media.
 * @remarks
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a UWP app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcestartingrequest
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSourceStartingRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaStreamSourceStartingRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaStreamSourceStartingRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies a reference to a [TimeSpan](/windows/desktop/api/windows.foundation/ns-windows-foundation-timespan) object which represents a time position in the media time-line from which the application should return [MediaStreamSample](mediastreamsample.md) objects.
     * @remarks
     * If *StartPosition* is not **null**, then the [TimeSpan](/windows/desktop/api/windows.foundation/ns-windows-foundation-timespan) specifies the position in the media time-line from which the application should deliver [MediaStreamSamples](mediastreamsample.md). If the reference is **null**, the application is not supposed to change its position and it should then continue to return [MediaStreamSamples](mediastreamsample.md) from the current position.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcestartingrequest.startposition
     * @type {IReference<TimeSpan>} 
     */
    StartPosition {
        get => this.get_StartPosition()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_StartPosition() {
        if (!this.HasProp("__IMediaStreamSourceStartingRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceStartingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceStartingRequest := IMediaStreamSourceStartingRequest(outPtr)
        }

        return this.__IMediaStreamSourceStartingRequest.get_StartPosition()
    }

    /**
     * Defers completing the [MediaStreamSource.Starting](mediastreamsource_starting.md) event.
     * @remarks
     * You can use a deferral when you want to make an asynchronous call in response to the [Starting](mediastreamsource_starting.md) event. For example, if you need to establish a HTTP connection or open a file for reading. The [MediaStreamSource](mediastreamsource.md) will then wait for you to mark the deferral as complete before it begins raising the [SampleRequested](mediastreamsource_samplerequested.md) event.
     * 
     * To create a deferral, call the GetDeferral method to instruct the [MediaStreamSource](mediastreamsource.md) to wait for your asynchronous call to complete. When you are ready to start receiving [SampleRequested](mediastreamsource_samplerequested.md) events, call the [Complete](mediastreamsourcestartingrequestdeferral_complete_1807836922.md) method to end the deferral.
     * @returns {MediaStreamSourceStartingRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcestartingrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMediaStreamSourceStartingRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceStartingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceStartingRequest := IMediaStreamSourceStartingRequest(outPtr)
        }

        return this.__IMediaStreamSourceStartingRequest.GetDeferral()
    }

    /**
     * Specifies the starting position in the media time-line for subsequent [MediaStreamSamples](mediastreamsample.md) that will be delivered to the [MediaStreamSource](mediastreamsource.md).
     * @remarks
     * The application should choose the value of *position* such that the values of the [Timestamp](mediastreamsample_timestamp.md) property of the [MediaStreamSample](mediastreamsample.md) objects will be greater than or equal to position, for all currently selected streams.
     * @param {TimeSpan} position The actual starting point in the media time-line chosen by the application.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourcestartingrequest.setactualstartposition
     */
    SetActualStartPosition(position) {
        if (!this.HasProp("__IMediaStreamSourceStartingRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceStartingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceStartingRequest := IMediaStreamSourceStartingRequest(outPtr)
        }

        return this.__IMediaStreamSourceStartingRequest.SetActualStartPosition(position)
    }

;@endregion Instance Methods
}
