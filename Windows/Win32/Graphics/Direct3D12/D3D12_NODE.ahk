#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_SHADER_NODE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_NODE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NodeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_SHADER_NODE}
     */
    Shader{
        get {
            if(!this.HasProp("__Shader"))
                this.__Shader := D3D12_SHADER_NODE(this.ptr + 8)
            return this.__Shader
        }
    }
}
