#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Graphics\Gdi\HPALETTE.ahk" { HPALETTE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The CAPSTATUS structure defines the current state of the capture window.
 * @remarks
 * Because the state of a capture window changes in response to various messages, an application should update the information in this structure whenever it needs to enable menu items, determine the actual state of the capture window, or call the video format dialog box. If the application yields during streaming capture, this structure returns the progress of the capture in the <b>dwCurrentVideoFrame</b>, <b>dwCurrentVideoFramesDropped</b>, <b>dwCurrentWaveSamples</b>, and <b>dwCurrentTimeElapsedMS</b> members. Use the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/wm-cap-get-status">WM_CAP_GET_STATUS</a> message or <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-capgetstatus">capGetStatus</a> macro to update the contents of this structure.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-capstatus
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct CAPSTATUS {
    #StructPack 8

    /**
     * Image width, in pixels.
     */
    uiImageWidth : UInt32

    /**
     * Image height, in pixels
     */
    uiImageHeight : UInt32

    /**
     * Live window flag. The value of this member is <b>TRUE</b> if the window is displaying video using the preview method.
     */
    fLiveWindow : BOOL

    /**
     * Overlay window flag. The value of this member is <b>TRUE</b> if the window is displaying video using hardware overlay.
     */
    fOverlayWindow : BOOL

    /**
     * Input scaling flag. The value of this member is <b>TRUE</b> if the window is scaling the input video to the client area when displaying video using preview. This parameter has no effect when displaying video using overlay.
     */
    fScale : BOOL

    /**
     * The x- and y-offset of the pixel displayed in the upper left corner of the client area of the window.
     */
    ptScroll : POINT

    /**
     * Default palette flag. The value of this member is <b>TRUE</b> if the capture driver is using its default palette.
     */
    fUsingDefaultPalette : BOOL

    /**
     * Audio hardware flag. The value of this member is <b>TRUE</b> if the system has waveform-audio hardware installed.
     */
    fAudioHardware : BOOL

    /**
     * Capture file flag. The value of this member is <b>TRUE</b> if a valid capture file has been generated.
     */
    fCapFileExists : BOOL

    /**
     * Number of frames processed during the current (or most recent) streaming capture. This count includes dropped frames.
     */
    dwCurrentVideoFrame : UInt32

    /**
     * Number of frames dropped during the current (or most recent) streaming capture. Dropped frames occur when the capture rate exceeds the rate at which frames can be saved to file. In this case, the capture driver has no buffers available for storing data. Dropping frames does not affect synchronization because the previous frame is displayed in place of the dropped frame.
     */
    dwCurrentVideoFramesDropped : UInt32

    /**
     * Number of waveform-audio samples processed during the current (or most recent) streaming capture.
     */
    dwCurrentWaveSamples : UInt32

    /**
     * Time, in milliseconds, since the start of the current (or most recent) streaming capture.
     */
    dwCurrentTimeElapsedMS : UInt32

    /**
     * Handle to current palette.
     */
    hPalCurrent : HPALETTE

    /**
     * Capturing flag. The value of this member is <b>TRUE</b> when capturing is in progress.
     */
    fCapturingNow : BOOL

    /**
     * Error return values. Use this member if your application does not support an error callback function.
     */
    dwReturn : UInt32

    /**
     * Number of video buffers allocated. This value might be less than the number specified in the <b>wNumVideoRequested</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-captureparms">CAPTUREPARMS</a> structure.
     */
    wNumVideoAllocated : UInt32

    /**
     * Number of audio buffers allocated. This value might be less than the number specified in the <b>wNumAudioRequested</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-captureparms">CAPTUREPARMS</a> structure.
     */
    wNumAudioAllocated : UInt32

}
