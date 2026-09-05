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
 */
class MFVideoRenderPrefs extends Win32Enum {

    /**
     * If this flag is set, the EVR does not draw the border color. By default, the EVR draws a border on areas of the destination rectangle that have no video. See <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-setbordercolor">IMFVideoDisplayControl::SetBorderColor</a>.
     * Native name: MFVideoRenderPrefs_DoNotRenderBorder
     * @type {Integer (Int32)}
     */
    static DoNotRenderBorder => 1

    /**
     * If this flag is set, the EVR does not clip the video when the video window straddles two monitors. By default, if the video window straddles two monitors, the EVR clips the video to the monitor that contains the largest area of video.
     * Native name: MFVideoRenderPrefs_DoNotClipToDevice
     * @type {Integer (Int32)}
     */
    static DoNotClipToDevice => 2

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Allow the EVR to limit its output to match GPU bandwidth.
     * Native name: MFVideoRenderPrefs_AllowOutputThrottling
     * @type {Integer (Int32)}
     */
    static AllowOutputThrottling => 4

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Force the EVR
     *             to limit its output to match GPU bandwidth.
     * Native name: MFVideoRenderPrefs_ForceOutputThrottling
     * @type {Integer (Int32)}
     */
    static ForceOutputThrottling => 8

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Force the EVR to batch Direct3D <b>Present</b> calls. This optimization enables the system to enter to idle states more frequently, which can reduce power consumption.
     * Native name: MFVideoRenderPrefs_ForceBatching
     * @type {Integer (Int32)}
     */
    static ForceBatching => 16

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Allow the EVR to batch Direct3D <b>Present</b> calls.
     * Native name: MFVideoRenderPrefs_AllowBatching
     * @type {Integer (Int32)}
     */
    static AllowBatching => 32

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Force the EVR to mix the video inside a rectangle that is smaller than the output rectangle. The EVR will then scale the result to the correct output size. The effective resolution will be lower if this setting is applied.
     * Native name: MFVideoRenderPrefs_ForceScaling
     * @type {Integer (Int32)}
     */
    static ForceScaling => 64

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Allow
     *             the EVR to mix the video inside a rectangle that is smaller than the output rectangle.
     * Native name: MFVideoRenderPrefs_AllowScaling
     * @type {Integer (Int32)}
     */
    static AllowScaling => 128

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * 
     * 
     * Prevent the EVR from repainting the video window after a stop command. By default, the EVR repaints the video window black after a stop command.
     * Native name: MFVideoRenderPrefs_DoNotRepaintOnStop
     * @type {Integer (Int32)}
     */
    static DoNotRepaintOnStop => 256

    /**
     * Bitmask to validate flag values. This value is not a valid flag.
     * Native name: MFVideoRenderPrefs_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 511
}
