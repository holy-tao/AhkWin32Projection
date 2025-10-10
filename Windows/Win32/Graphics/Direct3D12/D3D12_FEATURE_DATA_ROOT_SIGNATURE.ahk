#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates root signature version support.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_root_signature
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_ROOT_SIGNATURE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * On input, specifies the highest version <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d_root_signature_version">D3D_ROOT_SIGNATURE_VERSION</a> to check for. On output specifies the highest version, up to the input version specified, actually available.
     * @type {Integer}
     */
    HighestVersion {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
