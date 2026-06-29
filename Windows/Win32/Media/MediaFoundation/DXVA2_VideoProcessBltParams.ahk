#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA2_FilterValues.ahk" { DXVA2_FilterValues }
#Import ".\DXVA2_AYUVSample16.ahk" { DXVA2_AYUVSample16 }
#Import ".\DXVA2_Fixed32.ahk" { DXVA2_Fixed32 }
#Import ".\DXVA2_ExtendedFormat.ahk" { DXVA2_ExtendedFormat }
#Import ".\DXVA2_ProcAmpValues.ahk" { DXVA2_ProcAmpValues }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains parameters for the IDirectXVideoProcessor::VideoProcessBlt method.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_videoprocessbltparams
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_VideoProcessBltParams {
    #StructPack 8

    /**
     * Presentation time for the target frame, in 100-nanosecond units. If the video is interlaced, this value must be either the start time for the frame or the midpoint for the frame. If the video is progressive, this value must be the start time.
     */
    TargetFrame : Int64

    /**
     * Specifies the target rectangle, which is the rectangle within the destination surface where the output video frame is drawn.
     *           
     * 
     * The target rectangle cannot be larger than the destination surface.
     */
    TargetRect : RECT

    /**
     * Size to which the output video should be downsampled. 
     *           If this feature is supported, the driver sets the <b>DXVA2_VideoProcess_Constriction</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videoprocessorcaps">DXVA2_VideoProcessorCaps</a> structure.
     * 
     * The downsampling size cannot be less than zero, or larger than the size of the target rectangle (<b>TargetRect</b>).
     */
    ConstrictionSize : SIZE

    /**
     * Reserved. Set to zero.
     */
    StreamingFlags : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_ayuvsample16">DXVA2_AYUVSample16</a> structure that specifies the background color for the destination rectangle. The background color is used wherever no video image appears, but only within the <b>TargetRect</b> rectangle. The color is specified as an AYUV color value with 16 bits per channel. 
     * 
     * The alpha channel (<b>Alpha</b>) must be opaque (0xFFFF). The DXVA driver should ignore the value of the alpha channel. 
     * 
     * The color space for the background color is given by the <b>DestFormat</b> member. Note that the background color is always specified as a YUV color, even if the destination surface is RGB.
     */
    BackgroundColor : DXVA2_AYUVSample16

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_extendedformat">DXVA2_ExtendedFormat</a> structure that contains extended color information for the destination rectangle. For video playback, the recommended value for the nominal range is DXVA2_NominalRange_Unknown. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ne-dxva2api-dxva2_nominalrange">DXVA2_NominalRange</a> enumeration.
     */
    DestFormat : DXVA2_ExtendedFormat

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_procampvalues">DXVA2_ProcAmpValues</a> structure that specifies color adjustment (ProcAmp) settings. These values must fall within the ranges returned by the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getprocamprange">IDirectXVideoProcessor::GetProcAmpRange</a> method.
     */
    ProcAmpValues : DXVA2_ProcAmpValues

    /**
     * Alpha value that is applied to the composited image when it is copied to the destination surface. The alpha value is fixed-point value, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_fixed32">DXVA2_Fixed32</a> structure. To specify 100% opacity, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-dxva2_fixed32opaquealpha">DXVA2_Fixed32OpaqueAlpha</a> function.
     */
    Alpha : DXVA2_Fixed32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_filtervalues">DXVA2_FilterValues</a> structure that contains parameters for the luma noise filter.
     */
    NoiseFilterLuma : DXVA2_FilterValues

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_filtervalues">DXVA2_FilterValues</a> structure that contains parameters for the chroma noise filter.
     */
    NoiseFilterChroma : DXVA2_FilterValues

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_filtervalues">DXVA2_FilterValues</a> structure that contains parameters for the luma detail filter.
     */
    DetailFilterLuma : DXVA2_FilterValues

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_filtervalues">DXVA2_FilterValues</a> structure that contains parameters for the chroma detail filter.
     */
    DetailFilterChroma : DXVA2_FilterValues

    /**
     * Contains additional flags. The following flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA2_DestData_RFF"></a><a id="dxva2_destdata_rff"></a><a id="DXVA2_DESTDATA_RFF"></a><dl>
     * <dt><b>DXVA2_DestData_RFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Repeat first field (RFF) bit.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA2_DestData_TFF"></a><a id="dxva2_destdata_tff"></a><a id="DXVA2_DESTDATA_TFF"></a><dl>
     * <dt><b>DXVA2_DestData_TFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Top field first (TFF) bit.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA2_DestData_RFF_TFF_Present"></a><a id="dxva2_destdata_rff_tff_present"></a><a id="DXVA2_DESTDATA_RFF_TFF_PRESENT"></a><dl>
     * <dt><b>DXVA2_DestData_RFF_TFF_Present</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the RFF and TFF flags are used.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Currently, these flags are ignored. They are intended for use with interlaced output, which is not supported at this time.
     */
    DestData : UInt32

}
