#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D_ROOT_SIGNATURE_VERSION.ahk" { D3D_ROOT_SIGNATURE_VERSION }

/**
 * Indicates root signature version support.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_root_signature
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_ROOT_SIGNATURE {
    #StructPack 4

    /**
     * On input, specifies the highest version <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d_root_signature_version">D3D_ROOT_SIGNATURE_VERSION</a> to check for. On output specifies the highest version, up to the input version specified, actually available.
     */
    HighestVersion : D3D_ROOT_SIGNATURE_VERSION

}
