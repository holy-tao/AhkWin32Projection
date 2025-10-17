#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_OBJECT_HEADER.ahk
#Include .\NDIS_PORT_CHARACTERISTICS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_PORT extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Pointer<NDIS_PORT>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    NdisReserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    MiniportReserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    ProtocolReserved {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {NDIS_PORT_CHARACTERISTICS}
     */
    PortCharacteristics{
        get {
            if(!this.HasProp("__PortCharacteristics"))
                this.__PortCharacteristics := NDIS_PORT_CHARACTERISTICS(32, this)
            return this.__PortCharacteristics
        }
    }
}
