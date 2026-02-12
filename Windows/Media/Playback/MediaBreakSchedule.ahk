#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaBreakSchedule.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaBreakSchedule.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a set of [MediaBreak](mediabreak.md) objects associated with a [MediaPlaybackItem](mediaplaybackitem.md) and the positions within the playback of the item that the media breaks are played.
 * @remarks
 * Get the media break schedule for a media item by accessing the [BreakSchedule](mediaplaybackitem_breakschedule.md) property of the [MediaPlaybackItem](mediaplaybackitem.md) object.
 * 
 * For how-to guidance for working with media breaks, see [Create, schedule, and manage media breaks](/windows/uwp/audio-video-camera/create-schedule-and-manage-media-breaks).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakschedule
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaBreakSchedule extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaBreakSchedule

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaBreakSchedule.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the schedule's current list of [MediaBreak](mediabreak.md) objects that will be played at a point during the playback of the [MediaPlaybackItem](mediaplaybackitem.md) with which the [MediaBreakSchedule](mediabreakschedule.md) is associated.
     * @remarks
     * To add a [MediaBreak](mediabreak.md) to the **MidrollBreaks** list, use [InsertMidrollBreak](mediabreakschedule_insertmidrollbreak_1567865726.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakschedule.midrollbreaks
     * @type {IVectorView<MediaBreak>} 
     */
    MidrollBreaks {
        get => this.get_MidrollBreaks()
    }

    /**
     * Gets or sets the [MediaBreak](mediabreak.md) to be played before the [MediaPlaybackItem](mediaplaybackitem.md) associated with the [MediaBreakSchedule](mediabreakschedule.md) plays.
     * @remarks
     * If you want a **MediaBreak** to be played after the associated [MediaPlaybackItem](mediaplaybackitem.md) plays, assign it to the [PostrollBreak](mediabreakschedule_postrollbreak.md) property. If you want a **MediaBreak** to play at a point during the playback of the associated **MediaPlaybackItem**, use the [InsertMidrollBreak](mediabreakschedule_insertmidrollbreak_1567865726.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakschedule.prerollbreak
     * @type {MediaBreak} 
     */
    PrerollBreak {
        get => this.get_PrerollBreak()
        set => this.put_PrerollBreak(value)
    }

    /**
     * Gets or sets the [MediaBreak](mediabreak.md) to be played after the [MediaPlaybackItem](mediaplaybackitem.md) associated with the [MediaBreakSchedule](mediabreakschedule.md) plays.
     * @remarks
     * If you want a **MediaBreak** to be played before the associated [MediaPlaybackItem](mediaplaybackitem.md) plays, assign it to the [PrerollBreak](mediabreakschedule_prerollbreak.md) property. If you want a **MediaBreak** to play at a point during the playback of the associated **MediaPlaybackItem**, use the [InsertMidrollBreak](mediabreakschedule_insertmidrollbreak_1567865726.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakschedule.postrollbreak
     * @type {MediaBreak} 
     */
    PostrollBreak {
        get => this.get_PostrollBreak()
        set => this.put_PostrollBreak(value)
    }

    /**
     * Gets the [MediaPlaybackItem](mediaplaybackitem.md) with which the [MediaBreakSchedule](mediabreakschedule.md) is associated.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakschedule.playbackitem
     * @type {MediaPlaybackItem} 
     */
    PlaybackItem {
        get => this.get_PlaybackItem()
    }

    /**
     * Occurs when the [MediaBreakSchedule](mediabreakschedule.md) changes.
     * @type {TypedEventHandler<MediaBreakSchedule, IInspectable>}
    */
    OnScheduleChanged {
        get {
            if(!this.HasProp("__OnScheduleChanged")){
                this.__OnScheduleChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3c57acbf-ca07-586a-8adb-8047dc9165a6}"),
                    MediaBreakSchedule,
                    IInspectable
                )
                this.__OnScheduleChangedToken := this.add_ScheduleChanged(this.__OnScheduleChanged.iface)
            }
            return this.__OnScheduleChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnScheduleChangedToken")) {
            this.remove_ScheduleChanged(this.__OnScheduleChangedToken)
            this.__OnScheduleChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBreakSchedule, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScheduleChanged(handler) {
        if (!this.HasProp("__IMediaBreakSchedule")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSchedule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSchedule := IMediaBreakSchedule(outPtr)
        }

        return this.__IMediaBreakSchedule.add_ScheduleChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ScheduleChanged(token) {
        if (!this.HasProp("__IMediaBreakSchedule")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSchedule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSchedule := IMediaBreakSchedule(outPtr)
        }

        return this.__IMediaBreakSchedule.remove_ScheduleChanged(token)
    }

    /**
     * Adds a [MediaBreak](mediabreak.md) to the schedule that will be played at a point during the playback of the [MediaPlaybackItem](mediaplaybackitem.md) with which the [MediaBreakSchedule](mediabreakschedule.md) is associated.
     * @remarks
     * Remove a midroll break by calling [RemoveMidrollBreak](mediabreakschedule_removemidrollbreak_1073766102.md).
     * 
     * Access the current list of midroll media breaks in the schedule with the [MidrollBreaks](mediabreakschedule_midrollbreaks.md) property.
     * 
     * If you want a **MediaBreak** to be played before the associated [MediaPlaybackItem](mediaplaybackitem.md) plays, assign it to the [PrerollBreak](mediabreakschedule_prerollbreak.md) property. If you want a **MediaBreak** to be played after the associated [MediaPlaybackItem](mediaplaybackitem.md) plays, assign it to the [PostrollBreak](mediabreakschedule_postrollbreak.md) property.
     * @param {MediaBreak} mediaBreak_ The [MediaBreak](mediabreak.md) to add to the schedule.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakschedule.insertmidrollbreak
     */
    InsertMidrollBreak(mediaBreak_) {
        if (!this.HasProp("__IMediaBreakSchedule")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSchedule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSchedule := IMediaBreakSchedule(outPtr)
        }

        return this.__IMediaBreakSchedule.InsertMidrollBreak(mediaBreak_)
    }

    /**
     * Removes a midroll [MediaBreak](mediabreak.md) from the [MediaBreakSchedule](mediabreakschedule.md).
     * @remarks
     * Add a midroll media break by calling [InsertMidrollBreak](mediabreakschedule_insertmidrollbreak_1567865726.md).
     * 
     * Access the current list of midroll media breaks in the schedule with the [MidrollBreaks](mediabreakschedule_midrollbreaks.md) property.
     * @param {MediaBreak} mediaBreak_ The [MediaBreak](mediabreak.md) to remove from the schedule.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakschedule.removemidrollbreak
     */
    RemoveMidrollBreak(mediaBreak_) {
        if (!this.HasProp("__IMediaBreakSchedule")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSchedule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSchedule := IMediaBreakSchedule(outPtr)
        }

        return this.__IMediaBreakSchedule.RemoveMidrollBreak(mediaBreak_)
    }

    /**
     * 
     * @returns {IVectorView<MediaBreak>} 
     */
    get_MidrollBreaks() {
        if (!this.HasProp("__IMediaBreakSchedule")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSchedule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSchedule := IMediaBreakSchedule(outPtr)
        }

        return this.__IMediaBreakSchedule.get_MidrollBreaks()
    }

    /**
     * 
     * @param {MediaBreak} value 
     * @returns {HRESULT} 
     */
    put_PrerollBreak(value) {
        if (!this.HasProp("__IMediaBreakSchedule")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSchedule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSchedule := IMediaBreakSchedule(outPtr)
        }

        return this.__IMediaBreakSchedule.put_PrerollBreak(value)
    }

    /**
     * 
     * @returns {MediaBreak} 
     */
    get_PrerollBreak() {
        if (!this.HasProp("__IMediaBreakSchedule")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSchedule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSchedule := IMediaBreakSchedule(outPtr)
        }

        return this.__IMediaBreakSchedule.get_PrerollBreak()
    }

    /**
     * 
     * @param {MediaBreak} value 
     * @returns {HRESULT} 
     */
    put_PostrollBreak(value) {
        if (!this.HasProp("__IMediaBreakSchedule")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSchedule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSchedule := IMediaBreakSchedule(outPtr)
        }

        return this.__IMediaBreakSchedule.put_PostrollBreak(value)
    }

    /**
     * 
     * @returns {MediaBreak} 
     */
    get_PostrollBreak() {
        if (!this.HasProp("__IMediaBreakSchedule")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSchedule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSchedule := IMediaBreakSchedule(outPtr)
        }

        return this.__IMediaBreakSchedule.get_PostrollBreak()
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_PlaybackItem() {
        if (!this.HasProp("__IMediaBreakSchedule")) {
            if ((queryResult := this.QueryInterface(IMediaBreakSchedule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakSchedule := IMediaBreakSchedule(outPtr)
        }

        return this.__IMediaBreakSchedule.get_PlaybackItem()
    }

;@endregion Instance Methods
}
