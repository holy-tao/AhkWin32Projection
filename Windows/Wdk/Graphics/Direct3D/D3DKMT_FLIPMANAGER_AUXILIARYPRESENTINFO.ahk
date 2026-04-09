#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_FLIPMODEL_INDEPENDENT_FLIP_STAGE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_FLIPMANAGER_AUXILIARYPRESENTINFO extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    auxiliaryPresentInfo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    flipManagerTracingId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    customDurationChanged {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Pointer}
     */
    FlipAdapterLuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    VidPnSourceId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {D3DKMT_FLIPMODEL_INDEPENDENT_FLIP_STAGE}
     */
    independentFlipStage {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    FlipCompletedQpc {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    HwPresentDurationQpc {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {BOOL}
     */
    WasCanceled {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {BOOL}
     */
    ConvertedToNonIFlip {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
