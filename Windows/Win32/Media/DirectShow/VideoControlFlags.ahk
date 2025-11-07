#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the video mode of operation for a video device.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamvideocontrol">IAMVideoControl</a> interface uses this enumerated data type.
 * 
 * Multiple capture buffers are queued to a capture driver and are filled at a fixed rate once the stream is put into the "run" state. If the VideoControlFlag_ExternalTriggerEnable flag is set, a filled buffer is not passed up from the WDM capture driver for compression, display, or writing to a file until the external event happens.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-videocontrolflags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VideoControlFlags{

    /**
     * Specifies that the picture is flipped horizontally.
     * @type {Integer (Int32)}
     */
    static VideoControlFlag_FlipHorizontal => 1

    /**
     * Specifies that the picture is flipped vertically.
     * @type {Integer (Int32)}
     */
    static VideoControlFlag_FlipVertical => 2

    /**
     * Sets up a stream to capture a trigger from an external source, for example, a push button on a camera. Buffers can be queued to the driver but will not be passed up from the WDM capture driver (for compression, display, or writing to a file) until the external event happens. See Remarks.
     * @type {Integer (Int32)}
     */
    static VideoControlFlag_ExternalTriggerEnable => 4

    /**
     * In software, simulates an external trigger when the stream has the VideoControlFlag_ExternalTriggerEnable flag set.
     * @type {Integer (Int32)}
     */
    static VideoControlFlag_Trigger => 8
}
