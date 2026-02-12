#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of device that is being used as a photo import source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsourcetype
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportSourceType extends Win32Enum{

    /**
     * The device is a generic photo import source.
     * @type {Integer (Int32)}
     */
    static Generic => 0

    /**
     * The device is a camera.
     * @type {Integer (Int32)}
     */
    static Camera => 1

    /**
     * The device is a media player.
     * @type {Integer (Int32)}
     */
    static MediaPlayer => 2

    /**
     * The device is a phone.
     * @type {Integer (Int32)}
     */
    static Phone => 3

    /**
     * The device is a video camera.
     * @type {Integer (Int32)}
     */
    static Video => 4

    /**
     * The device is a personal information manager.
     * @type {Integer (Int32)}
     */
    static PersonalInfoManager => 5

    /**
     * The device is an audio recorder.
     * @type {Integer (Int32)}
     */
    static AudioRecorder => 6
}
