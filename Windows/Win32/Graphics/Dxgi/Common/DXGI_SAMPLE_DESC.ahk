#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes multi-sampling parameters for a resource.
 * @remarks
 * 
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> structure.
 * 
 * The default sampler mode, with no anti-aliasing, has a count of 1 and a quality level of 0.
 * 
 * If multi-sample antialiasing is being used, all bound render targets and depth buffers must have the same sample counts and quality levels.
 * 
 * <table>
 * <tr>
 * <td>
 * Differences between Direct3D 10.0 and Direct3D 10.1 and between Direct3D 10.0 and Direct3D 11:
 * 
 * Direct3D 10.1 has defined two standard quality levels:  
 *             <b>D3D10_STANDARD_MULTISAMPLE_PATTERN</b> and <b>D3D10_CENTER_MULTISAMPLE_PATTERN</b> in the <b>D3D10_STANDARD_MULTISAMPLE_QUALITY_LEVELS</b> enumeration in D3D10_1.h.
 * 
 * Direct3D 11 has defined two standard quality levels:  
 *             <b>D3D11_STANDARD_MULTISAMPLE_PATTERN</b> and <b>D3D11_CENTER_MULTISAMPLE_PATTERN</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_standard_multisample_quality_levels">D3D11_STANDARD_MULTISAMPLE_QUALITY_LEVELS</a> enumeration in D3D11.h.
 * 
 * </td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgicommon/ns-dxgicommon-dxgi_sample_desc
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_SAMPLE_DESC extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of multisamples per pixel.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The image quality level. The higher the quality, the lower the performance. The valid range is between zero and one less than the level returned 
     *         by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-checkmultisamplequalitylevels">ID3D10Device::CheckMultisampleQualityLevels</a> for Direct3D 10 or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkmultisamplequalitylevels">ID3D11Device::CheckMultisampleQualityLevels</a> for Direct3D 11.
     * 
     * For Direct3D 10.1 and Direct3D 11, you can use two special quality level values. For more information about these quality level values, see Remarks.
     * @type {Integer}
     */
    Quality {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
