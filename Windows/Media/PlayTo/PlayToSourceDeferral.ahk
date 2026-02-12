#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayToSourceDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a deferred operation when you're supplying a source media element for Play To.
 * @remarks
 * You can use a deferral when you want to make an asynchronous call to retrieve the media element to stream. Play To will then wait for you to supply the media element until you mark the deferral as complete.
 * 
 * 
 * 
 * To create a deferral, call the [GetDeferral](playtosourcerequest_getdeferral_254836512.md) method to instruct the [PlayToManager](playtomanager.md) class to wait to receive a source media element to stream to the Play To target. After you've supplied the source media element to the [SetSource](playtosourcerequest_setsource_1024738425.md) method, call the [Complete](playtosourcedeferral_complete_1807836922.md) method to end the deferral. If you create a deferral and the wait time exceeds the [Deadline](playtosourcerequest_deadline.md) property, Play To will continue without a source element from your app.
 * 
 * For an example of how to use Play To in an application, see [PlayReady DRM](/windows/uwp/audio-video-camera/playready-client-sdk).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourcedeferral
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToSourceDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayToSourceDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayToSourceDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Ends the deferral.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourcedeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IPlayToSourceDeferral")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceDeferral := IPlayToSourceDeferral(outPtr)
        }

        return this.__IPlayToSourceDeferral.Complete()
    }

;@endregion Instance Methods
}
