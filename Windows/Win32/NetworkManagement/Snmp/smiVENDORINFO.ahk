#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The smiVENDORINFO structure contains information about the Microsoft WinSNMP implementation.
 * @see https://learn.microsoft.com/windows/win32/api/winsnmp/ns-winsnmp-smivendorinfo
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
class smiVENDORINFO extends Win32Struct {
    static sizeof => 196

    static packingSize => 4

    /**
     * Contains the null-terminated string "Microsoft Corporation". The string is suitable for display to end users.
     * @type {String}
     */
    vendorName {
        get => StrGet(this.ptr + 0, 63, "UTF-8")
        set => StrPut(value, this.ptr + 0, 63, "UTF-8")
    }

    /**
     * Specifies a null-terminated character string that indicates how Microsoft can be contacted for WinSNMP-related information. For example, this member can contain a postal address, a telephone number or a fax number, a URL, or an e-mail address such as "snmpinfo@microsoft.com". The string is suitable for display.
     * @type {String}
     */
    vendorContact {
        get => StrGet(this.ptr + 64, 63, "UTF-8")
        set => StrPut(value, this.ptr + 64, 63, "UTF-8")
    }

    /**
     * Specifies a null-terminated character string that identifies the version number of the WinSNMP API the Microsoft WinSNMP implementation is currently supporting. The string is suitable for display.
     * @type {String}
     */
    vendorVersionId {
        get => StrGet(this.ptr + 128, 31, "UTF-8")
        set => StrPut(value, this.ptr + 128, 31, "UTF-8")
    }

    /**
     * Specifies a null-terminated character string that indicates the release date of the version of the WinSNMP API the Microsoft WinSNMP implementation is currently supporting. The string is suitable for display.
     * @type {String}
     */
    vendorVersionDate {
        get => StrGet(this.ptr + 160, 31, "UTF-8")
        set => StrPut(value, this.ptr + 160, 31, "UTF-8")
    }

    /**
     * Contains the value 311, Microsoft's enterprise number (permanent address) assigned by the Internet Assigned Numbers Authority (IANA).
     * @type {Integer}
     */
    vendorEnterprise {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }
}
