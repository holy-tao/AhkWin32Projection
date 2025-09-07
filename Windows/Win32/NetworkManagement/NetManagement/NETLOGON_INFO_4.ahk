#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Defines a level-4 control query response from a domain controller.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-netlogon_info_4
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NETLOGON_INFO_4 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A marshaled pointer to a string that contains the trusted domain controller name.
     * @type {PWSTR}
     */
    netlog4_trusted_dc_name{
        get {
            if(!this.HasProp("__netlog4_trusted_dc_name"))
                this.__netlog4_trusted_dc_name := PWSTR(this.ptr + 0)
            return this.__netlog4_trusted_dc_name
        }
    }

    /**
     * A marshaled pointer to a string that contains the trusted domain name.
     * @type {PWSTR}
     */
    netlog4_trusted_domain_name{
        get {
            if(!this.HasProp("__netlog4_trusted_domain_name"))
                this.__netlog4_trusted_domain_name := PWSTR(this.ptr + 8)
            return this.__netlog4_trusted_domain_name
        }
    }
}
