#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OFFLOAD_OPERATION_E.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class OFFLOAD_SECURITY_ASSOCIATION extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {OFFLOAD_OPERATION_E}
     */
    Operation {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SPI {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    IntegrityAlgo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    ConfAlgo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
