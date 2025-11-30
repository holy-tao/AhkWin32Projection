#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATSTICS_ALLOCATIONS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    Created {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    Destroyed {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    Opened {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    Closed {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    MigratedSuccess {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    MigratedFail {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    MigratedAbandoned {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
