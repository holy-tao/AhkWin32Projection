#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a subobject within a state object description. Use with [D3D12_STATE_OBJECT_DESC](/windows/win32/api/d3d12/ns-d3d12-d3d12_state_object_desc).
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_state_subobject
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_STATE_SUBOBJECT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A [D3D12_STATE_SUBOBJECT_TYPE](/windows/win32/api/d3d12/ne-d3d12-d3d12_state_subobject_type) specifying the type of the state subobject.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Pointer to state object description of the type specified in the *Type* parameter.
     * @type {Pointer<Void>}
     */
    pDesc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
