#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaStreamSourceSwitchStreamsRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object to be used by the [MediaStreamSource.SwitchStreamsRequest](mediastreamsource_switchstreamsrequested.md) event to provide information to the application.
 * @remarks
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a UWP app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourceswitchstreamsrequest
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSourceSwitchStreamsRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaStreamSourceSwitchStreamsRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaStreamSourceSwitchStreamsRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the stream descriptor for the stream which is no longer selected by the [MediaStreamSource](mediastreamsource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourceswitchstreamsrequest.oldstreamdescriptor
     * @type {IMediaStreamDescriptor} 
     */
    OldStreamDescriptor {
        get => this.get_OldStreamDescriptor()
    }

    /**
     * Gets the stream descriptor for the stream that is now selected by the [MediaStreamSource](mediastreamsource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourceswitchstreamsrequest.newstreamdescriptor
     * @type {IMediaStreamDescriptor} 
     */
    NewStreamDescriptor {
        get => this.get_NewStreamDescriptor()
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
    get_OldStreamDescriptor() {
        if (!this.HasProp("__IMediaStreamSourceSwitchStreamsRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceSwitchStreamsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceSwitchStreamsRequest := IMediaStreamSourceSwitchStreamsRequest(outPtr)
        }

        return this.__IMediaStreamSourceSwitchStreamsRequest.get_OldStreamDescriptor()
    }

    /**
     * 
     * @returns {IMediaStreamDescriptor} 
     */
    get_NewStreamDescriptor() {
        if (!this.HasProp("__IMediaStreamSourceSwitchStreamsRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceSwitchStreamsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceSwitchStreamsRequest := IMediaStreamSourceSwitchStreamsRequest(outPtr)
        }

        return this.__IMediaStreamSourceSwitchStreamsRequest.get_NewStreamDescriptor()
    }

    /**
     * Defers completing the [MediaStreamSource.SwitchStreamsRequested](mediastreamsource_switchstreamsrequested.md) event.
     * @remarks
     * You can use a deferral when you want to make an asynchronous call in response to the [MediaStreamSource.SwitchStreamsRequested](mediastreamsource_switchstreamsrequested.md) event. For example, if you need to establish a HTTP connection or open a file for reading. The [MediaStreamSource](mediastreamsource.md) will then wait for you to mark the deferral as complete before it begins raising the [SampleRequested](mediastreamsource_samplerequested.md) event.
     * 
     * To create a deferral, call the GetDeferral method to instruct the [MediaStreamSource](mediastreamsource.md) to wait for your asynchronous call to complete. When you are ready to start receiving [SampleRequested](mediastreamsource_samplerequested.md) events, call the [Complete](mediastreamsourceswitchstreamsrequestdeferral_complete_1807836922.md) method to end the deferral.
     * @returns {MediaStreamSourceSwitchStreamsRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourceswitchstreamsrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMediaStreamSourceSwitchStreamsRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceSwitchStreamsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceSwitchStreamsRequest := IMediaStreamSourceSwitchStreamsRequest(outPtr)
        }

        return this.__IMediaStreamSourceSwitchStreamsRequest.GetDeferral()
    }

;@endregion Instance Methods
}
