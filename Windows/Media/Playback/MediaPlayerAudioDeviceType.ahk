#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the primary usage of the device that is being used to play back audio. This value is used by [MediaPlayer.AudioDeviceType](mediaplayer_audiodevicetype.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayeraudiodevicetype
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlayerAudioDeviceType extends Win32Enum{

    /**
     * The device is a console and the audio session might support games, notifications, voice commands, and so on.
     * @type {Integer (Int32)}
     */
    static Console => 0

    /**
     * The device is intended for multimedia playback and/or recording.
     * @type {Integer (Int32)}
     */
    static Multimedia => 1

    /**
     * The device is primarily for voice communications.
     * @type {Integer (Int32)}
     */
    static Communications => 2
}
