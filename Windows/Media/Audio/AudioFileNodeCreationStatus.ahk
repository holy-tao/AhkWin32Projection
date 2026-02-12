#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines status values for audio file node creation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiofilenodecreationstatus
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioFileNodeCreationStatus extends Win32Enum{

    /**
     * Creation of the audio file node succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The audio file used to create the node was not found.
     * @type {Integer (Int32)}
     */
    static FileNotFound => 1

    /**
     * The audio file for node creation has an invalid file type.
     * @type {Integer (Int32)}
     */
    static InvalidFileType => 2

    /**
     * The format of the audio file is not supported.
     * @type {Integer (Int32)}
     */
    static FormatNotSupported => 3

    /**
     * An unknown failure occurred during creation of the audio file node.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 4
}
