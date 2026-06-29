#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The smiVENDORINFO structure contains information about the Microsoft WinSNMP implementation.
 * @see https://learn.microsoft.com/windows/win32/api/winsnmp/ns-winsnmp-smivendorinfo
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct smiVENDORINFO {
    #StructPack 4

    /**
     * Contains the null-terminated string "Microsoft Corporation". The string is suitable for display to end users.
     */
    vendorName : CHAR[64]

    /**
     * Specifies a null-terminated character string that indicates how Microsoft can be contacted for WinSNMP-related information. For example, this member can contain a postal address, a telephone number or a fax number, a URL, or an e-mail address such as "snmpinfo@microsoft.com". The string is suitable for display.
     */
    vendorContact : CHAR[64]

    /**
     * Specifies a null-terminated character string that identifies the version number of the WinSNMP API the Microsoft WinSNMP implementation is currently supporting. The string is suitable for display.
     */
    vendorVersionId : CHAR[32]

    /**
     * Specifies a null-terminated character string that indicates the release date of the version of the WinSNMP API the Microsoft WinSNMP implementation is currently supporting. The string is suitable for display.
     */
    vendorVersionDate : CHAR[32]

    /**
     * Contains the value 311, Microsoft's enterprise number (permanent address) assigned by the Internet Assigned Numbers Authority (IANA).
     */
    vendorEnterprise : UInt32

}
