#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the dimensions of a mip region.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_mip_region
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_MIP_REGION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The width of the mip region.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height of the mip region.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The depth of the mip region.
     * @type {Integer}
     */
    Depth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
