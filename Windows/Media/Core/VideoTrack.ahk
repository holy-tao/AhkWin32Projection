#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaTrack.ahk
#Include .\IVideoTrack.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\VideoTrack.ahk
#Include .\VideoTrackOpenFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a video track.
 * @remarks
 * Get an instance of this class by calling [MediaPlaybackVideoTrackList.GetAt](../windows.media.playback/mediaplaybackvideotracklist_getat_496709656.md).
 * 
 * For how-to guidance for working with **VideoTrack** objects, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotrack
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class VideoTrack extends IInspectable {
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
     * Gets the identifier for the video track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotrack.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a string indicating the language of the video track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotrack.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets a value indicating the type of data the track contains. For [VideoTrack](videotrack.md) objects, this value is always [MediaTrackKind.Video](mediatrackkind.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotrack.trackkind
     * @type {Integer} 
     */
    TrackKind {
        get => this.get_TrackKind()
    }

    /**
     * Gets or sets the label for the video track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotrack.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets the [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) containing the [VideoTrack](videotrack.md).
     * @remarks
     * A [VideoTrack](videotrack.md) is contained by a [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) when it is in the item's [VideoTracks](../windows.media.playback/mediaplaybackitem_videotracks.md) collection. Use the **PlaybackItem** property to get a reference to the **MediaPlaybackItem** that contains the **VideoTrack**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotrack.playbackitem
     * @type {MediaPlaybackItem} 
     */
    PlaybackItem {
        get => this.get_PlaybackItem()
    }

    /**
     * Gets the name of the [VideoTrack](videotrack.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotrack.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets support information for the [VideoTrack](videotrack.md). This information includes the status of the video decoder and the status of the [MediaSource](mediasource.md) with which the video track is associated.
     * @remarks
     * If a failure occurs when a [VideoTrack](videotrack.md) is opened, you can get detailed status and failure information by handling the [OpenFailed](videotrack_openfailed.md) event and checking the **SupportInfo** property of the **VideoTrack** passed into the event as the sender.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotrack.supportinfo
     * @type {VideoTrackSupportInfo} 
     */
    SupportInfo {
        get => this.get_SupportInfo()
    }

    /**
     * Occurs when a [VideoTrack](videotrack.md) fails to open.
     * @remarks
     * Register for the **OpenFailed** event for a [VideoTrack](videotrack.md) from within the [VideoTracksChanged](../windows.media.playback/mediaplaybackitem_videotrackschanged.md) event handler for a [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md), which is raised whenever a video track is added to the item.
     * @type {TypedEventHandler<VideoTrack, VideoTrackOpenFailedEventArgs>}
    */
    OnOpenFailed {
        get {
            if(!this.HasProp("__OnOpenFailed")){
                this.__OnOpenFailed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b1e4bd43-541b-53f3-ad6c-ddaac4813023}"),
                    VideoTrack,
                    VideoTrackOpenFailedEventArgs
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
     * @param {TypedEventHandler<VideoTrack, VideoTrackOpenFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OpenFailed(handler) {
        if (!this.HasProp("__IVideoTrack")) {
            if ((queryResult := this.QueryInterface(IVideoTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTrack := IVideoTrack(outPtr)
        }

        return this.__IVideoTrack.add_OpenFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OpenFailed(token) {
        if (!this.HasProp("__IVideoTrack")) {
            if ((queryResult := this.QueryInterface(IVideoTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTrack := IVideoTrack(outPtr)
        }

        return this.__IVideoTrack.remove_OpenFailed(token)
    }

    /**
     * Gets the encoding properties for the [VideoTrack](videotrack.md).
     * @returns {VideoEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotrack.getencodingproperties
     */
    GetEncodingProperties() {
        if (!this.HasProp("__IVideoTrack")) {
            if ((queryResult := this.QueryInterface(IVideoTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTrack := IVideoTrack(outPtr)
        }

        return this.__IVideoTrack.GetEncodingProperties()
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_PlaybackItem() {
        if (!this.HasProp("__IVideoTrack")) {
            if ((queryResult := this.QueryInterface(IVideoTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTrack := IVideoTrack(outPtr)
        }

        return this.__IVideoTrack.get_PlaybackItem()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IVideoTrack")) {
            if ((queryResult := this.QueryInterface(IVideoTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTrack := IVideoTrack(outPtr)
        }

        return this.__IVideoTrack.get_Name()
    }

    /**
     * 
     * @returns {VideoTrackSupportInfo} 
     */
    get_SupportInfo() {
        if (!this.HasProp("__IVideoTrack")) {
            if ((queryResult := this.QueryInterface(IVideoTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTrack := IVideoTrack(outPtr)
        }

        return this.__IVideoTrack.get_SupportInfo()
    }

;@endregion Instance Methods
}
