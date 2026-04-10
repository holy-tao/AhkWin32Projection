#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDDI_DRIVERESCAPETYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_DRIVERESCAPE_TRANSLATERESOURCEHANDLE extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {D3DDDI_DRIVERESCAPETYPE}
     */
    EscapeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    hResource {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
