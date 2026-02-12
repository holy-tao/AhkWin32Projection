#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the types of audio that can be played by a media player.
 * @remarks
 * Games should categorize their music streams as **GameMedia** so that game music mutes automatically if another application plays music in the background. Music or video applications should categorize their streams as **Media** or **Movie** so they will take priority over **GameMedia** streams.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayeraudiocategory
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlayerAudioCategory extends Win32Enum{

    /**
     * The audio type is not one of the provided enumeration values.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * The audio is used for communications.
     * @type {Integer (Int32)}
     */
    static Communications => 3

    /**
     * The audio is used for alerts.
     * @type {Integer (Int32)}
     */
    static Alerts => 4

    /**
     * The audio is a sound effect.
     * @type {Integer (Int32)}
     */
    static SoundEffects => 5

    /**
     * The audio is a game effect.
     * @type {Integer (Int32)}
     */
    static GameEffects => 6

    /**
     * The audio is game media, such as background music.
     * @type {Integer (Int32)}
     */
    static GameMedia => 7

    /**
     * The audio is used for game chat.
     * @type {Integer (Int32)}
     */
    static GameChat => 8

    /**
     * The audio is used for speech.
     * @type {Integer (Int32)}
     */
    static Speech => 9

    /**
     * The audio is for movie playback.
     * @type {Integer (Int32)}
     */
    static Movie => 10

    /**
     * The audio is for media playback.
     * @type {Integer (Int32)}
     */
    static Media => 11
}
