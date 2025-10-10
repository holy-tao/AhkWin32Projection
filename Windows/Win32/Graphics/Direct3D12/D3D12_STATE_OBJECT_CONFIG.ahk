#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines general properties of a state object.
 * @remarks
 * 
  * The presence of this subobject in a state object is optional.  If present, all exports in the state object must be associated with the same subobject (or one with a matching definition).  This consistency requirement does not apply across existing collections that are included in a larger state object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_state_object_config
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_STATE_OBJECT_CONFIG extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_state_object_flags">D3D12_STATE_OBJECT_FLAGS</a> flags enumeration that specifies the requirements for the state object.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
