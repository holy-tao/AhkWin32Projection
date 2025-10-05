#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates whether or not unaligned block-compressed textures are supported.
 * @remarks
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
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not unaligned block-compressed textures are supported.
     * 
     * If `false`, then Direct3D 12 requires that the dimensions of the top-level mip of a block-compressed texture are aligned to multiples of 4 (such alignment requirements do not apply to less-detailed mips). If `true`, then no such alignment requirement applies to any mip level of a block-compressed texture.
     * @type {Integer}
     */
    UnalignedBlockTexturesSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
