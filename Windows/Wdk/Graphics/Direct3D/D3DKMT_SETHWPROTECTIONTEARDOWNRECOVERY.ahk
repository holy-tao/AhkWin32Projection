#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOL.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_SETHWPROTECTIONTEARDOWNRECOVERY extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    hAdapter {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    Recovered {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
