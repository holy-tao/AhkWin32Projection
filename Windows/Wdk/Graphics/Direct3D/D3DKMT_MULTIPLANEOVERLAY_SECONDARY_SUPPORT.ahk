#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOL.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MULTIPLANEOVERLAY_SECONDARY_SUPPORT extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    Supported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
