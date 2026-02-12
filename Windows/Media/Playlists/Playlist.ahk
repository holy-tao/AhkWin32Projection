#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlaylist.ahk
#Include .\IPlaylistStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to a media playlist.
 * @remarks
 * This API is used to save and load playlist files to and from disk. For information about playing lists of media items, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playlists.playlist
 * @namespace Windows.Media.Playlists
 * @version WindowsRuntime 1.4
 */
class Playlist extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlaylist

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlaylist.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously loads files into a playlist.
     * @param {IStorageFile} file_ Represents the files to load.
     * @returns {IAsyncOperation<Playlist>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playlists.playlist.loadasync
     */
    static LoadAsync(file_) {
        if (!Playlist.HasProp("__IPlaylistStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playlists.Playlist")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaylistStatics.IID)
            Playlist.__IPlaylistStatics := IPlaylistStatics(factoryPtr)
        }

        return Playlist.__IPlaylistStatics.LoadAsync(file_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The set of media files that make up the playlist.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playlists.playlist.files
     * @type {IVector<StorageFile>} 
     */
    Files {
        get => this.get_Files()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of a [Playlist](playlist.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Playlists.Playlist")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<StorageFile>} 
     */
    get_Files() {
        if (!this.HasProp("__IPlaylist")) {
            if ((queryResult := this.QueryInterface(IPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaylist := IPlaylist(outPtr)
        }

        return this.__IPlaylist.get_Files()
    }

    /**
     * Asynchronously saves the playlist.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playlists.playlist.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IPlaylist")) {
            if ((queryResult := this.QueryInterface(IPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaylist := IPlaylist(outPtr)
        }

        return this.__IPlaylist.SaveAsync()
    }

    /**
     * Asynchronously saves the playlist to a specified file and folder, in a specified format.
     * @param {IStorageFolder} saveLocation The folder in which to save the playlist.
     * @param {HSTRING} desiredName The name of the playlist to save.
     * @param {Integer} option The action to take if the playlist is saved to an existing file. One of the values of the [NameCollisionOption](../windows.storage/namecollisionoption.md) enumeration.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playlists.playlist.saveasasync
     */
    SaveAsAsync(saveLocation, desiredName, option) {
        if (!this.HasProp("__IPlaylist")) {
            if ((queryResult := this.QueryInterface(IPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaylist := IPlaylist(outPtr)
        }

        return this.__IPlaylist.SaveAsAsync(saveLocation, desiredName, option)
    }

    /**
     * Asynchronously saves the playlist to a specified file and folder.
     * @param {IStorageFolder} saveLocation The folder in which to save the playlist.
     * @param {HSTRING} desiredName The name of the playlist to save.
     * @param {Integer} option The action to take if the playlist is saved to an existing file. One of the values of the [NameCollisionOption](../windows.storage/namecollisionoption.md) enumeration.
     * @param {Integer} playlistFormat_ 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playlists.playlist.saveasasync
     */
    SaveAsWithFormatAsync(saveLocation, desiredName, option, playlistFormat_) {
        if (!this.HasProp("__IPlaylist")) {
            if ((queryResult := this.QueryInterface(IPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaylist := IPlaylist(outPtr)
        }

        return this.__IPlaylist.SaveAsWithFormatAsync(saveLocation, desiredName, option, playlistFormat_)
    }

;@endregion Instance Methods
}
