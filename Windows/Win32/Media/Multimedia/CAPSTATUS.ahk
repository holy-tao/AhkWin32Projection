#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * The CAPSTATUS structure defines the current state of the capture window.
 * @remarks
 * 
  * Because the state of a capture window changes in response to various messages, an application should update the information in this structure whenever it needs to enable menu items, determine the actual state of the capture window, or call the video format dialog box. If the application yields during streaming capture, this structure returns the progress of the capture in the <b>dwCurrentVideoFrame</b>, <b>dwCurrentVideoFramesDropped</b>, dwCurre<b></b>ntWaveSamples, and <b>dwCurrentTimeElapsedMS</b> members. Use the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/wm-cap-get-status">WM_CAP_GET_STATUS</a> message or <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-capgetstatus">capGetStatus</a> macro to update the contents of this structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-capstatus
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class CAPSTATUS extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Image width, in pixels.
     * @type {Integer}
     */
    uiImageWidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Image height, in pixels
     * @type {Integer}
     */
    uiImageHeight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Live window flag. The value of this member is <b>TRUE</b> if the window is displaying video using the preview method.
     * @type {Integer}
     */
    fLiveWindow {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Overlay window flag. The value of this member is <b>TRUE</b> if the window is displaying video using hardware overlay.
     * @type {Integer}
     */
    fOverlayWindow {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Input scaling flag. The value of this member is <b>TRUE</b> if the window is scaling the input video to the client area when displaying video using preview. This parameter has no effect when displaying video using overlay.
     * @type {Integer}
     */
    fScale {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The x- and y-offset of the pixel displayed in the upper left corner of the client area of the window.
     * @type {POINT}
     */
    ptScroll{
        get {
            if(!this.HasProp("__ptScroll"))
                this.__ptScroll := POINT(this.ptr + 24)
            return this.__ptScroll
        }
    }

    /**
     * Default palette flag. The value of this member is <b>TRUE</b> if the capture driver is using its default palette.
     * @type {Integer}
     */
    fUsingDefaultPalette {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Audio hardware flag. The value of this member is <b>TRUE</b> if the system has waveform-audio hardware installed.
     * @type {Integer}
     */
    fAudioHardware {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Capture file flag. The value of this member is <b>TRUE</b> if a valid capture file has been generated.
     * @type {Integer}
     */
    fCapFileExists {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Number of frames processed during the current (or most recent) streaming capture. This count includes dropped frames.
     * @type {Integer}
     */
    dwCurrentVideoFrame {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Number of frames dropped during the current (or most recent) streaming capture. Dropped frames occur when the capture rate exceeds the rate at which frames can be saved to file. In this case, the capture driver has no buffers available for storing data. Dropping frames does not affect synchronization because the previous frame is displayed in place of the dropped frame.
     * @type {Integer}
     */
    dwCurrentVideoFramesDropped {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Number of waveform-audio samples processed during the current (or most recent) streaming capture.
     * @type {Integer}
     */
    dwCurrentWaveSamples {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Time, in milliseconds, since the start of the current (or most recent) streaming capture.
     * @type {Integer}
     */
    dwCurrentTimeElapsedMS {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Handle to current palette.
     * @type {Pointer<Void>}
     */
    hPalCurrent {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Capturing flag. The value of this member is <b>TRUE</b> when capturing is in progress.
     * @type {Integer}
     */
    fCapturingNow {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * Error return values. Use this member if your application does not support an error callback function.
     * @type {Integer}
     */
    dwReturn {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Number of video buffers allocated. This value might be less than the number specified in the <b>wNumVideoRequested</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-captureparms">CAPTUREPARMS</a> structure.
     * @type {Integer}
     */
    wNumVideoAllocated {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Number of audio buffers allocated. This value might be less than the number specified in the <b>wNumAudioRequested</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-captureparms">CAPTUREPARMS</a> structure.
     * @type {Integer}
     */
    wNumAudioAllocated {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }
}
