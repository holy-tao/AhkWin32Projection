#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\Core\TimedMetadataTrack.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include .\IMediaPlaybackTimedMetadataTrackList.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaPlaybackTimedMetadataTrackList.ahk
#Include .\TimedMetadataPresentationModeChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a read-only list of [TimedMetadataTrack](../windows.media.core/timedmetadatatrack.md) objects.
 * @remarks
 * Get an instance of this class by accessing the [TimedMetadataTracks](mediaplaybackitem_timedmetadatatracks.md) property of a [MediaPlaybackItem](mediaplaybackitem.md). To be notified when the list of tracks changes, handle the [TimedMetadataTracksChanged](mediaplaybackitem_timedmetadatatrackschanged.md) event.
 * 
 * For how-to guidance for working with metadata tracks, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackTimedMetadataTrackList extends IInspectable {
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
     * Gets the number of timed metadata tracks in the list.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }

    /**
     * Occurs when the presentation mode of the [MediaPlaybackTimedMetadataTrackList](mediaplaybacktimedmetadatatracklist.md) changes.
     * @remarks
     * Change the presentation mode by calling [SetPresentationMode](mediaplaybacktimedmetadatatracklist_setpresentationmode_83974782.md).
     * @type {TypedEventHandler<MediaPlaybackTimedMetadataTrackList, TimedMetadataPresentationModeChangedEventArgs>}
    */
    OnPresentationModeChanged {
        get {
            if(!this.HasProp("__OnPresentationModeChanged")){
                this.__OnPresentationModeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{40213c85-bf23-5f78-b9c4-e03f3be2b41c}"),
                    MediaPlaybackTimedMetadataTrackList,
                    TimedMetadataPresentationModeChangedEventArgs
                )
                this.__OnPresentationModeChangedToken := this.add_PresentationModeChanged(this.__OnPresentationModeChanged.iface)
            }
            return this.__OnPresentationModeChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPresentationModeChangedToken")) {
            this.remove_PresentationModeChanged(this.__OnPresentationModeChangedToken)
            this.__OnPresentationModeChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Returns the timed metadata track at the specified index.
     * @param {Integer} index The zero-based index of the timed metadata track.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{0313ae7a-2803-5d45-b5a1-a0fc5cd55e7c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(TimedMetadataTrack, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{0313ae7a-2803-5d45-b5a1-a0fc5cd55e7c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(TimedMetadataTrack, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Retrieves the index of a specified timed metadata track in the list.
     * @param {Generic} value The timed metadata track to find in the vector view.
     * @param {Pointer<UInt32>} index If the timed metadata track is found, this is the zero-based index of the audio track; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{0313ae7a-2803-5d45-b5a1-a0fc5cd55e7c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(TimedMetadataTrack, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Retrieves the timed metadata tracks that start at the specified index in the list.
     * @param {Integer} startIndex The zero-based index of the start of the timed metadata tracks in the list.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The timed metadata tracks that start at *startIndex* in the list.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{0313ae7a-2803-5d45-b5a1-a0fc5cd55e7c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(TimedMetadataTrack, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Returns an iterator that iterates over the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{150a4454-03bb-5dd1-8153-6a600e851f71}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(TimedMetadataTrack, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackTimedMetadataTrackList, TimedMetadataPresentationModeChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PresentationModeChanged(handler) {
        if (!this.HasProp("__IMediaPlaybackTimedMetadataTrackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackTimedMetadataTrackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackTimedMetadataTrackList := IMediaPlaybackTimedMetadataTrackList(outPtr)
        }

        return this.__IMediaPlaybackTimedMetadataTrackList.add_PresentationModeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PresentationModeChanged(token) {
        if (!this.HasProp("__IMediaPlaybackTimedMetadataTrackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackTimedMetadataTrackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackTimedMetadataTrackList := IMediaPlaybackTimedMetadataTrackList(outPtr)
        }

        return this.__IMediaPlaybackTimedMetadataTrackList.remove_PresentationModeChanged(token)
    }

    /**
     * Gets the presentation mode of the timed metadata track with the specified index.
     * @param {Integer} index The index of the timed metadata track for which the presentation mode is queried.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist.getpresentationmode
     */
    GetPresentationMode(index) {
        if (!this.HasProp("__IMediaPlaybackTimedMetadataTrackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackTimedMetadataTrackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackTimedMetadataTrackList := IMediaPlaybackTimedMetadataTrackList(outPtr)
        }

        return this.__IMediaPlaybackTimedMetadataTrackList.GetPresentationMode(index)
    }

    /**
     * Sets the presentation mode of the timed metadata track with the specified index.
     * @param {Integer} index The index of the timed metadata track for which the presentation mode is set.
     * @param {Integer} value The presentation mode to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist.setpresentationmode
     */
    SetPresentationMode(index, value) {
        if (!this.HasProp("__IMediaPlaybackTimedMetadataTrackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackTimedMetadataTrackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackTimedMetadataTrackList := IMediaPlaybackTimedMetadataTrackList(outPtr)
        }

        return this.__IMediaPlaybackTimedMetadataTrackList.SetPresentationMode(index, value)
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
