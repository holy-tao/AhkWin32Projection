#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWM_SOURCE_FRAME_SAMPLING.ahk" { DWM_SOURCE_FRAME_SAMPLING }
#Import ".\UNSIGNED_RATIO.ahk" { UNSIGNED_RATIO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies Desktop Window Manager (DWM) video frame parameters for frame composition. Used by the DwmSetPresentParameters function.
 * @remarks
 * The <b>rateSource</b> member is expressed as a ratio so that content (like that using NTSC standards, which has a rate of 60000/1001) can be accurately expressed. DWM determines how long to display each frame by resampling between the source rate and the composition rate in use each time the desktop is composed.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ns-dwmapi-dwm_present_parameters
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct DWM_PRESENT_PARAMETERS {
    #StructPack 8

    /**
     * The size of the <b>DWM_PRESENT_PARAMETERS</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * <b>TRUE</b> if the caller is requesting queued presents; otherwise, <b>FALSE</b>. If <b>TRUE</b>, the remaining parameters must be specified. If <b>FALSE</b>, queued presentation is disabled for this window and present behavior returns to the default behavior.
     */
    fQueue : BOOL

    /**
     * A <b>ULONGLONG</b> value that provides the refresh number that the next presented frame should begin to display.
     */
    cRefreshStart : Int64

    /**
     * The number of frames the application is instructing DWM to queue. The valid range is 2-8.
     */
    cBuffer : UInt32

    /**
     * <b>TRUE</b> if the application wants DWM to schedule presentation based on source rate. <b>FALSE</b> if the application will decide how many refreshes to display for each frame. If <b>TRUE</b>, <b>rateSource</b> must be specified. If <b>FALSE</b>, <b>cRefreshesPerFrame</b> must be specified.
     */
    fUseSourceRate : BOOL

    /**
     * The rate, in frames per second, of the source material being displayed.
     */
    rateSource : UNSIGNED_RATIO

    /**
     * The number of monitor refreshes through which each frame should be displayed on the screen.
     */
    cRefreshesPerFrame : UInt32

    /**
     * The frame sampling type to use for composition.
     */
    eSampling : DWM_SOURCE_FRAME_SAMPLING

}
