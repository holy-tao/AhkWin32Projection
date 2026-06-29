#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOL.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_ISBADDRIVERFORHWPROTECTIONDISABLED extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    Disabled {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
