#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackList.ahk
#Include .\IMediaPlaybackList2.ahk
#Include .\IMediaPlaybackList3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaPlaybackList.ahk
#Include .\MediaPlaybackItemFailedEventArgs.ahk
#Include .\CurrentMediaPlaybackItemChangedEventArgs.ahk
#Include .\MediaPlaybackItemOpenedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a list of [MediaPlaybackItem](mediaplaybackitem.md) objects that can be played back. Provides methods for switching the currently playing item and enabling looping and shuffling.
 * @remarks
 * Items in a MediaPlaybackList are rendered using gapless playback. The system will use provided metadata in MP3 or AAC encoded files to determine the delay or padding compensation needed for gapless playback. If the MP3 or AAC encoded files don't provide this metadata, then the system determines the delay or padding heuristically. For lossless formats, such as PCM, FLAC, or ALAC, the system takes no action because these encoders don't introduce delay or padding.
 * 
 * For how-to guidance for working with media items, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackList extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackList

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackList.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an [IObservableVector](../windows.foundation.collections/iobservablevector_1.md) representation of the playback list.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.items
     * @type {IObservableVector<MediaPlaybackItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets or sets a value indicating whether the playback list will loop when the end of the list is reached.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.autorepeatenabled
     * @type {Boolean} 
     */
    AutoRepeatEnabled {
        get => this.get_AutoRepeatEnabled()
        set => this.put_AutoRepeatEnabled(value)
    }

    /**
     * Gets or sets a value indicating whether the items in the playback list are played in a random order.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.shuffleenabled
     * @type {Boolean} 
     */
    ShuffleEnabled {
        get => this.get_ShuffleEnabled()
        set => this.put_ShuffleEnabled(value)
    }

    /**
     * Gets the currently playing [MediaPlaybackItem](mediaplaybackitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.currentitem
     * @type {MediaPlaybackItem} 
     */
    CurrentItem {
        get => this.get_CurrentItem()
    }

    /**
     * Gets the index of the current item in the[MediaPlaybackList](mediaplaybacklist.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.currentitemindex
     * @type {Integer} 
     */
    CurrentItemIndex {
        get => this.get_CurrentItemIndex()
    }

    /**
     * Gets or sets the maximum prefetch time for [MediaPlaybackItem](mediaplaybackitem.md) objects in the playback list. The prefetch time is the amount of time before an item is expected to begin playing that the system retrieves the item's media content.
     * @remarks
     * Prefetching allows the system to provide a more seamless playback experience because media content is retrieved before it is needed for playback. Setting a smaller maximum prefetch time can reduce bandwidth usage if the user stops playback before an item begins playing.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.maxprefetchtime
     * @type {IReference<TimeSpan>} 
     */
    MaxPrefetchTime {
        get => this.get_MaxPrefetchTime()
        set => this.put_MaxPrefetchTime(value)
    }

    /**
     * Gets or sets the [MediaPlaybackItem](mediaplaybackitem.md) that will be played first.
     * @remarks
     * The [MediaPlaybackItem](mediaplaybackitem.md) specified for this property is played first regardless of whether [ShuffleEnabled](mediaplaybacklist_shuffleenabled.md) is true.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.startingitem
     * @type {MediaPlaybackItem} 
     */
    StartingItem {
        get => this.get_StartingItem()
        set => this.put_StartingItem(value)
    }

    /**
     * Gets a read-only list of [MediaPlaybackItem](mediaplaybackitem.md) objects that will be played in shuffle mode, in the order in which they will be played.
     * @remarks
     * Replace the list of pending shuffled items by calling [SetShuffledItems](mediaplaybacklist_setshuffleditems_502786703.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.shuffleditems
     * @type {IVectorView<MediaPlaybackItem>} 
     */
    ShuffledItems {
        get => this.get_ShuffledItems()
    }

    /**
     * Gets or sets a value that specifies the number of [MediaPlaybackItem](mediaplaybackitem.md) objects that should be kept open after they have been played.
     * @remarks
     * Set this value to cause the system to keep the specified number of media playback items open after they have been played so that, if the users navigates backwards through the playback list, the open items can be played immediately without needing to be reopened. The trade off is that the more items that are kept open, the more memory is used by your app, which is especially important to consider with background media playback, where resources are more limited than for a foreground app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.maxplayeditemstokeepopen
     * @type {IReference<Integer>} 
     */
    MaxPlayedItemsToKeepOpen {
        get => this.get_MaxPlayedItemsToKeepOpen()
        set => this.put_MaxPlayedItemsToKeepOpen(value)
    }

    /**
     * Occurs when an error is encountered with a [MediaPlaybackItem](mediaplaybackitem.md) in the playback list.
     * @type {TypedEventHandler<MediaPlaybackList, MediaPlaybackItemFailedEventArgs>}
    */
    OnItemFailed {
        get {
            if(!this.HasProp("__OnItemFailed")){
                this.__OnItemFailed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{23319e7d-34b1-57b7-97e5-844948ba4719}"),
                    MediaPlaybackList,
                    MediaPlaybackItemFailedEventArgs
                )
                this.__OnItemFailedToken := this.add_ItemFailed(this.__OnItemFailed.iface)
            }
            return this.__OnItemFailed
        }
    }

    /**
     * Occurs when the currently playing [MediaPlaybackItem](mediaplaybackitem.md) changes.
     * @type {TypedEventHandler<MediaPlaybackList, CurrentMediaPlaybackItemChangedEventArgs>}
    */
    OnCurrentItemChanged {
        get {
            if(!this.HasProp("__OnCurrentItemChanged")){
                this.__OnCurrentItemChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{404c5f9d-250d-5f8c-9627-6b4105c32d09}"),
                    MediaPlaybackList,
                    CurrentMediaPlaybackItemChangedEventArgs
                )
                this.__OnCurrentItemChangedToken := this.add_CurrentItemChanged(this.__OnCurrentItemChanged.iface)
            }
            return this.__OnCurrentItemChanged
        }
    }

    /**
     * Occurs when a [MediaPlaybackItem](mediaplaybackitem.md) in the playback list is successfully opened.
     * @type {TypedEventHandler<MediaPlaybackList, MediaPlaybackItemOpenedEventArgs>}
    */
    OnItemOpened {
        get {
            if(!this.HasProp("__OnItemOpened")){
                this.__OnItemOpened := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6732bbef-3311-5f83-9c9d-82a5cf3cd82a}"),
                    MediaPlaybackList,
                    MediaPlaybackItemOpenedEventArgs
                )
                this.__OnItemOpenedToken := this.add_ItemOpened(this.__OnItemOpened.iface)
            }
            return this.__OnItemOpened
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MediaPlaybackList](mediaplaybacklist.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.MediaPlaybackList")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnItemFailedToken")) {
            this.remove_ItemFailed(this.__OnItemFailedToken)
            this.__OnItemFailed.iface.Dispose()
        }

        if(this.HasProp("__OnCurrentItemChangedToken")) {
            this.remove_CurrentItemChanged(this.__OnCurrentItemChangedToken)
            this.__OnCurrentItemChanged.iface.Dispose()
        }

        if(this.HasProp("__OnItemOpenedToken")) {
            this.remove_ItemOpened(this.__OnItemOpenedToken)
            this.__OnItemOpened.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackList, MediaPlaybackItemFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemFailed(handler) {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.add_ItemFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemFailed(token) {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.remove_ItemFailed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackList, CurrentMediaPlaybackItemChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentItemChanged(handler) {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.add_CurrentItemChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentItemChanged(token) {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.remove_CurrentItemChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackList, MediaPlaybackItemOpenedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemOpened(handler) {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.add_ItemOpened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemOpened(token) {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.remove_ItemOpened(token)
    }

    /**
     * 
     * @returns {IObservableVector<MediaPlaybackItem>} 
     */
    get_Items() {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.get_Items()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoRepeatEnabled() {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.get_AutoRepeatEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoRepeatEnabled(value) {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.put_AutoRepeatEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShuffleEnabled() {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.get_ShuffleEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShuffleEnabled(value) {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.put_ShuffleEnabled(value)
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_CurrentItem() {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.get_CurrentItem()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentItemIndex() {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.get_CurrentItemIndex()
    }

    /**
     * Changes the current item of the [MediaPlaybackList](mediaplaybacklist.md) to the next item in the list.
     * @remarks
     * This current item of the [MediaPlaybackList](mediaplaybacklist.md) can't be changed while a [MediaPlaybackItem](mediaplaybackitem.md) with [CanSkip](mediaplaybackitem_canskip.md) set to false is playing. Attempting to do so will cause an exception to be thrown.
     * @returns {MediaPlaybackItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.movenext
     */
    MoveNext() {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.MoveNext()
    }

    /**
     * Changes the current item of the [MediaPlaybackList](mediaplaybacklist.md) to the previous item in the list.
     * @remarks
     * This current item of the [MediaPlaybackList](mediaplaybacklist.md) can't be changed while a [MediaPlaybackItem](mediaplaybackitem.md) with [CanSkip](mediaplaybackitem_canskip.md) set to false is playing. Attempting to do so will cause an exception to be thrown.
     * @returns {MediaPlaybackItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.moveprevious
     */
    MovePrevious() {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.MovePrevious()
    }

    /**
     * Changes the current item of the [MediaPlaybackList](mediaplaybacklist.md) to the item with the specified index.
     * @remarks
     * This current item of the [MediaPlaybackList](mediaplaybacklist.md) can't be changed while a [MediaPlaybackItem](mediaplaybackitem.md) with [CanSkip](mediaplaybackitem_canskip.md) set to false is playing. Attempting to do so will cause an exception to be thrown.
     * @param {Integer} itemIndex The index of the item to make current.
     * @returns {MediaPlaybackItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.moveto
     */
    MoveTo(itemIndex) {
        if (!this.HasProp("__IMediaPlaybackList")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList := IMediaPlaybackList(outPtr)
        }

        return this.__IMediaPlaybackList.MoveTo(itemIndex)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_MaxPrefetchTime() {
        if (!this.HasProp("__IMediaPlaybackList2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList2 := IMediaPlaybackList2(outPtr)
        }

        return this.__IMediaPlaybackList2.get_MaxPrefetchTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_MaxPrefetchTime(value) {
        if (!this.HasProp("__IMediaPlaybackList2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList2 := IMediaPlaybackList2(outPtr)
        }

        return this.__IMediaPlaybackList2.put_MaxPrefetchTime(value)
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_StartingItem() {
        if (!this.HasProp("__IMediaPlaybackList2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList2 := IMediaPlaybackList2(outPtr)
        }

        return this.__IMediaPlaybackList2.get_StartingItem()
    }

    /**
     * 
     * @param {MediaPlaybackItem} value 
     * @returns {HRESULT} 
     */
    put_StartingItem(value) {
        if (!this.HasProp("__IMediaPlaybackList2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList2 := IMediaPlaybackList2(outPtr)
        }

        return this.__IMediaPlaybackList2.put_StartingItem(value)
    }

    /**
     * 
     * @returns {IVectorView<MediaPlaybackItem>} 
     */
    get_ShuffledItems() {
        if (!this.HasProp("__IMediaPlaybackList2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList2 := IMediaPlaybackList2(outPtr)
        }

        return this.__IMediaPlaybackList2.get_ShuffledItems()
    }

    /**
     * Sets the list of [MediaPlaybackItem](mediaplaybackitem.md) objects that will be played in shuffle mode, in the order in which they will be played.
     * @remarks
     * Use this method to manage the order in which items are played when [ShuffleEnabled](mediaplaybacklist_shuffleenabled.md) is set to true, replacing the shuffle order generated by the system.
     * @param {IIterable<MediaPlaybackItem>} value The list of [MediaPlaybackItem](mediaplaybackitem.md) objects that will be played in shuffle mode.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacklist.setshuffleditems
     */
    SetShuffledItems(value) {
        if (!this.HasProp("__IMediaPlaybackList2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList2 := IMediaPlaybackList2(outPtr)
        }

        return this.__IMediaPlaybackList2.SetShuffledItems(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxPlayedItemsToKeepOpen() {
        if (!this.HasProp("__IMediaPlaybackList3")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList3 := IMediaPlaybackList3(outPtr)
        }

        return this.__IMediaPlaybackList3.get_MaxPlayedItemsToKeepOpen()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxPlayedItemsToKeepOpen(value) {
        if (!this.HasProp("__IMediaPlaybackList3")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackList3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackList3 := IMediaPlaybackList3(outPtr)
        }

        return this.__IMediaPlaybackList3.put_MaxPlayedItemsToKeepOpen(value)
    }

;@endregion Instance Methods
}
