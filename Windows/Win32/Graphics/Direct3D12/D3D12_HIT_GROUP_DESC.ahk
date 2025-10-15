#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Describes a raytracing hit group state subobject that can be included in a state object.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_hit_group_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_HIT_GROUP_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The name of the hit group.
     * @type {PWSTR}
     */
    HitGroupExport{
        get {
            if(!this.HasProp("__HitGroupExport"))
                this.__HitGroupExport := PWSTR(this.ptr + 0)
            return this.__HitGroupExport
        }
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
     * @type {PWSTR}
     */
    AnyHitShaderImport{
        get {
            if(!this.HasProp("__AnyHitShaderImport"))
                this.__AnyHitShaderImport := PWSTR(this.ptr + 16)
            return this.__AnyHitShaderImport
        }
    }

    /**
     * Optional name of the closest-hit shader associated with the hit group. This field can be used with all hit group types.
     * @type {PWSTR}
     */
    ClosestHitShaderImport{
        get {
            if(!this.HasProp("__ClosestHitShaderImport"))
                this.__ClosestHitShaderImport := PWSTR(this.ptr + 24)
            return this.__ClosestHitShaderImport
        }
    }

    /**
     * Optional name of the intersection shader associated with the hit group.  This field can only be used with hit groups of type procedural primitive.
     * @type {PWSTR}
     */
    IntersectionShaderImport{
        get {
            if(!this.HasProp("__IntersectionShaderImport"))
                this.__IntersectionShaderImport := PWSTR(this.ptr + 32)
            return this.__IntersectionShaderImport
        }
    }
}
