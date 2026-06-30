#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SOCKET_SECURITY_PROTOCOL.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class SOCKET_SECURITY_QUERY_INFO_IPSEC2 extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {SOCKET_SECURITY_PROTOCOL}
     */
    SecurityProtocol {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PeerApplicationAccessTokenHandle {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    PeerMachineAccessTokenHandle {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MmSaId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    QmSaId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    NegotiationWinerr {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Guid}
     */
    SaLookupContext {
        get {
            if(!this.HasProp("__SaLookupContext"))
                this.__SaLookupContext := Guid(44, this)
            return this.__SaLookupContext
        }
    }
}
