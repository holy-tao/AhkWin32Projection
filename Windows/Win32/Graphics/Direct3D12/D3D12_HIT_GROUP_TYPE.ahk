#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a raytracing hit group state subobject. Use a value from this enumeration with the D3D12_HIT_GROUP_DESC structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_hit_group_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_HIT_GROUP_TYPE{

    /**
     * The hit group uses a list of triangles to calculate ray hits. Hit groups that use triangles can’t contain an intersection shader.
     * @type {Integer (Int32)}
     */
    static D3D12_HIT_GROUP_TYPE_TRIANGLES => 0

    /**
     * The hit group uses a procedural primitive within a bounding box to calculate ray hits. Hit groups that use procedural primitives must contain an intersection shader.
     * @type {Integer (Int32)}
     */
    static D3D12_HIT_GROUP_TYPE_PROCEDURAL_PRIMITIVE => 1
}
