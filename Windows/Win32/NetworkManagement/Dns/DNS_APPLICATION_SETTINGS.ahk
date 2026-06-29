#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents per-application DNS settings.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_application_settings
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_APPLICATION_SETTINGS {
    #StructPack 8

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Must be set to **DNS_APP_SETTINGS_VERSION1**.
     */
    Version : UInt32

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * A bitset containing the following options.
     * 
     * * **DNS_APP_SETTINGS_EXCLUSIVE_SERVERS** (0x1). Use the custom DNS servers exclusively, and don't try the system-configured ones.
     */
    Flags : Int64

}
