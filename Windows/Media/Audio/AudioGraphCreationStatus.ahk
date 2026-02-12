#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines status values for audio graph creation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographcreationstatus
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioGraphCreationStatus extends Win32Enum{

    /**
     * Creation of the audio graph succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The [PrimaryRenderDevice](audiograph_primaryrenderdevice.md) for the audio graph is not available.
     * @type {Integer (Int32)}
     */
    static DeviceNotAvailable => 1

    /**
     * The audio stream format is not supported by the audio graph.
     * @type {Integer (Int32)}
     */
    static FormatNotSupported => 2

    /**
     * An unknown failure occurred during creation of the audio graph.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 3
}
