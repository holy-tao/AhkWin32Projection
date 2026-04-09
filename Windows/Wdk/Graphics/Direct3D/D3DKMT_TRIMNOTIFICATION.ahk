#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_TRIMNOTIFICATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    Context {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumBytesToTrim {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
