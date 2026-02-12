#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaControl.ahk
#Include ..\..\Guid.ahk

/**
 * > [!NOTE]
  * > MediaControl may be altered or unavailable for releases after Windows 8.1. Instead, use [SystemMediaTransportControls](systemmediatransportcontrols.md).
  * 
  * Describes the object that applications register with, to receive media focus and transport control notifications.
 * @remarks
 * The **MediaControl** class provides access to button press events. These events can be monitored, and can modify the response and behavior of an audio-aware app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediacontrol
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MediaControl extends IInspectable {
;@region Static Properties
    /**
     * > [!NOTE]
     * > [MediaControl](mediacontrol.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [SystemMediaTransportControls](systemmediatransportcontrols.md).
     * 
     * Gets the current sound level.
     * @remarks
     * Note that the sound level of an application is tied to the state of its render streams only, and not to the states of its capture or loopback streams.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediacontrol.soundlevel
     * @type {Integer} 
     */
    static SoundLevel {
        get => MediaControl.get_SoundLevel()
    }

    /**
     * > [!NOTE]
     * > [MediaControl](mediacontrol.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [SystemMediaTransportControls](systemmediatransportcontrols.md).
     * 
     * Gets or sets the track name.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediacontrol.trackname
     * @type {HSTRING} 
     */
    static TrackName {
        get => MediaControl.get_TrackName()
        set => MediaControl.put_TrackName(value)
    }

    /**
     * > [!NOTE]
     * > [MediaControl](mediacontrol.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [SystemMediaTransportControls](systemmediatransportcontrols.md).
     * 
     * Gets or sets the name of the artist.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediacontrol.artistname
     * @type {HSTRING} 
     */
    static ArtistName {
        get => MediaControl.get_ArtistName()
        set => MediaControl.put_ArtistName(value)
    }

    /**
     * > [!NOTE]
     * > [MediaControl](mediacontrol.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [SystemMediaTransportControls](systemmediatransportcontrols.md).
     * 
     * Gets or sets the state of the Play button.
     * @remarks
     * **IsPlaying** is a Boolean value that indicates the state of the Play button. You can retrieve or set this value. You can also use the current value to make programmatic decisions about the behavior of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediacontrol.isplaying
     * @type {Boolean} 
     */
    static IsPlaying {
        get => MediaControl.get_IsPlaying()
        set => MediaControl.put_IsPlaying(value)
    }

    /**
     * > [!NOTE]
     * > [MediaControl](mediacontrol.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [SystemMediaTransportControls](systemmediatransportcontrols.md).
     * 
     * Gets or sets the path to the artwork for the album cover.
     * @remarks
     * If you provide an invalid path for the album art property, it will cause an exception to be thrown. The only valid URI formats are ms-appx:// and ms-appdata://.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediacontrol.albumart
     * @type {Uri} 
     */
    static AlbumArt {
        get => MediaControl.get_AlbumArt()
        set => MediaControl.put_AlbumArt(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_SoundLevelChanged(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_SoundLevelChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_SoundLevelChanged(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_SoundLevelChanged(cookie)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_PlayPressed(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_PlayPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_PlayPressed(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_PlayPressed(cookie)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_PausePressed(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_PausePressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_PausePressed(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_PausePressed(cookie)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_StopPressed(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_StopPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_StopPressed(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_StopPressed(cookie)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_PlayPauseTogglePressed(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_PlayPauseTogglePressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_PlayPauseTogglePressed(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_PlayPauseTogglePressed(cookie)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_RecordPressed(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_RecordPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_RecordPressed(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_RecordPressed(cookie)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_NextTrackPressed(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_NextTrackPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_NextTrackPressed(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_NextTrackPressed(cookie)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_PreviousTrackPressed(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_PreviousTrackPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_PreviousTrackPressed(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_PreviousTrackPressed(cookie)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_FastForwardPressed(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_FastForwardPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_FastForwardPressed(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_FastForwardPressed(cookie)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_RewindPressed(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_RewindPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_RewindPressed(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_RewindPressed(cookie)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ChannelUpPressed(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_ChannelUpPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_ChannelUpPressed(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_ChannelUpPressed(cookie)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ChannelDownPressed(handler) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.add_ChannelDownPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_ChannelDownPressed(cookie) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.remove_ChannelDownPressed(cookie)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SoundLevel() {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.get_SoundLevel()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    static put_TrackName(value) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.put_TrackName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TrackName() {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.get_TrackName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    static put_ArtistName(value) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.put_ArtistName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ArtistName() {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.get_ArtistName()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_IsPlaying(value) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.put_IsPlaying(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsPlaying() {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.get_IsPlaying()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    static put_AlbumArt(value) {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.put_AlbumArt(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    static get_AlbumArt() {
        if (!MediaControl.HasProp("__IMediaControl")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaControl.IID)
            MediaControl.__IMediaControl := IMediaControl(factoryPtr)
        }

        return MediaControl.__IMediaControl.get_AlbumArt()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
