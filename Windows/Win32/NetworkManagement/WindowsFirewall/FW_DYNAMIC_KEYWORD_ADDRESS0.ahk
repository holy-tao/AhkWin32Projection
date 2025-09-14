#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Allows the client to create a dynamic keyword address, which holds a list of IP addresses.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ns-netfw-fw_dynamic_keyword_address0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class FW_DYNAMIC_KEYWORD_ADDRESS0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * A unique **GUID** identifier for this object. It must be a non-empty **GUID**.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **[PCWSTR](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * Either a string (for management convenience), or a resolvable string (that is, a FQDN or hostname) when the **FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE** flag is set.
     * @type {Pointer<PWSTR>}
     */
    keyword {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **[DWORD](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * Set to the value [**FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE**](/windows/win32/api/netfw/ne-netfw-fw_dynamic_keyword_address_flags) to indicate that the *keyword* field will be resolved, and that the *addresses* field will be populated by another component outside the firewall service.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[PCWSTR](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * The list of IP addresses for this keyword. If the **FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE** flag is set, then this indicates that the *addresses* field was populated outside the firewall service.
     * @type {Pointer<PWSTR>}
     */
    addresses {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
