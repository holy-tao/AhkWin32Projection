#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackItem.ahk
#Include .\IMediaPlaybackItem2.ahk
#Include .\IMediaPlaybackItem3.ahk
#Include .\IMediaPlaybackItemStatics.ahk
#Include .\IMediaPlaybackItemFactory.ahk
#Include .\IMediaPlaybackItemFactory2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaPlaybackItem.ahk
#Include ..\..\Foundation\Collections\IVectorChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a media item that can be played back. This class acts as a wrapper around a [MediaSource](../windows.media.core/mediasource.md) that exposes the audio tracks, video tracks, and timed metadata tracks included in the media source.
 * @remarks
 * A **MediaPlaybackItem** can be passed directly to a player such as [MediaPlayer](mediaplayer.md), [MediaElement](../windows.ui.xaml.controls/mediaelement.md) or [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md). Or, you can even pass the player a list of multiple media playback items using the [MediaPlaybackList](mediaplaybacklist.md) class.
 * 
 * For how-to guidance for working with media items, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the [MediaPlaybackItem](mediaplaybackitem.md) associated with the provided [MediaSource](../windows.media.core/mediasource.md).
     * @param {MediaSource} source The [MediaSource](../windows.media.core/mediasource.md) associated with the [MediaPlaybackItem](mediaplaybackitem.md).
     * @returns {MediaPlaybackItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.findfrommediasource
     */
    static FindFromMediaSource(source) {
        if (!MediaPlaybackItem.HasProp("__IMediaPlaybackItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.MediaPlaybackItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlaybackItemStatics.IID)
            MediaPlaybackItem.__IMediaPlaybackItemStatics := IMediaPlaybackItemStatics(factoryPtr)
        }

        return MediaPlaybackItem.__IMediaPlaybackItemStatics.FindFromMediaSource(source)
    }

    /**
     * Initializes a new instance of the [MediaPlaybackItem](mediaplaybackitem.md) class.
     * @remarks
     * A [MediaSource](../windows.media.core/mediasource.md) can only be used by a single **MediaPlaybackItem**. If you attempt to create a second **MediaPlaybackItem** from the same **MediaSource**, the constructor will fail with an MF_E_UNEXPECTED error. In C# this error is projected as a **System.Exception**.
     * @param {MediaSource} source The media source from which the [MediaPlaybackItem](mediaplaybackitem.md) is created.
     * @returns {MediaPlaybackItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.#ctor
     */
    static Create(source) {
        if (!MediaPlaybackItem.HasProp("__IMediaPlaybackItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.MediaPlaybackItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlaybackItemFactory.IID)
            MediaPlaybackItem.__IMediaPlaybackItemFactory := IMediaPlaybackItemFactory(factoryPtr)
        }

        return MediaPlaybackItem.__IMediaPlaybackItemFactory.Create(source)
    }

    /**
     * Initializes a new instance of the [MediaPlaybackItem](mediaplaybackitem.md) class with a [StartTime](mediaplaybackitem_starttime.md) value indicating the position within the item where playback should begin.
     * @param {MediaSource} source The media source from which the [MediaPlaybackItem](mediaplaybackitem.md) is created.
     * @param {TimeSpan} startTime The position within the [MediaPlaybackItem](mediaplaybackitem.md) where playback should begin.
     * @returns {MediaPlaybackItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.#ctor
     */
    static CreateWithStartTime(source, startTime) {
        if (!MediaPlaybackItem.HasProp("__IMediaPlaybackItemFactory2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.MediaPlaybackItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlaybackItemFactory2.IID)
            MediaPlaybackItem.__IMediaPlaybackItemFactory2 := IMediaPlaybackItemFactory2(factoryPtr)
        }

        return MediaPlaybackItem.__IMediaPlaybackItemFactory2.CreateWithStartTime(source, startTime)
    }

    /**
     * Initializes a new instance of the [MediaPlaybackItem](mediaplaybackitem.md) class with a [StartTime](mediaplaybackitem_starttime.md) value indicating the position within the item where playback should begin and a [DurationLimit](mediaplaybackitem_durationlimit.md) value specifying the maximum playback duration of the item.
     * @param {MediaSource} source The media source from which the [MediaPlaybackItem](mediaplaybackitem.md) is created.
     * @param {TimeSpan} startTime The position within the [MediaPlaybackItem](mediaplaybackitem.md) where playback should begin.
     * @param {TimeSpan} durationLimit The maximum playback duration of the [MediaPlaybackItem](mediaplaybackitem.md).
     * @returns {MediaPlaybackItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.#ctor
     */
    static CreateWithStartTimeAndDurationLimit(source, startTime, durationLimit) {
        if (!MediaPlaybackItem.HasProp("__IMediaPlaybackItemFactory2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.MediaPlaybackItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlaybackItemFactory2.IID)
            MediaPlaybackItem.__IMediaPlaybackItemFactory2 := IMediaPlaybackItemFactory2(factoryPtr)
        }

        return MediaPlaybackItem.__IMediaPlaybackItemFactory2.CreateWithStartTimeAndDurationLimit(source, startTime, durationLimit)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [MediaSource](../windows.media.core/mediasource.md) object associated with the [MediaPlaybackItem](mediaplaybackitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.source
     * @type {MediaSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * Gets a read-only list of audio tracks in the [MediaSource](../windows.media.core/mediasource.md) associated with the [MediaPlaybackItem](mediaplaybackitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.audiotracks
     * @type {MediaPlaybackAudioTrackList} 
     */
    AudioTracks {
        get => this.get_AudioTracks()
    }

    /**
     * Gets a read-only list of video tracks in the [MediaSource](../windows.media.core/mediasource.md) associated with the [MediaPlaybackItem](mediaplaybackitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.videotracks
     * @type {MediaPlaybackVideoTrackList} 
     */
    VideoTracks {
        get => this.get_VideoTracks()
    }

    /**
     * Gets a read-only list of timed metadata tracks in the [MediaSource](../windows.media.core/mediasource.md) associated with the [MediaPlaybackItem](mediaplaybackitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.timedmetadatatracks
     * @type {MediaPlaybackTimedMetadataTrackList} 
     */
    TimedMetadataTracks {
        get => this.get_TimedMetadataTracks()
    }

    /**
     * Gets the [MediaBreakSchedule](mediabreakschedule.md) defining the schedule of media breaks for the [MediaPlaybackItem](mediaplaybackitem.md).
     * @remarks
     * The **MediaBreakSchedule** object allows you to specify [MediaBreak](mediabreak.md) objects that should be played before the **MediaPlaybackItem** is played, after the item is played, or at scheduled positions within the item's playback.
     * 
     * For how-to guidance for working with media breaks, see [Create, schedule, and manage media breaks](/windows/uwp/audio-video-camera/create-schedule-and-manage-media-breaks).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.breakschedule
     * @type {MediaBreakSchedule} 
     */
    BreakSchedule {
        get => this.get_BreakSchedule()
    }

    /**
     * Gets the position within the [MediaPlaybackItem](mediaplaybackitem.md) where playback should begin.
     * @remarks
     * Set this value by using the [MediaPlaybackItem(MediaSource, TimeSpan)](mediaplaybackitem_mediaplaybackitem_1053881486.md) or [MediaPlaybackItem(MediaSource, TimeSpan, TimeSpan)](mediaplaybackitem_mediaplaybackitem_342236482.md) constructor to specify that playback of the [MediaPlaybackItem](mediaplaybackitem.md) should begin at a position other than the start of the item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.starttime
     * @type {TimeSpan} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * Gets the maximum playback duration of the [MediaPlaybackItem](mediaplaybackitem.md).
     * @remarks
     * Set this value by using the [MediaPlaybackItem(MediaSource, TimeSpan, TimeSpan)](mediaplaybackitem_mediaplaybackitem_342236482.md) constructor to ensure that the [MediaPlaybackItem](mediaplaybackitem.md) will be played for no longer than the specified duration.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.durationlimit
     * @type {IReference<TimeSpan>} 
     */
    DurationLimit {
        get => this.get_DurationLimit()
    }

    /**
     * Gets or sets a value indicating whether the [MediaPlaybackItem](mediaplaybackitem.md) can be skipped.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.canskip
     * @type {Boolean} 
     */
    CanSkip {
        get => this.get_CanSkip()
        set => this.put_CanSkip(value)
    }

    /**
     * Gets or sets a value that specifies whether a [MediaPlaybackItem](mediaplaybackitem.md) is disabled in a [MediaPlaybackList](mediaplaybacklist.md).
     * @remarks
     * A example scenario for using this property is when network connectivity is lost, your app can check the [TotalDownloadProgress](mediaplaybackitem_totaldownloadprogress.md) property to see which items in the playback list have completed downloading. For items that have not completed, set **IsDisabledInPlaybackList** to true so that the item won't be played in the list.
     * 
     * Note that after playback of an item has begun, setting the **IsDisabledInPlaybackList** property has no effect.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.isdisabledinplaybacklist
     * @type {Boolean} 
     */
    IsDisabledInPlaybackList {
        get => this.get_IsDisabledInPlaybackList()
        set => this.put_IsDisabledInPlaybackList(value)
    }

    /**
     * Gets a value that indicates the proportion of the data for the **MediaPlaybackItem** that is currently downloaded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.totaldownloadprogress
     * @type {Float} 
     */
    TotalDownloadProgress {
        get => this.get_TotalDownloadProgress()
    }

    /**
     * Gets or sets a value that specifies for which types of media content, if any, the system should automatically load metadata to display in the System Media Transport Controls.
     * @remarks
     * You can programmatically provide metadata for media items, instead of having the system dynamically load the metadata in the content, by calling [GetDisplayProperties](mediaplaybackitem_getdisplayproperties_103236454.md), setting the data of the returned [MediaItemDisplayProperties] (mediaitemdisplayproperties.md), and then calling [ApplyDisplayProperties](mediaplaybackitem_applydisplayproperties_1634192028.md). For more information, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.autoloadeddisplayproperties
     * @type {Integer} 
     */
    AutoLoadedDisplayProperties {
        get => this.get_AutoLoadedDisplayProperties()
        set => this.put_AutoLoadedDisplayProperties(value)
    }

    /**
     * Occurs when the list of audio tracks in the [MediaSource](../windows.media.core/mediasource.md) associated with the [MediaPlaybackItem](mediaplaybackitem.md) changes.
     * @type {TypedEventHandler<MediaPlaybackItem, IVectorChangedEventArgs>}
    */
    OnAudioTracksChanged {
        get {
            if(!this.HasProp("__OnAudioTracksChanged")){
                this.__OnAudioTracksChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2dd51918-4525-5be5-a6c1-409bc72863a6}"),
                    MediaPlaybackItem,
                    IVectorChangedEventArgs
                )
                this.__OnAudioTracksChangedToken := this.add_AudioTracksChanged(this.__OnAudioTracksChanged.iface)
            }
            return this.__OnAudioTracksChanged
        }
    }

    /**
     * Occurs when the list of video tracks in the [MediaSource](../windows.media.core/mediasource.md) associated with the [MediaPlaybackItem](mediaplaybackitem.md) changes.
     * @type {TypedEventHandler<MediaPlaybackItem, IVectorChangedEventArgs>}
    */
    OnVideoTracksChanged {
        get {
            if(!this.HasProp("__OnVideoTracksChanged")){
                this.__OnVideoTracksChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2dd51918-4525-5be5-a6c1-409bc72863a6}"),
                    MediaPlaybackItem,
                    IVectorChangedEventArgs
                )
                this.__OnVideoTracksChangedToken := this.add_VideoTracksChanged(this.__OnVideoTracksChanged.iface)
            }
            return this.__OnVideoTracksChanged
        }
    }

    /**
     * Occurs when the list of timed metadata tracks in the [MediaSource](../windows.media.core/mediasource.md) associated with the [MediaPlaybackItem](mediaplaybackitem.md) changes.
     * @type {TypedEventHandler<MediaPlaybackItem, IVectorChangedEventArgs>}
    */
    OnTimedMetadataTracksChanged {
        get {
            if(!this.HasProp("__OnTimedMetadataTracksChanged")){
                this.__OnTimedMetadataTracksChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2dd51918-4525-5be5-a6c1-409bc72863a6}"),
                    MediaPlaybackItem,
                    IVectorChangedEventArgs
                )
                this.__OnTimedMetadataTracksChangedToken := this.add_TimedMetadataTracksChanged(this.__OnTimedMetadataTracksChanged.iface)
            }
            return this.__OnTimedMetadataTracksChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAudioTracksChangedToken")) {
            this.remove_AudioTracksChanged(this.__OnAudioTracksChangedToken)
            this.__OnAudioTracksChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVideoTracksChangedToken")) {
            this.remove_VideoTracksChanged(this.__OnVideoTracksChangedToken)
            this.__OnVideoTracksChanged.iface.Dispose()
        }

        if(this.HasProp("__OnTimedMetadataTracksChangedToken")) {
            this.remove_TimedMetadataTracksChanged(this.__OnTimedMetadataTracksChangedToken)
            this.__OnTimedMetadataTracksChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackItem, IVectorChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioTracksChanged(handler) {
        if (!this.HasProp("__IMediaPlaybackItem")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem := IMediaPlaybackItem(outPtr)
        }

        return this.__IMediaPlaybackItem.add_AudioTracksChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AudioTracksChanged(token) {
        if (!this.HasProp("__IMediaPlaybackItem")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem := IMediaPlaybackItem(outPtr)
        }

        return this.__IMediaPlaybackItem.remove_AudioTracksChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackItem, IVectorChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VideoTracksChanged(handler) {
        if (!this.HasProp("__IMediaPlaybackItem")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem := IMediaPlaybackItem(outPtr)
        }

        return this.__IMediaPlaybackItem.add_VideoTracksChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VideoTracksChanged(token) {
        if (!this.HasProp("__IMediaPlaybackItem")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem := IMediaPlaybackItem(outPtr)
        }

        return this.__IMediaPlaybackItem.remove_VideoTracksChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackItem, IVectorChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TimedMetadataTracksChanged(handler) {
        if (!this.HasProp("__IMediaPlaybackItem")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem := IMediaPlaybackItem(outPtr)
        }

        return this.__IMediaPlaybackItem.add_TimedMetadataTracksChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TimedMetadataTracksChanged(token) {
        if (!this.HasProp("__IMediaPlaybackItem")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem := IMediaPlaybackItem(outPtr)
        }

        return this.__IMediaPlaybackItem.remove_TimedMetadataTracksChanged(token)
    }

    /**
     * 
     * @returns {MediaSource} 
     */
    get_Source() {
        if (!this.HasProp("__IMediaPlaybackItem")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem := IMediaPlaybackItem(outPtr)
        }

        return this.__IMediaPlaybackItem.get_Source()
    }

    /**
     * 
     * @returns {MediaPlaybackAudioTrackList} 
     */
    get_AudioTracks() {
        if (!this.HasProp("__IMediaPlaybackItem")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem := IMediaPlaybackItem(outPtr)
        }

        return this.__IMediaPlaybackItem.get_AudioTracks()
    }

    /**
     * 
     * @returns {MediaPlaybackVideoTrackList} 
     */
    get_VideoTracks() {
        if (!this.HasProp("__IMediaPlaybackItem")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem := IMediaPlaybackItem(outPtr)
        }

        return this.__IMediaPlaybackItem.get_VideoTracks()
    }

    /**
     * 
     * @returns {MediaPlaybackTimedMetadataTrackList} 
     */
    get_TimedMetadataTracks() {
        if (!this.HasProp("__IMediaPlaybackItem")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem := IMediaPlaybackItem(outPtr)
        }

        return this.__IMediaPlaybackItem.get_TimedMetadataTracks()
    }

    /**
     * 
     * @returns {MediaBreakSchedule} 
     */
    get_BreakSchedule() {
        if (!this.HasProp("__IMediaPlaybackItem2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem2 := IMediaPlaybackItem2(outPtr)
        }

        return this.__IMediaPlaybackItem2.get_BreakSchedule()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartTime() {
        if (!this.HasProp("__IMediaPlaybackItem2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem2 := IMediaPlaybackItem2(outPtr)
        }

        return this.__IMediaPlaybackItem2.get_StartTime()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_DurationLimit() {
        if (!this.HasProp("__IMediaPlaybackItem2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem2 := IMediaPlaybackItem2(outPtr)
        }

        return this.__IMediaPlaybackItem2.get_DurationLimit()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSkip() {
        if (!this.HasProp("__IMediaPlaybackItem2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem2 := IMediaPlaybackItem2(outPtr)
        }

        return this.__IMediaPlaybackItem2.get_CanSkip()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanSkip(value) {
        if (!this.HasProp("__IMediaPlaybackItem2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem2 := IMediaPlaybackItem2(outPtr)
        }

        return this.__IMediaPlaybackItem2.put_CanSkip(value)
    }

    /**
     * Gets the display properties for a [MediaPlaybackItem](mediaplaybackitem.md).
     * @remarks
     * To modify the display properties for a [MediaPlaybackItem](mediaplaybackitem.md), retrieve the properties by calling **GetDisplayProperties**, update the data in the [MediaItemDisplayProperties](mediaitemdisplayproperties.md), then call [ApplyDisplayProperties](mediaplaybackitem_applydisplayproperties_1634192028.md).
     * 
     * For how-to guidance for integrating with the SMTC, see [Integrate with the System Media Transport Controls](/windows/uwp/audio-video-camera/integrate-with-systemmediatransportcontrols).
     * @returns {MediaItemDisplayProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.getdisplayproperties
     */
    GetDisplayProperties() {
        if (!this.HasProp("__IMediaPlaybackItem2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem2 := IMediaPlaybackItem2(outPtr)
        }

        return this.__IMediaPlaybackItem2.GetDisplayProperties()
    }

    /**
     * Updates the display properties for the [MediaPlaybackItem](mediaplaybackitem.md). These properties are used by the System Media Transport Controls to display information about the currently playing media item.
     * @remarks
     * Get the display properties for a [MediaPlaybackItem](mediaplaybackitem.md) by calling [GetDisplayProperties](mediaplaybackitem_getdisplayproperties_103236454.md).
     * 
     * For how-to guidance for integrating with the SMTC, see [Integrate with the System Media Transport Controls](/windows/uwp/audio-video-camera/integrate-with-systemmediatransportcontrols).
     * @param {MediaItemDisplayProperties} value The display properties to apply to the [MediaPlaybackItem](mediaplaybackitem.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackitem.applydisplayproperties
     */
    ApplyDisplayProperties(value) {
        if (!this.HasProp("__IMediaPlaybackItem2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem2 := IMediaPlaybackItem2(outPtr)
        }

        return this.__IMediaPlaybackItem2.ApplyDisplayProperties(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledInPlaybackList() {
        if (!this.HasProp("__IMediaPlaybackItem3")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem3 := IMediaPlaybackItem3(outPtr)
        }

        return this.__IMediaPlaybackItem3.get_IsDisabledInPlaybackList()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDisabledInPlaybackList(value) {
        if (!this.HasProp("__IMediaPlaybackItem3")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem3 := IMediaPlaybackItem3(outPtr)
        }

        return this.__IMediaPlaybackItem3.put_IsDisabledInPlaybackList(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TotalDownloadProgress() {
        if (!this.HasProp("__IMediaPlaybackItem3")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem3 := IMediaPlaybackItem3(outPtr)
        }

        return this.__IMediaPlaybackItem3.get_TotalDownloadProgress()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutoLoadedDisplayProperties() {
        if (!this.HasProp("__IMediaPlaybackItem3")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem3 := IMediaPlaybackItem3(outPtr)
        }

        return this.__IMediaPlaybackItem3.get_AutoLoadedDisplayProperties()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AutoLoadedDisplayProperties(value) {
        if (!this.HasProp("__IMediaPlaybackItem3")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackItem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackItem3 := IMediaPlaybackItem3(outPtr)
        }

        return this.__IMediaPlaybackItem3.put_AutoLoadedDisplayProperties(value)
    }

;@endregion Instance Methods
}
