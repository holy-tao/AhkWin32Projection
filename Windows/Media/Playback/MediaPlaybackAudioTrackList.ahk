#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\Core\AudioTrack.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\Core\ISingleSelectMediaTrackList.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a read-only list of [AudioTrack](../windows.media.core/audiotrack.md) objects, of which a single track can be selected at one time.
 * @remarks
 * Get an instance of this class by accessing the [AudioTracks](mediaplaybackitem_audiotracks.md) property of a [MediaPlaybackItem](mediaplaybackitem.md). To be notified when the list of tracks changes, handle the [AudioTracksChanged](mediaplaybackitem_audiotrackschanged.md) event.
 * 
 * This class provides access to the list of [AudioTrack](../windows.media.core/audiotrack.md) objects that are associated with a [MediaPlaybackItem](mediaplaybackitem.md). When the media item is opened by a component and the [ItemOpened](mediaplaybacklist_itemopened.md) event is raised, you can select one of the audio tracks in the track list for playback.
 * 
 * Note that this class does not represent a playlist of audio tracks that are played sequentially. To play a sequential list of tracks, use [MediaPlaybackList](mediaplaybacklist.md).
 * 
 * For how-to guidance for working with the audio tracks of a media item, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackaudiotracklist
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackAudioTrackList extends IInspectable {
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
     * Gets the number of audio tracks in the list.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackaudiotracklist.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * Gets or sets the index of the currently selected audio track in the list.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackaudiotracklist.selectedindex
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
     * Occurs when the index of the currently selected audio track changes.
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
     * Returns the audio track at the specified index.
     * @param {Integer} index The zero-based index of the audio track.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackaudiotracklist.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e71ffa4a-14a7-5068-891c-6e717af8bf8d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(AudioTrack, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e71ffa4a-14a7-5068-891c-6e717af8bf8d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(AudioTrack, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Retrieves the index of a specified audio track in the list.
     * @param {Generic} value The audio track to find in the vector view.
     * @param {Pointer<UInt32>} index If the audio track is found, this is the zero-based index of the audio track; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackaudiotracklist.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e71ffa4a-14a7-5068-891c-6e717af8bf8d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(AudioTrack, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Retrieves the audio tracks that start at the specified index in the list.
     * @param {Integer} startIndex The zero-based index of the start of the audio tracks in the list.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The audio tracks that start at *startIndex* in the list.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackaudiotracklist.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e71ffa4a-14a7-5068-891c-6e717af8bf8d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(AudioTrack, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Returns an iterator that iterates over the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackaudiotracklist.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{b3be50a8-9856-5656-ab6d-cd58f9de0a4f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(AudioTrack, outPtr)
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
