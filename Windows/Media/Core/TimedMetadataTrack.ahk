#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedMetadataTrack.ahk
#Include .\IMediaTrack.ahk
#Include .\ITimedMetadataTrack2.ahk
#Include .\ITimedMetadataTrackFactory.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\TimedMetadataTrack.ahk
#Include .\MediaCueEventArgs.ahk
#Include .\TimedMetadataTrackFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a timed metadata track. The track contains a list of [IMediaCue](imediacue.md) objects and raises events at the beginning and end of the time window of each cue.
 * @remarks
 * For how-to guidance for working with timed metadata tracks, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedMetadataTrack extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedMetadataTrack

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedMetadataTrack.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [TimedMetadataTrack](timedmetadatatrack.md) class.
     * @param {HSTRING} id An identifier for the new timed metadata track.
     * @param {HSTRING} language_ A string indicating the language of the new timed metadata track.
     * @param {Integer} kind A value indicating the kind of metadata contained in the new track.
     * @returns {TimedMetadataTrack} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.#ctor
     */
    static Create(id, language_, kind) {
        if (!TimedMetadataTrack.HasProp("__ITimedMetadataTrackFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedMetadataTrack")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedMetadataTrackFactory.IID)
            TimedMetadataTrack.__ITimedMetadataTrackFactory := ITimedMetadataTrackFactory(factoryPtr)
        }

        return TimedMetadataTrack.__ITimedMetadataTrackFactory.Create(id, language_, kind)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a read-only list of the media cues in the [TimedMetadataTrack](timedmetadatatrack.md).
     * @remarks
     * Add cues to the list by calling [AddCue](timedmetadatatrack_addcue_1989081881.md).
     * 
     * The cues in the list are sorted in chronological order by the value of the [StartTime](imediacue_starttime.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.cues
     * @type {IVectorView<IMediaCue>} 
     */
    Cues {
        get => this.get_Cues()
    }

    /**
     * Gets the list of media cues in the [TimedMetadataTrack](timedmetadatatrack.md) that are currently active. A cue is considered active after its [StartTime](imediacue_starttime.md) has been reached until its [Duration](imediacue_duration.md) has been exceeded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.activecues
     * @type {IVectorView<IMediaCue>} 
     */
    ActiveCues {
        get => this.get_ActiveCues()
    }

    /**
     * Gets a value indicating the kind of metadata contained in the track.
     * @remarks
     * You can specify a value for the **TimedMetadataKind** property in the [TimedMetadataTrack constructor](timedmetadatatrack_timedmetadatatrack_2131229248.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.timedmetadatakind
     * @type {Integer} 
     */
    TimedMetadataKind {
        get => this.get_TimedMetadataKind()
    }

    /**
     * Gets the custom string value containing routing information for cues.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.dispatchtype
     * @type {HSTRING} 
     */
    DispatchType {
        get => this.get_DispatchType()
    }

    /**
     * Gets the identifier for the timed metadata track.
     * @remarks
     * You can specify a value for the **Id** property in the [TimedMetadataTrack constructor](timedmetadatatrack_timedmetadatatrack_2131229248.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a string indicating the language of the timed metadata track.
     * @remarks
     * You can specify a value for the **Language** property in the [TimedMetadataTrack constructor](timedmetadatatrack_timedmetadatatrack_2131229248.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets a value specifying the type of the media track. For [TimedMetadataTrack](timedmetadatatrack.md) this value will always be [MediaTrackKind.TimedMetadata](mediatrackkind.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.trackkind
     * @type {Integer} 
     */
    TrackKind {
        get => this.get_TrackKind()
    }

    /**
     * Gets or sets the label for the timed metadata track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets the [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) containing the [TimedMetadataTrack](timedmetadatatrack.md).
     * @remarks
     * A [TimedMetadataTrack](timedmetadatatrack.md) is contained by a [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) when it is in the item's [TimedMetadataTracks](../windows.media.playback/mediaplaybackitem_timedmetadatatracks.md) collection. Use the **PlaybackItem** property to get a reference to the **MediaPlaybackItem** that contains the **TimedMetadataTrack**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.playbackitem
     * @type {MediaPlaybackItem} 
     */
    PlaybackItem {
        get => this.get_PlaybackItem()
    }

    /**
     * Gets the name of the [TimedMetadataTrack](timedmetadatatrack.md).
     * @remarks
     * The **Name** property can be used in your UI to identify the metadata track to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Occurs when a media time window of a media cue is entered. The time window is defined by the [StartTime](imediacue_starttime.md) and [Duration](imediacue_duration.md) of the cue.
     * @type {TypedEventHandler<TimedMetadataTrack, MediaCueEventArgs>}
    */
    OnCueEntered {
        get {
            if(!this.HasProp("__OnCueEntered")){
                this.__OnCueEntered := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4aac9411-c355-5c95-8c78-5a0f5ca1a54d}"),
                    TimedMetadataTrack,
                    MediaCueEventArgs
                )
                this.__OnCueEnteredToken := this.add_CueEntered(this.__OnCueEntered.iface)
            }
            return this.__OnCueEntered
        }
    }

    /**
     * Occurs when a media time window of a media cue is exited. The time window is defined by the [StartTime](imediacue_starttime.md) and [Duration](imediacue_duration.md) of the cue.
     * @type {TypedEventHandler<TimedMetadataTrack, MediaCueEventArgs>}
    */
    OnCueExited {
        get {
            if(!this.HasProp("__OnCueExited")){
                this.__OnCueExited := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4aac9411-c355-5c95-8c78-5a0f5ca1a54d}"),
                    TimedMetadataTrack,
                    MediaCueEventArgs
                )
                this.__OnCueExitedToken := this.add_CueExited(this.__OnCueExited.iface)
            }
            return this.__OnCueExited
        }
    }

    /**
     * Raised when an error occurs with the [TimedMetadataTrack](timedmetadatatrack.md).
     * @type {TypedEventHandler<TimedMetadataTrack, TimedMetadataTrackFailedEventArgs>}
    */
    OnTrackFailed {
        get {
            if(!this.HasProp("__OnTrackFailed")){
                this.__OnTrackFailed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8dc73162-255b-532e-b0c7-9a6d70b4bb9e}"),
                    TimedMetadataTrack,
                    TimedMetadataTrackFailedEventArgs
                )
                this.__OnTrackFailedToken := this.add_TrackFailed(this.__OnTrackFailed.iface)
            }
            return this.__OnTrackFailed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCueEnteredToken")) {
            this.remove_CueEntered(this.__OnCueEnteredToken)
            this.__OnCueEntered.iface.Dispose()
        }

        if(this.HasProp("__OnCueExitedToken")) {
            this.remove_CueExited(this.__OnCueExitedToken)
            this.__OnCueExited.iface.Dispose()
        }

        if(this.HasProp("__OnTrackFailedToken")) {
            this.remove_TrackFailed(this.__OnTrackFailedToken)
            this.__OnTrackFailed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<TimedMetadataTrack, MediaCueEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CueEntered(handler) {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.add_CueEntered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CueEntered(token) {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.remove_CueEntered(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TimedMetadataTrack, MediaCueEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CueExited(handler) {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.add_CueExited(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CueExited(token) {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.remove_CueExited(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TimedMetadataTrack, TimedMetadataTrackFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TrackFailed(handler) {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.add_TrackFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TrackFailed(token) {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.remove_TrackFailed(token)
    }

    /**
     * 
     * @returns {IVectorView<IMediaCue>} 
     */
    get_Cues() {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.get_Cues()
    }

    /**
     * 
     * @returns {IVectorView<IMediaCue>} 
     */
    get_ActiveCues() {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.get_ActiveCues()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TimedMetadataKind() {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.get_TimedMetadataKind()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DispatchType() {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.get_DispatchType()
    }

    /**
     * Adds the specified media cue to the [TimedMetadataTrack](timedmetadatatrack.md).
     * @param {IMediaCue} cue The media cue to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.addcue
     */
    AddCue(cue) {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.AddCue(cue)
    }

    /**
     * Removes the specified media cue from the [TimedMetadataTrack](timedmetadatatrack.md).
     * @param {IMediaCue} cue The media cue to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatatrack.removecue
     */
    RemoveCue(cue) {
        if (!this.HasProp("__ITimedMetadataTrack")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack := ITimedMetadataTrack(outPtr)
        }

        return this.__ITimedMetadataTrack.RemoveCue(cue)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IMediaTrack")) {
            if ((queryResult := this.QueryInterface(IMediaTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTrack := IMediaTrack(outPtr)
        }

        return this.__IMediaTrack.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__IMediaTrack")) {
            if ((queryResult := this.QueryInterface(IMediaTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTrack := IMediaTrack(outPtr)
        }

        return this.__IMediaTrack.get_Language()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrackKind() {
        if (!this.HasProp("__IMediaTrack")) {
            if ((queryResult := this.QueryInterface(IMediaTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTrack := IMediaTrack(outPtr)
        }

        return this.__IMediaTrack.get_TrackKind()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IMediaTrack")) {
            if ((queryResult := this.QueryInterface(IMediaTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTrack := IMediaTrack(outPtr)
        }

        return this.__IMediaTrack.put_Label(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        if (!this.HasProp("__IMediaTrack")) {
            if ((queryResult := this.QueryInterface(IMediaTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTrack := IMediaTrack(outPtr)
        }

        return this.__IMediaTrack.get_Label()
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_PlaybackItem() {
        if (!this.HasProp("__ITimedMetadataTrack2")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack2 := ITimedMetadataTrack2(outPtr)
        }

        return this.__ITimedMetadataTrack2.get_PlaybackItem()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ITimedMetadataTrack2")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataTrack2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataTrack2 := ITimedMetadataTrack2(outPtr)
        }

        return this.__ITimedMetadataTrack2.get_Name()
    }

;@endregion Instance Methods
}
