#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a group of barriers of a given type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_barrier_group
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BARRIER_GROUP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The type of barriers in the group.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of barriers in the group.
     * @type {Integer}
     */
    NumBarriers {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<D3D12_GLOBAL_BARRIER>}
     */
    pGlobalBarriers {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_TEXTURE_BARRIER>}
     */
    pTextureBarriers {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_BUFFER_BARRIER>}
     */
    pBufferBarriers {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
