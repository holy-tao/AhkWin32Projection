#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AMVABUFFERINFO structure specifies a buffer for the IAMVideoAccelerator::Execute method.
 * @see https://learn.microsoft.com/windows/win32/api/amva/ns-amva-amvabufferinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMVABUFFERINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type of buffer. The following buffer types are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_ALPHA_BLEND_COMBINATION_BUFFER"></a><a id="dxva_alpha_blend_combination_buffer"></a><dl>
     * <dt><b>DXVA_ALPHA_BLEND_COMBINATION_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Alpha blend combination buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_AYUV_BUFFER"></a><a id="dxva_ayuv_buffer"></a><dl>
     * <dt><b>DXVA_AYUV_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AYUV alpha blending sample buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_BITSTREAM_DATA_BUFFER"></a><a id="dxva_bitstream_data_buffer"></a><dl>
     * <dt><b>DXVA_BITSTREAM_DATA_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Raw bitstream data buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_DCCMD_SURFACE_BUFFER"></a><a id="dxva_dccmd_surface_buffer"></a><dl>
     * <dt><b>DXVA_DCCMD_SURFACE_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display control command (DCCMD) data buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_DEBLOCKING_CONTROL_BUFFER"></a><a id="dxva_deblocking_control_buffer"></a><dl>
     * <dt><b>DXVA_DEBLOCKING_CONTROL_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deblocking Filter control command buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_DPXD_SURFACE_BUFFER"></a><a id="dxva_dpxd_surface_buffer"></a><dl>
     * <dt><b>DXVA_DPXD_SURFACE_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Decoded PXD (DPXD) alpha blending surface buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_HIGHLIGHT_BUFFER"></a><a id="dxva_highlight_buffer"></a><dl>
     * <dt><b>DXVA_HIGHLIGHT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Highlight data buffers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_IA44_SURFACE_BUFFER"></a><a id="dxva_ia44_surface_buffer"></a><dl>
     * <dt><b>DXVA_IA44_SURFACE_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IA44 alpha blending sample buffer. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_INVERSE_QUANTIZATION_MATRIX_BUFFER"></a><a id="dxva_inverse_quantization_matrix_buffer"></a><dl>
     * <dt><b>DXVA_INVERSE_QUANTIZATION_MATRIX_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Inverse quantization matrix buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_MACROBLOCK_CONTROL_BUFFER"></a><a id="dxva_macroblock_control_buffer"></a><dl>
     * <dt><b>DXVA_MACROBLOCK_CONTROL_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Macroblock control command buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_PICTURE_DECODE_BUFFER"></a><a id="dxva_picture_decode_buffer"></a><dl>
     * <dt><b>DXVA_PICTURE_DECODE_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Picture parameters buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_PICTURE_RESAMPLE_BUFFER"></a><a id="dxva_picture_resample_buffer"></a><dl>
     * <dt><b>DXVA_PICTURE_RESAMPLE_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Alpha blend combination buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_READ_BACK_BUFFER"></a><a id="dxva_read_back_buffer"></a><dl>
     * <dt><b>DXVA_READ_BACK_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Read-back command buffers containing commands to read macroblocks of the resulting picture back to the host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_RESIDUAL_DIFFERENCE_BUFFER"></a><a id="dxva_residual_difference_buffer"></a><dl>
     * <dt><b>DXVA_RESIDUAL_DIFFERENCE_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Residual difference block data buffer. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA_SLICE_CONTROL_BUFFER"></a><a id="dxva_slice_control_buffer"></a><dl>
     * <dt><b>DXVA_SLICE_CONTROL_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Slice control buffer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For complete descriptions of these buffer types, refer to the DirectX Video Acceleration 1.0 specification.
     * @type {Integer}
     */
    dwTypeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Buffer index.
     * @type {Integer}
     */
    dwBufferIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The offset of the relevant data from the beginning of the buffer.
     * @type {Integer}
     */
    dwDataOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size of the relevant data in the buffer, in bytes.
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
