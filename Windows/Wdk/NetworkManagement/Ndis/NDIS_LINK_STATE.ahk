#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\NetworkManagement\Ndis\NET_IF_MEDIA_CONNECT_STATE.ahk
#Include ..\..\..\Win32\NetworkManagement\Ndis\NET_IF_MEDIA_DUPLEX_STATE.ahk
#Include .\NDIS_SUPPORTED_PAUSE_FUNCTIONS.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_LINK_STATE extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {NET_IF_MEDIA_CONNECT_STATE}
     */
    MediaConnectState {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {NET_IF_MEDIA_DUPLEX_STATE}
     */
    MediaDuplexState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    XmitLinkSpeed {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    RcvLinkSpeed {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {NDIS_SUPPORTED_PAUSE_FUNCTIONS}
     */
    PauseFunctions {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    AutoNegotiationFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
