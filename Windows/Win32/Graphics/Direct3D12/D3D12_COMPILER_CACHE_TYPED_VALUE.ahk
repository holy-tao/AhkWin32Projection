#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_COMPILER_CACHE_VALUE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMPILER_CACHE_TYPED_VALUE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_COMPILER_CACHE_VALUE}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := D3D12_COMPILER_CACHE_VALUE(8, this)
            return this.__Value
        }
    }
}
