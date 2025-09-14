#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The sockaddr structure varies depending on the protocol selected. (sockaddr)
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-sockaddr
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 2

    /**
     * 
     * @type {Integer}
     */
    sa_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * 
     * @type {Array<SByte>}
     */
    sa_data{
        get {
            if(!this.HasProp("__sa_dataProxyArray"))
                this.__sa_dataProxyArray := Win32FixedArray(this.ptr + 2, 14, Primitive, "char")
            return this.__sa_dataProxyArray
        }
    }
}
