#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundMediaPlayerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the media player while it is running in the background.
  * 
  * > [!NOTE]
  * > Starting with Windows, version 1703, **BackgroundMediaPlayer** is deprecated and may not be available in future versions of Windows. Use the [MediaPlayer](mediaplayer.md) class instead. For more information, see [Play media in the background](/windows/uwp/audio-video-camera/background-audio).
 * @remarks
 * Starting with Windows 10, version 1607, apps should use the [MediaPlayer](mediaplayer.md) for media playback. The *MediaPlayer* object allows you to play media in the background seamlessly, using a single process. For information on using **MediaPlayer**, see [Play audio and video with MediaPlayer](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer). For information on playing media in the background with **MediaPlayer**, see [Play media in the background](/windows/uwp/audio-video-camera/background-audio). For information on the legacy, two-process background playback model, which is still supported for backwards compatibility, see [Legacy background media playback](/windows/uwp/audio-video-camera/legacy-background-media-playback).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.backgroundmediaplayer
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class BackgroundMediaPlayer extends IInspectable {
;@region Static Properties
    /**
     * Gets the current instance of the background media player.
     * 
     * > [!NOTE]
     * > Starting with Windows, version 1703, **BackgroundMediaPlayer** is deprecated and may not be available in future versions of Windows. Use the [MediaPlayer](mediaplayer.md) class instead. For more information, see [Play media in the background](/windows/uwp/audio-video-camera/background-audio).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.backgroundmediaplayer.current
     * @type {MediaPlayer} 
     */
    static Current {
        get => BackgroundMediaPlayer.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MediaPlayer} 
     */
    static get_Current() {
        if (!BackgroundMediaPlayer.HasProp("__IBackgroundMediaPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.BackgroundMediaPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundMediaPlayerStatics.IID)
            BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics := IBackgroundMediaPlayerStatics(factoryPtr)
        }

        return BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics.get_Current()
    }

    /**
     * 
     * @param {EventHandler<MediaPlayerDataReceivedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_MessageReceivedFromBackground(value) {
        if (!BackgroundMediaPlayer.HasProp("__IBackgroundMediaPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.BackgroundMediaPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundMediaPlayerStatics.IID)
            BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics := IBackgroundMediaPlayerStatics(factoryPtr)
        }

        return BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics.add_MessageReceivedFromBackground(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_MessageReceivedFromBackground(token) {
        if (!BackgroundMediaPlayer.HasProp("__IBackgroundMediaPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.BackgroundMediaPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundMediaPlayerStatics.IID)
            BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics := IBackgroundMediaPlayerStatics(factoryPtr)
        }

        return BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics.remove_MessageReceivedFromBackground(token)
    }

    /**
     * 
     * @param {EventHandler<MediaPlayerDataReceivedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_MessageReceivedFromForeground(value) {
        if (!BackgroundMediaPlayer.HasProp("__IBackgroundMediaPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.BackgroundMediaPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundMediaPlayerStatics.IID)
            BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics := IBackgroundMediaPlayerStatics(factoryPtr)
        }

        return BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics.add_MessageReceivedFromForeground(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_MessageReceivedFromForeground(token) {
        if (!BackgroundMediaPlayer.HasProp("__IBackgroundMediaPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.BackgroundMediaPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundMediaPlayerStatics.IID)
            BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics := IBackgroundMediaPlayerStatics(factoryPtr)
        }

        return BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics.remove_MessageReceivedFromForeground(token)
    }

    /**
     * Sends a message to the background media player.
     * 
     * > [!NOTE]
     * > Starting with Windows, version 1703, **BackgroundMediaPlayer** is deprecated and may not be available in future versions of Windows. Use the [MediaPlayer](mediaplayer.md) class instead. For more information, see [Play media in the background](/windows/uwp/audio-video-camera/background-audio).
     * @param {ValueSet} value Set of values representing the message.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.backgroundmediaplayer.sendmessagetobackground
     */
    static SendMessageToBackground(value) {
        if (!BackgroundMediaPlayer.HasProp("__IBackgroundMediaPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.BackgroundMediaPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundMediaPlayerStatics.IID)
            BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics := IBackgroundMediaPlayerStatics(factoryPtr)
        }

        return BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics.SendMessageToBackground(value)
    }

    /**
     * Sends a message to the foreground task.
     * 
     * > [!NOTE]
     * > Starting with Windows, version 1703, **BackgroundMediaPlayer** is deprecated and may not be available in future versions of Windows. Use the [MediaPlayer](mediaplayer.md) class instead. For more information, see [Play media in the background](/windows/uwp/audio-video-camera/background-audio).
     * @remarks
     * Apps should only call **SendMessageToForeground** while the foreground app is running. Attempting to call this method while the foreground app is not running will throw an exception. An app is responsible for communicating the foreground app state to the background process. This can be done using app lifecycle events, state values kept in local storage, and messages between processes.
     * 
     * Calls to **SendMessageToForeground** should always be made within a **try** block so that the exception thrown can be caught if the system is unable to send the message.
     * @param {ValueSet} value Set of values representing the message.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.backgroundmediaplayer.sendmessagetoforeground
     */
    static SendMessageToForeground(value) {
        if (!BackgroundMediaPlayer.HasProp("__IBackgroundMediaPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.BackgroundMediaPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundMediaPlayerStatics.IID)
            BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics := IBackgroundMediaPlayerStatics(factoryPtr)
        }

        return BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics.SendMessageToForeground(value)
    }

    /**
     * Returns a Boolean value indicating if other media is currently playing on the device.
     * 
     * > [!NOTE]
     * > Starting with Windows, version 1703, **BackgroundMediaPlayer** is deprecated and may not be available in future versions of Windows. Use the [MediaPlayer](mediaplayer.md) class instead. For more information, see [Play media in the background](/windows/uwp/audio-video-camera/background-audio).
     * @remarks
     * If this value is true, you may want to prompt the user to see if they would prefer to continue to listen to the other media source.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.backgroundmediaplayer.ismediaplaying
     */
    static IsMediaPlaying() {
        if (!BackgroundMediaPlayer.HasProp("__IBackgroundMediaPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.BackgroundMediaPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundMediaPlayerStatics.IID)
            BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics := IBackgroundMediaPlayerStatics(factoryPtr)
        }

        return BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics.IsMediaPlaying()
    }

    /**
     * Shuts down the current background media player.
     * 
     * > [!NOTE]
     * > Starting with Windows, version 1703, **BackgroundMediaPlayer** is deprecated and may not be available in future versions of Windows. Use the [MediaPlayer](mediaplayer.md) class instead. For more information, see [Play media in the background](/windows/uwp/audio-video-camera/background-audio).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.backgroundmediaplayer.shutdown
     */
    static Shutdown() {
        if (!BackgroundMediaPlayer.HasProp("__IBackgroundMediaPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.BackgroundMediaPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundMediaPlayerStatics.IID)
            BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics := IBackgroundMediaPlayerStatics(factoryPtr)
        }

        return BackgroundMediaPlayer.__IBackgroundMediaPlayerStatics.Shutdown()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
