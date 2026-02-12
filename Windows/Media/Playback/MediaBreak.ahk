#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaBreak.ahk
#Include .\IMediaBreakFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a set of one or more [MediaPlaybackItem](mediaplaybackitem.md) objects that are played before, after, or at specified points during the playback of another [MediaPlaybackItem](mediaplaybackitem.md).
 * @remarks
 * Get a reference to the currently playing **MediaBreak** using the constructor or by accessing the [CurrentBreak](mediabreakmanager_currentbreak.md) property of the [MediaBreakManager](mediabreakmanager.md). When a media break begins playing, you can get a reference to the associated **MediaBreak** object by handling the [BreakStarted](mediabreakmanager_breakstarted.md) event and accessing the [MediaBreak](mediabreakendedeventargs_mediabreak.md) property of the [MediaBreakStartedEventArgs](mediabreakstartedeventargs.md) passed into the handler.
 * 
 * Get or set a pre-roll or post-roll media break for a media item by accessing the [PrerollBreak](mediabreakschedule_prerollbreak.md) or [PostrollBreak](mediabreakschedule_postrollbreak.md) property of the [MediaBreakSchedule](mediabreakschedule.md) object associated with a [MediaPlaybackItem](mediaplaybackitem.md).
 * 
 * For how-to guidance for working with media breaks, see [Create, schedule, and manage media breaks](/windows/uwp/audio-video-camera/create-schedule-and-manage-media-breaks).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreak
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaBreak extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaBreak

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaBreak.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [MediaBreak](mediabreak.md) class with the specified insertion method.
     * @param {Integer} insertionMethod A value indicating whether the media break will pause the currently playing media content.
     * @returns {MediaBreak} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreak.#ctor
     */
    static Create(insertionMethod) {
        if (!MediaBreak.HasProp("__IMediaBreakFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.MediaBreak")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaBreakFactory.IID)
            MediaBreak.__IMediaBreakFactory := IMediaBreakFactory(factoryPtr)
        }

        return MediaBreak.__IMediaBreakFactory.Create(insertionMethod)
    }

    /**
     * Initializes a new instance of the [MediaBreak](mediabreak.md) class with the specified insertion method and presentation position.
     * @param {Integer} insertionMethod A value indicating whether the media break will pause the currently playing media content.
     * @param {TimeSpan} presentationPosition The position within the playback of a [MediaPlaybackItem](mediaplaybackitem.md) at which the [MediaBreak](mediabreak.md) will be played.
     * @returns {MediaBreak} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreak.#ctor
     */
    static CreateWithPresentationPosition(insertionMethod, presentationPosition) {
        if (!MediaBreak.HasProp("__IMediaBreakFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.MediaBreak")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaBreakFactory.IID)
            MediaBreak.__IMediaBreakFactory := IMediaBreakFactory(factoryPtr)
        }

        return MediaBreak.__IMediaBreakFactory.CreateWithPresentationPosition(insertionMethod, presentationPosition)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [MediaPlaybackList](mediaplaybacklist.md) containing the [MediaPlaybackItem](mediaplaybackitem.md) objects that will be played as part of the [MediaBreak](mediabreak.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreak.playbacklist
     * @type {MediaPlaybackList} 
     */
    PlaybackList {
        get => this.get_PlaybackList()
    }

    /**
     * Gets the position within the playback of a [MediaPlaybackItem](mediaplaybackitem.md) at which the [MediaBreak](mediabreak.md) will be played.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreak.presentationposition
     * @type {IReference<TimeSpan>} 
     */
    PresentationPosition {
        get => this.get_PresentationPosition()
    }

    /**
     * Gets a value indicating whether the media break will interrupt the main content, causing the main content to pause while it is played, or if it will replace the main content.
     * @remarks
     * Typical implementations will use [MediaBreakInsertionMethod.Interrupt](mediabreakinsertionmethod.md) for on-demand content and use [MediaBreakInsertionMethod.Replace](mediabreakinsertionmethod.md) for live content.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreak.insertionmethod
     * @type {Integer} 
     */
    InsertionMethod {
        get => this.get_InsertionMethod()
    }

    /**
     * Gets a map of key/value pairs that allow you to associate custom data with a [MediaBreak](mediabreak.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreak.customproperties
     * @type {ValueSet} 
     */
    CustomProperties {
        get => this.get_CustomProperties()
    }

    /**
     * Gets or sets a value indicating whether the [MediaBreak](mediabreak.md) can be played.
     * @remarks
     * You can set **CanStart** to false in the handler for the [BreakEnded](mediabreakmanager_breakended.md) event to make sure that a break that has already played isn't played again.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreak.canstart
     * @type {Boolean} 
     */
    CanStart {
        get => this.get_CanStart()
        set => this.put_CanStart(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaPlaybackList} 
     */
    get_PlaybackList() {
        if (!this.HasProp("__IMediaBreak")) {
            if ((queryResult := this.QueryInterface(IMediaBreak.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreak := IMediaBreak(outPtr)
        }

        return this.__IMediaBreak.get_PlaybackList()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PresentationPosition() {
        if (!this.HasProp("__IMediaBreak")) {
            if ((queryResult := this.QueryInterface(IMediaBreak.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreak := IMediaBreak(outPtr)
        }

        return this.__IMediaBreak.get_PresentationPosition()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InsertionMethod() {
        if (!this.HasProp("__IMediaBreak")) {
            if ((queryResult := this.QueryInterface(IMediaBreak.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreak := IMediaBreak(outPtr)
        }

        return this.__IMediaBreak.get_InsertionMethod()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_CustomProperties() {
        if (!this.HasProp("__IMediaBreak")) {
            if ((queryResult := this.QueryInterface(IMediaBreak.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreak := IMediaBreak(outPtr)
        }

        return this.__IMediaBreak.get_CustomProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanStart() {
        if (!this.HasProp("__IMediaBreak")) {
            if ((queryResult := this.QueryInterface(IMediaBreak.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreak := IMediaBreak(outPtr)
        }

        return this.__IMediaBreak.get_CanStart()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanStart(value) {
        if (!this.HasProp("__IMediaBreak")) {
            if ((queryResult := this.QueryInterface(IMediaBreak.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreak := IMediaBreak(outPtr)
        }

        return this.__IMediaBreak.put_CanStart(value)
    }

;@endregion Instance Methods
}
