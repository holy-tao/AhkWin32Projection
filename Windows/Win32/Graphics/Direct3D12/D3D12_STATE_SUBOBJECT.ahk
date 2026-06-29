#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_STATE_SUBOBJECT_TYPE.ahk" { D3D12_STATE_SUBOBJECT_TYPE }

/**
 * Represents a subobject within a state object description. Use with [D3D12_STATE_OBJECT_DESC](/windows/win32/api/d3d12/ns-d3d12-d3d12_state_object_desc).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_state_subobject
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_STATE_SUBOBJECT {
    #StructPack 8

    /**
     * A [D3D12_STATE_SUBOBJECT_TYPE](/windows/win32/api/d3d12/ne-d3d12-d3d12_state_subobject_type) specifying the type of the state subobject.
     */
    Type : D3D12_STATE_SUBOBJECT_TYPE

    /**
     * Pointer to state object description of the type specified in the *Type* parameter.
     */
    pDesc : IntPtr

}
