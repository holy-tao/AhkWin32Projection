#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_STATE_SUBOBJECT.ahk" { D3D12_STATE_SUBOBJECT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Associates a subobject defined directly in a state object with shader exports.
 * @remarks
 * Depending on the flags specified in the optional <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_state_object_config">D3D12_STATE_OBJECT_CONFIG</a> subobject for opting into cross linkage, the exports being associated don’t necessarily have to be present in the current state object, or one that has been seen yet, to be resolved later, on raytracing pipeline state object (RTPSO) creation for example.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subobject_to_exports_association
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SUBOBJECT_TO_EXPORTS_ASSOCIATION {
    #StructPack 8

    /**
     * Pointer to the subobject in current state object to define an association to.
     */
    pSubobjectToAssociate : D3D12_STATE_SUBOBJECT.Ptr

    /**
     * Size of the <i>pExports</i> array.  If 0, this is being explicitly defined as a default association.  Another way to define a default association is to omit this subobject association for that subobject completely.
     */
    NumExports : UInt32

    /**
     * The array of exports with which the subobject is associated.
     */
    pExports : PWSTR.Ptr

}
