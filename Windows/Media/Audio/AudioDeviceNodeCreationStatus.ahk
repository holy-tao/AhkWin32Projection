#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines status values for audio device node creation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiodevicenodecreationstatus
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioDeviceNodeCreationStatus extends Win32Enum{

    /**
     * Audio device node creation succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The audio device is not available.
     * @type {Integer (Int32)}
     */
    static DeviceNotAvailable => 1

    /**
     * The format for audio device node creation is not supported.
     * @type {Integer (Int32)}
     */
    static FormatNotSupported => 2

    /**
     * An unknown failure occurred in creation of the audio device node.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 3

    /**
     * Access to the audio device was denied.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 4
}
