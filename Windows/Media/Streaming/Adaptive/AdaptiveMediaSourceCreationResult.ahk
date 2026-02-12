#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourceCreationResult.ahk
#Include .\IAdaptiveMediaSourceCreationResult2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the result of the creation of a [AdaptiveMediaSource](adaptivemediasource.md) object.
 * @remarks
 * This object is accessed when you call one of the [CreateFromStreamAsync](adaptivemediasource_createfromstreamasync_337009516.md) or [CreateFromUriAsync](adaptivemediasource_createfromuriasync_832683104.md)  methods to create a [AdaptiveMediaSource](adaptivemediasource.md) object.
 * 
 * For how-to guidance for using adaptive streaming in your app, see [Adaptive streaming](/windows/uwp/audio-video-camera/adaptive-streaming).
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcecreationresult
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceCreationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourceCreationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourceCreationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of an attempt to create a [AdaptiveMediaSource](adaptivemediasource.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcecreationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the [AdaptiveMediaSource](adaptivemediasource.md) object that represents the source of adaptive streaming content.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcecreationresult.mediasource
     * @type {AdaptiveMediaSource} 
     */
    MediaSource {
        get => this.get_MediaSource()
    }

    /**
     * Gets the HTTP response message, if any, returned from an attempt to create a [AdaptiveMediaSource](adaptivemediasource.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcecreationresult.httpresponsemessage
     * @type {HttpResponseMessage} 
     */
    HttpResponseMessage {
        get => this.get_HttpResponseMessage()
    }

    /**
     * Gets the extended error code associated with the creation of a [AdaptiveMediaSource](adaptivemediasource.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcecreationresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAdaptiveMediaSourceCreationResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceCreationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceCreationResult := IAdaptiveMediaSourceCreationResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceCreationResult.get_Status()
    }

    /**
     * 
     * @returns {AdaptiveMediaSource} 
     */
    get_MediaSource() {
        if (!this.HasProp("__IAdaptiveMediaSourceCreationResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceCreationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceCreationResult := IAdaptiveMediaSourceCreationResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceCreationResult.get_MediaSource()
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_HttpResponseMessage() {
        if (!this.HasProp("__IAdaptiveMediaSourceCreationResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceCreationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceCreationResult := IAdaptiveMediaSourceCreationResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceCreationResult.get_HttpResponseMessage()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IAdaptiveMediaSourceCreationResult2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceCreationResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceCreationResult2 := IAdaptiveMediaSourceCreationResult2(outPtr)
        }

        return this.__IAdaptiveMediaSourceCreationResult2.get_ExtendedError()
    }

;@endregion Instance Methods
}
