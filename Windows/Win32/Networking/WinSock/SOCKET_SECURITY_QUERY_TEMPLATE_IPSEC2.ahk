#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKADDR_STORAGE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKET_SECURITY_QUERY_TEMPLATE_IPSEC2 extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SecurityProtocol {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {SOCKADDR_STORAGE}
     */
    PeerAddress{
        get {
            if(!this.HasProp("__PeerAddress"))
                this.__PeerAddress := SOCKADDR_STORAGE(this.ptr + 8)
            return this.__PeerAddress
        }
    }

    /**
     * @type {Integer}
     */
    PeerTokenAccessMask {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * @type {Integer}
     */
    FieldMask {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }
}
