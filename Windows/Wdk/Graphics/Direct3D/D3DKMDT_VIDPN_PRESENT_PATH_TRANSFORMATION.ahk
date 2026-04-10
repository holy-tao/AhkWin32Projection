#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMDT_VIDPN_PRESENT_PATH_SCALING.ahk
#Include .\D3DKMDT_VIDPN_PRESENT_PATH_ROTATION.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_VIDPN_PRESENT_PATH_TRANSFORMATION extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {D3DKMDT_VIDPN_PRESENT_PATH_SCALING}
     */
    Scaling {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    ScalingSupport {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {D3DKMDT_VIDPN_PRESENT_PATH_ROTATION}
     */
    Rotation {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    RotationSupport {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
