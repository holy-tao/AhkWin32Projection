#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BARRIER_SUBRESOURCE_RANGE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    IndexOrFirstMipLevel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumMipLevels {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    FirstArraySlice {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumArraySlices {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    FirstPlane {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NumPlanes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
