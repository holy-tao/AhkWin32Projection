#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMPILER_CACHE_CONST_VALUE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    pValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ValueSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
