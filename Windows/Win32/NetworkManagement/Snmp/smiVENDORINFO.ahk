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
    static sizeof => 196

    static packingSize => 4

    /**
     * Contains the null-terminated string "Microsoft Corporation". The string is suitable for display to end users.
     * @type {Array<SByte>}
     */
    vendorName{
        get {
            if(!this.HasProp("__vendorNameProxyArray"))
                this.__vendorNameProxyArray := Win32FixedArray(this.ptr + 0, 64, Primitive, "char")
            return this.__vendorNameProxyArray
        }
    }

    /**
     * Specifies a null-terminated character string that indicates how Microsoft can be contacted for WinSNMP-related information. For example, this member can contain a postal address, a telephone number or a fax number, a URL, or an e-mail address such as "snmpinfo@microsoft.com". The string is suitable for display.
     * @type {Array<SByte>}
     */
    vendorContact{
        get {
            if(!this.HasProp("__vendorContactProxyArray"))
                this.__vendorContactProxyArray := Win32FixedArray(this.ptr + 64, 64, Primitive, "char")
            return this.__vendorContactProxyArray
        }
    }

    /**
     * Specifies a null-terminated character string that identifies the version number of the WinSNMP API the Microsoft WinSNMP implementation is currently supporting. The string is suitable for display.
     * @type {Array<SByte>}
     */
    vendorVersionId{
        get {
            if(!this.HasProp("__vendorVersionIdProxyArray"))
                this.__vendorVersionIdProxyArray := Win32FixedArray(this.ptr + 128, 32, Primitive, "char")
            return this.__vendorVersionIdProxyArray
        }
    }

    /**
     * Specifies a null-terminated character string that indicates the release date of the version of the WinSNMP API the Microsoft WinSNMP implementation is currently supporting. The string is suitable for display.
     * @type {Array<SByte>}
     */
    vendorVersionDate{
        get {
            if(!this.HasProp("__vendorVersionDateProxyArray"))
                this.__vendorVersionDateProxyArray := Win32FixedArray(this.ptr + 160, 32, Primitive, "char")
            return this.__vendorVersionDateProxyArray
        }
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
