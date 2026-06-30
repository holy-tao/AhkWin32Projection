#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_REGISTER_TRIM_NOTIFICATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<D3D12_PFN_TRIM_NOTIFICATION_CALLBACK>}
     */
    pfnCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    pContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    CallbackCookie {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
