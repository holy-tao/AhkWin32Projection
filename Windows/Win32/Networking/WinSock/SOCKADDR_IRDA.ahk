#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SOCKADDR_IRDA structure is used in conjunction with IrDA socket operations, defined by address family AF_IRDA.
 * @remarks
 * Client applications make use of each field in the 
  * <b>SOCKADDR_IRDA</b> structure. The <b>irdaDeviceID</b> member is obtained by a previous discovery operation performed by making a 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockopt">getsockopt</a>(IRLMP_ENUMDEVICES) function call. For more information on performing a discovery operation, see the Notes for IrDA Sockets section in the Remarks section of 
  * <b>getsockopt</b>.
  * 
  * The <b>irdaServiceName</b> member is filled with the well-known value that the server application specified in its 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-bind">bind</a> function call.
 * @see https://learn.microsoft.com/windows/win32/api/af_irda/ns-af_irda-sockaddr_irda
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_IRDA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 2

    /**
     * Address family. This member is always AF_IRDA.
     * @type {Integer}
     */
    irdaAddressFamily {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Device identifier (ID) of the IrDA device to which the client wants to issue the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-connect">connect</a> function call. Ignored by server applications.
     * @type {Array<Byte>}
     */
    irdaDeviceID{
        get {
            if(!this.HasProp("__irdaDeviceIDProxyArray"))
                this.__irdaDeviceIDProxyArray := Win32FixedArray(this.ptr + 2, 4, Primitive, "char")
            return this.__irdaDeviceIDProxyArray
        }
    }

    /**
     * Well-known service name associated with a server application. Specified by servers during their 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-bind">bind</a> function call.
     * @type {String}
     */
    irdaServiceName {
        get => StrGet(this.ptr + 6, 24, "UTF-16")
        set => StrPut(value, this.ptr + 6, 24, "UTF-16")
    }
}
