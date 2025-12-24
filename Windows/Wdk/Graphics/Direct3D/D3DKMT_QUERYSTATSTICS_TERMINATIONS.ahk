#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATSTICS_TERMINATIONS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    TerminatedShared {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    TerminatedNonShared {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    DestroyedShared {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    DestroyedNonShared {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
