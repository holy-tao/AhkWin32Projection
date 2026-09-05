#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that are used to configure how the enhanced video renderer (EVR) performs deinterlacing.
 * @remarks
 * To set these flags, call the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideomixercontrol2-setmixingprefs">IMFVideoMixerControl2::SetMixingPrefs</a> method.
 * 
 * These flags control some trade-offs between video quality and rendering speed. The constants named "MFVideoMixPrefs_Allow..." enable lower-quality settings, but only when the quality manager requests a drop in quality.  The constants named "MFVideoMixPrefs_Force..." force the EVR to use lower-quality settings regardless of  what the quality manager requests. (For more information about the quality manager, see <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfqualityadvise">IMFQualityAdvise</a>.)
 * 
 * Currently two lower-quality modes are supported, as described in the following table. Either is preferable to dropping an entire frame.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Mode</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="Half_interface"></a><a id="half_interface"></a><a id="HALF_INTERFACE"></a>Half interface
 * 
 * </td>
 * <td width="60%">
 * The EVR's video mixer skips the second field (relative to temporal order) of each interlaced frame. The video mixer still deinterlaces the first field, and this operation typically interpolates data from the second field. The overall frame rate is unaffected.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="Bob_deinterlacing"></a><a id="bob_deinterlacing"></a><a id="BOB_DEINTERLACING"></a>Bob deinterlacing
 * 
 * </td>
 * <td width="60%">
 * The video mixer uses bob deinterlacing, even if the driver supports  a higher-quality deinterlacing algorithm.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/evr/ne-evr-mfvideomixprefs
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVideoMixPrefs extends Win32Enum {

    /**
     * Force the EVR  to skip the second field (in temporal order) of every interlaced frame.
     * Native name: MFVideoMixPrefs_ForceHalfInterlace
     * @type {Integer (Int32)}
     */
    static ForceHalfInterlace => 1

    /**
     * If the EVR is falling behind, allow it to skip the second field (in temporal order) of every interlaced frame.
     * Native name: MFVideoMixPrefs_AllowDropToHalfInterlace
     * @type {Integer (Int32)}
     */
    static AllowDropToHalfInterlace => 2

    /**
     * If the EVR is falling behind, allow it to use bob deinterlacing, even if the driver supports a higher-quality deinterlacing mode.
     * Native name: MFVideoMixPrefs_AllowDropToBob
     * @type {Integer (Int32)}
     */
    static AllowDropToBob => 4

    /**
     * Force the EVR to use bob deinterlacing, even if the driver supports a higher-quality mode.
     * Native name: MFVideoMixPrefs_ForceBob
     * @type {Integer (Int32)}
     */
    static ForceBob => 8

    /**
     * Native name: MFVideoMixPrefs_EnableRotation
     * @type {Integer (Int32)}
     */
    static EnableRotation => 16

    /**
     * The bitmask of valid flag values. This constant is not itself a valid flag.
     * Native name: MFVideoMixPrefs_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 31
}
