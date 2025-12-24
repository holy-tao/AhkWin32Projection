#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_ADAPTER_VERIFIER_OPTION_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<D3DKMT_ADAPTER_VERIFIER_VIDMM_FLAGS>}
     */
    VidMmFlags {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<D3DKMT_ADAPTER_VERIFIER_VIDMM_TRIM_INTERVAL>}
     */
    VidMmTrimInterval {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
