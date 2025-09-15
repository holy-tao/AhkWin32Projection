#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The smiVENDORINFO structure contains information about the Microsoft WinSNMP implementation.
 * @see https://learn.microsoft.com/windows/win32/api/winsnmp/ns-winsnmp-smivendorinfo
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class smiVENDORINFO extends Win32Struct
{
    static sizeof => 388

    static packingSize => 4

    /**
     * Contains the null-terminated string "Microsoft Corporation". The string is suitable for display to end users.
     * @type {String}
     */
    vendorName {
        get => StrGet(this.ptr + 0, 63, "UTF-16")
        set => StrPut(value, this.ptr + 0, 63, "UTF-16")
    }

    /**
     * Specifies a null-terminated character string that indicates how Microsoft can be contacted for WinSNMP-related information. For example, this member can contain a postal address, a telephone number or a fax number, a URL, or an e-mail address such as "snmpinfo@microsoft.com". The string is suitable for display.
     * @type {String}
     */
    vendorContact {
        get => StrGet(this.ptr + 128, 63, "UTF-16")
        set => StrPut(value, this.ptr + 128, 63, "UTF-16")
    }

    /**
     * Specifies a null-terminated character string that identifies the version number of the WinSNMP API the Microsoft WinSNMP implementation is currently supporting. The string is suitable for display.
     * @type {String}
     */
    vendorVersionId {
        get => StrGet(this.ptr + 256, 31, "UTF-16")
        set => StrPut(value, this.ptr + 256, 31, "UTF-16")
    }

    /**
     * Specifies a null-terminated character string that indicates the release date of the version of the WinSNMP API the Microsoft WinSNMP implementation is currently supporting. The string is suitable for display.
     * @type {String}
     */
    vendorVersionDate {
        get => StrGet(this.ptr + 320, 31, "UTF-16")
        set => StrPut(value, this.ptr + 320, 31, "UTF-16")
    }

    /**
     * Contains the value 311, Microsoft's enterprise number (permanent address) assigned by the Internet Assigned Numbers Authority (IANA).
     * @type {Integer}
     */
    vendorEnterprise {
        get => NumGet(this, 384, "uint")
        set => NumPut("uint", value, this, 384)
    }
}
