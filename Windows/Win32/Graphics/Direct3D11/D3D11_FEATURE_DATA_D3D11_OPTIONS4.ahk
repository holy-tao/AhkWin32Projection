#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes Direct3D 11.4 feature options in the current graphics driver.
 * @remarks
 * Use this structure with the D3D11_FEATURE_D3D11_OPTIONS4 member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE</a>. 
  * 
  * Refer to the section on NV12 in <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-4-features">Direct3D 11.4 Features</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/ns-d3d11_4-d3d11_feature_data_d3d11_options4
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_D3D11_OPTIONS4 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a BOOL that determines if NV12 textures can be shared across processes and D3D devices.
     * @type {Integer}
     */
    ExtendedNV12SharedTextureSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
