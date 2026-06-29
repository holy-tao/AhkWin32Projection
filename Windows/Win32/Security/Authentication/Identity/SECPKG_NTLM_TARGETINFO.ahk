#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_NTLM_TARGETINFO {
    #StructPack 8

    Flags : UInt32

    MsvAvNbComputerName : PWSTR

    MsvAvNbDomainName : PWSTR

    MsvAvDnsComputerName : PWSTR

    MsvAvDnsDomainName : PWSTR

    MsvAvDnsTreeName : PWSTR

    MsvAvFlags : UInt32

    MsvAvTimestamp : FILETIME

    MsvAvTargetName : PWSTR

}
