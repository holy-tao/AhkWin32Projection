#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_SUPPORTED_PAUSE_FUNCTIONS.ahk
#Include .\NET_IF_MEDIA_DUPLEX_STATE.ahk
#Include .\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_LINK_PARAMETERS extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {NET_IF_MEDIA_DUPLEX_STATE}
     */
    MediaDuplexState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    XmitLinkSpeed {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    RcvLinkSpeed {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {NDIS_SUPPORTED_PAUSE_FUNCTIONS}
     */
    PauseFunctions {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    AutoNegotiationFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
