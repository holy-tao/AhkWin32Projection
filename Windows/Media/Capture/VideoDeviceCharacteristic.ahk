#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates which video streams are independent of each other.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.videodevicecharacteristic
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class VideoDeviceCharacteristic extends Win32Enum{

    /**
     * All streams are independent.
     * @type {Integer (Int32)}
     */
    static AllStreamsIndependent => 0

    /**
     * Preview video streams are identical.
     * @type {Integer (Int32)}
     */
    static PreviewRecordStreamsIdentical => 1

    /**
     * Preview photo streams are identical
     * @type {Integer (Int32)}
     */
    static PreviewPhotoStreamsIdentical => 2

    /**
     * Video and photo streams are identical
     * @type {Integer (Int32)}
     */
    static RecordPhotoStreamsIdentical => 3

    /**
     * All streams are identical
     * @type {Integer (Int32)}
     */
    static AllStreamsIdentical => 4
}
