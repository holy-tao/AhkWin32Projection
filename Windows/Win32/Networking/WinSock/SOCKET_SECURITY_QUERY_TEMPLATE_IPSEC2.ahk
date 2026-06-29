#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKET_SECURITY_PROTOCOL.ahk
#Include .\ADDRESS_FAMILY.ahk
#Include .\SOCKADDR_STORAGE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class SOCKET_SECURITY_QUERY_TEMPLATE_IPSEC2 extends Win32Struct {
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {SOCKET_SECURITY_PROTOCOL}
     */
    SecurityProtocol {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {SOCKADDR_STORAGE}
     */
    PeerAddress {
        get {
            if(!this.HasProp("__PeerAddress"))
                this.__PeerAddress := SOCKADDR_STORAGE(8, this)
            return this.__PeerAddress
        }
    }

    /**
     * @type {Integer}
     */
    PeerTokenAccessMask {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {Integer}
     */
    FieldMask {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }
}
