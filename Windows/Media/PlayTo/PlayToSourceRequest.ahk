#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayToSourceRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a request to connect a media element with a Play To target.
 * @remarks
 * The PlayToSourceRequest class represents a user request for source media to stream to a Play To target. You use the [SourceRequest](playtosourcerequestedeventargs_sourcerequest.md) property of the [PlayToSourceRequestedEventArgs](playtosourcerequestedeventargs.md) class to pass media from your application to Play To during the [SourceRequested](playtomanager_sourcerequested.md) event.
 * 
 * You can use the [GetDeferral](playtosourcerequest_getdeferral_254836512.md) method to create a deferral for when you want to make an asynchronous call to retrieve the media element to stream. Play To will then wait for you to supply the media element until you mark the deferral as complete.
 * 
 * For an example of how to use Play To in an application, see [PlayReady DRM](/windows/uwp/audio-video-camera/playready-client-sdk).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourcerequest
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToSourceRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayToSourceRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayToSourceRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time limit to supply the Play To source element.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourcerequest.deadline
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__IPlayToSourceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceRequest := IPlayToSourceRequest(outPtr)
        }

        return this.__IPlayToSourceRequest.get_Deadline()
    }

    /**
     * Displays an error message in the Play To UI.
     * @param {HSTRING} errorString The error message to display in the Play To UI.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourcerequest.displayerrorstring
     */
    DisplayErrorString(errorString) {
        if (!this.HasProp("__IPlayToSourceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceRequest := IPlayToSourceRequest(outPtr)
        }

        return this.__IPlayToSourceRequest.DisplayErrorString(errorString)
    }

    /**
     * Defers connecting a media source to a Play To target.
     * @remarks
     * You can use a deferral when you want to make an asynchronous call to retrieve the media element to stream. Play To will then wait for you to supply the media element until you mark the deferral as complete.
     * 
     * 
     * 
     * To create a deferral, call the GetDeferral method to instruct the [PlayToManager](playtomanager.md) class to wait to receive a source media element to stream to the Play To target. After you have supplied the source media element to the [SetSource](playtosourcerequest_setsource_1024738425.md) method, call the [Complete](playtosourcedeferral_complete_1807836922.md) method to end the deferral. If you create a deferral and the wait time exceeds the [Deadline](playtosourcerequest_deadline.md) property, Play To will continue without a source element from your app.
     * 
     * For an example of how to use Play To in an application, see [PlayReady DRM](/windows/uwp/audio-video-camera/playready-client-sdk).
     * @returns {PlayToSourceDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourcerequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPlayToSourceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceRequest := IPlayToSourceRequest(outPtr)
        }

        return this.__IPlayToSourceRequest.GetDeferral()
    }

    /**
     * Sets the source element to connect to the Play To target.
     * @remarks
     * The [PlayToSourceRequest](playtosourcerequest.md) class represents a user request for source media to stream to a Play To target. You use the [SourceRequest](playtosourcerequestedeventargs_sourcerequest.md) property of the [PlayToSourceRequestedEventArgs](playtosourcerequestedeventargs.md) class to pass media from your application to Play To during the [SourceRequested](playtomanager_sourcerequested.md) event.
     * @param {PlayToSource} value The source element to connect to the Play To target.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtosourcerequest.setsource
     */
    SetSource(value) {
        if (!this.HasProp("__IPlayToSourceRequest")) {
            if ((queryResult := this.QueryInterface(IPlayToSourceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToSourceRequest := IPlayToSourceRequest(outPtr)
        }

        return this.__IPlayToSourceRequest.SetSource(value)
    }

;@endregion Instance Methods
}
