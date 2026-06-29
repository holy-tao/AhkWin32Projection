#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA2_Fixed32.ahk" { DXVA2_Fixed32 }
#Import ".\DXVA2_ExtendedFormat.ahk" { DXVA2_ExtendedFormat }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import ".\DXVA2_AYUVSample8.ahk" { DXVA2_AYUVSample8 }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Specifies an input sample for the IDirectXVideoProcessor::VideoProcessBlt method.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_videosample
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_VideoSample {
    #StructPack 8

    /**
     * Start time of the sample, in 100-nanosecond units. For video substream samples, the value is zero.
     */
    Start : Int64

    /**
     * End time of the sample, in 100-nanosecond units. For video substream samples, the value is zero.
     */
    End : Int64

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_extendedformat">DXVA2_ExtendedFormat</a> structure that describes the interlacing and extended color information for the sample.
     */
    SampleFormat : DXVA2_ExtendedFormat

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface of the Direct3D surface that contains the sample.
     */
    SrcSurface : IDirect3DSurface9

    /**
     * Source rectangle. The source rectangle defines which portion of the input sample is copied to the destination surface. The source rectangle is specified using pixel coordinates on the input surface.
     */
    SrcRect : RECT

    /**
     * Destination rectangle. The destination rectangle defines the portion of the destination surface where the source rectangle is copied. The destination rectangle is specified using pixel coordinates on the destination surface.
     */
    DstRect : RECT

    /**
     * If the input sample is for a substream and uses a palettized YUV color format, this member contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_ayuvsample8">DXVA2_AYUVSample8</a> structures that define the palette entries. For non-palettized pixel formats, the array elements should all be zero.
     */
    Pal : DXVA2_AYUVSample8[16]

    /**
     * Alpha value that will be applied to this input sample when it is composited.
     */
    PlanarAlpha : DXVA2_Fixed32

    /**
     * Contains additional flags. The following flags are defined.
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA2_SampleData_RFF"></a><a id="dxva2_sampledata_rff"></a><a id="DXVA2_SAMPLEDATA_RFF"></a><dl>
     * <dt><b>DXVA2_SampleData_RFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Repeat first field (RFF) bit.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA2_SampleData_TFF"></a><a id="dxva2_sampledata_tff"></a><a id="DXVA2_SAMPLEDATA_TFF"></a><dl>
     * <dt><b>DXVA2_SampleData_TFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Top field first (TFF) bit.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA2_SampleData_RFF_TFF_Present"></a><a id="dxva2_sampledata_rff_tff_present"></a><a id="DXVA2_SAMPLEDATA_RFF_TFF_PRESENT"></a><dl>
     * <dt><b>DXVA2_SampleData_RFF_TFF_Present</b></dt>
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
     * These flags provide a hint to the deinterlacer when it performs inverse telecine.
     */
    SampleData : UInt32

}
