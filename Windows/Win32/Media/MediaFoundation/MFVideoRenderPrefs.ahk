#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that define how the enhanced video renderer (EVR) displays the video.
 * @remarks
 * To set these flags, call <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-setrenderingprefs">IMFVideoDisplayControl::SetRenderingPrefs</a>.
 * 
 * The flags named "MFVideoRenderPrefs_Allow..." cause the EVR to use lower-quality settings only when requested by the quality manager. (For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfqualityadvise">IMFQualityAdvise</a>.) The flags named "MFVideoRenderPrefs_Force..." cause the video mixer to use lower-quality settings regardless of the quality manager.
 * @see https://learn.microsoft.com/windows/win32/api/evr/ne-evr-mfvideorenderprefs
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoRenderPrefs extends Win32Enum{

    /**
     * If this flag is set, the EVR does not draw the border color. By default, the EVR draws a border on areas of the destination rectangle that have no video. See <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-setbordercolor">IMFVideoDisplayControl::SetBorderColor</a>.
     * @type {Integer (Int32)}
     */
    static MFVideoRenderPrefs_DoNotRenderBorder => 1

    /**
     * If this flag is set, the EVR does not clip the video when the video window straddles two monitors. By default, if the video window straddles two monitors, the EVR clips the video to the monitor that contains the largest area of video.
     * @type {Integer (Int32)}
     */
    static MFVideoRenderPrefs_DoNotClipToDevice => 2

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Allow the EVR to limit its output to match GPU bandwidth.
     * @type {Integer (Int32)}
     */
    static MFVideoRenderPrefs_AllowOutputThrottling => 4

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Force the EVR
     *             to limit its output to match GPU bandwidth.
     * @type {Integer (Int32)}
     */
    static MFVideoRenderPrefs_ForceOutputThrottling => 8

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Force the EVR to batch Direct3D <b>Present</b> calls. This optimization enables the system to enter to idle states more frequently, which can reduce power consumption.
     * @type {Integer (Int32)}
     */
    static MFVideoRenderPrefs_ForceBatching => 16

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Allow the EVR to batch Direct3D <b>Present</b> calls.
     * @type {Integer (Int32)}
     */
    static MFVideoRenderPrefs_AllowBatching => 32

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Force the EVR to mix the video inside a rectangle that is smaller than the output rectangle. The EVR will then scale the result to the correct output size. The effective resolution will be lower if this setting is applied.
     * @type {Integer (Int32)}
     */
    static MFVideoRenderPrefs_ForceScaling => 64

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Allow
     *             the EVR to mix the video inside a rectangle that is smaller than the output rectangle.
     * @type {Integer (Int32)}
     */
    static MFVideoRenderPrefs_AllowScaling => 128

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Prevent the EVR from repainting the video window after a stop command. By default, the EVR repaints the video window black after a stop command.
     * @type {Integer (Int32)}
     */
    static MFVideoRenderPrefs_DoNotRepaintOnStop => 256

    /**
     * Bitmask to validate flag values. This value is not a valid flag.
     * @type {Integer (Int32)}
     */
    static MFVideoRenderPrefs_Mask => 511
}
