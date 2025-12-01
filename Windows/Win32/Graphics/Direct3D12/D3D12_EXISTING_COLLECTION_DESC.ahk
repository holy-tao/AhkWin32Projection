#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A state subobject describing an existing collection that can be included in a state object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_existing_collection_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_EXISTING_COLLECTION_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The collection to include in a state object.   The enclosing state object holds a reference to the existing collection.
     * @type {ID3D12StateObject}
     */
    pExistingCollection {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size of the <i>pExports</i> array.  If 0, all of the collection’s exports get exported.
     * @type {Integer}
     */
    NumExports {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Pointer<D3D12_EXPORT_DESC>}
     */
    pExports {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
