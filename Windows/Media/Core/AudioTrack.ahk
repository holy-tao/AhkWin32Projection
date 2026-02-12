#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaTrack.ahk
#Include .\IAudioTrack.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AudioTrack.ahk
#Include .\AudioTrackOpenFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an audio track.
 * @remarks
 * Get an instance of this class by calling [MediaPlaybackAudioTrackList.GetAt](../windows.media.playback/mediaplaybackaudiotracklist_getat_496709656.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotrack
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class AudioTrack extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaTrack

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaTrack.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for the audio track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotrack.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a string indicating the language of the audio track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotrack.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets a value indicating the type of data the track contains. For [AudioTrack](audiotrack.md) objects, this value is always [MediaTrackKind.Audio](mediatrackkind.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotrack.trackkind
     * @type {Integer} 
     */
    TrackKind {
        get => this.get_TrackKind()
    }

    /**
     * Gets or sets the label for the audio track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotrack.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets the [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) containing the [AudioTrack](audiotrack.md).
     * @remarks
     * An [AudioTrack](audiotrack.md) is contained by a [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) when it is in the item's [AudioTracks](../windows.media.playback/mediaplaybackitem_audiotracks.md) collection. Use the **PlaybackItem** property to get a reference to the **MediaPlaybackItem** that contains the **AudioTrack**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotrack.playbackitem
     * @type {MediaPlaybackItem} 
     */
    PlaybackItem {
        get => this.get_PlaybackItem()
    }

    /**
     * Gets the name of the [AudioTrack](audiotrack.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotrack.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets support information for the [AudioTrack](audiotrack.md). This information includes the status of the audio decoder, information about any audio degradation applied by the decoder, and the status of the [MediaSource](mediasource.md) with which the audio track is associated.
     * @remarks
     * If a failure occurs when an [AudioTrack](audiotrack.md) is opened, you can get detailed status and failure information by handling the [OpenFailed](audiotrack_openfailed.md) event and checking the **SupportInfo** property of the **AudioTrack** passed into the event as the sender.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotrack.supportinfo
     * @type {AudioTrackSupportInfo} 
     */
    SupportInfo {
        get => this.get_SupportInfo()
    }

    /**
     * Occurs when an [AudioTrack](audiotrack.md) fails to open.
     * @remarks
     * Register for the **OpenFailed** event for an [AudioTrack](audiotrack.md) from within the [AudioTracksChanged](../windows.media.playback/mediaplaybackitem_audiotrackschanged.md) event handler for a [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md), which is raised whenever an audio track is added to the item.
     * @type {TypedEventHandler<AudioTrack, AudioTrackOpenFailedEventArgs>}
    */
    OnOpenFailed {
        get {
            if(!this.HasProp("__OnOpenFailed")){
                this.__OnOpenFailed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b5b7e554-2476-5667-9c9a-1c7a7d09ace2}"),
                    AudioTrack,
                    AudioTrackOpenFailedEventArgs
                )
                this.__OnOpenFailedToken := this.add_OpenFailed(this.__OnOpenFailed.iface)
            }
            return this.__OnOpenFailed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOpenFailedToken")) {
            this.remove_OpenFailed(this.__OnOpenFailedToken)
            this.__OnOpenFailed.iface.Dispose()
        }

        super.__Delete()
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
     * @param {TypedEventHandler<AudioTrack, AudioTrackOpenFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OpenFailed(handler) {
        if (!this.HasProp("__IAudioTrack")) {
            if ((queryResult := this.QueryInterface(IAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioTrack := IAudioTrack(outPtr)
        }

        return this.__IAudioTrack.add_OpenFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OpenFailed(token) {
        if (!this.HasProp("__IAudioTrack")) {
            if ((queryResult := this.QueryInterface(IAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioTrack := IAudioTrack(outPtr)
        }

        return this.__IAudioTrack.remove_OpenFailed(token)
    }

    /**
     * Gets the audio encoding properties for an [AudioTrack](audiotrack.md).
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotrack.getencodingproperties
     */
    GetEncodingProperties() {
        if (!this.HasProp("__IAudioTrack")) {
            if ((queryResult := this.QueryInterface(IAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioTrack := IAudioTrack(outPtr)
        }

        return this.__IAudioTrack.GetEncodingProperties()
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_PlaybackItem() {
        if (!this.HasProp("__IAudioTrack")) {
            if ((queryResult := this.QueryInterface(IAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioTrack := IAudioTrack(outPtr)
        }

        return this.__IAudioTrack.get_PlaybackItem()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IAudioTrack")) {
            if ((queryResult := this.QueryInterface(IAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioTrack := IAudioTrack(outPtr)
        }

        return this.__IAudioTrack.get_Name()
    }

    /**
     * 
     * @returns {AudioTrackSupportInfo} 
     */
    get_SupportInfo() {
        if (!this.HasProp("__IAudioTrack")) {
            if ((queryResult := this.QueryInterface(IAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioTrack := IAudioTrack(outPtr)
        }

        return this.__IAudioTrack.get_SupportInfo()
    }

;@endregion Instance Methods
}
