#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR.ahk
#Include .\SOCKADDR_IN.ahk
#Include .\IN6_ADDR.ahk
#Include .\SCOPE_ID.ahk
#Include .\SOCKADDR_IN6.ahk
#Include .\SOCKADDR_INET.ahk

/**
 * Used to store received ICMP error information.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2ipdef/ns-ws2ipdef-icmp_error_info
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ICMP_ERROR_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: **[SOCKADDR_INET](./ns-ws2ipdef-sockaddr_inet.md)**
     * 
     * The source IP address of the ICMP error.
     * @type {SOCKADDR_INET}
     */
    srcaddress{
        get {
            if(!this.HasProp("__srcaddress"))
                this.__srcaddress := SOCKADDR_INET(0, this)
            return this.__srcaddress
        }
    }

    /**
     * Type: **IPPROTO**
     * 
     * The protocol of the ICMP error (either **IPPROTO_ICMP** or **IPPROTO_ICMPV6**).
     * @type {Integer}
     */
    protocol {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Type: **[UINT8](/windows/win32/winprog/windows-data-types)**
     * 
     * The ICMP error type.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 68, "char")
        set => NumPut("char", value, this, 68)
    }

    /**
     * Type: **[UINT8](/windows/win32/winprog/windows-data-types)**
     * 
     * The ICMP error code.
     * @type {Integer}
     */
    code {
        get => NumGet(this, 69, "char")
        set => NumPut("char", value, this, 69)
    }
}
