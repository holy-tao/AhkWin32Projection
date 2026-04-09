#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_DEVICE_ERROR_REASON.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MARKDEVICEASERROR extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    hDevice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3DKMT_DEVICE_ERROR_REASON}
     */
    Reason {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
