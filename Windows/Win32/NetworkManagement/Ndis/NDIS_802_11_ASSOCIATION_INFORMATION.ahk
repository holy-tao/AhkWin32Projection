#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_AI_REQFI.ahk
#Include .\NDIS_802_11_AI_RESFI.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_ASSOCIATION_INFORMATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AvailableRequestFixedIEs {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {NDIS_802_11_AI_REQFI}
     */
    RequestFixedIEs{
        get {
            if(!this.HasProp("__RequestFixedIEs"))
                this.__RequestFixedIEs := NDIS_802_11_AI_REQFI(6, this)
            return this.__RequestFixedIEs
        }
    }

    /**
     * @type {Integer}
     */
    RequestIELength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    OffsetRequestIEs {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    AvailableResponseFixedIEs {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {NDIS_802_11_AI_RESFI}
     */
    ResponseFixedIEs{
        get {
            if(!this.HasProp("__ResponseFixedIEs"))
                this.__ResponseFixedIEs := NDIS_802_11_AI_RESFI(26, this)
            return this.__ResponseFixedIEs
        }
    }

    /**
     * @type {Integer}
     */
    ResponseIELength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    OffsetResponseIEs {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
