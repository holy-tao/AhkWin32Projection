#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the video mode of operation for a video device.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamvideocontrol">IAMVideoControl</a> interface uses this enumerated data type.
 * 
 * Multiple capture buffers are queued to a capture driver and are filled at a fixed rate once the stream is put into the "run" state. If the VideoControlFlag_ExternalTriggerEnable flag is set, a filled buffer is not passed up from the WDM capture driver for compression, display, or writing to a file until the external event happens.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-videocontrolflags
 * @namespace Windows.Win32.Media.DirectShow
 */
class VideoControlFlags extends Win32Enum {

    /**
     * Specifies that the picture is flipped horizontally.
     * Native name: VideoControlFlag_FlipHorizontal
     * @type {Integer (Int32)}
     */
    static Flag_FlipHorizontal => 1

    /**
     * Specifies that the picture is flipped vertically.
     * Native name: VideoControlFlag_FlipVertical
     * @type {Integer (Int32)}
     */
    static Flag_FlipVertical => 2

    /**
     * Sets up a stream to capture a trigger from an external source, for example, a push button on a camera. Buffers can be queued to the driver but will not be passed up from the WDM capture driver (for compression, display, or writing to a file) until the external event happens. See Remarks.
     * Native name: VideoControlFlag_ExternalTriggerEnable
     * @type {Integer (Int32)}
     */
    static Flag_ExternalTriggerEnable => 4

    /**
     * In software, simulates an external trigger when the stream has the VideoControlFlag_ExternalTriggerEnable flag set.
     * Native name: VideoControlFlag_Trigger
     * @type {Integer (Int32)}
     */
    static Flag_Trigger => 8
}
