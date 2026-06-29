#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Allows the client to create a dynamic keyword address, which holds a list of IP addresses.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ns-netfw-fw_dynamic_keyword_address0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class FW_DYNAMIC_KEYWORD_ADDRESS0 extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * A unique **GUID** identifier for this object. It must be a non-empty **GUID**.
     * @type {Guid}
     */
    id {
        get {
            if(!this.HasProp("__id"))
                this.__id := Guid(0, this)
            return this.__id
        }
    }

    /**
     * Type: **[PCWSTR](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * Either a string (for management convenience), or a resolvable string (that is, a FQDN or hostname) when the **FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE** flag is set.
     * @type {PWSTR}
     */
    keyword {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **[DWORD](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * Set to the value [**FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE**](/windows/win32/api/netfw/ne-netfw-fw_dynamic_keyword_address_flags) to indicate that the *keyword* field will be resolved, and that the *addresses* field will be populated by another component outside the firewall service.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: **[PCWSTR](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * The list of IP addresses for this keyword. If the **FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE** flag is set, then this indicates that the *addresses* field was populated outside the firewall service.
     * @type {PWSTR}
     */
    addresses {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
