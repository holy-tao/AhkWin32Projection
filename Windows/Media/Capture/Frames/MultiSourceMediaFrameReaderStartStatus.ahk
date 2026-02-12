#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a [MultiSourceMediaFrameReader](multisourcemediaframereader.md) start operation. A value from this enumeration is returned by the [MultiSourceMediaFrameReader.StartAsync](multisourcemediaframereader_startasync_1931900819.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.multisourcemediaframereaderstartstatus
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MultiSourceMediaFrameReaderStartStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * @type {Integer (Int32)}
     */
    static NotSupported => 1

    /**
     * @type {Integer (Int32)}
     */
    static InsufficientResources => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeviceNotAvailable => 3

    /**
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 4
}
