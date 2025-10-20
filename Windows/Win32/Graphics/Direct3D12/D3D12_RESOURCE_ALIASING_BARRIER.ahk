#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the transition between usages of two different resources that have mappings into the same heap.
 * @remarks
 * 
  * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_barrier">D3D12_RESOURCE_BARRIER</a> structure.
  *       
  * 
  * Both the before and the after resources can be specified or one or both resources can be <b>NULL</b>, which indicates that any placed or reserved resource could cause aliasing.
  *       
  * 
  * Refer to the usage models described in <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createplacedresource">CreatePlacedResource</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_resource_aliasing_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RESOURCE_ALIASING_BARRIER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> object that represents the before resource used in the transition.
     * @type {ID3D12Resource}
     */
    pResourceBefore {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> object that represents the after resource used in the transition.
     * @type {ID3D12Resource}
     */
    pResourceAfter {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
