#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DATE_TIME.ahk" { DATE_TIME }
#Import ".\QuarantineStatus.ahk" { QuarantineStatus }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DHCP_HOST_INFO.ahk" { DHCP_HOST_INFO }
#Import ".\DHCP_BINARY_DATA.ahk" { DHCP_BINARY_DATA }

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV4_FAILOVER_CLIENT_INFO_EX {
    #StructPack 8

    ClientIpAddress : UInt32

    SubnetMask : UInt32

    ClientHardwareAddress : DHCP_BINARY_DATA

    ClientName : PWSTR

    ClientComment : PWSTR

    ClientLeaseExpires : DATE_TIME

    OwnerHost : DHCP_HOST_INFO

    bClientType : Int8

    AddressState : Int8

    Status : QuarantineStatus

    ProbationEnds : DATE_TIME

    QuarantineCapable : BOOL

    SentPotExpTime : UInt32

    AckPotExpTime : UInt32

    RecvPotExpTime : UInt32

    StartTime : UInt32

    CltLastTransTime : UInt32

    LastBndUpdTime : UInt32

    BndMsgStatus : UInt32

    PolicyName : PWSTR

    Flags : Int8

    AddressStateEx : UInt32

}
