#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WKSTA_TRANSPORT_INFO_0 structure contains information about the workstation transport protocol, such as Wide Area Network (WAN) or NetBIOS.
 * @see https://docs.microsoft.com/windows/win32/api//lmwksta/ns-lmwksta-wksta_transport_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_TRANSPORT_INFO_0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies a value that determines the search order of the transport protocol with respect to other transport protocols. The highest value is searched first.
     * @type {Integer}
     */
    wkti0_quality_of_service {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the number of clients communicating with the server using this transport protocol.
     * @type {Integer}
     */
    wkti0_number_of_vcs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the device name of the transport protocol.
     * @type {PWSTR}
     */
    wkti0_transport_name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the address of the server on this transport protocol.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    wkti0_transport_address {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * This member is ignored by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/nf-lmwksta-netwkstatransportadd">NetWkstaTransportAdd</a> function. For the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmwksta/nf-lmwksta-netwkstatransportenum">NetWkstaTransportEnum</a> function, this member indicates whether the transport protocol is a WAN transport protocol. This member is set to <b>TRUE</b> for NetBIOS/TCIP; it is set to <b>FALSE</b> for NetBEUI and NetBIOS/IPX. 
     * 
     * 
     * 
     * 
     * Certain legacy networking protocols, including NetBEUI, will no longer be supported. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinSock/network-protocol-support-in-windows">Network Protocol Support in Windows</a>.
     * @type {BOOL}
     */
    wkti0_wan_ish {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
