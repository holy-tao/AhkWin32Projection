#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_MIRACAST_DISPLAY_DEVICE_STATE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MIRACAST_DISPLAY_DEVICE_STATUS extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {D3DKMT_MIRACAST_DISPLAY_DEVICE_STATE}
     */
    State {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
