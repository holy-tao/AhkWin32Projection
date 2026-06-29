#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Wraps an array of render target formats.
 * @remarks
 * This structure is primarily intended to be used when creating pipeline state stream descriptions that contain multiple contiguous render target format descriptions.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_rt_format_array
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RT_FORMAT_ARRAY {
    #StructPack 4

    /**
     * Specifies a fixed-size array of DXGI_FORMAT values that define the format of up to 8 render targets.
     */
    RTFormats : DXGI_FORMAT[8]

    /**
     * Specifies the number of render target formats stored in the array.
     */
    NumRenderTargets : UInt32

}
