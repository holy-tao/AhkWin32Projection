#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Associates a subobject defined directly in a state object with shader exports.
 * @remarks
 * 
  * Depending on the flags specified in the optional <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_state_object_config">D3D12_STATE_OBJECT_CONFIG</a> subobject for opting into cross linkage, the exports being associated don’t necessarily have to be present in the current state object, or one that has been seen yet, to be resolved later, on raytracing pipeline state object (RTPSO) creation for example.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_subobject_to_exports_association
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SUBOBJECT_TO_EXPORTS_ASSOCIATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to the subobject in current state object to define an association to.
     * @type {Pointer<D3D12_STATE_SUBOBJECT>}
     */
    pSubobjectToAssociate {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size of the <i>pExports</i> array.  If 0, this is being explicitly defined as a default association.  Another way to define a default association is to omit this subobject association for that subobject completely.
     * @type {Integer}
     */
    NumExports {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The array of exports with which the subobject is associated.
     * @type {Pointer<Char>}
     */
    pExports {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
