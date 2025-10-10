#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the capabilities of an app container.
 * @see https://docs.microsoft.com/windows/win32/api//networkisolation/ns-networkisolation-inet_firewall_ac_capabilities
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INET_FIREWALL_AC_CAPABILITIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of security identifiers (SIDs) in the <b>capabilities</b> member.
     * @type {Integer}
     */
    count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>SID_AND_ATTRIBUTES*</b>
     * 
     * Security information related to the app container's capabilities.
     * @type {Pointer<SID_AND_ATTRIBUTES>}
     */
    capabilities {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
