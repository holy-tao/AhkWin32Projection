#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AFPROTOCOLS structure supplies a list of protocols to which application programmers can constrain queries. The AFPROTOCOLS structure is used for query purposes only.
 * @remarks
 * 
  * The members of the 
  * <b>AFPROTOCOLS</b> structure are a functional pair, and only have meaning when used together, as protocol values have meaning only within the context of an address family.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsock2/ns-winsock2-afprotocols
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class AFPROTOCOLS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Address family to which the query is to be constrained.
     * @type {Integer}
     */
    iAddressFamily {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Protocol to which the query is to be constrained.
     * @type {Integer}
     */
    iProtocol {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
