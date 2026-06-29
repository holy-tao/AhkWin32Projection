#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_TRIM_NOTIFICATION_FLAGS.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_TRIM_NOTIFICATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    pContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {D3D12_TRIM_NOTIFICATION_FLAGS}
     */
    Flags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumBytesToTrim {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
