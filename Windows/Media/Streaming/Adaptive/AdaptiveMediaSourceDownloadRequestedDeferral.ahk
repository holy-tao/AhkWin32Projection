#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourceDownloadRequestedDeferral.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a deferral that can be used to defer the completion of the [DownloadRequested](adaptivemediasource_downloadrequested.md) event so that the app can asynchronously download media content.
 * @remarks
 * To get an instance of this class call [AdaptiveMediaSourceDownloadRequestedEventargs.GetDeferral](adaptivemediasourcedownloadrequestedeventargs_getdeferral_254836512.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequesteddeferral
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceDownloadRequestedDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourceDownloadRequestedDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourceDownloadRequestedDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Informs the system that an asynchronous operation associated with a [DownloadRequested](adaptivemediasource_downloadrequested.md) event has finished.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadrequesteddeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadRequestedDeferral")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadRequestedDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadRequestedDeferral := IAdaptiveMediaSourceDownloadRequestedDeferral(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadRequestedDeferral.Complete()
    }

;@endregion Instance Methods
}
