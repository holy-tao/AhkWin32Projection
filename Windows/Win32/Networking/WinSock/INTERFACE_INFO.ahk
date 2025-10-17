#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKADDR.ahk
#Include .\IN_ADDR.ahk
#Include .\SOCKADDR_IN.ahk
#Include .\IN6_ADDR.ahk
#Include .\sockaddr_in6_old.ahk
#Include .\sockaddr_gen.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class INTERFACE_INFO extends Win32Struct
{
    static sizeof => 248

    static packingSize => 8

    /**
     * @type {Integer}
     */
    iiFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {sockaddr_gen}
     */
    iiAddress{
        get {
            if(!this.HasProp("__iiAddress"))
                this.__iiAddress := sockaddr_gen(8, this)
            return this.__iiAddress
        }
    }

    /**
     * @type {sockaddr_gen}
     */
    iiBroadcastAddress{
        get {
            if(!this.HasProp("__iiBroadcastAddress"))
                this.__iiBroadcastAddress := sockaddr_gen(88, this)
            return this.__iiBroadcastAddress
        }
    }

    /**
     * @type {sockaddr_gen}
     */
    iiNetmask{
        get {
            if(!this.HasProp("__iiNetmask"))
                this.__iiNetmask := sockaddr_gen(168, this)
            return this.__iiNetmask
        }
    }
}
