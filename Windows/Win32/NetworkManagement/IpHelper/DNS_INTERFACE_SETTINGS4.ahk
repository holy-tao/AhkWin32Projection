#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_SERVER_PROPERTY.ahk" { DNS_SERVER_PROPERTY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct DNS_INTERFACE_SETTINGS4 {
    #StructPack 8

    Version : UInt32

    Flags : Int64

    Domain : PWSTR

    NameServer : PWSTR

    SearchList : PWSTR

    RegistrationEnabled : UInt32

    RegisterAdapterName : UInt32

    EnableLLMNR : UInt32

    QueryAdapterName : UInt32

    ProfileNameServer : PWSTR

    DisableUnconstrainedQueries : UInt32

    SupplementalSearchList : PWSTR

    cServerProperties : UInt32

    ServerProperties : DNS_SERVER_PROPERTY.Ptr

    cProfileServerProperties : UInt32

    ProfileServerProperties : DNS_SERVER_PROPERTY.Ptr

    EncryptedDnsAdapterFlags : UInt32

}
