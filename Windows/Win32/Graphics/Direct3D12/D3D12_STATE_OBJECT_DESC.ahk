#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Description of a state object. Pass this structure into ID3D12Device::CreateStateObject.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_state_object_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_STATE_OBJECT_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The type of the state object.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Size of the <i>pSubobjects</i> array.
     * @type {Integer}
     */
    NumSubobjects {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of subobject definitions.
     * @type {Pointer<D3D12_STATE_SUBOBJECT>}
     */
    pSubobjects {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
