#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the purpose of the audio information in an audio stream. Used as a value by [AudioCategory](../windows.ui.xaml.controls/mediaelement_audiocategory.md).
 * @remarks
 * These enumeration values are used by the [MediaElement.AudioCategory](../windows.ui.xaml.controls/mediaelement_audiocategory.md) property. If you use the [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) control, you use the [MediaPlayerAudioCategory](../windows.media.playback/mediaplayeraudiocategory.md) enumeration values to set the [AudioCategory](../windows.media.playback/mediaplayer_audiocategory.md) directly on the underlying [MediaPlayer](../windows.media.playback/mediaplayer.md) instead.
 * 
 * Starting in Windows 10, version 1511 the **ForegroundOnlyMedia** and **BackgroundCapableMedia** enumeration values are deprecated. For more info about using background audio in your app, see [Play media in the background](/windows/uwp/audio-video-camera/background-audio).
 * 
 * Games should categorize their music streams as **GameMedia** so that game music mutes automatically if another application plays music in the background. Music or video applications should categorize their streams as **Media** or **Movie** so they will take priority over **GameMedia** streams. Game audio for in-game cinematics or cutscenes, when the audio is premixed or for creative reasons should take priority over background audio, should also be categorized as **Media** or **Movie**.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.audiocategory
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class AudioCategory extends Win32Enum{

    /**
     * All other streams.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * Audio is for general media, for example audio for video, or streaming audio, but should not be played as background. This enumeration value is deprecated. For more information, see **Remarks**.
     * @type {Integer (Int32)}
     */
    static ForegroundOnlyMedia => 1

    /**
     * Audio is for general media, for example audio for video, or streaming audio, and can be played as background. This enumeration value is deprecated. For more information, see **Remarks**.
     * @type {Integer (Int32)}
     */
    static BackgroundCapableMedia => 2

    /**
     * Audio is for peer-to-peer communications, for example chat or VoIP.
     * @type {Integer (Int32)}
     */
    static Communications => 3

    /**
     * Audio is for system or application notifications, for example ring tones.
     * @type {Integer (Int32)}
     */
    static Alerts => 4

    /**
     * Audio is for sound effects.
     * @type {Integer (Int32)}
     */
    static SoundEffects => 5

    /**
     * Audio is for game-specific sound effects.
     * @type {Integer (Int32)}
     */
    static GameEffects => 6

    /**
     * Audio is background (non-event or ambient) audio for games.
     * @type {Integer (Int32)}
     */
    static GameMedia => 7

    /**
     * Game chat audio. Similar to **Communications** except that **GameChat** will not attenuate other streams.
     * @type {Integer (Int32)}
     */
    static GameChat => 8

    /**
     * Audio is speech.
     * @type {Integer (Int32)}
     */
    static Speech => 9

    /**
     * Stream that includes audio with dialog.
     * @type {Integer (Int32)}
     */
    static Movie => 10

    /**
     * Stream that includes audio without dialog.
     * @type {Integer (Int32)}
     */
    static Media => 11
}
