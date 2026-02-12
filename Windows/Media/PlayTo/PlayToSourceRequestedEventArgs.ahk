#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayToSourceRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [SourceRequested](playtomanager_sourcerequested.md) event.
 * @remarks
 * You use the [SourceRequest](playtosourcerequestedeventargs_sourcerequest.md) property of the  class to pass media from your application to Play To during the [SourceRequested](playtomanager_sourcerequested.md) event.
 * 
 * For an example of how to use Play To in an application, see [PlayReady DRM](/windows/uwp/audio-video-camera/playready-client-sdk).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourcerequestedeventargs
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToSourceRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayToSourceRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayToSourceRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the media object to connect to a Play To target.
     * @remarks
     * You use the  property to pass media from your application to Play To during the [SourceRequested](playtomanager_sourcerequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourcerequestedeventargs.sourcerequest
     * @type {PlayToSourceRequest} 
     */
    SourceRequest {
        get => this.get_SourceRequest()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PlayToSourceRequest} 
     */
    get_SourceRequest() {
        if (!this.HasProp("__IPlayToSourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceRequestedEventArgs := IPlayToSourceRequestedEventArgs(outPtr)
        }

        return this.__IPlayToSourceRequestedEventArgs.get_SourceRequest()
    }

;@endregion Instance Methods
}
