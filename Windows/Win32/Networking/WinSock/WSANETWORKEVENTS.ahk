#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WSANETWORKEVENTS structure is used to store a socket's internal information about network events.
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsanetworkevents
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSANETWORKEVENTS extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * Indicates which of the FD_XXX network events have occurred.
     * @type {Integer}
     */
    lNetworkEvents {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Array that contains any associated error codes, with an array index that corresponds to the position of event bits in <b>lNetworkEvents</b>. The identifiers FD_READ_BIT, FD_WRITE_BIT and others can be used to index the <b>iErrorCode</b> array.
     * @type {Array<Int32>}
     */
    iErrorCode{
        get {
            if(!this.HasProp("__iErrorCodeProxyArray"))
                this.__iErrorCodeProxyArray := Win32FixedArray(this.ptr + 4, 10, Primitive, "int")
            return this.__iErrorCodeProxyArray
        }
    }
}
