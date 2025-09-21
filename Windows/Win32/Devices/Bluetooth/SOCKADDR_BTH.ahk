#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SOCKADDR_BTH structure is used in conjunction with Bluetooth socket operations, defined by address family AF_BTH.
 * @remarks
 * When used with the <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-bind">bind</a> function on client applications, the <b>port</b> member must be zero to enable an appropriate local endpoint to be assigned. When used with <b>bind</b> on server applications, the <b>port</b> member must be a valid port number or BT_PORT_ANY; ports automatically assigned using BT_PORT_ANY may be queried subsequently with a call to the <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-getsockname">getsockname</a> function. The valid range for requesting a specific RFCOMM port is 1 through 30.
  * 
  * When using the <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-connect">connect</a> function when <b>serviceClassId</b> is not provided, the port should directly specify the remote port number to which a <b>connect</b> operation is requested. Using the <b>port</b> member instead of the <b>serviceClassId</b> member requires the application  to perform its own service (SDP) search before attempting the <b>connect</b> operation.
 * @see https://learn.microsoft.com/windows/win32/api/ws2bth/ns-ws2bth-sockaddr_bth
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class SOCKADDR_BTH extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Address family of the socket. This member is always AF_BTH.
     * @type {Integer}
     */
    addressFamily {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Address of the target Bluetooth device. When used with the 
     * <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-bind">bind</a> function, must be zero or a valid local radio address. If zero, a valid local Bluetooth device address is assigned when the 
     * <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-connect">connect</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-accept">accept</a> function is called. When used with the <b>connect</b> function, a valid remote radio address must be specified.
     * @type {Integer}
     */
    btAddr {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Service Class Identifier of the socket. When used with the <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-bind">bind</a> function, <i>serviceClassId</i> is ignored. Also ignored if the port is specified. For the <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-connect">connect</a> function, specifies the unique Bluetooth service class ID of the service to which it wants to connect. If the peer device has more than one port that corresponds to the service class identifier, the <b>connect</b> function attempts to connect to the first valid service; this mechanism can be used without prior SDP queries.
     * @type {Pointer<Guid>}
     */
    serviceClassId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * RFCOMM channel associated with the socket. See Remarks.
     * @type {Integer}
     */
    port {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
