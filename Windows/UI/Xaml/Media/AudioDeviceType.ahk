#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the primary usage of the device that is being used to play back audio. This value is used by [AudioDeviceType](../windows.ui.xaml.controls/mediaelement_audiodevicetype.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.audiodevicetype
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class AudioDeviceType extends Win32Enum{

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
