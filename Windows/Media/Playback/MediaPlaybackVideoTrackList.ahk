#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\Core\VideoTrack.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\Core\ISingleSelectMediaTrackList.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a read-only list of [VideoTrack](../windows.media.core/videotrack.md) objects, of which a single track can be selected at one time.
 * @remarks
 * Get an instance of this class by accessing the [VideoTracks](mediaplaybackitem_videotracks.md) property of a [MediaPlaybackItem](mediaplaybackitem.md). To be notified when the list of tracks changes, handle the [VideoTracksChanged](mediaplaybackitem_videotrackschanged.md) event.
 * 
 * This class provides access to the list of [VideoTrack](../windows.media.core/videotrack.md) objects that are associated with a [MediaPlaybackItem](mediaplaybackitem.md). When the media item is opened by a component and the [ItemOpened](mediaplaybacklist_itemopened.md) event is raised, you can select one of the video tracks in the track list for playback.
 * 
 * Note that this class does not represent a playlist of video tracks that are played sequentially. To play a sequential list of tracks, use [MediaPlaybackList](mediaplaybacklist.md).
 * 
 * For how-to guidance for working with the video tracks of a media item, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackvideotracklist
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackVideoTrackList extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVectorView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVectorView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of video tracks in the list.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackvideotracklist.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * Gets or sets the index of the currently selected video track in the list.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackvideotracklist.selectedindex
     * @type {Integer} 
     */
    SelectedIndex {
        get => this.get_SelectedIndex()
        set => this.put_SelectedIndex(value)
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }

    /**
     * Occurs when the index of the currently selected video track changes.
     * @type {TypedEventHandler<ISingleSelectMediaTrackList, IInspectable>}
    */
    OnSelectedIndexChanged {
        get {
            if(!this.HasProp("__OnSelectedIndexChanged")){
                this.__OnSelectedIndexChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{21eb6e39-728a-56a9-8dce-062ba4c81bf5}"),
                    ISingleSelectMediaTrackList,
                    IInspectable
                )
                this.__OnSelectedIndexChangedToken := this.add_SelectedIndexChanged(this.__OnSelectedIndexChanged.iface)
            }
            return this.__OnSelectedIndexChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSelectedIndexChangedToken")) {
            this.remove_SelectedIndexChanged(this.__OnSelectedIndexChangedToken)
            this.__OnSelectedIndexChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Returns the video track at the specified index.
     * @param {Integer} index The zero-based index of the video track.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackvideotracklist.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{200c6224-0b43-54fb-995f-fd8688bf24de}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(VideoTrack, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{200c6224-0b43-54fb-995f-fd8688bf24de}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(VideoTrack, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Retrieves the index of a specified video track in the list.
     * @param {Generic} value The video track to find in the vector view.
     * @param {Pointer<UInt32>} index If the video track is found, this is the zero-based index of the audio track; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackvideotracklist.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{200c6224-0b43-54fb-995f-fd8688bf24de}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(VideoTrack, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Retrieves the video tracks that start at the specified index in the list.
     * @param {Integer} startIndex The zero-based index of the start of the video tracks in the list.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The video tracks that start at *startIndex* in the list.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackvideotracklist.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{200c6224-0b43-54fb-995f-fd8688bf24de}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(VideoTrack, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Returns an iterator that iterates over the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackvideotracklist.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{84413442-a2e3-5e0f-936d-bc40b0fb2dcd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(VideoTrack, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * 
     * @param {TypedEventHandler<ISingleSelectMediaTrackList, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectedIndexChanged(handler) {
        if (!this.HasProp("__ISingleSelectMediaTrackList")) {
            if ((queryResult := this.QueryInterface(ISingleSelectMediaTrackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISingleSelectMediaTrackList := ISingleSelectMediaTrackList(outPtr)
        }

        return this.__ISingleSelectMediaTrackList.add_SelectedIndexChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectedIndexChanged(token) {
        if (!this.HasProp("__ISingleSelectMediaTrackList")) {
            if ((queryResult := this.QueryInterface(ISingleSelectMediaTrackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISingleSelectMediaTrackList := ISingleSelectMediaTrackList(outPtr)
        }

        return this.__ISingleSelectMediaTrackList.remove_SelectedIndexChanged(token)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedIndex(value) {
        if (!this.HasProp("__ISingleSelectMediaTrackList")) {
            if ((queryResult := this.QueryInterface(ISingleSelectMediaTrackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISingleSelectMediaTrackList := ISingleSelectMediaTrackList(outPtr)
        }

        return this.__ISingleSelectMediaTrackList.put_SelectedIndex(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedIndex() {
        if (!this.HasProp("__ISingleSelectMediaTrackList")) {
            if ((queryResult := this.QueryInterface(ISingleSelectMediaTrackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISingleSelectMediaTrackList := ISingleSelectMediaTrackList(outPtr)
        }

        return this.__ISingleSelectMediaTrackList.get_SelectedIndex()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
