#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The WKSTA_TRANSPORT_INFO_0 structure contains information about the workstation transport protocol, such as Wide Area Network (WAN) or NetBIOS.
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/ns-lmwksta-wksta_transport_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct WKSTA_TRANSPORT_INFO_0 {
    #StructPack 8

    /**
     * Specifies a value that determines the search order of the transport protocol with respect to other transport protocols. The highest value is searched first.
     */
    wkti0_quality_of_service : UInt32

    /**
     * Specifies the number of clients communicating with the server using this transport protocol.
     */
    wkti0_number_of_vcs : UInt32

    /**
     * Specifies the device name of the transport protocol.
     */
    wkti0_transport_name : PWSTR

    /**
     * Specifies the address of the server on this transport protocol.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    wkti0_transport_address : PWSTR

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
     */
    wkti0_wan_ish : BOOL

}
