#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk
#Include ..\..\System\SystemServices\DMA_WIDTH.ahk
#Include ..\..\System\SystemServices\DMA_SPEED.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_DMA_DESCRIPTION extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {BOOLEAN}
     */
    DemandMode {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    AutoInitialize {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {BOOLEAN}
     */
    DmaChannelSpecified {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {DMA_WIDTH}
     */
    DmaWidth {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {DMA_SPEED}
     */
    DmaSpeed {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DmaPort {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    DmaChannel {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
