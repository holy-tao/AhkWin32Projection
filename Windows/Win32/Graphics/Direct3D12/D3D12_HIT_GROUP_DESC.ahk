#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a raytracing hit group state subobject that can be included in a state object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_hit_group_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_HIT_GROUP_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The name of the hit group.
     * @type {Pointer<PWSTR>}
     */
    HitGroupExport {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_hit_group_type">D3D12_HIT_GROUP_TYPE</a> enumeration specifying the type of the hit group.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Optional name of the any-hit shader associated with the hit group. This field can be used with all hit group types.
     * @type {Pointer<PWSTR>}
     */
    AnyHitShaderImport {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Optional name of the closest-hit shader associated with the hit group. This field can be used with all hit group types.
     * @type {Pointer<PWSTR>}
     */
    ClosestHitShaderImport {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Optional name of the intersection shader associated with the hit group.  This field can only be used with hit groups of type procedural primitive.
     * @type {Pointer<PWSTR>}
     */
    IntersectionShaderImport {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
