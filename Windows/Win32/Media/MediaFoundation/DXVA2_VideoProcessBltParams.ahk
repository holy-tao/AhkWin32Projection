#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\DXVA2_AYUVSample16.ahk
#Include .\DXVA2_ExtendedFormat.ahk
#Include .\DXVA2_Fixed32.ahk
#Include .\DXVA2_ProcAmpValues.ahk
#Include .\DXVA2_FilterValues.ahk

/**
 * Contains parameters for the IDirectXVideoProcessor::VideoProcessBlt method.
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ns-dxva2api-dxva2_videoprocessbltparams
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_VideoProcessBltParams extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Presentation time for the target frame, in 100-nanosecond units. If the video is interlaced, this value must be either the start time for the frame or the midpoint for the frame. If the video is progressive, this value must be the start time.
     * @type {Integer}
     */
    TargetFrame {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Specifies the target rectangle, which is the rectangle within the destination surface where the output video frame is drawn.
     *           
     * 
     * The target rectangle cannot be larger than the destination surface.
     * @type {RECT}
     */
    TargetRect{
        get {
            if(!this.HasProp("__TargetRect"))
                this.__TargetRect := RECT(this.ptr + 8)
            return this.__TargetRect
        }
    }

    /**
     * Size to which the output video should be downsampled. 
     *           If this feature is supported, the driver sets the <b>DXVA2_VideoProcess_Constriction</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_videoprocessorcaps">DXVA2_VideoProcessorCaps</a> structure.
     * 
     * The downsampling size cannot be less than zero, or larger than the size of the target rectangle (<b>TargetRect</b>).
     * @type {SIZE}
     */
    ConstrictionSize{
        get {
            if(!this.HasProp("__ConstrictionSize"))
                this.__ConstrictionSize := SIZE(this.ptr + 24)
            return this.__ConstrictionSize
        }
    }

    /**
     * Reserved. Set to zero.
     * @type {Integer}
     */
    StreamingFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_ayuvsample16">DXVA2_AYUVSample16</a> structure that specifies the background color for the destination rectangle. The background color is used wherever no video image appears, but only within the <b>TargetRect</b> rectangle. The color is specified as an AYUV color value with 16 bits per channel. 
     * 
     * The alpha channel (<b>Alpha</b>) must be opaque (0xFFFF). The DXVA driver should ignore the value of the alpha channel. 
     * 
     * The color space for the background color is given by the <b>DestFormat</b> member. Note that the background color is always specified as a YUV color, even if the destination surface is RGB.
     * @type {DXVA2_AYUVSample16}
     */
    BackgroundColor{
        get {
            if(!this.HasProp("__BackgroundColor"))
                this.__BackgroundColor := DXVA2_AYUVSample16(this.ptr + 40)
            return this.__BackgroundColor
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_extendedformat">DXVA2_ExtendedFormat</a> structure that contains extended color information for the destination rectangle. For video playback, the recommended value for the nominal range is DXVA2_NominalRange_Unknown. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ne-dxva2api-dxva2_nominalrange">DXVA2_NominalRange</a> enumeration.
     * @type {DXVA2_ExtendedFormat}
     */
    DestFormat{
        get {
            if(!this.HasProp("__DestFormat"))
                this.__DestFormat := DXVA2_ExtendedFormat(this.ptr + 48)
            return this.__DestFormat
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_procampvalues">DXVA2_ProcAmpValues</a> structure that specifies color adjustment (ProcAmp) settings. These values must fall within the ranges returned by the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideoprocessor-getprocamprange">IDirectXVideoProcessor::GetProcAmpRange</a> method.
     * @type {DXVA2_ProcAmpValues}
     */
    ProcAmpValues{
        get {
            if(!this.HasProp("__ProcAmpValues"))
                this.__ProcAmpValues := DXVA2_ProcAmpValues(this.ptr + 56)
            return this.__ProcAmpValues
        }
    }

    /**
     * Alpha value that is applied to the composited image when it is copied to the destination surface. The alpha value is fixed-point value, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_fixed32">DXVA2_Fixed32</a> structure. To specify 100% opacity, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-dxva2_fixed32opaquealpha">DXVA2_Fixed32OpaqueAlpha</a> function.
     * @type {DXVA2_Fixed32}
     */
    Alpha{
        get {
            if(!this.HasProp("__Alpha"))
                this.__Alpha := DXVA2_Fixed32(this.ptr + 72)
            return this.__Alpha
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_filtervalues">DXVA2_FilterValues</a> structure that contains parameters for the luma noise filter.
     * @type {DXVA2_FilterValues}
     */
    NoiseFilterLuma{
        get {
            if(!this.HasProp("__NoiseFilterLuma"))
                this.__NoiseFilterLuma := DXVA2_FilterValues(this.ptr + 80)
            return this.__NoiseFilterLuma
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_filtervalues">DXVA2_FilterValues</a> structure that contains parameters for the chroma noise filter.
     * @type {DXVA2_FilterValues}
     */
    NoiseFilterChroma{
        get {
            if(!this.HasProp("__NoiseFilterChroma"))
                this.__NoiseFilterChroma := DXVA2_FilterValues(this.ptr + 96)
            return this.__NoiseFilterChroma
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_filtervalues">DXVA2_FilterValues</a> structure that contains parameters for the luma detail filter.
     * @type {DXVA2_FilterValues}
     */
    DetailFilterLuma{
        get {
            if(!this.HasProp("__DetailFilterLuma"))
                this.__DetailFilterLuma := DXVA2_FilterValues(this.ptr + 112)
            return this.__DetailFilterLuma
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_filtervalues">DXVA2_FilterValues</a> structure that contains parameters for the chroma detail filter.
     * @type {DXVA2_FilterValues}
     */
    DetailFilterChroma{
        get {
            if(!this.HasProp("__DetailFilterChroma"))
                this.__DetailFilterChroma := DXVA2_FilterValues(this.ptr + 128)
            return this.__DetailFilterChroma
        }
    }

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
     * @type {Integer}
     */
    DestData {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }
}
