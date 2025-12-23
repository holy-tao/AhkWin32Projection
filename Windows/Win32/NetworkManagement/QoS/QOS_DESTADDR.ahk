#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk

/**
 * The QOS object QOS_DESTADDR is used during a call to the WSAIoctl (SIO_SET_QOS) function in order to avoid issuing a connect function call for a sending socket.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-qos_destaddr
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_DESTADDR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The QOS object 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos/ns-qos-qos_object_hdr">QOS_OBJECT_HDR</a>. The object type for this QOS object should be 
     * <b>QOS_DESTADDR</b>.
     * @type {QOS_OBJECT_HDR}
     */
    ObjectHdr{
        get {
            if(!this.HasProp("__ObjectHdr"))
                this.__ObjectHdr := QOS_OBJECT_HDR(0, this)
            return this.__ObjectHdr
        }
    }

    /**
     * Address of the destination socket.
     * @type {Pointer<SOCKADDR>}
     */
    SocketAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Length of the <b>SocketAddress</b> structure.
     * @type {Integer}
     */
    SocketAddressLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
