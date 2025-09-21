#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
     * @type {Pointer<Char>}
     */
    netlog4_trusted_dc_name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A marshaled pointer to a string that contains the trusted domain name.
     * @type {Pointer<Char>}
     */
    netlog4_trusted_domain_name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
