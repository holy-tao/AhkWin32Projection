#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options8
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS8 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    UnalignedBlockTexturesSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
