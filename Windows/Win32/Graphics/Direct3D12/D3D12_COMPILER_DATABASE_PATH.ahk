#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\D3D12_COMPILER_VALUE_TYPE_FLAGS.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_COMPILER_DATABASE_PATH extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {D3D12_COMPILER_VALUE_TYPE_FLAGS}
     */
    Types {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pPath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
