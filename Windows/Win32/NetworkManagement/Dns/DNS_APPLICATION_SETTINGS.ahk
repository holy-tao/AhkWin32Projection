#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents per-application DNS settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_application_settings
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_APPLICATION_SETTINGS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Must be set to **DNS_APP_SETTINGS_VERSION1**.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * A bitset containing the following options.
     * 
     * * **DNS_APP_SETTINGS_EXCLUSIVE_SERVERS** (0x1). Use the custom DNS servers exclusively, and don't try the system-configured ones.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
