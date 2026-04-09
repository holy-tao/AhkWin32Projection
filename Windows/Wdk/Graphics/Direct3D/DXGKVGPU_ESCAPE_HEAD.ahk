#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXGKVGPU_ESCAPE_TYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKVGPU_ESCAPE_HEAD extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Luid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {DXGKVGPU_ESCAPE_TYPE}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
