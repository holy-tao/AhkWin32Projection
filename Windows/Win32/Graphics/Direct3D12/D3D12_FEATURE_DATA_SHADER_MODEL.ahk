#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the supported shader model.
 * @remarks
 * Refer to the enumeration constant *D3D12_FEATURE_SHADER_MODEL* in the [D3D12_FEATURE](/windows/win32/api/d3d12/ne-d3d12-d3d12_feature).
  * 
  * When used with the [ID3D12Device::CheckFeatureSupport](/windows/win32/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport) function, before calling the function initialize the *HighestShaderModel* field to the highest shader model that your application understands. After the function completes successfully, the *HighestShaderModel* field contains the highest shader model that is both supported by the device and no higher than the shader model passed in.
  * 
  * > [!NOTE]
  * > **ID3D12Device::CheckFeatureSupport** returns **E_INVALIDARG** if *HighestShaderModel* isn't known by the current runtime. For that reason, we recommend that you call this in a loop with decreasing shader models to determine the highest supported shader model. Alternatively, use the caps checking helper to simplify this; see the blog post [Introducing a New API for Checking Feature Support in Direct3D 12](https://devblogs.microsoft.com/directx/introducing-a-new-api-for-checking-feature-support-in-direct3d-12/).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_shader_model
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_SHADER_MODEL extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies one member of [D3D_SHADER_MODEL](/windows/win32/api/d3d12/ne-d3d12-d3d_shader_model) that indicates the maximum supported shader model.
     * @type {Integer}
     */
    HighestShaderModel {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
