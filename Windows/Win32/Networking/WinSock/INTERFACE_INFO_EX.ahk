#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKET_ADDRESS.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class INTERFACE_INFO_EX extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    iiFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {SOCKET_ADDRESS}
     */
    iiAddress{
        get {
            if(!this.HasProp("__iiAddress"))
                this.__iiAddress := SOCKET_ADDRESS(this.ptr + 8)
            return this.__iiAddress
        }
    }

    /**
     * @type {SOCKET_ADDRESS}
     */
    iiBroadcastAddress{
        get {
            if(!this.HasProp("__iiBroadcastAddress"))
                this.__iiBroadcastAddress := SOCKET_ADDRESS(this.ptr + 24)
            return this.__iiBroadcastAddress
        }
    }

    /**
     * @type {SOCKET_ADDRESS}
     */
    iiNetmask{
        get {
            if(!this.HasProp("__iiNetmask"))
                this.__iiNetmask := SOCKET_ADDRESS(this.ptr + 40)
            return this.__iiNetmask
        }
    }
}
