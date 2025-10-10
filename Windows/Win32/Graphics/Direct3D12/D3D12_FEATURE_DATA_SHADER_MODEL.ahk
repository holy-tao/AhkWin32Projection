#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the supported shader model.
 * @remarks
 * 
  * Refer to  the enumeration constant D3D12_FEATURE_SHADER_MODEL in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a> enumeration.
  *       
  * 
  * When used with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport">ID3D12Device::CheckFeatureSupport</a> function, before calling the function initialize the <b>HighestShaderModel</b> field to the highest shader model that your  application understands.  After the function completes successfully, the <b>HighestShaderModel</b> field contains the highest shader model that is both supported by the device and no higher than the shader model passed in.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_shader_model
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_SHADER_MODEL extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies one member of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d_shader_model">D3D_SHADER_MODEL</a> that indicates the maximum supported shader model.
     * @type {Integer}
     */
    HighestShaderModel {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
