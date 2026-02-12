#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the result of a call to [StartAsync](mediaframereader_startasync_1931900819.md) to start the reading of media frames by a MediaFrameReader.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereaderstartstatus
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameReaderStartStatus extends Win32Enum{

    /**
     * The operation was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The operation failed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 1

    /**
     * The operation failed because the media frame source device is unavailable.
     * @type {Integer (Int32)}
     */
    static DeviceNotAvailable => 2

    /**
     * The operation failed because the requested output format is not supported by the media frame source.
     * @type {Integer (Int32)}
     */
    static OutputFormatNotSupported => 3

    /**
     * The operation failed because exclusive control of the media frame source device is unavailable.
     * @type {Integer (Int32)}
     */
    static ExclusiveControlNotAvailable => 4
}
