#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Allows the client to create a dynamic keyword address, which holds a list of IP addresses.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ns-netfw-fw_dynamic_keyword_address0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct FW_DYNAMIC_KEYWORD_ADDRESS0 {
    #StructPack 8

    /**
     * Type: **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * A unique **GUID** identifier for this object. It must be a non-empty **GUID**.
     */
    id : Guid

    /**
     * Type: **[PCWSTR](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * Either a string (for management convenience), or a resolvable string (that is, a FQDN or hostname) when the **FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE** flag is set.
     */
    keyword : PWSTR

    /**
     * Type: **[DWORD](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * Set to the value [**FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE**](/windows/win32/api/netfw/ne-netfw-fw_dynamic_keyword_address_flags) to indicate that the *keyword* field will be resolved, and that the *addresses* field will be populated by another component outside the firewall service.
     */
    flags : UInt32

    /**
     * Type: **[PCWSTR](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * The list of IP addresses for this keyword. If the **FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE** flag is set, then this indicates that the *addresses* field was populated outside the firewall service.
     */
    addresses : PWSTR

}
