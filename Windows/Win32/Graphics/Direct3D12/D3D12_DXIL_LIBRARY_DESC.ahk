#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_SHADER_BYTECODE.ahk

/**
 * Describes a DXIL library state subobject that can be included in a state object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dxil_library_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DXIL_LIBRARY_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The library to include in the state object.  Must have been compiled with library target 6.3 or higher.  It is fine to specify the same library multiple times either in the same state object / collection or across multiple, as long as the names exported each time don’t conflict in a given state object.
     * @type {D3D12_SHADER_BYTECODE}
     */
    DXILLibrary{
        get {
            if(!this.HasProp("__DXILLibrary"))
                this.__DXILLibrary := D3D12_SHADER_BYTECODE(0, this)
            return this.__DXILLibrary
        }
    }

    /**
     * The size of <i>pExports</i> array.  If 0, everything gets exported from the library.
     * @type {Integer}
     */
    NumExports {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<D3D12_EXPORT_DESC>}
     */
    pExports {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
